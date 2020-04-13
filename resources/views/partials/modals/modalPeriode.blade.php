<!-- Modal -->
<div class="modal fade" id="modalPeriode" tabindex="-1" role="dialog" aria-labelledby="modalPeriodeTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modalPeriodeTitle">Download Transaksi</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="{{ route('transaction.export') }}" method="post" id="form-export">
            {{-- Include CSRF Token --}}
            @csrf
            <div class="form-group">
              <label class="control-label" id="from">Dari</label>
              <input type="date" class="form-control" name="from" id="from" required />
            </div>
            <div class="form-group">
              <label class="control-label" id="to">Sampai</label>
              <input type="date" class="form-control" name="to" id="to" required />
            </div>
            <button type="submit" class="btn btn-primary" id="btn-download">Unduh</button>
        </form>
      </div>
    </div>
  </div>
</div>
