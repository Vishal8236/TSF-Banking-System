$(document).ready(function () {
	show_payment_form = (e) =>{
		console.log(e)
		let user_id = $(e).attr('id')
		jQuery.ajax({
			type: 'get',
			url: '/make_transaction',
			data: {"user_id": user_id}
		});
	}
});