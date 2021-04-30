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
public interface UserDao {
    /**
     *
     * @param forward
     * @return
     */
    public boolean forWord(@Param("forward")Forward forward);

    /**
     * 查询用户账号信息
     * @param aUserLogin
     * @return
     */
    public AUserLogin userLogin(AUserLogin aUserLogin);
    public String getName(String name);
    public List<AUserLogin2> userLogin2();
    public List<DUserLogin> doctorLogin();
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
