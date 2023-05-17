class Bible {
      final String chapter; 
      final String book; 

      Bible(this.chapter,this.book);

      Bible.fromJson(Map<String,dynamic> json)
      : book = json["books"],
        chapter = json["chapters"];

      Map<String,dynamic> toJson() => {
        'books':book,
        'chapters':chapter, 
      };    
    }