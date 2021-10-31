package crudExampleProject1.springMVC.controller;

import crudExampleProject1.springMVC.model.Post;
import crudExampleProject1.springMVC.repository.PostRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
public class PostController {

    private PostRepository postRepository = PostRepository.getInstance();

    @GetMapping("/")
    public String mainPage(Model model) {
        List<Post> postList = postRepository.list();
        model.addAttribute("postList", postList);
        return "main";
    }

    //새 게시글 작성페이지
    @GetMapping("/noticeBoard/newPost")
    public String newPost() {
        log.info("ok");
        return "newPost";
    }

    //새 게시글 전송
    @PostMapping("/noticeBoard/newPost")
    public String newPost(@RequestParam String title,
                          @RequestParam String writer,
                          @RequestParam String password,
                          @RequestParam String textContents,
                          Model model
                                ) {
        Post inputPost = new Post(title, writer, password, textContents);
        Post OutputPost = postRepository.save(inputPost);
//        model.addAttribute("post", OutputPost);
        log.info("ok2");
//        Post post = new Post(title, writer, password, textContents);
//        model.addAttribute("post", post);
        return "redirect:/";
    }

    // 게시글 조회
    @GetMapping("/noticeBoard/post/{postId}")
    public String readPost(@PathVariable Long postId,
                           Model model) {
        postRepository.getPost(postId);
        Post readPost = postRepository.read(postId);
        model.addAttribute("readPost", readPost);
        return "post";
    }
    @GetMapping("/noticeBoard/updatePost/{postId}")
    public String updatePost(@PathVariable Long postId,
                             Model model) {
        Post updatePost = postRepository.getPost(postId);
        model.addAttribute("updatePost", updatePost);
        return "updatePost";
    }

    @PostMapping("/noticeBoard/updatePost/{postId}")
    public String updatePost(@RequestParam String title,
                             @RequestParam String password,
                             @RequestParam String textContents,
                             @PathVariable Long postId,
                             Model model) {
        Post updatePost = postRepository.getPost(postId);
        if (updatePost.getPassword().equals(password)) {
            updatePost.setTitle(title);
            updatePost.setTextContents(textContents);
        }
        else {
            // 비밀번호 틀릴시 임시
            System.out.println("password error");
        }
        return "redirect:/";
    }

//    public String deletePost() {
//
//    }
}
