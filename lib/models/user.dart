class User{
  String username;
  String name;
  String imageUrl;
  int followers;
  int following;
  int public_repo;
  String joined_date;

  User({
    this.username,
    this.name,
    this.imageUrl,
    this.followers,
    this.following,
    this.public_repo,
    this.joined_date,
  });
}








// Card(
// child: Column(
// children: [
// Image.network("${user.imageUrl.toString()}", height: 200, width: 200, alignment: Alignment.center,)
// SizedBox(height: 10,),
// Text("Userame: "+user.username.toString()),
// Text("Name: "+user.name.toString()),
// Text("Followers: "+user.followers.toString()),  //
// Text("Following: "+user.following.toString()),  //
// Text("Public Repositories: "+user.public_repo.toString()), //
// Text("Joined at "+user.joined_date.toString()),
// ],
// ),
// margin: EdgeInsets.all(30),
// borderOnForeground: true,
// color: Colors.white10,
// ),