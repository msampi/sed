
/* Objectives */

var BASE_URL = 'http://localhost/sed/public/';
//var BASE_URL = 'http://sed.centromultimedia.com.ar/public/';
var objcounter = 0;


function appendWeightSelect(num){

    return '<td class="weight-column rating-column" rowspan="2">'+
                '<select id="weight-selector-'+num+'" class="form-control weight" onchange="changeWeightColor()">'+
                    '<option>0%</option>'+
                    '<option>25%</option>'+
                    '<option>50%</option>'+
                    '<option>75%</option>'+
                    '<option>100%</option>'+
                '</select>'+
            '</td>';
}

function appendRatingSelect(rating, disabled){


    rating = $.parseJSON(rating);
    var options = "";
    for(var key in rating)
        options += '<option>'+rating[key].value+'</option>';
	return '<td class="rating-column">'+
				'<select '+disabled+' class="form-control">'+
                    options+
				'</select>'+
			'</td>';
}

function appendPDPObjective(){
    $("#pdp-objective").append('<tr>'+
                                    '<td><textarea class="form-control"></textarea></td>'+
                                    '<td><textarea class="form-control"></textarea></td>'+
                                    '<td><textarea class="form-control"></textarea></td>'+
                                    '<td><textarea class="form-control"></textarea></td>'+
                                    '<td><a onclick="$(this).parent().parent().remove()" class="btn btn-danger btn-sm"><i class="fa fa-trash" style="font-size:16px"></i></a></td>'+
                                '</tr>');
}
function appendObjective(options){

    objcounter = parseInt(objcounter) + parseInt(options.objnum);
	$("#objectives-container").append('<table class="table table-bordered objective-table">'+
    	'<thead>'+
    		'<th colspan="6" style="background-color:#3c8dbc"><button class="btn btn-xs btn-danger" onclick="$(this).parent().parent().parent().parent().remove()"><i class="fa fa-trash"></i></button></th>'+
    	'</thead>'+
    	'<tbody>'+
    		'<tr>'+
    			'<td width="22%"><strong>'+options.objective+'</strong></td>'+
    			'<td class="rating-column weight-column font-white"><strong>'+options.weight+'</strong></td>'+
    			'<td><strong>'+options.reviewHY+'</strong></td>'+
    			'<td class="rating-column"><strong>Rating</strong></td>'+
    			'<td><strong>'+options.reviewFY+'</strong></td>'+
    			'<td class="rating-column"><strong>Rating</strong></td>'+
    		'</tr>'+
    		'<tr>'+
    			'<td rowspan="2"><textarea data-select="weight-selector-'+objcounter+'" data-id="" data-pid="'+options.pid+'" data-eid="'+options.eid+'" data-uid="'+options.uid+'" data-stage="objective"   class="form-control  objective-first-textarea textarea-small-'+objcounter+'"></textarea></td>'+
    			appendWeightSelect(objcounter)+
    			'<td><textarea disabled class="form-control textarea-small-'+objcounter+'"></textarea></td>'+
    			appendRatingSelect(options.rating, 'disabled')+
    			'<td><textarea disabled class="form-control textarea-small-'+objcounter+'"></textarea></td>'+
    			appendRatingSelect(options.rating, 'disabled')+
    		'</tr>'+
    		'<tr>'+
    			'<td><textarea class="form-control textarea-small-'+objcounter+'"></textarea></td>'+
    			appendRatingSelect(options.rating)+
    			'<td><textarea class="form-control textarea-small-'+objcounter+'"></textarea></td>'+
    			appendRatingSelect(options.rating)+
    		'</tr>'+
    	'</tbody>'+
    '</table>');

    $(".textarea-small-"+objcounter).wysihtml5({
        toolbar: {
            "font-styles": false, // Font styling, e.g. h1, h2, etc.
            "emphasis": true, // Italics, bold, etc.
            "lists": true, // (Un)ordered lists, e.g. Bullets, Numbers.
            "html": false, // Button which allows you to edit the generated HTML.
            "link": false, // Button to insert a link.
            "image": false, // Button to insert an image.
            "color": false, // Button to change color of font
            "blockquote": false, // Blockquote
            "size": 'xs' // options are xs, sm, lg
          }
        });
    objcounter++;
    changeWeightColor();


}

function removeObjective(elem, id){

    if (confirm(message))
        $.ajax({
          type: "POST",
          url: BASE_URL+'objectives/delete',
          data: {'_token': $('input[name=_token]').val(), 'id': id},
          success: function(){
            $(elem).remove();
          },
          dataType: 'json'
        });

}

function getTotalWeight(){
    var total = 0;
    $('.weight').each(function(){
        total += parseInt($(this).val().substring(0, $(this).val().length - 1));
    })
    return total;
}



function changeWeightColor(){

    if (getTotalWeight() != 100){
        $('.weight-column').css('background-color','#dd4b39');
         $("#add-objective").show();
    }
    else{
        $('.weight-column').css('background-color','#00a65a');
        $("#add-objective").hide();
    }


}

function getObjectivesDataToSave(){

    var elements = Array();
    var data;

    $('textarea').each(function(){
        data = {
            stage: $(this).data('stage'),
            entry: $(this).data('entry'),
            id: $(this).data('id'),
            uid: $(this).data('uid'),
            eid: $(this).data('eid'),
            pid: $(this).data('pid'),
            oid: $(this).data('oid'),
            selector: $("#"+$(this).data('select')).val(),
            description: $(this).val()
        };

        elements.push(data);
    });

    return JSON.stringify(elements);

}

function getCompetitionsDataToSave(){

    var elements = {'comments': [],'ratings': []};

    var data;

    $('textarea').each(function(){
        data = {
            stage: $(this).data('stage'),
            id: $(this).data('id'),
            uid: $(this).data('uid'),
            eid: $(this).data('eid'),
            cid: $(this).data('cid'),
            entry: $(this).data('entry'),
            comment: $(this).val()

        };

        elements.comments.push(data);
    });

    $('.bh-selector').each(function(){
        data = {
            id: $(this).data('id'),
            bid: $(this).data('bid'),
            uid: $(this).data('uid'),
            eid: $(this).data('eid'),
            stage: $(this).data('stage'),
            entry: $(this).data('entry'),
            rating: $(this).val()
        };

        elements.ratings.push(data);
    });



    return JSON.stringify(elements);

}

function getValorationsDataToSave(){

    var elements = {'comments': [],'ratings': []};

    var data;

    $('textarea').each(function(){
        data = {
            stage: $(this).data('stage'),
            id: $(this).data('id'),
            uid: $(this).data('uid'),
            eid: $(this).data('eid'),
            cid: $(this).data('cid'),
            entry: $(this).data('entry'),
            comment: $(this).val()

        };

        elements.comments.push(data);
    });

    $('.bh-selector').each(function(){
        data = {
            id: $(this).data('id'),
            bid: $(this).data('bid'),
            uid: $(this).data('uid'),
            eid: $(this).data('eid'),
            stage: $(this).data('stage'),
            entry: $(this).data('entry'),
            rating: $(this).val()
        };

        elements.ratings.push(data);
    });


    console.log(elements);
    return JSON.stringify(elements);

}

function objectivesSave(){
    $("#saving-label").show();
    $.ajax({
      type: "POST",
      url: BASE_URL+'objectives/save',
      data: {'_token': $('input[name=_token]').val(), 'data': getObjectivesDataToSave()},
      success: function(){
        $("#saving-label").hide();
      },
      dataType: 'json'
    });

}

function competitionsSave(){
    $("#saving-label").show();
    $.ajax({
      type: "POST",
      url: BASE_URL+'competitions/save',
      data: {'_token': $('input[name=_token]').val(), 'data': getCompetitionsDataToSave()},
      success: function(){
        $("#saving-label").hide();
      },
      dataType: 'json'
    });

}

function valorationsSave(){
    $("#saving-label").show();
    $.ajax({
      type: "POST",
      url: BASE_URL+'valorations/save',
      data: {'_token': $('input[name=_token]').val(), 'data': getValorationsDataToSave()},
      success: function(){
        $("#saving-label").hide();
      },
      dataType: 'json'
    });

}

function getAverage(elemclass){
  var sum = 0;
  $('.'+elemclass).each(function(){
    value = new String($(this).val());
    sum += parseInt(value.replace('%',''));
  })
  return sum;
}

$(function(){
    changeWeightColor();
    $('.weight-column select').change(function(){
        changeWeightColor();
    })

    $('.pdp-selector').change(function(){
        child_selector = $('#'+$(this).data('child'));
        child_selector.empty();
        options = actions[$(this).val()];

        options.forEach(function(action){
            child_selector.append('<option>'+action+'</option>');
        })


    })

    $('#average-comp-user-half').html(getAverage('sel-us-half'));
    $('#average-comp-evaluator-half').html(getAverage('sel-ev-half'));
    $('#average-comp-user-full').html(getAverage('sel-us-full'));
    $('#average-comp-evaluator-full').html(getAverage('sel-ev-full'));

    $('.sel-ev-half').change(function(){
      $('#average-comp-evaluator-half').html(getAverage('sel-ev-half'));

    });
    $('.sel-ev-full').change(function(){
      $('#average-comp-evaluator-full').html(getAverage('sel-ev-full'));
    });
    $('.sel-us-half').change(function(){
      $('#average-comp-user-half').html(getAverage('sel-us-half'));

    });
    $('.sel-us-full').change(function(){
      $('#average-comp-user-full').html(getAverage('sel-us-full'));
    });







})
