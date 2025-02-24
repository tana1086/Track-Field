document.addEventListener('turbo:load', selectFrom);

function selectFrom (){
    const select = document.getElementById('event_type_select');
    const selectDetail = document.getElementById('event_detail_select');
    const sprintForms = document.querySelectorAll('.sprint');
    const middleAndLongForms = document.querySelectorAll('.middle-and-long');
    const jumpingForms = document.querySelectorAll('.jumping');
    const throwingForms = document.querySelectorAll('.throwing');
    const combinedForms = document.querySelectorAll('.combined');
    const selectValue = select.value

    const allForms = document.querySelectorAll('.form');
    allForms.forEach(form => {
    form.style.visibility = 'hidden';
    form.style.position = 'absolute';
    });

    const allFields = document.querySelectorAll('.sprint-field, .middle-and-long-field, .jumping-field, .throwing-field');
    allFields.forEach(field => {
    field.disabled = true;
    });

    if(selectValue === 'sprint'){
        sprintForms.forEach(sprintForm => {
            sprintForm.style.visibility = 'visible';
            sprintForm.style.position = 'relative';
        })
        const fields = document.querySelectorAll('.sprint-field');
        fields.forEach(field => {
            field.disabled = false;
        });
    } else if(selectValue === 'middle_and_long'){
        middleAndLongForms.forEach(middleAndLongForm => {
            middleAndLongForm.style.visibility = 'visible';
            middleAndLongForm.style.position = 'relative';
        })
        const fields = document.querySelectorAll('.middle-and-long-field');
        fields.forEach(field => {
            field.disabled = false;
        });
    } else if(selectValue === 'jumping'){
        jumpingForms.forEach(jumpingForm => {
            jumpingForm.style.visibility = 'visible';
            jumpingForm.style.position = 'relative';
        })
        const fields = document.querySelectorAll('.jumping-field');
        fields.forEach(field => {
            field.disabled = false;
        });
    } else if(selectValue === 'throwing'){
        throwingForms.forEach(throwingForm => {
            throwingForm.style.visibility = 'visible';
            throwingForm.style.position = 'relative';
        })
        const fields = document.querySelectorAll('.throwing-field');
        fields.forEach(field => {
            field.disabled = false;
        });
    }
    select.addEventListener('change', selectFrom ,false)
}