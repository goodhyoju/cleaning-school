package com.goblinstic.cleaningschool.controller;

import com.goblinstic.cleaningschool.utils.SystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * packageName : com.goblinstic.cleaningschool.controller
 * fileName : PageController
 * author : goodhyoju
 * date : 2022/04/27 4:22 PM
 * description :
 */

@Controller
public class PageController {

    @Autowired
    private SystemUtils systemUtils;

    /**
     *
     * @return
     */
    @RequestMapping(value = { "/", "/index" }, method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView index() {
        ModelAndView view = new ModelAndView("index");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","index");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "cleaningBusiness" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView cleaningBusiness() {
        ModelAndView view = new ModelAndView("study/cleaning-business");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","cleaningBusiness");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "cleaningJob" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView cleaningJob() {
        ModelAndView view = new ModelAndView("study/cleaning-job");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","cleaningJob");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "preInspectionStartup" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView preInspectionStartup() {
        ModelAndView view = new ModelAndView("study/pre-inspection-startup");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","preInspectionStartup");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "preInspectionJob" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView preInspectionJob() {
        ModelAndView view = new ModelAndView("study/pre-inspection-job");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","preInspectionJob");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "cleaningStep" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView cleaningStep() {
        ModelAndView view = new ModelAndView("step/cleaning-step");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","cleaningStep");
        return view;
    }

    @RequestMapping(value = "preInspectionStep" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView preInspectionStep() {
        ModelAndView view = new ModelAndView("step/pre-inspection-step");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","preInspectionStep");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "studySchedule" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView studySchedule() {
        ModelAndView view = new ModelAndView("step/study-schedule");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","studySchedule");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "startupSupport" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView startupSupport() {
        ModelAndView view = new ModelAndView("startup-support");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","startupSupport");
        return view;
    }

    @RequestMapping(value = "consultation" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView consultation() {
        ModelAndView view = new ModelAndView("community/consultation");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","consultation");
        return view;
    }

    @RequestMapping(value = "notis" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView notis() {
        ModelAndView view = new ModelAndView("community/notis");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","notis");
        return view;
    }
    @RequestMapping(value = "qna" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView qna() {
        ModelAndView view = new ModelAndView("community/qna");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","qna");
        return view;
    }
    @RequestMapping(value = "review" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView review() {
        ModelAndView view = new ModelAndView("community/review");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","review");
        return view;
    }
    @RequestMapping(value = "schedule" , method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView schedule() {
        ModelAndView view = new ModelAndView("community/schedule");
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","schedule");
        return view;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "admin1981", method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView admin(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        ModelAndView view = new ModelAndView("/admin");
        String remoteIp = request.getRemoteAddr();
        String consultant = request.getParameter("consultant");
        if(StringUtils.isEmpty(consultant)){
            consultant = "운영자";
        }
        view.addObject("myip",systemUtils.getServerIp());
        view.addObject("page","admin");
        view.addObject("consultant",consultant);
        return view;
    }
}

