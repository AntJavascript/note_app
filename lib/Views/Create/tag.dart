class Tag extends StatefulWidget {

  final String text;
  final bool? isActive;

  this.Tag(text, {
    this.isActive = false,
  })

  @override
  State<StatefulWidget> createState() => TagState();
}

class TagState extends State<Tag>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text(text)
    )
  }

}
