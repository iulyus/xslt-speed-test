include vs. import
==================

Насколько все же дорого обходится `xsl:import`.


Результаты тестов
-----------------

    -----------------------------------------------------------------------------------------------
                                    ../xml/s25000_.xml            run      parse xsl      parse xml
    -----------------------------------------------------------------------------------------------
                                           default.xsl         158.48           0.00          65.26
                                           include.xsl         158.52           0.00          65.36
                              include-and-override.xsl         158.80           0.00          64.84
          include-and-override-with-true-predicate.xsl         172.26           0.00          65.58
                                         include-3.xsl         158.92           0.00          65.28
                            include-3-and-override.xsl         159.34           0.00          65.56
                                         include-5.xsl         158.46           0.00          65.56
                            include-5-and-override.xsl         158.84           0.00          65.56
                                            import.xsl         160.92           0.00          65.66
                               import-and-override.xsl         158.66           0.00          65.30
           import-and-override-with-true-predicate.xsl         171.88           0.00          65.50
                                          import-3.xsl         159.88           0.00          65.24
                             import-3-and-override.xsl         158.60           0.00          65.14
                                          import-5.xsl         160.92           0.00          65.12
                             import-5-and-override.xsl         158.60           0.00          65.56

    -----------------------------------------------------------------------------------------------
                                    ../xml/s50000_.xml            run      parse xsl      parse xml
    -----------------------------------------------------------------------------------------------
                                     default-noout.xsl          26.06           0.00         130.74
                                     include-noout.xsl          26.06           0.00         130.10
                        include-and-override-noout.xsl          26.22           0.00         129.66
    include-and-override-with-true-predicate-noout.xsl          50.84           0.00         129.48
                                   include-3-noout.xsl          26.20           0.00         130.22
                      include-3-and-override-noout.xsl          26.16           0.00         129.30
                                   include-5-noout.xsl          26.30           0.00         129.36
                      include-5-and-override-noout.xsl          26.20           0.00         129.50
                                      import-noout.xsl          28.76           0.00         129.36
                         import-and-override-noout.xsl          26.14           0.00         130.06
     import-and-override-with-true-predicate-noout.xsl          51.06           0.00         129.84
                                    import-3-noout.xsl          28.72           0.00         130.34
                       import-3-and-override-noout.xsl          26.08           0.00         129.62
                                    import-5-noout.xsl          28.78           0.00         129.04
                       import-5-and-override-noout.xsl          26.16           0.00         129.92


В целом тест ничего не дал. Результаты на грани погрешностей эксперимента.
Видимо, нужен более сложный пример -- с множеством include/import, перекрывающихся шаблонов и т.д.

По этому тесту.

1.  Перекрытие шаблона шаблоном с такой же сигнатурой ничего не стоит.
    Т.е. если в самом файле и в include/import'е есть шаблон вида:
        <xsl:template match="item">
            ...
        </xsl:template>
    то второй шаблон перекрывает первый бесплатно.

2.  Если сигнатура меняется (см. *-with-true-predicate.xsl), то это выполняется медленнее.

3.  Почти незаметная, но все же существующая, разница есть в случае,
    когда в самом файле шаблона нет, а он есть в импортируемом файле.
    См. import.xsl vs. include-and-override.xsl

