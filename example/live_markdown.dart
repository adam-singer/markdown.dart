import 'dart:html';
import 'package:markdown/lib.dart';

String defaultInput = r"""
# Header 1 #
## Header 2 ##
### Header 3 ###
#### Header 4 ####
##### Header 5 #####
 
## Markdown
[Link to google](http://www.google.com)
 
This is a paragraph, which is text surrounded by whitespace. Paragraphs can be on one 
line (or many), and can drone on for hours.  
 
Here is a Markdown link to [Warped](http://warpedvisions.org), and a literal <http://link.com/>. 
Now some SimpleLinks, like one to &#91;google&#93; (automagically links to are-you-
feeling-lucky), a &#91;wiki: test&#93; link to a Wikipedia page, and a link to 
&#91;foldoc: CPU&#93;s at foldoc.  
 
Now some inline markup like _italics_,  **bold**, and `code()`. Note that underscores in 
words are ignored in Markdown Extra.
 
![picture alt](/images/photo.jpeg "Title is optional")     
 
> Blockquotes are like quoted text in email replies
>> And, they can be nested
 
* Bullet lists are easy too
- Another one
+ Another one
 
1. A numbered list
2. Which is numbered
3. With periods and a space
 
And now some code:
 
    // Code is just text indented a bit
    which(is_easy) to_remember();
 
~~~
 
// Markdown extra adds un-indented code blocks too
 
if (this_is_more_code == true && !indented) {
    // tild wrapped code blocks, also not indented
}
 
~~~
 
Text with  
two trailing spaces  
(on the right)  
can be used  
for things like poems  
 
### Horizontal rules
 
* * * *
****
--------------------------
  
* Outer pipes on tables are optional
* Colon used for alignment (right versus left)
""";

void main() {
  TextAreaElement textArea = query('#markdown-input');
  textArea.defaultValue = defaultInput;
  DivElement output = query('#markdown-output');
  String markdown = markdownToHtml(defaultInput);
  output.innerHtml = markdown;

  textArea.on.input.add((e) {
    print("on input");
    var input = textArea.value;
    markdown = markdownToHtml(input);
    print("input = $input");
    print("markdown = $markdown");
    output.innerHtml = markdown;
  });
}

