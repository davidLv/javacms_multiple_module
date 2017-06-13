/**
 * 修改个人信息表单验证
 */

jQuery(document).ready(function() {
	alert('1');
	$.i18n.properties({
    	name:'validatormessages',// 资源文件名称
        path:'/javacms/res/i18n/',// 资源文件所在目录路径
        mode:'both',// 模式：变量或 Map 
        language:'zh_CN',// 对应的语言
        cache:false, 
        encoding: 'UTF-8', 
        callback: function() {// 回调方法
        	//alert($.i18n.prop('admin.username.empty'));
        	/*$('#username').attr('placeholder', $.i18n.prop('admin.username'));
        	$('#password').attr('placeholder', $.i18n.prop('admin.password'));
        	$('#kaptcha').attr('placeholder', $.i18n.prop('admin.jcode'));*/
        }
    });
	$("#jvForm").bootstrapValidator({
    	message : 'This value is not valid',
    	feedbackIcons : {
    		valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
    	},
    	fields : {
    		password : {
    			validators : {
    				notEmpty : {
    					message : $.i18n.prop('password.empty.illegal')
    				},
    				stringLength : {
    					min : 5,
    					max : 20,
    					message : $.i18n.prop('password.length.illegal')
    				},
    				regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: $.i18n.prop('password.format.illegal')
                    },
    			}
    		},
    		newPassword : {
    			validators : {
    				notEmpty : {
    					message : $.i18n.prop('newpassword.null.illegal')
    				},
    				stringLength : {
    					min : 5,
    					max : 20,
    					message : $.i18n.prop('newpassword.length.illegal')
    				},
    				regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: $.i18n.prop('newpassword.format.illegal')
                    },
    			}
    		},
    		/*kaptcha : {
    			notEmpty : {
					message : $.i18n.prop('admin.jcode.empty')
				},
				stringLength : {
					maxlength : 4,
					message : $.i18n.prop('admin.jcode.format')
				},
				regexp: {
                    regexp: /^\d{4}$/,
                    message: $.i18n.prop('admin.jcode.format')
                },
    		}*/
    	},
    }).on('success.form.bv', function(e) {
    	e.preventDefault();
    	alert('ok');
    });
    /*$("#jvForm").on('submit', function(e) {
    	e.preventDefault();
    	alert('2');
    	
    });*/
    
});