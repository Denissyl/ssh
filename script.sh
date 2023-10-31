#!/bin/bash

# Генерируем случайное число от 1 до 100
secret_number=$(( (RANDOM % 100) + 1 ))

# Функция для проверки, является ли введенное значение числом
function is_number() {
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then
        return 0
    else
        return 1
    fi
}

echo "Добро пожаловать в игру 'Угадай число'!"
echo "Попробуйте угадать число от 1 до 100."

attempts=0
guessed=false

while [ "$guessed" = false ]; do
    read -p "Введите вашу догадку: " guess

    if ! is_number "$guess"; then
        echo "Пожалуйста, введите целое число."
    else
        ((attempts++))
        if [ "$guess" -lt "$secret_number" ]; then
            echo "Загаданное число больше, чем ваша догадка."
        elif [ "$guess" -gt "$secret_number" ]; then
            echo "Загаданное число меньше, чем ваша догадка."
        else
            guessed=true
            echo "Поздравляем! Вы угадали число $secret_number за $attempts попыток."
        fi
    fi
done


