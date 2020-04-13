@extends('voyager::master')

@section('page_title', __('Tambah Transaksi'))

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-dollar"></i>
        {{ __('Tambah Transaksi') }}
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
                       <form action="{{ route('voyager.transaction.store') }}" method="post" id="form-transaction">
                           {{-- Include CSRF token --}}
                           @csrf
                           <div class="form-group col-md-12">
                               <label class="control-label" for="id_member">Member</label>
                               <select name="id_member" id="id_member" class="form-control select2 select2-hidden-accessible">
                                   <option value="" selected>None</option>
                                   @foreach(\App\Member::all() as $member)
                                       {{-- If user is logged in using account petugas --}}
                                      @if(auth()->user()->role_id == 3)
                                        {{-- Filter members where id_outlet is the same as id_outlet petugas who is logged in --}}
                                        @if(auth()->user()->id_outlet == $member->id_outlet)
                                          <option value="{{ $member->id }}">{{ $member->nama }}</option>
                                        @endif
                                      {{-- If user logged in using role admin, show all member in dropdown menu --}}
                                      @else
                                        <option value="{{ $member->id }}">{{ $member->nama }}</option>
                                      @endif
                                   @endforeach
                               </select>
                           </div>

                           @if(auth()->user()->role_id == 1)
                              <div class="form-group col-md-12">
                                 <label class="control-label" for="id_outlet">Outlet</label>
                                 <select name="id_outlet" id="id_outlet" class="form-control select2 select2-hidden-accessible">
                                     <option value="" selected>None</option>
                                     @foreach(\App\Outlet::all() as $outlet)
                                        <option value="{{ $outlet->id }}">{{ $outlet->nama }}</option>
                                     @endforeach
                                 </select>
                            </div>
                           @endif

                           <div class="form-group col-md-12">
                               <label class="control-label" for="id_paket">Paket</label>
                               <select name="id_paket" id="id_paket" class="form-control select2 select2-hidden-accessible">
                                   <option value="" selected>None</option>
                                   {{-- Display all packages --}}
                                   @foreach(\App\Package::all() as $package)
                                      <option value="{{ $package->id }}">{{ $package->nama_paket }}</option>
                                   @endforeach
                               </select>
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="berat">Berat (Kg)</label>
                                <input type="number" name="berat" min="0.1" step="0.1" class="form-control" id="berat">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="qty">Qty</label>
                                <input type="number" name="qty" value="1" min="1" class="form-control" id="qty">
                           </div>

                            <div class="form-group col-md-12">
                               <label class="control-label" for="pajak">Pajak</label>
                                <input type="number" name="pajak" value="0" min="0" class="form-control" id="pajak">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="biaya_tambahan">Biaya Tambahan</label>
                                <input type="number" name="biaya_tambahan" value="0" min="0" class="form-control" id="biaya_tambahan">
                           </div>

                           <div class="form-group col-md-12">
                               <label class="control-label" for="diskon">Diskon</label>
                                <input type="number" name="diskon" min="0" max="100" value="0" class="form-control" id="diskon">
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
                                <textarea name="keterangan" class="form-control" rows="5"></textarea>
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
