-- Análise de Pedidos e Vendas — E-commerce (2025)

-- 1. Visualização inicial
SELECT *
FROM FACT_Orders
LIMIT 10;


-- 2. Quantidade total de pedidos
SELECT COUNT(*) AS total_linhas
FROM FACT_Orders;


-- 3. Período dos pedidos
SELECT
    MIN(Order_Date) AS primeira_data,
    MAX(Order_Date) AS ultima_data
FROM FACT_Orders;


-- 4. Faturamento total
SELECT
    SUM(Total) AS faturamento_total
FROM FACT_Orders;


-- 5. Ticket médio
SELECT
    AVG(Total) AS ticket_medio
FROM FACT_Orders;


-- 6. Menor e maior pedido
SELECT
    MIN(Total) AS menor_pedido,
    MAX(Total) AS maior_pedido
FROM FACT_Orders;


-- 7. Pedidos e faturamento por status
SELECT
    Status,
    COUNT(*) AS quantidade_pedidos,
    SUM(Total) AS faturamento,
    AVG(Total) AS ticket_medio
FROM FACT_Orders
GROUP BY Status
ORDER BY faturamento DESC;


-- 8. Evolução mensal
SELECT
    date_trunc('month', Order_Date) AS mes,
    COUNT(*) AS quantidade,
    SUM(Total) AS faturamento,
    AVG(Total) AS ticket_medio
FROM FACT_Orders
GROUP BY date_trunc('month', Order_Date)
ORDER BY mes;


-- 9. Quantidade de clientes distintos
SELECT
    COUNT(DISTINCT customer_name) AS clientes
FROM DIM_Customer;


-- 10. Clientes com nomes repetidos
SELECT
    customer_name,
    COUNT(*) AS ocorrencias
FROM DIM_Customer
GROUP BY customer_name
HAVING COUNT(*) > 1;
