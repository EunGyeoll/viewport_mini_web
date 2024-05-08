package com.mycompany.viewport_mini_web.controller;


import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.viewport_mini_web.dto.Qna;
import com.mycompany.viewport_mini_web.service.BoardService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
  @Autowired
  BoardService boardService;
  @Autowired
  UserService userService;

  @GetMapping("/writeQNA")
  public String CreateNewBoard() {
    return "board/writeQNA";
  }

  @GetMapping("/qnaList")
  public String QnaList(Model model) {
    List<Qna> qnaList = boardService.getQnaList();
    for(Qna qna : qnaList) {
      qna.setQuemail(userService.getUserByUserId(qna.getQuserid()));
    }
    model.addAttribute("qnaList",qnaList);
    return "board/qnaList";
  }

  @GetMapping("/FAQ")
  public String FAQ() {
    return "board/FAQ";
  }

  @GetMapping("/qna")
  public String Qna() {
    return "board/qna";
  }

  @PostMapping("/writeQNA")
  @ResponseBody
  public ResponseEntity<?> WriteQNA(Qna qna, Model model, Principal principal) {
    log.info("실행");
    String uemail = principal.getName();
    qna.setQattachoname(qna.getQattach().getOriginalFilename());
    qna.setQattachtype(qna.getQattach().getContentType());
    try {
      qna.setQattachdata(qna.getQattach().getBytes());
    } catch (IOException e) {
    }
    qna.setQattachsname(
        UUID.randomUUID().toString() + "-" + qna.getQattach().getOriginalFilename());
    boardService.insertNewPost(qna, uemail);
    return ResponseEntity.ok("/viewport_mini_web/board/qnaList");
  }
}
