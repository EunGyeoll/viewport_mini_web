package com.mycompany.viewport_mini_web.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;
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
    for (Qna qna : qnaList) {
      qna.setQuemail(userService.getUserByUserId(qna.getQuserid()));
    }
    model.addAttribute("qnaList", qnaList);
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

  @GetMapping("qnaDetail")
  public String qnaDetail(int qid, Model model) {
    log.info("실행");
    Qna qna = boardService.getQna(qid);
    qna.setQuemail(userService.getUserByUserId(qna.getQuserid()));
    model.addAttribute("qna", qna);

    return "board/qnaDetail";
  }

  @GetMapping("/attachQnaDownload")
  public void attachDownload(int qid, HttpServletResponse response) throws Exception {
    // 다운로드할 데이터를 준비
    Qna qna = boardService.getQna(qid);
    byte[] data = qna.getQattachdata();
    // 응답 헤더 구성
    response.setContentType(qna.getQattachtype());
    String fileName = new String(qna.getQattachoname().getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
    // 응답 본문에 파일 데이터 출력
    OutputStream os = response.getOutputStream();
    os.write(data);
    os.flush();
    os.close();
  }

}
