$(document).ready(function() 
    {
    //alert("Hello World!");
    $('ul.stories').sortable(
      {
update: function() 
{
console.log($('ul.stories'))
  }
  });
});

