(function(e){
    "use strict";
    e(".btn_update_company").click(function(){

        var scrf = $('input[name="csrfmiddlewaretoken"]').val();
        var conf = confirm("Are you sure to synchronize compay names from app backend?");
        if(conf){
            $.ajax({
                url: 'https://gift-api.loyaltyjam.com/v1/company/list',
                type: 'get',
                dataType: 'json',
                success: function(result){
                    var companies = result;
                    $.ajax({
                        headers: {
                            "X-CSRFToken": scrf
                        },
                        url: '/campanies',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            companies: JSON.stringify(companies) 
                        },
                        success: function(result){
                            window.location.href = "/campanies";
                        },
                        error: function(err){
                            console.log(err)
                        }
                    });
                },
                error: function(err){
                    console.log(err)
                }
            });
        }
    }),
    e("#btn_search_company").click(function(){
        var urlArray = window.location.href.split('?');
        var baseUrl = urlArray[0];
        var additionUrl = urlArray[1];
        var searchCompany = $("#search_company").val();
        var searchUrl = '';
        if(additionUrl==undefined){
            searchUrl = baseUrl + '?name='+searchCompany
        }else{
            if(additionUrl.indexOf('name=') == -1){
                searchUrl = baseUrl + '?' + additionUrl + '&name=' + searchCompany;
            }else{
                var variables = additionUrl.split('&');
                for(var i = 0; i < variables.length; i++)
                {
                    if(variables[i].indexOf('name=') != -1)
                    {
                        variables[i] = 'name=' + searchCompany;
                    }
                }
                searchUrl = baseUrl + '?' + variables.join("&");
            }
        }
        if(searchCompany != ''){
            window.location.href = searchUrl;
        }
    })
}).apply(this,[jQuery]);