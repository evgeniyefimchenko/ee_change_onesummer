<div id="user_id" style="padding-top: 15px; display: none;"><strong><p>user_id = {$order_info.user_id}</p></strong></div>
{literal}
	<script>
		$('.profile-info').append($('#user_id')).attr('style', 'margin-bottom: 2px;');
		$('#user_id').show();
	</script>
{/literal}