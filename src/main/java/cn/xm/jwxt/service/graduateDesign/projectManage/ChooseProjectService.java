package cn.xm.jwxt.service.graduateDesign.projectManage;

import cn.xm.jwxt.bean.baseInfo.TTeacherBaseInfo;
import cn.xm.jwxt.bean.graduateDesign.*;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ChooseProjectService {
    /**
     * 根据条件，查询课题信息
     * @param condition 课题名称、教师名称
     * @return 教师名称、课题id、课题名称、课题类型、课题来源、学生人数
     */
    List<Map<String,String>> getprojectInfoByCondition(Map<String, String> condition) throws Exception;

    /**
     * 获取课题申请详细信息
     * @param teacherTitleID
     * @return
     */
    public TeachergredesigntitleDetailVo getProjectInfoDetail(String teacherTitleID) throws Exception;

    /**
     * 初始化选择课题信息
     * @param studentID
     * @return
     */
    public List<ChooseProjectVo> getChooseProjectInfo(String studentID) throws Exception;

    /**
     * 保存选择课题
     * @param choose_titleIDstr
     * @return
     */
    public boolean saveChooseProject(String choose_titleIDstr) throws Exception;

    /**
     * 提交选择课题
     * @param choose_titleIDstr
     * @return
     */
    public boolean submitChooseProject(String choose_titleIDstr) throws Exception;

    /**
     * 检查学生提交信息   校内校外选择信息。
     * @return
     */
    public boolean findIsChoose() throws Exception;

    /**
     * 提交学生选择校外毕设的指导老师
     * @return
     * @throws Exception
     */
    public boolean submitChooseTeacher() throws Exception;
}
