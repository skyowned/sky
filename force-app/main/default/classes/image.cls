public with sharing class image {
    @RemoteAction public static Id saveImage(String name, String contentType, String data) {
        Document d = new Document(Name=name, FolderId=UserInfo.getUserId(), contentType=contentType, Body=EncodingUtil.base64Decode(data));
        Database.insert(d, true);
        return d.id;
    }
}