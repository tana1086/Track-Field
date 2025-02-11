const select = document.getElementById('event_type_select');
const sprintForms = document.querySelectorAll('.sprint');
const middleAndLongForms = document.querySelectorAll('.middle-and-long');
const jumpForms = document.querySelectorAll('.jump');
const throwingForms = document.querySelectorAll('.throwing');
const combinedForms = document.querySelectorAll('.combined');

function selectFrom (){
    const selectValue = select.value

    const allForms = document.querySelectorAll('.form');
    allForms.forEach(form => {
      form.style.visibility = 'hidden';
      form.style.position = 'absolute';
    });

    if(selectValue === 'sprint'){
        sprintForms.forEach(sprintForm => {
            sprintForm.style.visibility = 'visible';
            sprintForm.style.position = 'relative';
        })
    } else if(selectValue === 'middle_and_long'){
        middleAndLongForms.forEach(middleAndLongForm => {
            middleAndLongForm.style.visibility = 'visible';
            middleAndLongForm.style.position = 'relative';
        })
    } else if(selectValue === 'jump'){
        jumpForms.forEach(jumpForm => {
            jumpForm.style.visibility = 'visible';
            jumpForm.style.position = 'relative';
        })
    } else if(selectValue === 'throwing'){
        throwingForms.forEach(throwingForm => {
            throwingForm.style.visibility = 'visible';
            throwingForm.style.position = 'relative';
        })
    } else if(selectValue === 'combined'){
        combinedForms.forEach(combinedForm => {
            combinedForm.style.visibility = 'visible';
            combinedForm.style.position = 'relative';
        })
    }
}

select.addEventListener('change', selectFrom ,false)