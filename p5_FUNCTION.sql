-- Видаляємо функцію, якщо вона вже існує
DROP FUNCTION IF EXISTS divide_float_values;

-- Змінюємо розділювач, щоб MySQL не обірвав створення функції на першій крапці з комою
DELIMITER //

-- Створюємо функцію
CREATE FUNCTION divide_float_values(val1 FLOAT, val2 FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    -- Перевірка на ділення на нуль, щоб уникнути помилки
    IF val2 = 0 THEN
        RETURN NULL; 
    END IF;
    RETURN val1 / val2;
END //

-- Повертаємо стандартний розділювач
DELIMITER ;

-- Застосовуємо функцію до поля quantity (другий параметр - довільне число, наприклад, 2.5)
SELECT 
    id,
    order_id,
    quantity,
    divide_float_values(quantity, 2.5) AS divided_quantity
FROM order_details;