/*
Template Name: Nazox -  Admin & Dashboard Template
Author: Themesdesign
Version: 2.0.0
Contact: themesdesign.in@gmail.com
File: Main Js File
*/
(function ($) {
  "use strict";


  var language = localStorage.getItem("language");
  // Default Language
  var default_lang = "en";

  function setLanguage(lang) {
      if (document.getElementById("header-lang-img")) {
          if (lang == "en") {
              document.getElementById("header-lang-img").src =
                  "/static/images/flags/us.jpg";
          } else if (lang == "sp") {
              document.getElementById("header-lang-img").src =
                  "/static/images/flags/spain.jpg";
          } else if (lang == "gr") {
              document.getElementById("header-lang-img").src =
                  "/static/images/flags/germany.jpg";
          } else if (lang == "it") {
              document.getElementById("header-lang-img").src =
                  "/static/images/flags/italy.jpg";
          } else if (lang == "ru") {
              document.getElementById("header-lang-img").src =
                  "/static/images/flags/russia.jpg";
          }
          localStorage.setItem("language", lang);
          language = localStorage.getItem("language");
          getLanguage();
      }
  }

  // Multi language setting
  function getLanguage() {
      language == null ? setLanguage(default_lang) : false;
      $.getJSON("/static/lang/" + language + ".json", function(lang) {
          $("html").attr("lang", language);
          $.each(lang, function(index, val) {
              index === "head" ? $(document).attr("title", val["title"]) : false;
              $("[key='" + index + "']").text(val);
          });
      });
  }
  function initLanguage() {
    // Auto Loader
    if (language != "null" && language !== default_lang) setLanguage(language);
    $(".language").on("click", function(e) {
        setLanguage($(this).attr("data-lang"));
    });
}


  function initCheckAll() {
    var ele = document.getElementsByName("chkbox");
    $(document).on("click", "#checkboxall", function (e) {
      for (var i = 0; i < ele.length; i++) {
        if (ele[i].type == "checkbox") ele[i].checked = true;
      }
    });
    $("#checkboxall").change(function () {
      if (!$(this).prop("checked")) {
        $(ele).prop("checked", false);
      }
    });
  }

  function initMetisMenu() {
    //metis menu
    $("#side-menu").metisMenu();
  }

  function initLeftMenuCollapse() {
    $("#vertical-menu-btn").on("click", function (event) {
      event.preventDefault();
      $("body").toggleClass("sidebar-enable");
      if ($(window).width() >= 992) {
        $("body").toggleClass("vertical-collpsed");
      } else {
        $("body").removeClass("vertical-collpsed");
      }
    });
    $("body,html").click(function (e) {
      var container = $("#vertical-menu-btn");
      if (
        !container.is(e.target) &&
        container.has(e.target).length === 0 &&
        !e.target.closest("div.vertical-menu")
      ) {
        $("body").removeClass("sidebar-enable");
      }
    });
  }

  function initActiveMenu() {
    // === following js will activate the menu in left side bar based on url ====
    $("#sidebar-menu a").each(function () {
      var pageUrl = window.location.href.split(/[?#]/)[0];
      if (this.href == pageUrl) {
        $(this).addClass("active");
        $(this).parent().addClass("mm-active"); // add active to li of the current link
        $(this).parent().parent().addClass("mm-show");
        $(this).parent().parent().prev().addClass("mm-active"); // add active class to an anchor
        $(this).parent().parent().parent().addClass("mm-active");
        $(this).parent().parent().parent().parent().addClass("mm-show"); // add active to li of the current link
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass("mm-active");
      }
    });
  }

  function initMenuItem() {
    $(".navbar-nav a").each(function () {
      var pageUrl = window.location.href.split(/[?#]/)[0];
      if (this.href == pageUrl) {
        $(this).addClass("active");
        $(this).parent().addClass("active");
        $(this).parent().parent().addClass("active");
        $(this).parent().parent().parent().addClass("active");
        $(this).parent().parent().parent().parent().addClass("active");
        $(this).parent().parent().parent().parent().parent().addClass("active");
      }
    });
  }

  function initMenuItemScroll() {
    // focus active menu in left sidebar
    $(document).ready(function () {
      if (
        $("#sidebar-menu").length > 0 &&
        $("#sidebar-menu .mm-active .active").length > 0
      ) {
        var activeMenu = $("#sidebar-menu .mm-active .active").offset().top;
        if (activeMenu > 300) {
          activeMenu = activeMenu - 300;
          $(".vertical-menu .simplebar-content-wrapper").animate(
            {
              scrollTop: activeMenu,
            },
            "slow"
          );
        }
      }
    });
  }

  function initFullScreen() {
    $('[data-toggle="fullscreen"]').on("click", function (e) {
      e.preventDefault();
      $("body").toggleClass("fullscreen-enable");
      if (
        !document.fullscreenElement &&
        /* alternative standard method */ !document.mozFullScreenElement &&
        !document.webkitFullscreenElement
      ) {
        // current working methods
        if (document.documentElement.requestFullscreen) {
          document.documentElement.requestFullscreen();
        } else if (document.documentElement.mozRequestFullScreen) {
          document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullscreen) {
          document.documentElement.webkitRequestFullscreen(
            Element.ALLOW_KEYBOARD_INPUT
          );
        }
      } else {
        if (document.cancelFullScreen) {
          document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen();
        }
      }
    });
    document.addEventListener("fullscreenchange", exitHandler);
    document.addEventListener("webkitfullscreenchange", exitHandler);
    document.addEventListener("mozfullscreenchange", exitHandler);

    function exitHandler() {
      if (
        !document.webkitIsFullScreen &&
        !document.mozFullScreen &&
        !document.msFullscreenElement
      ) {
        $("body").removeClass("fullscreen-enable");
      }
    }
  }

  function initRightSidebar() {
    // right side-bar toggle
    $(".right-bar-toggle").on("click", function (e) {
      $("body").toggleClass("right-bar-enabled");
    });
    $(document).on("click", "body", function (e) {
      if ($(e.target).closest(".right-bar-toggle, .right-bar").length > 0) {
        return;
      }
      $("body").removeClass("right-bar-enabled");
      return;
    });
  }

  function initDropdownMenu() {
    if (document.getElementById("topnav-menu-content")) {
      var elements = document
        .getElementById("topnav-menu-content")
        .getElementsByTagName("a");
      for (var i = 0, len = elements.length; i < len; i++) {
        elements[i].onclick = function (elem) {
          if (elem.target.getAttribute("href") === "#") {
            elem.target.parentElement.classList.toggle("active");
            elem.target.nextElementSibling.classList.toggle("show");
          }
        };
      }
      window.addEventListener("resize", updateMenu);
    }
  }

  function updateMenu() {
    var elements = document
      .getElementById("topnav-menu-content")
      .getElementsByTagName("a");
    for (var i = 0, len = elements.length; i < len; i++) {
      if (
        elements[i].parentElement.getAttribute("class") ===
        "nav-item dropdown active"
      ) {
        elements[i].parentElement.classList.remove("active");
        elements[i].nextElementSibling.classList.remove("show");
      }
    }
  }

  function initComponents() {
    // Tooltip
    var tooltipTriggerList = [].slice.call(
      document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl);
    });
    // Popover
    var popoverTriggerList = [].slice.call(
      document.querySelectorAll('[data-bs-toggle="popover"]')
    );
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
      return new bootstrap.Popover(popoverTriggerEl);
    });
  }

  function initPreloader() {
    $(window).on("load", function () {
      $("#status").fadeOut();
      $("#preloader").delay(350).fadeOut("slow");
    });
  }

  function initSettings() {
    if (window.sessionStorage) {
      var alreadyVisited = sessionStorage.getItem("is_visited");
      if (!alreadyVisited) {
        alreadyVisited = "light-mode-switch";
        sessionStorage.setItem("is_visited", alreadyVisited);
        $(".right-bar input:checkbox").prop("checked", false);
        $("#" + alreadyVisited).prop("checked", true);
        updateThemeSetting(alreadyVisited);
      } else {
        $(".right-bar input:checkbox").prop("checked", false);
        $("#" + alreadyVisited).prop("checked", true);
        updateThemeSetting(alreadyVisited);
      }
    }
    $("#light-mode-switch, #dark-mode-switch, #rtl-mode-switch").on(
      "change",
      function (e) {
        updateThemeSetting(e.target.id);
      }
    );
  }

  function updateThemeSetting(id) {
    if (
      $("#light-mode-switch").prop("checked") == true &&
      id === "light-mode-switch"
    ) {
      $("html").removeAttr("dir");
      $("#dark-mode-switch").prop("checked", false);
      $("#rtl-mode-switch").prop("checked", false);
      $("#bootstrap-style").attr("href", "../../static/css/bootstrap.min.css");
      $("#app-style").attr("href", "../../static/css/app.min.css");
      sessionStorage.setItem("is_visited", "light-mode-switch");
    } else if (
      $("#dark-mode-switch").prop("checked") == true &&
      id === "dark-mode-switch"
    ) {
      $("html").removeAttr("dir");
      $("#light-mode-switch").prop("checked", false);
      $("#rtl-mode-switch").prop("checked", false);
      $("#bootstrap-style").attr(
        "href",
        "../../static/css/bootstrap-dark.min.css"
      );
      $("#app-style").attr("href", "../../static/css/app-dark.min.css");
      sessionStorage.setItem("is_visited", "dark-mode-switch");
    } else if (
      $("#rtl-mode-switch").prop("checked") == true &&
      id === "rtl-mode-switch"
    ) {
      $("#light-mode-switch").prop("checked", false);
      $("#dark-mode-switch").prop("checked", false);
      $("#bootstrap-style").attr(
        "href",
        "../../static/css/bootstrap-rtl.min.css"
      );
      $("#app-style").attr("href", "../../static/css/app-rtl.min.css");
      $("html").attr("dir", "rtl");
      sessionStorage.setItem("is_visited", "rtl-mode-switch");
    }
  }

  function init() {
    
    initMetisMenu();
    initLeftMenuCollapse();
    initActiveMenu();
    initMenuItem();
    initMenuItemScroll();
    initFullScreen();
    initRightSidebar();
    initDropdownMenu();
    initComponents();
    initPreloader();
    initSettings();
    initLanguage();
    initCheckAll();
    Waves.init();
  }
  init();
})(jQuery);

//  User Registration
$("#user-register").on("click", function (e) {
  e.preventDefault();
  var email = document.getElementById("user_email").value;
  var username = document.getElementById("user_name").value;
  var password = document.getElementById("user_password").value;
  var confirm_password = document.getElementById("confirm_password").value;

  if (email && username && password && confirm_password != "") {
    if (password.length < 6 || confirm_password < 6) {
      $("#err-msg").removeAttr("hidden");
      $("#err-msg").addClass("alert alert-danger");
      $("#msg_err").text("Password must be at least 6 characters");
    } else {
      if (password == confirm_password) {
        var formData = new FormData();
        // formData.append('img', $('#imgupload')[0].files[0]);
        formData.append("email", email);
        formData.append("username", username);
        formData.append("password1", password);
        formData.append("password2", confirm_password);
        formData.append(
          "csrfmiddlewaretoken",
          $("input[name=csrfmiddlewaretoken]").val()
        );
        $.ajax({
          type: "POST",
          url: "register",
          async: true,
          data: formData,
          cache: false,
          contentType: false,
          processData: false,
          timeout: 60000,

          success: function (data) {
            if (data.success_message) {
              window.setTimeout(function () {
                window.location = "login";
              }, 3000);
              $("#err-msg").removeClass("alert alert-danger");
              $("#err-msg").removeAttr("hidden");
              $("#err-msg").addClass("alert alert-success");
              $("#msg_err").text(data.success_message);
            } else {
              var error_message = data.error_message;
              $("#err-msg").removeAttr("hidden");
              $("#err-msg").addClass("alert alert-danger");
              $("#msg_err").text(error_message);
            }
          },
          error: function (error) {
            // handle error
          },
        });
      } else {
        $("#err-msg").removeAttr("hidden");
        $("#err-msg").addClass("alert alert-danger");
        $("#msg_err").text("Password and confirm password not match");
      }
    }
  } else {
    $("#err-msg").removeAttr("hidden");
    $("#err-msg").addClass("alert alert-danger");
    $("#msg_err").text("Some field is empty");
  }
});

//   User Login
$("#user-login").on("click", function (e) {
  e.preventDefault();
  var username = document.getElementById("user_name").value;
  var password = document.getElementById("user_password").value;
  if (username && password != "") {
    if (password.length < 6) {
      $("#err-msg").removeAttr("hidden");
      $("#err-msg").addClass("alert alert-danger");
      $("#msg_err").text("Password must be at least 6 characters");
    } else {
      var formData = new FormData();
      formData.append("username", username);
      formData.append("password", password);
      formData.append(
        "csrfmiddlewaretoken",
        $("input[name=csrfmiddlewaretoken]").val()
      );
      $.ajax({
        type: "POST",
        url: "login",

        success: function (data) {
          if (data.success_message) {
            window.setTimeout(function () {
              window.location = "../";
            }, 3000);
            $("#err-msg").removeClass("alert alert-danger");
            $("#err-msg").removeAttr("hidden");
            $("#err-msg").addClass("alert alert-success");
            $("#msg_err").text(data.success_message);
          } else {
            var error_message = data.error_message;
            $("#err-msg").removeAttr("hidden");
            $("#err-msg").addClass("alert alert-danger");
            $("#msg_err").text(error_message);
          }
        },
        error: function (error) {
          // handle error
        },
        async: true,
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        timeout: 60000,
      });
    }
  } else {
    $("#err-msg").removeAttr("hidden");
    $("#err-msg").addClass("alert alert-danger");
    $("#msg_err").text("Some field is empty");
  }
});

//  Lockscreen
$("#lock-screen-login").on("click", function (e) {
  e.preventDefault();

  var password = document.getElementById("user_password").value;

  if (password != "") {
    if (password.length < 6) {
      $("#err-msg").removeAttr("hidden");
      $("#err-msg").addClass("alert alert-danger");
      $("#msg_err").text("Password must be at least 6 characters");
    } else {
      var formData = new FormData();
      formData.append("password", password);
      formData.append(
        "csrfmiddlewaretoken",
        $("input[name=csrfmiddlewaretoken]").val()
      );
      $.ajax({
        type: "POST",
        url: "lock-screen",

        success: function (data) {
          if (data.success_message) {
            window.setTimeout(function () {
              window.location = "../../";
            }, 3000);
            $("#err-msg").removeClass("alert alert-danger");
            $("#err-msg").removeAttr("hidden");
            $("#err-msg").addClass("alert alert-success");
            $("#msg_err").text(data.success_message);
          } else {
            if (data.session_timeout) {
              window.setTimeout(function () {
                window.location = "login";
              }, 3000);
              $("#err-msg").removeAttr("hidden");
              $("#err-msg").addClass("alert alert-danger");
              $("#msg_err").text(data.session_timeout);
            } else {
              var error_message = data.error_message;
              $("#err-msg").removeAttr("hidden");
              $("#err-msg").addClass("alert alert-danger");
              $("#msg_err").text(error_message);
            }
          }
        },
        error: function (error) {
          window.location = "../utility/maintenance";
        },
        async: true,
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        timeout: 60000,
      });
    }
  } else {
    $("#err-msg").removeAttr("hidden");
    $("#err-msg").addClass("alert alert-danger");
    $("#msg_err").text("Some field is empty");
  }
});
