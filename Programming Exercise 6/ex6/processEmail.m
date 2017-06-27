function word_indices = processEmail(email_contents)
% PROCESSEMAIL preprocesses the body of an email and returns a list of word_indices
% word_indices = processEmail(email_contents) preprocesses the body of an email and
% returns a list of indices of the words contained in the email.

% Load Vocabulary
vocabList = getVocabList();


