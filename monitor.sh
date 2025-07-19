#!/usr/bin/env bash
echo "Запуск программы"
# Функция для более красивого вывода с вариативным количеством аргументов
function super_echo() {
  if [ -n "$2" ]; then
    echo "$2"
  fi
  echo
  echo "$1"
  echo
  echo "==============================================================================================================="
}
# Бесконечный цикл
while true; do
  # Очистка
  clear

  # Данные сначала записываются для быстродействия
  TOP_PROCESS=$(ps aux --sort=-%cpu | head -n 2 | tail -n 1)
  PID=$(echo "$TOP_PROCESS" | awk '{print $2}')
  STATUS=$(cat "/proc/$PID/status")
  CMDLINE=$(cat "/proc/$PID/cmdline")
  IO=$(cat "/proc/$PID/io")
  SCHED=$(cat "/proc/$PID/sched")

  # Вывод данных
  echo "==============================================================================================================="
  # С одним аргументом
  super_echo "TOP_PROCESS = $TOP_PROCESS"
  super_echo "PID = $PID"

  # С двумя аргументами
  super_echo "$STATUS" "Данные из файла status - основная информация о процессе"
  super_echo "$CMDLINE" "Данные из файла cmdline - какая консоль запустила процесс"
  super_echo "$IO" "Данные из файла io - информация о вводе-выводе"
  super_echo "$SCHED" "Данные из файла sched - информация о планировании"

  # Перерыв 5 секунд
  sleep 5
done
