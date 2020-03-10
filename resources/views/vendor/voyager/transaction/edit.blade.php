@extends('voyager::master')

@section('page_title', __('Edit Transaksi'))

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-dollar"></i>
        {{ __('Edit Transaksi') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                   <div class="panel-body">
                       <form action="{{ route('voyager.transaction.update', $data->id) }}" method="post">
                           @csrf
                           @method('PUT')
                           <div class="form-group col-md-12">
                               <label class="control-label" for="id_member">Member</label>
                               <select name="id_member" id="id_member" class="form-control select2 select2-hidden-accessible">
                                   <option value="{{ $data->id_member }}" selected>{{ $data->member->nama }}
                                   </option>
                                   @foreach(\App\Member::all() as $member)
                                      @if($data->id_member !== $member->id)
                                        <option value="{{ $member->id }}">{{ $member->nama }}</option>
                                      @endif
                                   @endforeach
                               </select>
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="id_paket">Paket</label>
                               <select name="id_paket" id="id_paket" class="form-control select2 select2-hidden-accessible">
                                  <option value="{{ $data->detail->getOriginal('id_paket') }}" selected>{{ $data->detail->id_paket }}</option>
                                  @foreach(\App\Package::all() as $package)
                                    @if($package->nama_paket !== $data->detail->id_paket)
                                      <option value="{{ $package->id }}">{{ $package->nama_paket }}</option>
                                    @endif
                                  @endforeach
                               </select>
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="berat">Berat (Kg)</label>
                                <input type="number" name="berat" value="{{ $data->detail->berat }}" min="0.1" step="0.1" class="form-control" id="berat">
                           </div>
                           
                           <div class="form-group col-md-12">
                               <label class="control-label" for="qty">Qty</label>
                                <input type="number" name="qty" value="{{ $data->detail->qty }}" min="0" class="form-control" id="qty">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="pajak">Pajak</label>
                                <input type="number" name="pajak" value="{{ $data->getOriginal('pajak') }}" min="0" class="form-control" id="pajak">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="biaya_tambahan">Biaya Tambahan</label>
                                <input type="number" name="biaya_tambahan" value="{{ $data->getOriginal('biaya_tambahan') }}" min="0" class="form-control" id="biaya_tambahan">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="diskon">Diskon</label>
                                <input type="number" name="diskon" value="{{ $data->getOriginal('diskon') }}" class="form-control" id="diskon">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="status">Status</label>
                               <select name="status" id="status" class="form-control select2 select2-hidden-accessible">
                                   <option value="baru">Baru</option>
                                   <option value="proses">Proses</option>
                                   <option value="selesai">Selesai</option>
                                   <option value="diambil">Diambil</option>
                               </select>
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="dibayar">Dibayar</label>
                               <select name="dibayar" id="dibayar" class="form-control select2 select2-hidden-accessible">
                                   <option value="belum_dibayar">Belum Dibayar</option>
                                   <option value="dibayar">Dibayar</option>
                               </select>
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="keterangan">Keterangan</label>
                                <textarea name="keterangan" class="form-control" rows="5">{{ $data->detail->getOriginal('keterangan') }}</textarea>
                           </div>

                           <button type="submit" class="btn btn-primary mr-auto">Simpan</button>
                       </form>
                   </div>
                </div>
            </div>
        </div>
    </div>
@endsection
