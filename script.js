const table = document.querySelector('#people-table');
const tbody = table.querySelector('tbody');

// Function to create a table row for a given person object
// td for every column value
// reused 
function createTableRow(person) {
    const row = document.createElement('tr');
    //each column value is taken from person object and then shown on html as a row
    row.innerHTML = `
        <td>${person.name}</td>
        <td>${person.height}</td>
        <td>${person.dob}</td>
        <td>${person.hobby}</td>
        <td><button class="button" onclick="change_hobby(${person.id});">Change Hobby</button> </td>
    `;
    return row;
}

// Function to sort the table rows based on a given column index and direction(asc/desc)
function sortTable(columnIndex, ascending = true) {
    const rows = Array.from(tbody.querySelectorAll('tr'));

    // Sort the rows based on the selected column's value
    rows.sort((a, b) => {
        const aCellValue = a.querySelectorAll('td')[columnIndex].textContent.trim();
        const bCellValue = b.querySelectorAll('td')[columnIndex].textContent.trim();
        return ascending ? aCellValue.localeCompare(bCellValue) : bCellValue.localeCompare(aCellValue);
    });

    // Clear the existing table rows
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    // Re-add the sorted rows to the table
    rows.forEach(row => tbody.appendChild(row));
}

//Change hobby when button is clicked
function change_hobby(id){
    
    console.log("from js "+id);
    fetch('api.php',{method: 'post', body:{'field':id}})
    .then(response => response.json())
    .then(data => {
        //add each person with changed hobby to the table
        //by replacing old row with new row
        data.forEach(person => {
            const row = createTableRow(person);
            tbody.replaceChild(row);
            console.log(person);
        }); //error 
    }).catch(error => console.error(error));
}


// Fetch the people data from the PHP endpoint
fetch('api.php')
    .then(response => response.json())
    .then(data => {
        // Loop through the people data and add each person to the table
        data.forEach(person => {
            const row = createTableRow(person);
            tbody.appendChild(row);
            console.log("get"+row);
        });
    })
    .catch(error => console.error(error));


// Add event listeners to each header to sort the table when clicked
table.querySelectorAll('th').forEach(header => {
    var isAscending = true;
    header.addEventListener('click', () => {
        const columnIndex = Array.from(header.parentNode.children).indexOf(header);
        sortTable(columnIndex, isAscending);
        isAscending = !isAscending;
        header.classList.toggle('desc');
    });
});


