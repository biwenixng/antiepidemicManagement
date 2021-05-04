package cn.itcast.dao;

import cn.itcast.domain.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.List;

/**
 * @author 毕文星
 */
@Repository
public interface UserLoginDao {
    /**
     * 预约
     * @param forward
     * @return
     */
    public int forWord(Forward forward);

    /**
     * 查询用户账号信息
     * @param aUserLogin
     * @return
     */
    public AUserLogin userLogin(AUserLogin aUserLogin);

    /**
     * 查询用户信息
     * @param name
     * @return
     */
    public String getName(String name);

    public List<AUserLogin2> userLogin2();

    /**
     * 校医登录
     * @return
     */
    public DUserLogin doctorLogin(DUserLogin newLogin);
    public List<MUserLogin> adminLogin();

    /**
     * 获取校区
     * @return
     */
    public List<School> findSchool();

    /**
     * 获取楼
     * @param schoolname
     * @return
     */
    public List<Floor> findFloor(@Param("schoolname") String schoolname);

    /**
     * 获取寝室
     * @param floorname
     * @return
     */
    public List<Dormitory> findDormitory(@Param("floorname") String floorname);

    /**
     * 注册
     * @param user
     * @return
     */
    public int userRegistered(AUserRegistered user);
    public List<AUserRegistered> userFindPassword1();
    public int userFindPassword2(String phone, String pwd);
}
