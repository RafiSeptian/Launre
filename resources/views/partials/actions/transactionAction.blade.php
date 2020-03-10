<div class="d-flex text-center">
	<a href="{{ route('voyager.transaction.show', $id) }}" id="btn-look" class="btn btn-sm btn-warning"
	@if(auth()->user()->role_id == 4)
		disabled
	@endif
	>
		<i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">Lihat</span>
	</a>
	<a href="{{ $url_edit }}" class="btn btn-sm btn-primary edit" id="btn-edit">
		<i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
	</a>
	<a href="{{ $url_destroy }}" title="Hapus" class="btn btn-sm btn-danger delete" data-id="3" id="deleteTrans">
            <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Hapus</span>
        </a>
</div>

<script type="text/javascript">
	$('#btn-look').attr('disabled') ? $('#btn-look').attr('href', '#') : ''
</script>