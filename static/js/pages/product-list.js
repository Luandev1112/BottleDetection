(function(e){
    "use strict";
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
                var company_id = result.company_id;
                form.find('#id').val(id);
                form.find('#name').val(product_name);
                form.find('#description').val(description);
                form.find('#company_id').val(company_id);
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
    }),
    e("#btn_search_company").click(function(){
        var urlArray = window.location.href.split('?');
        var baseUrl = urlArray[0];
        var additionUrl = urlArray[1];
        var searchCompany = $("#search_company").val();
        var searchUrl = '';
        if(additionUrl==undefined){
            searchUrl = baseUrl + '?company='+searchCompany
        }else{
            if(additionUrl.indexOf('company=') == -1){
                searchUrl = baseUrl + '?' + additionUrl + '&company=' + searchCompany;
            }else{
                var variables = additionUrl.split('&');
                for(var i = 0; i < variables.length; i++)
                {
                    if(variables[i].indexOf('company=') != -1)
                    {
                        variables[i] = 'company=' + searchCompany;
                    }
                }
                searchUrl = baseUrl + '?' + variables.join("&");
            }
        }
        if(searchCompany != ''){
            window.location.href = searchUrl;
        }
    }),
    e("#btn_search_product").click(function(){
        var urlArray = window.location.href.split('?');
        var baseUrl = urlArray[0];
        var additionUrl = urlArray[1];
        var searchProduct = $("#search_product").val();
        var searchUrl = '';
        if(additionUrl==undefined){
            searchUrl = baseUrl + '?product='+searchProduct
        }else{
            if(additionUrl.indexOf('product=') == -1){
                searchUrl = baseUrl + '?' + additionUrl + '&product=' + searchProduct;
            }else{
                var variables = additionUrl.split('&');
                for(var i = 0; i < variables.length; i++)
                {
                    if(variables[i].indexOf('product=') != -1)
                    {
                        variables[i] = 'product=' + searchProduct;
                    }
                }
                searchUrl = baseUrl + '?' + variables.join("&");
            }
        }
        if(searchProduct != ''){
            window.location.href = searchUrl;
        }
    })
}).apply(this,[jQuery]);