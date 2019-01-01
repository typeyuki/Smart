<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>古美路街道综合为老服务平台</title>
<#include "head.ftl" />
    <style>
        .tuPie,.tuBar{
            margin-top: 1%;
        }
        .exit{
            padding-left: 20px;
        }
        .top{
            background-color: rgb(245,184,139);
            border-bottom: 3px solid rgb(237,166,102);
            padding: 10px;
        }
        @media only screen and (min-width: 1000px) and ( max-width: 1600px) {
            #logo {
                padding: 1px;
                position: relative;
                left: 5%;
                width: 115%;
            }
            #logo1{
                padding: 1px;
                position: relative;
                left: 17%;
                width: 115%;
            }
            .top-right{
                position: relative;
                left:67.6%
            }
            .top-right1{
                position: relative;
                left:66.6%
            }
            .weclome,.exit{
                font-size: 1.5em;
                background-color: rgb(252,115,1);
                color: white;
                font-weight: bold;
                padding: 0 10px;
                border-radius: 10%;
                margin-top: 15px;
            }
        }

        @media only screen and (min-width: 1600px)  {
            #logo {
                padding: 1px;
                position: relative;
                left: 8%;
                width: 115%;
            }
            #logo1{
                padding: 1px;
                position: relative;
                left: 20%;
                width: 115%;
            }
            .top-right{
                position: relative;
                left:70%
            }
            .top-right1{
                position: relative;
                left:69%
            }
            .weclome,.exit{
                font-size: 1.5em;
                background-color: rgb(252,115,1);
                color: white;
                font-weight: bold;
                padding: 0 10px;
                border-radius: 10%;
                margin-top: 15px;
            }
        }
    </style>
</head>

<body style="overflow-y: hidden;background-color: rgb(235,229,215)">
<div class="container-fluid">
    <div class="row top">
        <div class="col-md-2">
            <#if role=='admin'>
                <img src="/static/img/logo.png" id="logo">
<#else >
    <img src="/static/img/logo.png" id="logo1">
            </#if>
        </div>
    <#if role=='admin'>
    <div class="col-md-2 top-right">
    <#else >
    <div class="col-md-2 top-right1">
    </#if>
            <span>
                    <button class="weclome btn" onclick="location.href='/'">
                        <#if organ??>
                        ${organ.name}
                        <#else >
                        ${username}
                        </#if>
                    </button>
            <span class="exit btn" onclick="location.href='/login'" style="cursor: pointer"><i class="fa fa-power-off" style="margin-right: 3px"></i>退出</span>
                </span>
        </div>
    </div>
    <#if role=="admin">
        <#include "admin.ftl"/>
    <#else >
        <#include "jw.ftl"/>
    </#if>
</div>

<script>
    function back(url,title) {
        location.href="/?url="+url+"&title="+title;
    }

</script>
</body>

</html>