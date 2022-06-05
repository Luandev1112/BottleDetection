(function(e){
    "use strict";
    var productlist = [];
    if(page == 'edit')
    {
        productlist = planoproducts;
        showProduct();
    }
    function showProduct(){
        var html = '';
        for(var i = 0; i < productlist.length; i++)
        {
            var pro = productlist[i];
            html += '<div class="product">';
                html += '<h5 class="product-name">'+pro.name+'</h5>';
                html += '<div class="product-count">';
                    html += '<span>Count : </span>';
                    html += '<span class="numbers">'+pro.count+'</span>';
                html += '</div>';
                html += '<span class="product-close" role="'+pro.id+'"><i class=" ri-close-circle-line"></i></span>';
            html += '</div>';
        }
        $(".product-card").html(html);
    };
    e(".popup-form").magnificPopup({
        type:"inline",
        preloader:!1,
        focus:"#name",
        callbacks:{beforeOpen:function(){e(window).width()<700?this.st.focus=!1:this.st.focus="#name"}}
    }),
    e(".btn_product_add").click(function(){
        var idx = $("#product_index").val();
        var count = $("#product_count").val();
        var product = products[parseInt(idx)];
        product.count = count;
        productlist.push(product);
        showProduct();
    }),
    e(document).on( 'click', ".product-close", function(){
        var id = $(this).attr('role');
        for(var i = 0; i < productlist.length; i++)
        {
            if(parseInt(id) == parseInt(productlist[i].id)){
                productlist.splice(i, 1);
                break;
            }
        }
        showProduct();
    }),
    e(".btn_planogram_add").click(function(){
        var planogram_name = $("#planogram_name").val();
        var planogram_description = $("#planogram_description").val();
        var planogram_status = $("#planogram_status").val();
        var form = $("#add_planogram_form");
        var token = $("#add_planogram_form").find("input[name='csrfmiddlewaretoken']").val();

        $.ajax({
            headers: { "X-CSRFToken": token },
            url: '/planogram/new',
            type: 'post',
            dataType: 'json',
            data: {
                'planogram_name' : planogram_name,
                'status' : planogram_status,
                'planogram_description' : planogram_description,
                'products' : JSON.stringify(productlist) 
            },
            success: function(result){
                window.location.href = '/planograms';
            },
            error: function(err){
                console.log(err)
            }
        });
    }),

    e(".btn_planogram_edit").click(function(){
        var planogram_id = $("#planogram_id").val();
        var planogram_name = $("#planogram_name").val();
        var planogram_description = $("#planogram_description").val();
        var planogram_status = $("#planogram_status").val();
        var form = $("#edit_planogram_form");
        var token = form.find("input[name='csrfmiddlewaretoken']").val();

        $.ajax({
            headers: { "X-CSRFToken": token },
            url: '/planogram/'+ planogram_id + '/edit',
            type: 'post',
            dataType: 'json',
            data: {
                'planogram_name' : planogram_name,
                'status' : planogram_status,
                'planogram_description' : planogram_description,
                'products' : JSON.stringify(productlist) 
            },
            success: function(result){
                window.location.href = '/planograms';
            },
            error: function(err){
                console.log(err)
            }
        });
    }),

    e(".btn-delete-planogram").click(function(){
        var plano_id = $(this).attr('planogram_id');
        var conf = confirm("Are you sure to delete this plangoram?");
        if(conf){
            $.ajax({
                url: '/plangram-delete/' + plano_id,
                type: 'get',
                dataType: 'json',
                success: function(result){
                    window.location.href = "/planograms";
                },
                error: function(err){
                    console.log(err)
                }
            })
        }
    })
}).apply(this,[jQuery]);