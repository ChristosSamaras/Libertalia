SELECT COUNT(DISTINCT reference.JEmail, reference.Post_Date) AS NumReference
FROM reference
WHERE reference.Text = 'FreePalestine';
