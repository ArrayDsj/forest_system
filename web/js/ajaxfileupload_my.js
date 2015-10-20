// JavaScript Document
jQuery.extend({

    /**
     * jQuery.handleError is not a function 解决办法
     * @param s
     * @param xhr
     * @param status
     * @param e
     */
    handleError: function (s, xhr, status, e) {
        if (s.error) {
            s.error.call(s.context || s, xhr, status, e);
        }
        if (s.global) {
            (s.context ? jQuery(s.context) : jQuery.event).trigger("ajaxError", [xhr, s, e]);
        }
    },

    createUploadIframe: function (id, uri) {
        //create frame
        var frameId = 'jUploadFrame' + id;

        if (window.ActiveXObject) {
            var io = document.createElement('<iframe id="' + frameId + '" name="' + frameId + '" />');
            if (typeof uri == 'boolean') {
                io.src = 'javascript:false';
            }
            else if (typeof uri == 'string') {
                io.src = uri;
            }
        }
        else {
            var io = document.createElement('iframe');
            io.id = frameId;
            io.name = frameId;
        }
        io.style.position = 'absolute';
        io.style.top = '-1000px';
        io.style.left = '-1000px';

        document.body.appendChild(io);

        return io;
    },
    createUploadForm: function (id, fileElementId, data) {
        //create form
        var formId = 'jUploadForm' + id;
        var fileId = 'jUploadFile' + id;
        var form = jQuery('<form  action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');

        for (var i in fileElementId) {
            var oldElement = jQuery('#' + fileElementId[i]);
            var newElement = jQuery(oldElement).clone();
            jQuery(oldElement).attr('id', fileId);
            jQuery(oldElement).before(newElement);
            jQuery(oldElement).appendTo(form);
        }
        if (data) {
            for (var i in data) {
                $('<input type="hidden" name="' + i + '" value="' + data[i] + '" />').appendTo(form);
            }
        }

        //set attributes
        jQuery(form).css('position', 'absolute');
        jQuery(form).css('top', '-1200px');
        jQuery(form).css('left', '-1200px');
        jQuery(form).appendTo('body');
        return form;
    },

    ajaxFileUpload: function (s) {
        // TODO introduce global settings, allowing the client to modify them for all requests, not only timeout  
        s = jQuery.extend({}, jQuery.ajaxSettings, s);
        var id = s.fileElementId[0];
        var form = jQuery.createUploadForm(id, s.fileElementId, s.data);
        var io = jQuery.createUploadIframe(id, s.secureuri);
        var frameId = 'jUploadFrame' + id;
        var formId = 'jUploadForm' + id;

        if (s.global && !jQuery.active++) {
            // Watch for a new set of requests
            jQuery.event.trigger("ajaxStart");
        }
        var requestDone = false;
        // Create the request object
        var xml = {};
        if (s.global) {
            jQuery.event.trigger("ajaxSend", [xml, s]);
        }

        var uploadCallback = function (isTimeout) {
            // Wait for a response to come back
            var io = document.getElementById(frameId);
            try {
                if (io.contentWindow) {
                    xml.responseText = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
                    xml.responseXML = io.contentWindow.document.XMLDocument ? io.contentWindow.document.XMLDocument : io.contentWindow.document;

                } else if (io.contentDocument) {
                    xml.responseText = io.contentDocument.document.body ? io.contentDocument.document.body.innerHTML : null;
                    xml.responseXML = io.contentDocument.document.XMLDocument ? io.contentDocument.document.XMLDocument : io.contentDocument.document;
                }
            } catch (e) {
                jQuery.handleError(s, xml, null, e);
            }
            if (xml || isTimeout == "timeout") {
                requestDone = true;
                var status;
                try {
                    status = isTimeout != "timeout" ? "success" : "error";
                    // Make sure that the request was successful or notmodified
                    if (status != "error") {
                        // process the data (runs the xml through httpData regardless of callback)
                        var data = jQuery.uploadHttpData(xml, s.dataType);
                        if (s.success) {
                            // ifa local callback was specified, fire it and pass it the data
                            s.success(data, status);
                        };
                        if (s.global) {
                            // Fire the global callback
                            jQuery.event.trigger("ajaxSuccess", [xml, s]);
                        };
                    } else {
                        jQuery.handleError(s, xml, status);
                    }

                } catch (e) {
                    status = "error";
                    jQuery.handleError(s, xml, status, e);
                };
                if (s.global) {
                    // The request was completed
                    jQuery.event.trigger("ajaxComplete", [xml, s]);
                };


                // Handle the global AJAX counter
                if (s.global && !--jQuery.active) {
                    jQuery.event.trigger("ajaxStop");
                };
                if (s.complete) {
                    s.complete(xml, status);
                };

                jQuery(io).unbind();

                setTimeout(function () {
                    try {
                        jQuery(io).remove();
                        jQuery(form).remove();

                    } catch (e) {
                        jQuery.handleError(s, xml, null, e);
                    }

                }, 100);

                xml = null;

            };
        }
        // Timeout checker
        if (s.timeout > 0) {
            setTimeout(function () {

                if (!requestDone) {
                    // Check to see ifthe request is still happening
                    uploadCallback("timeout");
                }

            }, s.timeout);
        }
        try {
            var form = jQuery('#' + formId);
            jQuery(form).attr('action', s.url);
            jQuery(form).attr('method', 'POST');
            jQuery(form).attr('target', frameId);
            if (form.encoding) {
                form.encoding = 'multipart/form-data';
            }
            else {
                form.enctype = 'multipart/form-data';
            }
            jQuery(form).submit();

        } catch (e) {
            jQuery.handleError(s, xml, null, e);
        }
        if (window.attachEvent) {
            document.getElementById(frameId).attachEvent('onload', uploadCallback);
        }
        else {
            document.getElementById(frameId).addEventListener('load', uploadCallback, false);
        }
        return {
            abort: function () {
            }
        };

    },

    uploadHttpData: function (r, type) {
        var data = !type;
        data = type == "xml" || data ? r.responseXML : r.responseText;
        // ifthe type is "script", eval it in global context
        if (type == "script") {
            jQuery.globalEval(data);
        }

        // Get the JavaScript object, ifJSON is used.
        if (type == "json") {
            /*
            * 问题2：一直得到error，无法执行指定的success方法。
            * 通过追踪ajaxFileUpload的执行过程发现，在调用它自身的uploadHttpData函数时，
            * 当执行if（type=="json")    eval("data = "+data);
            * 会抛出异常，导致在处理异常的时候将status = "error" 因此一直执行error方法。
            * 上网查询，得知eval函数是用来执行一段js代码，
            * 而并不是如我所想的反解json串eval("data = "+data);的意思是 将data 赋值给 data参数 ，
            * 但是当我返回给页面的是一个简单的字符串，比如"OK" ，时，
            * 这样写就抛出异常。最后改为 eval("data = \" "+data+" \" ");
            * 即将返回的数据用双引号引起来当作字符串，然后赋给 data 。终于成功了。。。
            */
            //eval( "data = " + data );
            eval("data = \" " + data + " \" ");
        }

        // evaluate scripts within html
        if (type == "html") {
            jQuery("<div>").html(data).evalScripts();
        }

        return data;
    }
});
