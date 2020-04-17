@extends('voyager::master')

@section('page_title', __('Tambah Modal'))

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-dollar"></i>
        {{ __('Tambah Modal') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        @if($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach($errors->all() as $error)
                                        <li>
                                            {{ $error }}
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <form action="{{ route('voyager.tb-modal.store') }}" method="post" id="form-modal">
                            {{-- Include CSRF token --}}
                            @csrf

                            <div class="form-group col-md-12">
                                <label class="control-label" for="keterangan">Keterangan</label>
                                <textarea name="keterangan" class="form-control" rows="5"></textarea>
                            </div>

                            <div class="form-group col-md-12">
                                <label class="control-label" for="biaya">Biaya</label>
                                <input type="number" id="biaya" name="biaya" min="0" value="0" class="form-control">
                            </div>

                            <button type="submit" class="btn btn-primary mr-auto">Simpan</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('javascript')
    <script src="{{ asset('js/custom.js') }}"></script>
@endsection
