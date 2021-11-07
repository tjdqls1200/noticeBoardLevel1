package crudExampleProject1.springMVC.repository;

import crudExampleProject1.springMVC.model.Post;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.util.*;

@Getter @Setter
@Repository
public class PostRepository {
    private static Map<Long, Post> posts = new HashMap<>();
    private static long sequence = 0L;
    private static final PostRepository instance = new PostRepository();

    public static PostRepository getInstance() {
        return instance;
    }

    public PostRepository() {
    }

    // 저장
    public Post save(Post post) {
        post.setPostId(++sequence);
        Post result = posts.put(post.getPostId(), post);
        return result;
    }

    public List<Post> list() {
        ArrayList<Post> postList = new ArrayList<>(posts.values());
        return postList;
    }

    public Post getPost(Long postId) {
        Post readPost = posts.get(postId);
        return readPost;
    }

    // 조회
    public Post read(Long postId) {
        Post readPost = posts.get(postId);
        Long postHits = readPost.getPostHits();
        readPost.setPostHits(++postHits);
        posts.put(postId, readPost);
        return readPost;
    }

    // 수정
    public void update(Post post, String title, String textContents) {
        Post updatePost = posts.get(post.getPostId());
        updatePost.setTextContents(textContents);
        updatePost.setTitle(title);
        posts.put(post.getPostId(), updatePost);
    }

    // 삭제
    public void delete(Post post) {
        posts.remove(post.getPostId());
    }
}
