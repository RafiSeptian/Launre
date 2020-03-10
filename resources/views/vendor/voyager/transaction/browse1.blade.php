@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
@include('partials.modals.modalPeriode')

    <div class="container-fluid">
        <h1 class="page-title">
            <i class="{{ $dataType->icon }}"></i> {{ $dataType->getTranslatedAttribute('display_name_plural') }}
        </h1>
        @can('add', app($dataType->model_name))
            <a href="{{ route('voyager.'.$dataType->slug.'.create') }}" class="btn btn-success btn-add-new">
                <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
            </a>
        @endcan
        <a href="" id="btn-export" data-link="{{ route('transaction.export') }}" class="btn btn-export-excel">
            <i class="voyager-book-download"></i> <span>Export Excel</span>
        </a>
        <a href="" id="btn-export" data-link="{{ route('transaction.pdf') }}" class="btn btn-danger btn-export-pdf">
            <i class="voyager-book-download"></i> <span>Export PDF</span>
        </a>
        @can('edit', app($dataType->model_name))
            @if(isset($dataType->order_column) && isset($dataType->order_display_column))
                <a href="{{ route('voyager.'.$dataType->slug.'.order') }}" class="btn btn-primary btn-add-new">
                    <i class="voyager-list"></i> <span>{{ __('voyager::bread.order') }}</span>
                </a>
            @endif
        @endcan
        @can('delete', app($dataType->model_name))
            @if($usesSoftDeletes)
                <input type="checkbox" @if ($showSoftDeleted) checked @endif id="show_soft_deletes" data-toggle="toggle" data-on="{{ __('voyager::bread.soft_deletes_off') }}" data-off="{{ __('voyager::bread.soft_deletes_on') }}">
            @endif
        @endcan
        @foreach($actions as $action)
            @if (method_exists($action, 'massAction'))
                @include('voyager::bread.partials.actions', ['action' => $action, 'data' => null])
            @endif
        @endforeach
        @include('voyager::multilingual.language-selector')
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="table-transaction">
                            <thead>
                               <tr>
                                    <th>Outlet</th>
                                    <th>Kode Invoice</th>
                                    <th>Member</th>
                                    <th>Tanggal</th>
                                    <th>Batas Waktu</th>
                                    <th>Tanggal Bayar</th>
                                    <th>Biaya Tambahan</th>
                                    <th>Diskon</th>
                                    <th>Pajak</th>
                                    <th>Status</th>
                                    <th>Dibayar</th>
                                    <th>Aksi</th>
                               </tr>
                            </thead>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Single delete modal --}}
    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
                </div>
                <div class="modal-footer">
                    <form action="#" id="delete_form" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm" value="{{ __('voyager::generic.delete_confirm') }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@stop

@section('css')
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
    <link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@endif
@stop

@section('javascript')
    <!-- DataTables -->
    @if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
        <script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
    @endif
    <script>
        $(document).ready(function(){
            $('#table-transaction').DataTable({
                responsive: true,
                serverSide: true,
                ajax: "{{ route('transaction.data') }}",
                columns: [
                    {"data" : "outlet"},
                    {"data" : "kode_invoice"},
                    {"data" : "member"},
                    {"data" : "tgl"},
                    {"data" : "batas_waktu"},
                    {"data" : "tgl_bayar"},
                    {"data" : "biaya_tambahan"},
                    {"data" : "diskon"},
                    {"data" : "pajak"},
                    {"data" : "status"},
                    {"data" : "dibayar"},
                    {"data" : "action", "orderable": false, "searchable" : false},
                ]
            });
        });
    </script>
    <script type="text/javascript" src="{{ asset('js/custom.js') }}"></script>
@stop
