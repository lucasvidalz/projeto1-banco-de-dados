-- Listar todos os eventos
SELECT *
FROM events;

-- Contar o número de inscrições por usuário
SELECT users.name, COUNT(registrations.id) AS num_registrations
FROM users
LEFT JOIN registrations ON users.id = registrations.user_id
GROUP BY users.name;

-- Encontrar eventos com inscrições pendentes
SELECT events.title
FROM events
JOIN registrations ON events.id = registrations.event_id
WHERE registrations.payment_status = 'Pending';

-- Listar usuários que deixaram avaliações
SELECT DISTINCT users.name
FROM users
JOIN reviews ON users.id = reviews.user_id;

-- Calcular o total de inscrições por categoria
SELECT categories.name, COUNT(registrations.id) AS num_registrations
FROM categories
LEFT JOIN events ON categories.id = events.category_id
LEFT JOIN registrations ON events.id = registrations.event_id
GROUP BY categories.name;

-- Encontrar eventos sem avaliações
SELECT events.title
FROM events
LEFT JOIN reviews ON events.id = reviews.event_id
WHERE reviews.id IS NULL;

-- Listar usuários que se inscreveram em um evento específico
SELECT users.name
FROM users
JOIN registrations ON users.id = registrations.user_id
WHERE registrations.event_id = 1;

-- Encontrar eventos com pelo menos 5 inscrições
SELECT events.title
FROM events
JOIN registrations ON events.id = registrations.event_id
GROUP BY events.title
HAVING COUNT(registrations.id) >= 5;

-- Calcular a média de avaliações por usuário
SELECT users.name, AVG(reviews.score) AS avg_score
FROM users
LEFT JOIN reviews ON users.id = reviews.user_id
GROUP BY users.name;

-- Encontrar eventos com a maior quantidade de inscrições pagas
SELECT events.title, COUNT(registrations.id) AS num_paid_registrations
FROM events
JOIN registrations ON events.id = registrations.event_id
WHERE registrations.payment_status = 'Paid'
GROUP BY events.title
ORDER BY num_paid_registrations DESC
LIMIT 1;





