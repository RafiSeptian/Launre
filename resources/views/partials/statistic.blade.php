@extends('voyager::master')

@section('page_title', __('Statistik'))

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-bar-chart"></i>
        {{ __('Statistik') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row" style="display: flex; justify-content: center; align-items:center">
            <div class="col-md-10">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <h3 class="text-center" id="month"></h3>
                        <canvas id="statistic" style="width:100%; height:400px; margin-top: 20px"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('javascript')
    <script>
        const ctx = document.getElementById('statistic').getContext('2d');
        const month = document.getElementById('month');

        // generate month
        const date = new Date().toLocaleDateString('id', {
            'month': 'long',
            'year': 'numeric'
        });

        month.innerHTML = date;

        // generate chart
        $.ajax({
            url: '{{ route('get.statistic') }}',
            success: function(res){

                const modal = getModal(),
                    profit = getProfit(),
                    loss = getLoss(modal, profit);

                let data = {
                    outlet: res.outlet.map(outlet => outlet.nama),
                    modal: modal,
                    profit: profit,
                    loss: loss
                };

                function getModal(){
                     const total = res.modal.reduce((map, e) => {
                        map[e.id_outlet] = e.biaya += (map[e.id_outlet] || 0)
                        return map
                    }, {});

                    return Object.values(total)
                }

                function getProfit(){
                    const total = res.transaction.reduce((acc, curr) => {
                        let detail = parseInt(curr.detail.total.split('.')[1].replace(',', ''));
                        acc[curr.id_outlet] = detail += (acc[curr.id_outlet] || 0)
                        return acc;
                    }, {});

                    return Object.values(total);
                }

                function getLoss(modal, profit){
                    const loss = [];
                    for(let i = 0; i < modal.length; i++){
                        if(modal[i] > profit[i]){
                            loss.push(Math.abs(modal[i] - profit[i]));
                        }
                    }

                    return loss;
                }

                console.log(res.transaction);

                const options = {
                    type: 'bar',
                    data: {
                        labels: data.outlet,
                        datasets: [
                            {
                                label: "Modal",
                                data: data.modal,
                                backgroundColor: '#FFBF0B',
                                borderColor: '#cd9d0a',
                                borderWidth: 3
                            },
                            {
                                label: "Keuntungan",
                                data: data.profit,
                                backgroundColor: '#6DC888',
                                borderColor: '#72cc8a',
                                borderWidth: 3
                            },
                            {
                                label: "Kerugian",
                                data: data.loss,
                                backgroundColor: '#F62E48',
                                borderColor: '#cb283c',
                                borderWidth: 3
                            }
                        ]
                    },

                    options: {
                        scaleY: {
                            yAxes: [
                                {
                                    ticks: {
                                        beginAtZero:true
                                    }
                                }
                            ]
                        }
                    }
                }

                new Chart(ctx, options);
            }
        });
    </script>
@endsection
