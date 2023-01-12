package com.ipms.proj.projSetting.controller;

import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projSetting.reCaptcha.VerifyReCapcha;
import com.ipms.proj.projSetting.service.ProjSettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ProjSettingController {
    @Autowired
    ProjSettingService projSettingService;

    @GetMapping("/{projId}/settingManagement")
    public String setProj(@PathVariable String projId, Model model) {
        model.addAttribute("listProjectSettings", this.projSettingService.listProjectSettings(projId));
        return "proj/projSetting/settingManagement";
    }

    //프로젝트 수정하기
    @PostMapping(value = "{projId}/modifyProjectSettings")
    public String modifyProjectSettings(@PathVariable String projId,@ModelAttribute ProjVO projVO, MultipartFile[] uploadFile) {
        return this.projSettingService.projectCreate(projVO, uploadFile);
    }

    //프로젝트 탈퇴하기
    @ResponseBody
    @GetMapping(value = "{projId}/withdrawalProject")
    public int withdrawalProject(@PathVariable String projId){
        return this.projSettingService.withdrawalProject(projId);
    }


    @ResponseBody
    @RequestMapping(value = "/VerifyReCapcha", method = RequestMethod.POST)
    public int VerifyRecaptcha(HttpServletRequest request) {
       
        String gRecaptchaResponse = request.getParameter("recaptcha");
        try {
            if (VerifyReCapcha.verify(gRecaptchaResponse))
                return 0; // 성공
            else return 1; // 실패
        } catch (Exception e) {
            e.printStackTrace();
            return -1; //에러
        }
    }
}
