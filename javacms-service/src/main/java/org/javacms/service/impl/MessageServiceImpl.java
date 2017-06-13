package org.javacms.service.impl;

import org.javacms.dao.MessageDao;
import org.javacms.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;
    public int getMessageCountByUserId(Object userId) {
        // TODO Auto-generated method stub
        return this.messageDao.getMessageCountByUserId(userId);
    }

}
