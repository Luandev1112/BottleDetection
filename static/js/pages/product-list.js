(function(e){
    "use strict";
    var product_arr = [];
    e(".image-popup-vertical-fit").magnificPopup({
        type:"image",
        closeOnContentClick:!0,
        mainClass:"mfp-img-mobile",
        image:{verticalFit:!0}
    }),
    e(".popup-form").magnificPopup({
        type:"inline",
        preloader:!1,
        focus:"#name",
        callbacks:{beforeOpen:function(){e(window).width()<700?this.st.focus=!1:this.st.focus="#name"}}
    }),
    e(".popup-form").click(function(){
        var pro_id = $(this).attr('product_id');
        var form = $("#product_edit_form");
        $.ajax({
            url: '/product/' + pro_id,
            type: 'get',
            dataType: 'json',
            success: function(result){
                var id = result.id;
                var product_name = result.product_name;
                var status = result.status;
                var description = result.description;
                var order = result.order;
                form.find('#id').val(id);
                form.find('#name').val(product_name);
                form.find('#description').val(description);
                form.find('#product_order').val(order);
                form.find('#product_status').val(status);
            },
            error: function(err){
                console.log(err)
            }
        })
    }),
    e(".btn-delete-product").click(function(){
        var pro_id = $(this).attr('product_id');
        var conf = confirm("Are you sure to delete this product?");
        if(conf){
            $.ajax({
                url: '/product-delete/' + pro_id,
                type: 'get',
                dataType: 'json',
                success: function(result){
                    window.location.href = "/products";
                },
                error: function(err){
                    console.log(err)
                }
            })
        }
    }),
    e(".btn_export").click(function(){
        var pro_id = $(this).attr('product_id');
        var conf = confirm("Are you sure to export current verified product names to dataset file?");
        if(conf){
            $.ajax({
                url: '/product-export',
                type: 'get',
                dataType: 'json',
                success: function(result){
                    console.log(result);
                    alert("Successfully exported");
                },
                error: function(err){
                    console.log(err)
                }
            })
        }
    })
}).apply(this,[jQuery]);