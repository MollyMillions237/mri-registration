function X = openImageFile(fileName, fileExt)
%% Check if the file name is empty and throw exception
if isempty(fileName)
    msgId = 'openImageFile:FileEmpty';
    msg = 'File name shouldn\''t be empty';
    causeException = MException(msgId, msg);
    throw(causeException);
end

%% Check if the file name provided exists and throw exception otherwise
if exist(fileName, 'file') ~= 2
    msgId = 'openImageFile:UnableFindFile';
    msg = 'File doesn\''t exist: ';
    msg = strcat(msg,fileName);
    causeException = MException(msgId, msg);
    throw(causeException);
end

[~,~,ext] = fileparts(fileName);

% Check if the file's extension is the same as the one provided
% and thrwo exception otherwise
if strcmp(ext,fileExt) ~= 1
    msgId = 'openImageFile:FileExtensionInvalid';
    msg = 'File extension should have been : ';
    msg = strcat(msg,fileExt);
    msg2 = '\nInstead it\''s :';
    msg2 = strcat(msg2,ext);
    msg = strcat(msg,msg2);
    causeException = MException(msgId, msg);
    throw(causeException);
end 

try
    %% open file based on the image type
    %% TODO: add more image types
    if strcmp(fileExt,'.img') == 1
        X = openAnalyze75File(fileName);
    else
        msgId = 'openImageFile:UnsupportedFileType';
        msg = 'Unsupported file type : ';
        msg = strcat(msg,fileExt);
        causeException = MException(msgId, msg);
        throw(causeException);
    end
catch
    msgId = 'openImageFile:UnableOpenFile';
    msg = 'Unable to open file: ';
    msg = strcat(msg,fileName);
    causeException = MException(msgId, msg);
    throw(causeException);
end
end