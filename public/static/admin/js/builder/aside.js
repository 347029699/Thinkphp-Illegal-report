/*!
 *  Document   : aside.js
 *  Description: 侧栏构建器
 */
jQuery(document).ready(function() {
    // 侧栏开关
    $('#aside .switch input:checkbox').on('click', function () {
        var $switch = $(this);
        var $data = {
            value: $switch.prop('checked'),
            _t: $switch.data('table') || '',
            name: $switch.data('field') || '',
            type: 'switch',
            pk: $switch.data('id') || ''
        };

        // 发送ajax请求
        Ma.loading();
        $.post(ma.aside_edit_url, $data).success(function(res) {
            Ma.loading('hide');
            if (res.code) {
                Ma.notify(res.msg, 'success');
            } else {
                Ma.notify(res.msg, 'danger');
                $switch.prop('checked', !$data.status);
                return false;
            }
        }).fail(function (res) {
            Ma.loading('hide');
            Ma.notify($(res.responseText).find('h1').text() || '服务器内部错误~', 'danger');
        });
    });
});