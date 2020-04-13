 $('body').on('click', '#deleteTrans', function(e){
            e.preventDefault();
            $('#delete_modal').modal('show');
            $('#delete_form').attr('action', $(this).attr('href'));
        })

 $('body').on('click', '#btn-export', function(e){
    e.preventDefault();
    $('#form-export')[0].reset()
    $('#modalPeriode').modal('show')

    $('#btn-download').attr('disabled', true)
	$('#btn-download').attr('title', 'Tidak valid!')

	$('#form-export').attr('action', $(this).data('link'));

	console.log($('#form-export').attr('action'));
})

$('body').on('submit', '#form-export', function(){
    $('#modalPeriode').modal('hide');
})

$('body').on('change', 'input#from', function(){
	$('input#to').attr('min', $(this).val());
})

$('body').on('change', 'input#to', function(){
	let from = $('input#from').val();
	let to = $(this).val();

	if(to < from){
		$('#btn-download').attr('disabled', true)
		$('#btn-download').attr('title', 'Tidak valid!')
	}
	else if(to >= from){
		$('#btn-download').attr('disabled', false)
		$('#btn-download').removeAttr('title')
	}
})

$('body').on('click', '#btn-editstat', function(e){
	e.preventDefault();

	let url = $(this).attr('href');

	return fetch(url)
	.then(response => response.text())
	.then(result => {
		$('#customModal .modal-body').html(result);
		const div = document.createElement('div');
		div.classList.add('d-flex');
		const button = document.createElement('button');
		button.setAttribute('type', 'submit');
		button.setAttribute('id', 'btn-editStat');
		button.classList.add('btn');
		button.style.marginTop = '-7%';
		button.classList.add('btn-primary');
		button.classList.add('pull-right');
		button.innerHTML = 'Simpan';
		div.append(button);
		$('#customModal .modal-body form').append(div);
		$('#customModal').modal('show');
	})
})

$('body').on('submit', '#form-editStat', function(e){
	e.preventDefault();

	return fetch($(this).attr('action'), {
		headers: {
	     "Content-Type": "application/json",
	     "Accept": "application/json, text-plain, */*",
	     "X-Requested-With": "XMLHttpRequest",
	     "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
	    },
		method: 'PUT',
		body: JSON.stringify({
			status: $('select#status').val()
		})
	})
	.then(response => {
		if(response.status == 200){
			$('#customModal').modal('hide');
			setTimeout(() => {
				document.location.reload();
			}, 3400);
		}
		return response.json();
	})
	.then(result => Swal.fire({
		title: 'Berhasil !',
		icon: 'success',
		text: result.msg,
		timer: 3000,
		showConfirmButton:false
	}))
	.catch(err => {
		console.log(err);
	});
})

 // show modal result transaction
