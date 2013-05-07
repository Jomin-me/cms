// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
    $('#component_element_id').change(
        function(){
            if(this.value == '-输入-') {
                $('#component_element_id').css('display','none');
                $('#component_specification_id').css('display','none');
                $('#component_package_id').css('display','none');
                $('#element_name').css('display','block');
                $('#specification_name').css('display','block');
                $('#package_name').css('display','block');
            } else if(this.value == '-请选择-') {
                $("#component_specification_id").html("<option value='请选择上级'>请选择上级</option>");
                $("#component_package_id").html("<option value='请选择上级'>请选择上级</option>");
            } else {
                $.ajax({
                    type:'POST',
                    url:'/components/get_specification_options?id=' + this.value,
                    data:'text',
                    success:function (data) {
                        $("#component_specification_id").html(data.split(',')[0]);
                        $("#component_package_id").html(data.split(',')[1]);
                    }
                });
            }
        }
    );

    $('#component_specification_id').change(
        function() {
            if(this.value == '-输入-') {
                $('#component_specification_id').css('display','none');
                $('#component_package_id').css('display','none');
                $('#specification_name').css('display','block');
                $('#package_name').css('display','block');
            }else {
                $.ajax({
                    type:'POST',
                    url:'/components/get_package_options?id=' + this.value,
                    data:'text',
                    success:function (data) {
                        $("#component_package_id").html(data);
                    }
                });
            }
        }
    );

    $('#component_package_id').change(
        function() {
            if(this.value == '-输入-') {
                $('#component_package_id').css('display','none');
                $('#package_name').css('display','block');
            }
        }
    );
});
