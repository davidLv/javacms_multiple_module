package org.javacms.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.javacms.beans.Message;
import org.springframework.stereotype.Component;

//@Component
public interface MessageDao {
    @Select("SELECT COUNT(msg_id) msgCount FROM jc_message WHERE msg_receiver_user = #{userId} AND msg_status = 0")
    public int getMessageCountByUserId(@Param("userId") Object userId);
}
