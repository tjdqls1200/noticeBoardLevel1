package crudExampleProject1.springMVC.controller;

import crudExampleProject1.springMVC.model.Post;
import crudExampleProject1.springMVC.repository.PostRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static java.rmi.server.LogStream.log;

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
        PostController.log.info("ok");
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
        PostController.log.info("ok2");
//        Post post = new Post(title, writer, password, textContents);
//        model.addAttribute("post", post);
        return "redirect:/";
    }

    // 게시글 조회
    @GetMapping("/noticeBoard/read/{postId}")
    public String readPost(@PathVariable Long postId,
                           Model model) {
        postRepository.getPost(postId);
        Post readPost = postRepository.read(postId);
        model.addAttribute("readPost", readPost);
        return "post";
    }

    @GetMapping("/noticeBoard/update/{postId}")
    public String updatePost(@PathVariable Long postId,
                             Model model) {
        Post updatePost = postRepository.getPost(postId);
        model.addAttribute("updatePost", updatePost);

        return "updatePost";
    }

    @PostMapping("/noticeBoard/update/{postId}")
    public String updatePost(@RequestParam String title,
                             @RequestParam String password,
                             @RequestParam String textContents,
                             @PathVariable Long postId,
                             Model model) {
        Post updatePost = postRepository.getPost(postId);
        if (!updatePost.getPassword().equals(password)) {
            model.addAttribute("updatePost", updatePost);
            return "updatePost";
        }
        postRepository.update(updatePost, title, textContents);
        return "redirect:/";
    }

    @GetMapping("/noticeBoard/delete/{postId}")
    public String deletePost(@PathVariable Long postId,
                             Model model) {
        Post deletePost = postRepository.getPost(postId);
        model.addAttribute("deletePost", deletePost);
        PostController.log.info("error 0 point");
        return "delete";
    }

    @PostMapping("/noticeBoard/delete/{postId}")
    public String deletePost(@PathVariable Long postId,
                             @RequestParam String password,
                             Model model) {
        Post deletePost = postRepository.getPost(postId);
        PostController.log.info("error 1 point");
        if (!deletePost.getPassword().equals(password)) {
            model.addAttribute("deletePost", deletePost);
            PostController.log.info("error 2 point");
            return "delete";
        }
        PostController.log.info("error 3 point");
        postRepository.delete(deletePost);
        return "redirect:/";
    }
}
