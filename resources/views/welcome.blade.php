<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ env('APP_NAME') }}</title>
        <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
        <style type="text/css">
            @font-face{
                font-family: 'Montserrat';
                src:url('{{ asset('fonts/Montserrat-Regular.ttf') }}');
            }
            body{
                background:url('{{ asset('images/bg-hero.svg') }}');
                background-size:cover;
                background-repeat: no-repeat;
                background-position: center center;
                width:100vw;
                height:100vh;
                overflow: hidden;
            }

            img.hero-img{
                width:650px;
                height:450px;
            }

            .container.hero{
                position:absolute;
                top:50%;
                left:50%;
                transform:translate(-50%, -50%);
            }

            .hero-title{
                font-family: "Segoe UI";
                font-size: 42px;
                line-height: 54px;
            }

            .btn-start{
                padding: 15px;
                background-color:#fff;
                color:#0a0a0a !important;
                text-transform:uppercase;
                font-weight:bold;
                border-radius: 12px;
                font-family:segoe ui;
            }

            .btn-start:hover{
                text-decoration:none;
            }

            img.img-logo{
                width:42px;
                height:50px;
            }

            .img-logo.animate{
                animation: flip 2s;
            }

            a.brand{
                color:#fff;
                text-decoration:none;
                font-size: 25px;
                font-weight:bold;
            }

            span{
                font-size: 25px;
                font-weight:bold;
                color:#fff;
                font-family:segoe ui;
            }

            @keyframes flip{
                0%{
                    transform:rotateY(0deg);
                }
                25%{
                    transform:rotateY(90deg);
                }
                50%{
                    transform:rotateY(180deg);
                }
                75%{
                    transform:rotateY(270deg);
                }
                100%{
                    transform:rotateY(360deg);
                }
            }
            @media screen and (max-width: 768px){
                img.hero-img{
                    display: none;
                }
                .hero-text{
                    text-align:center;
                }
            }
        </style>
    </head>
    <body>
            <div class="container mt-4">
                 <a href="#" class="brand d-flex align-items-center">
                      <img src="{{ asset('images/launree.png') }}" class="img-logo">
                        <span class="ml-3 mt-2">Launre</span>
                 </a>
            </div>
        <div class="container hero">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-5 col-md-10 hero-text">
                    <h1 class="hero-title text-white mb-5">
                        Efektifkan manajemen laundry-mu bersama <b>Launre</b>
                    </h1>
                    <a class="btn-start" href="{{ url('/admin') }}">Mulai sekarang</a>
                </div>
                <div class="col-lg-7 col-md-0">
                    <img src="{{ asset('images/SS.png') }}" class="hero-img">
                </div>
            </div>
        </div>

        <script>
            const logo = document.querySelector('.img-logo');
            setInterval(() => {
                logo.classList.add('animate');
            }, 3000);
            setInterval(() => {
                logo.classList.remove('animate');
            }, 5000);
        </script>
    </body>
</html>
