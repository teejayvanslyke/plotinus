function subject()    { return $('#subject input').val();   }
function predicate()  { return $('#predicate input').val(); }
function object()    { return $('#object input').val();   }
function sentence()  { return subject() + ' ' + predicate() + ' ' + object(); }

var size = 24;

$(function() {


  function searchTriples(callback)
  {
    $.get('/triples/search.json', {
      'triple[subject_name]':    subject(),
      'triple[predicate_name]':  predicate(),
      'triple[object_name]':     object()
    }, callback, 'json');
  }

  function allInputsFilled() {
    return subject() != '' && object() != '' && predicate != '';
  }
    
  function clearResults() 
  {
    $('#results').html('');
  }

  function clearInputs()
  {
    $('#subject input, #predicate input, #object input').val('');
  }

  function displayTripleSentence(triple)
  {
    $('#sentence').html(triple.to_sentence);
  }

  function isWordCharacter(keyCode)
  {
    return (keyCode > 48 && keyCode < 58)  || // Digits
           (keyCode > 64 && keyCode < 91)  || // A-Z
           (keyCode > 96 && keyCode < 123) || // a-z
           (keyCode == 8)                  || // Backspace
           (keyCode == 32);                   // Space
  }

  function truncate(str) 
  {
    var length = 25;
    return str.substr(0, length) + (str.length >= length ? '...' : '');
  }

  function createElementForTriple(triple)
  {
    var element = $('<div class="span-'+size+' last triple"></div>');

    element.
      append('<div class="span-'+(size/3)+'"><div class="subject"><a href="'+triple.subject_url+'">'+truncate(triple.subject)+'</a></div></div>').
      append('<div class="span-'+(size/3)+'"><div class="predicate">'+truncate(triple.predicate_name)+'</div></div>').
      append('<div class="span-'+(size/3)+' last"><div class="object"><a href="'+triple.object_url+'">'+truncate(triple.object)+'</a></div></div>').
      append('<div class="hidden-sentence">'+triple.to_sentence+'</div>');

    element.hover(
      function() { $('#sentence').html($(this).find('.hidden-sentence').html()); },
      function() { $('#sentence').html("Type a thing, a predicate, and a thing.  For instance, 'berlin is city' or 'pizza from italy'."); }
    );

    element.click(function() {
      $('#subject input').val($(this).find('.subject a').html());
      $('#object input').val($(this).find('.object a').html());
      $('#predicate input').val($(this).find('.predicate').html());
      updateResults({ keyCode: 32 });
    });

    return element;
  }

  function postTriple()
  {
    $.post('/triples', {
      'triple[subject_name]':   subject(),
      'triple[object_name]':    object(),
      'triple[predicate_name]': predicate()
      },
      function(data) {
        $('#sentence').html(data);
        clearInputs();
    });
  }

  function postTripleIfPressedReturn(e)
  {
    if (e.keyCode == 13)
    {
      postTriple();
    }
  }

  function linkToAddNewTriple(title) {
    var link = $('<a href="#">'+title+'</a>');
    link.click(function() { postTriple(); });
    return link;
    /*
    return "<a href=\"/triples/new?triple[subject_name]="+subject()+
           "&triple[object_name]="+object()+
           "&triple[predicate_name]="+predicate()+
           "\">"+
           title+
           "</a>";
    */
  }

  function updateResults(e) {

    // postTripleIfPressedReturn(e);
    if (! isWordCharacter(e.keyCode)) return;

    searchTriples(function(json) {
      clearResults();

      if (json.length == 0 && allInputsFilled()) {
        $('#sentence').html("'"+sentence()+"' has not been entered.  ").
                       append(linkToAddNewTriple('Add it!'));
        return;
      }
      if (json.length == 1) {
        displayTripleSentence(json[0]['triple']);
      }

      for (index in json) {
        $('#results').append(createElementForTriple(json[index]['triple']));
      }
    });
  }

  $('#subject input, #object input, #predicate input').keyup(updateResults);
  
  updateResults({ keyCode: 32 });
  
});
