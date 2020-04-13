<form action="{{ route('transaction.status.update', $transaction->id) }}" method="post" id="form-editStat">
	@csrf
	@method('PUT')
	<div class="form-group">
		<label class="control-label" for="status">
			Status Cucian
		</label>
		<select name="status" class="form-control" id="status" style="margin-bottom: 17%;">
			<option value="{{ $transaction->status }}">{{ ucfirst($transaction->status) }}</option>
			@foreach($data as $status)
				@if($status !== $transaction->status)
					<option value="{{ $status }}">{{ ucfirst($status) }}</option>
				@endif
			@endforeach
		</select>
	</div>
</form>