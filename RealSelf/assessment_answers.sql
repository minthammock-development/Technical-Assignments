-- Question 1: Q1
SELECT question_id
FROM table_of_questions_by_created_date qc
LEFT JOIN table_of_questions_and_tag_ids qt ON qc.question_id = qt.question_id
WHERE qc.created LIKE 2018%
AND tag_ids.tag_id LIKE "pre-op"

-- Question 1: Q2
SELECT tt.tag_name, MONTH(qc.created) AS months, SUM(qc.question_id) AS total_questions
FROM table_of_questions_by_created_date qc
LEFT JOIN table_of_questions_and_tag_ids qt ON qt.question_id = qc.question_id
LEFT JOIN table_of_tags tt ON tt.tag_id = qt.tag_id
WHERE YEAR(qc.created) > 2018
ORDER BY months,tt.tag_name

-- Question 1: Q3
SELECT tt.tag_name, AVG(COUNT(*)) AS total
FROM table_of_tags tt
JOIN table_of_questions_and_tag_ids qt ON qt.tag_id = tt.tag_id
JOIN (
  SELECT qc.question_id
  FROM table_of_questions_by_created_date qc
  WHERE (qc.created LIKE "2018%") OR (qc.created LIKE "2019%")
)
ON qc.question_id = qt.question_id
GROUP BY tt.tag_name
ORDER BY tt.tag_name DESC
