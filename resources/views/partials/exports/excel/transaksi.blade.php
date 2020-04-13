<table>
	<thead>
		<tr>
			<th>No</th>
			<th>Outlet</th>
			<th>Member</th>
			<th>Kode Invoice</th>
			<th>Tanggal</th>
			<th>Batas Waktu</th>
			<th>Tanggal Bayar</th>
			<th>Biaya Tambahan</th>
			<th>Diskon</th>
			<th>Pajak</th>
			<th>Qty</th>
			<th>Status</th>
			<th>Dibayar</th>
			<th>Keterangan</th>
			<th>User</th>
		</tr>
	</thead>

	<tbody>
			@foreach($data as $transaksi)
				<tr>
					<td>{{ $loop->index+1 }}</td>
					<td>{{ $transaksi->outlet->nama }}</td>
					<td>{{ $transaksi->member->nama }}</td>
					<td>{{ $transaksi->kode_invoice }}</td>
                    <td>{{ \Date::parse($transaksi->tgl)->format('d - m - Y') }}</td>
					<td>{{ $transaksi->batas_waktu }}</td>
                    <td>{{ \Date::parse($transaksi->tgl_bayar)->format('d - m - Y') }}</td>
					<td>{{ $transaksi->biaya_tambahan }}</td>
					<td>{{ $transaksi->diskon }}</td>
					<td>{{ $transaksi->pajak }}</td>
					<td>{{ $transaksi->detail->qty }}</td>
					<td>{{ ucfirst($transaksi->status)  }}</td>
					<td>{{ ucfirst(str_replace('_', ' ',  $transaksi->dibayar)) }}</td>
					<td>{{ $transaksi->detail->keterangan }}</td>
					<td>{{ $transaksi->user->name }}</td>
				</tr>
			@endforeach
		</tbody>
</table>
