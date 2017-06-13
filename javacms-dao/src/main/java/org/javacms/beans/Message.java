package org.javacms.beans;

import java.util.Date;

public class Message {
    
    private Integer msgId;
    
    private String msgTitle;
    
    private String msgContent;
    
    private Date sendTime;
    
    private Integer msgSendUser;
    
    private Integer msgReceiverUser;
    
    private Integer siteId;
    
    private byte msgStatus;
    
    private byte msgBox;

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Integer getMsgSendUser() {
        return msgSendUser;
    }

    public void setMsgSendUser(Integer msgSendUser) {
        this.msgSendUser = msgSendUser;
    }

    public Integer getMsgReceiverUser() {
        return msgReceiverUser;
    }

    public void setMsgReceiverUser(Integer msgReceiverUser) {
        this.msgReceiverUser = msgReceiverUser;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public byte getMsgStatus() {
        return msgStatus;
    }

    public void setMsgStatus(byte msgStatus) {
        this.msgStatus = msgStatus;
    }

    public byte getMsgBox() {
        return msgBox;
    }

    public void setMsgBox(byte msgBox) {
        this.msgBox = msgBox;
    }
    
    
}
