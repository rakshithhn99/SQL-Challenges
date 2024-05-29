-- Schema:

-- Create the Candidate table
CREATE TABLE Candidate (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create the Vote table
CREATE TABLE Vote (
    id INT AUTO_INCREMENT PRIMARY KEY,
    candidateId INT,
    FOREIGN KEY (candidateId) REFERENCES Candidate(id)
);

-- Insert values into the Candidate table
INSERT INTO Candidate (id, name) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

-- Insert values into the Vote table
INSERT INTO Vote (candidateId) VALUES
(2),
(4),
(3),
(2),
(5);



-- Solution:

WITH CTE AS (SELECT
candidateId
FROM Vote
GROUP  BY candidateId
ORDER BY COUNT(*) DESC
LIMIT 1)

SELECT name
FROM candidate INNER JOIN CTE
ON candidate.id = CTE.candidateId;