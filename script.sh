#!/bin/bash

# ���������� ��������� ����� �� 1 �� 100
secret_number=$(( (RANDOM % 100) + 1 ))

# ������� ��� ��������, �������� �� ��������� �������� ������
function is_number() {
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then
        return 0
    else
        return 1
    fi
}

echo "����� ���������� � ���� '������ �����'!"
echo "���������� ������� ����� �� 1 �� 100."

attempts=0
guessed=false

while [ "$guessed" = false ]; do
    read -p "������� ���� �������: " guess

    if ! is_number "$guess"; then
        echo "����������, ������� ����� �����."
    else
        ((attempts++))
        if [ "$guess" -lt "$secret_number" ]; then
            echo "���������� ����� ������, ��� ���� �������."
        elif [ "$guess" -gt "$secret_number" ]; then
            echo "���������� ����� ������, ��� ���� �������."
        else
            guessed=true
            echo "�����������! �� ������� ����� $secret_number �� $attempts �������."
        fi
    fi
done


