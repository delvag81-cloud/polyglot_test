# Java calculator (no build tool)

## Установка
Windows/macOS: нужен JDK (проверить `javac -version`). Рекомендую Adoptium Temurin.

## Запуск тестов
Windows/macOS:
```bash
# компиляция
javac -d out src/main/java/Calculator.java src/test/java/CalculatorTest.java
# выполнение
java -cp out CalculatorTest
```

## Что это демонстрирует
- Чистый `javac/java` без Gradle/Maven.
- Исключение `ArithmeticException` при делении на ноль.
