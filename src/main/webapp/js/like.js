let num = 1;
		$('#write_com').on('click', function(){
			let com = $('input[type=text]').val();
			$('#comments').append('<li class="com'+num+'">'+com+'<input type="button" value="댓글삭제"onclick="del('+num+')"></li>');
			num++;
			$('input[type=text]').val('');
			
		});
		
		function del(num){
			$('.com'+num).remove();
			
		}
		
		function like(){
			if($('#like_btn').val() =="좋아요"){
				$.ajax({
					type: "post",
					data: {"board_num": $('#board_num').html()},
					url: "likeService",
					dataType: "text",
					success: function(data){
						alert(data);
						$('#like_result').html(data);
						$('#like_btn').val("좋아요 취소");
						
					},
					error: function(){
						alert("실패!");
					}
				});
			}else{
				$.ajax({
					type: "post",
					data: {"board_num": $('#board_num').html()},
					url: "dislikeService",
					dataType: "text",
					success: function(data){
						alert(data);
						$('#like_result').html(data);
						$('#like_btn').val("좋아요");
					},
					error: function(){
						alert("실패!");
					}
				});
			}
		}