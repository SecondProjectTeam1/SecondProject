
	function submit(){
		let id = $('#id').val();
		let title = $('#title').val();
		let content = $('#content').val();
		console.log(id,title,content)
		if(title.trim()=="") {
			$('#title').focus();
			return;
		};
		if(content.trim()=="") {
			$('#content').focus();
			return;
		};
		var form = document.frm;
	    form.submit();
	};
	// 사진 업로드
	function uploadImageByImgur(file, callback) {
		form = new FormData();
		form.append('image', file);
		$.ajax({
				xhr : function() {
					var xhr = new window.XMLHttpRequest();
					xhr.upload.addEventListener("progress", function(evt) {
						if (evt.lengthComputable) {
							console.log("업로드진행률:"+ parseInt((evt.loaded / evt.total * 100),10) + "%");
						}
					}, false);
					return xhr;
				},
				url : 'https://api.imgur.com/3/image',             
				headers : {
					Authorization : 'Client-ID 8d95801a0ad3ea9'
				},
				type : 'POST',
				data : form,
				cache : false,
				contentType : false,
				processData : false
		}).always(callback);
	}
	$(document).ready(function() {
		$("input[name=img]").change(function() {
			var file = this.files[0];
			uploadImageByImgur(file, function(result) {
				console.log(result);
				console.log('업로드결과:' + result.status);
				if (result.status != 200) {
					result = $.parseJSON(result.responseText);
				}
				if (result.data.error) {
					console.log('지원하지않는 파일형식..');
				} else {
					console.log('업로드된 파일경로:' + result.data.link);
					// $('#preview').attr('src',result.data.link)
					$('input[name="poster"]').val(result.data.link);
				}
			});
		});
	});

	$(document).ready(function(){
		  var fileTarget = $('.filebox .upload-hidden');
		    fileTarget.on('change', function(){
		        if(window.FileReader){
		            var filename = $(this)[0].files[0].name;
		        } else {
		            var filename = $(this).val().split('/').pop().split('\\').pop();
		        }
		        $(this).siblings('.upload-name').val(filename);
		    });
	});
	function setThumbnail(event) {
		for (var image of event.target.files) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var container = document.querySelector("div#image_container");
				while(container.hasChildNodes()){
					container.removeChild(container.firstChild);
				}
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.style.width = '100%';
				container.appendChild(img);
			};
			console.log(image);
			reader.readAsDataURL(image); 
		} 
	}
