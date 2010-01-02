Замеры скорости различных xsl-конструкций
=========================================

Разрозненные преждевременные наблюдения
---------------------------------------

1.  Разные методы в xsl:output:

    *   Самый быстрый, конечно, `text`

    *   Потом `xml`

    *   `html` самый медленный --- раза в полтора медленнее `text`, процентов на 10-15 медленнее `xml`.

    Почему `text` быстрее понятно. А вот почему `html` заметно медленнее --- непонятно.

2.  `xsl:text` vs просто текст. Конечно же, `xsl:text` не оптимизируется на стадии компиляции в просто текст,
    несколько последовательных `xsl:text` не склеивается в один. Ну и, очевидно, `xsl:text` чего-то да стоит.
    Как результат --- он медленнее. На тесте из примерно миллиона строк, выведенных через `xsl:text`, и такого же
    количества обычного текста лидирует обычный текст. Разница около двух раз.
