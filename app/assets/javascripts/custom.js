$(document).ready(function(){
    var MaxInputs = 8; //maximum input boxes allowed
    var InputsWrapper = $("#InputsWrapper"); //Input boxes wrapper ID
    var AddButton = $("#add"); //Add button ID
    
    var x = InputsWrapper.length; //initlal text box count
    var FieldCount = 1; //to keep track of text box added
    
     AddButton.click(function (e) //on add input button click
    {
        if (x <= MaxInputs) //max input box allowed
        {
            FieldCount++; //text box added increment
            //add input box
            $(InputsWrapper).append('<tr><td><b class="label label-form">Category </b></td><td><select class="input-small input-select" id="attachment_category" name="attachment[category]" style="height:26px"><option value="java">java</option><option value="js">js</option><option value="python">python</option><option value="ruby">ruby</option></select></td></tr><tr><td><b class="label label-form">File to upload</b></td><td><input id="attachment_avatar" name="attachment[avatar]" type="file" /></td></tr>');
            x++; //text box increment
        }
        return false;
    });
});
