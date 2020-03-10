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