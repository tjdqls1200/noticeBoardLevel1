package crudExampleProject1.springMVC.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Post {
    private Long postId;
    private String title;
    private String writer;
    private String password;
    private String textContents;
    private Long postHits = 0L;
    public Post() {

    }

    public Post(String title, String writer, String password, String textContents) {
        this.title = title;
        this.writer = writer;
        this.password = password;
        this.textContents = textContents;
    }
}
