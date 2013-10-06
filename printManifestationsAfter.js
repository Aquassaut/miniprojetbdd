function checkDate()
{
    var date = document.getElementById("date").value;
    var errorDate = document.getElementById("errorDate");
    var correct = true;

    if(date === "")
        return true;

    var validformat=/^\d{1,2}\/\d{1,2}\/\d{1,4}$/ //Basic check for format validity

    if (!validformat.test(date))
    {
        errorDate.innerHTML = "Format de la date invalide. Elle doit être du type JJ/MM/AAAA.";
        correct = false;
    }

    else
    {
        var dayfield = date.split("/")[0]
        var monthfield = date.split("/")[1]
        var yearfield=date.split("/")[2]
        var dayobj = new Date(yearfield, monthfield-1, dayfield)

        if ((dayobj.getMonth()+1!=monthfield) || (dayobj.getDate() != dayfield) ||
            (dayobj.getFullYear() != yearfield))
        {
            errorDate.innerHTML = "Date invalide.";
            correct = false;
        }
    }

    return correct;
}
