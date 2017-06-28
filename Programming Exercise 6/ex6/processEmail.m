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
 email_contents = regexprep(email_contents, '<[^<>]+>', ' ');
 
 % Handle Numbers
 % Look for one or more characters between 0-9
 email_contents = regexprep(email_contents, '[0-9]+', 'number'）；
 
 % Handle URLs
 % Look for strings starting with http:// or https：//
 email_contents = regexprep(email_contents, '(http|https)://[^\s]*', 'httpaddr');
 
 % Handle Email Addresses
 % Look for strings with @ in the middle
 email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');
 
 % Handle $ sign
 email_contents = regexprep(email_contents, '[$]+', 'dollar');
 
 
 % ==========Tokenize Email=============
 % Output the email to screen as well
 fprintf('\n==== Processed Email ====\n\n');
 
 % Process file
 l = 0;
 
 while ~isempty(email_contents)
        % Tokenize and also get rid of any unctuation
        [str, email_contents] = strtok(email_contents,[' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
        
        
 
 
 
 
 
 
 
 
 
 end
 
 % Print footer
 fprintf('\n\n===================================\n');
 
 end
 
 
 
 
 
 
 
 



