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
    public List<School> findSchool();
    public List<Floor> findFloor(String schoolname);
    public List<Dormitory> findDormitory(String floorname);
    public int userRegistered(AUserRegistered user);
    public List<AUserRegistered> userFindPassword1();
    public int userFindPassword2(String phone, String pwd);
}
