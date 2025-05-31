
const imageInput = document.getElementById('imageInput');
const previewContainer = document.getElementById('previewContainer');
const myForm = document.getElementById('myForm');
let selectedFiles = [];

imageInput.addEventListener('change', function(event) {
    const files = Array.from(event.target.files); // 파일을 배열로 복사

    files.forEach(file => {
        if (file.type.startsWith('image/')) {
            selectedFiles.push(file); // 배열에 추가

            const reader = new FileReader();
            reader.onload = function(e) {
                const wrapper = document.createElement('div');
                wrapper.style.position = 'relative';
                wrapper.style.display = 'inline-block';

                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.width = '150px';
                img.style.border = '1px solid #ccc';
                img.style.padding = '5px';
                img.style.borderRadius = '8px';

                const closeButton = document.createElement('button');
                closeButton.innerHTML = '&times;';
                closeButton.style.position = 'absolute';
                closeButton.style.top = '0';
                closeButton.style.right = '0';
                closeButton.style.background = 'red';
                closeButton.style.color = 'white';
                closeButton.style.border = 'none';
                closeButton.style.borderRadius = '50%';
                closeButton.style.cursor = 'pointer';
                closeButton.style.width = '24px';
                closeButton.style.height = '24px';

                closeButton.addEventListener('click', function() {
                    previewContainer.removeChild(wrapper);
                    selectedFiles = selectedFiles.filter(f => f !== file); // 배열에서 제거
                });

                wrapper.appendChild(img);
                wrapper.appendChild(closeButton);
                previewContainer.appendChild(wrapper);
            };
            reader.readAsDataURL(file);
        }
    });

    imageInput.value = ''; // 같은 파일 재선택 가능하게 초기화
});

// 폼 전송 시 실제 선택된 파일만 FormData로 추가
myForm.addEventListener('submit', function(e) {
    e.preventDefault(); // 기본 전송 막기

    const formData = new FormData();

    // 이미지 파일들 추가
    selectedFiles.forEach(file => {
        formData.append('images', file);
    });

    // 기타 input들도 추가
    const inputs = myForm.querySelectorAll('input, select, textarea');
    inputs.forEach(input => {
        if (input.type !== 'file') {
            formData.append(input.name, input.value);
        }
    });

    // 실제 전송 (fetch 사용)
    fetch('/petaddok.do', {
        method: 'POST',
        body: formData
    }).then(response => {
        return response.text().then(text => {
            console.log('서버 응답 상태:', response.status);
            console.log('서버 응답 내용:', text);

            if (response.ok) {
                alert('등록에 성공했습니다 !🐶');
                window.location.href = '/petboard.do';
            } else {
                alert('등록 실패: ' + text);
            }
        });
    }).catch(err => {
        console.error(err);
        alert('에러 발생');
    });

});