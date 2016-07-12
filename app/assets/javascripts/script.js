$(function() {
    $.getJSON("https://api.github.com/users/AnnaCW",
      function(response) {
        console.log(response);
        $('#jsonhere').append("<li>Name: "+response.name+"</li>");
        $('#jsonhere').append("<li>Followers: "+response.followers+"</li>");
        $('#jsonhere').append("<li>Following: "+response.following+"</li>");
        $('#jsonhere').append("<li>Starred: "+response.starred+"</li>");

        $('#profileimg').append("<img src=\""+response.avatar_url+"\">Profile Image</img>");

      });

      $.getJSON("https://api.github.com/users/AnnaCW/repos",
        function(response) {
          console.log(response);
          $.each(response, function(i, repo) {
            $('#repos').append("<li>"+repo.name+"</li>");
           });
      });
});
