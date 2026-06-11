#!/bin/bash

sudo apt update
sudo apt install -y gpg curl unzip

# Получаем абсолютный путь к текущему скрипту, чтобы он не запускал сам себя
CURRENT_SCRIPT=$(readlink -f "$0")

# Перебираем все элементы в текущей директории
for dir in */; do
  # Проверяем, является ли это директорией
  if [ -d "$dir" ]; then
    echo "--- Входим в директорию: $dir ---"

    # Переходим в папку
    cd "$dir" || continue

    # Ищем все файлы .sh и запускаем их
    for script in *.sh; do
      # Проверяем существование файлов (на случай, если .sh файлов нет)
      if [ -f "$script" ]; then
        # Проверяем, что это не тот же самый скрипт
        if [ "$(readlink -f "$script")" != "$CURRENT_SCRIPT" ]; then
          echo "Запуск $script..."
          chmod +x "$script" # На всякий случай даем права на исполнение
          ./"$script"
        fi
      fi
    done

    # Возвращаемся обратно на уровень выше
    cd ..
  fi
done

echo "--- Готово! ---"
