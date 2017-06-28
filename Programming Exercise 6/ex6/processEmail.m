function word_indices = processEmail(email_contents)
% PROCESSEMAIL preprocesses the body of an email and returns a list of word_indices
% word_indices = processEmail(email_contents) preprocesses the body of an email and
% returns a list of indices of the words contained in the email.

% Load Vocabulary
vocabList = getVocabList(); % cell(1899,1)

% Initialize return value
word_indices = [];

% ===== Preprocess Email =======
% Find the Headers (\n\n and remove)
% Uncomment the following lines if you are working with 
% raw emails with the full headers
% hdrstart = strfind(email_contents, ([char(10 char(10)]));
% email_contents = email_contents(hdrstart(1):end);

% Lower case
email_contents = lower(email_contents);

% Strip all HTML
% Looks for any expression that starts with < and ends with >
% and replace and does not have any < or > in the tag it with a space
% email_contents = regexprep(email_contents, '<[^<>]+>', ' ');



