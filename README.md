Замеры скорости различных xsl-конструкций
=========================================

Запуск тестов
-------------

После checkout'а, нужно в корне проекта запустить скрипт:

    $> git clone git://github.com/pasaran/xslt-speed-test.git
    $> cd xslt-speed-test
    $> ./genxml

Он сгенерит в папке `xml` необходимые для тестов xml'и.

Можно или запустить на выполнение все тесты разом:

    $> ./doall

Или же запустить конкретный тест:

    $> cd apply-templates-vs-call-template
    $> ../dotest

Результаты будут выведены в файлы `results` в соответствующих папках.


Отмазки
-------

Важно понимать, что все тесты очень зависят от среды исполнения. На разных машинах (даже с близкими версиями libxml/libxslt)
могут быть противоположные результаты и выводы.

Закоммиченные результаты были сделаны на моем ноутбуке с Ubuntu 9.10, версии библиотек:

    $> xsltproc --version
    Using libxml 20705, libxslt 10124 and libexslt 813
    xsltproc was compiled against libxml 20632, libxslt 10124 and libexslt 813
    libxslt 10124 was compiled against libxml 20632
    libexslt 813 was compiled against libxml 20632

Еще важно понимать, что тесты довольно таки синтетические, так что нельзя на них полностью полагаться.
В реальной жизни (много шаблонов, сложный развесистый и неоднородный xml и т.д.) все намного сложнее.
Это тема для будущих экспериментов. А это так, для затравки.


Выводы
------

1.  Неймспейсы -- зло [apply-templates-vs-apply-templates-with-namespaces](apply-templates-vs-apply-templates-with-namespaces/).

2.  `call-template` выгоднее, чем `apply-templates` [apply-templates-vs-call-template](apply-templates-vs-call-template/).

3.  Дефолтные шаблоны рулят. Самый быстрый способ вывести текстовую ноду -- `apply-templates` на нее
    [apply-templates-vs-value-of](apply-templates-vs-value-of/).

4.  Атрибуты лучше создавать инлайном, а не через `xsl:atttribute`.
    А еще лучше сразу задавать их в xsl статически [attribute-node-vs-inline-attribute](attribute-node-vs-inline-attribute/).

5.  `choose` для выбора между двумя вариантами лучше не использовать. `apply-templates` быстрее.
    При этом еще важный нюанс: в `choose` много времени тратится именно на сам выбор,
    а в `apply-templates` на вывод результата [choose-vs-apply-templates](choose-vs-apply-templates/).

6.  Копировать xml/html из исходного дерева лучше всего через `copy-of`.
    `identity transform` в два с лишним раза дороже -- без необходимости не использовать
    [copy-of-vs-identity-transform-vs-literal-result](copy-of-vs-identity-transform-vs-literal-result/).

7.  Пустой шаблон таки вызывается. И это чего-то стоит.
    При передаче параметра (даже в пустой шаблон) время тратится не на его передачу,
    а на прием. Т.е. если передавать параметр в шаблон, в котором нет `xsl:param`, то это ничего не стоит.
    А вот если есть, то это сразу ощутимо, даже если сам параметр в теле шаблона не используется
    [empty-template-vs-default-template](empty-template-vs-default-template/).

8.  `for-each` завсегда побьет `apply-templates`. Причем с очень приличным отрывом
    [for-each-vs-apply-templates](for-each-vs-apply-templates/).

9.  Удивительно, но вызов функции быстрее, чем именованный шаблон.
    Важное замечание: тест сильно зависит от машины и окружения. На другой машине могут быть другие результаты
    [function-vs-call-template-1-scalar](function-vs-call-template-1-scalar/) и [function-vs-call-template-2-xml](function-vs-call-template-2-xml/).

10. Невооруженным взглядом особой разницы между `xsl:include` и `xsl:import` обнаружить не удалось.
    Видимо, требуются более сложные эксперименты [include-vs-import](include-vs-import/).

11. Ключ дешевле строить по атрибуту, чем по вложенному элементу.
    Кроме того, чем короче xpath в match'е ключа, тем лучше.
    И в случае длинного xpath'а, лучше сделать его абсолютным, чем относительным [key-by-something](key-by-something/).

12. С ключом таки быстрее, чем без ключа. Чуда не случилось.
    В данном случае, выгоднее абсолютный путь в ключе. А короткий относительный путь просто неприемлимо долго считается.
    Вывод: думать надо всякий раз, основываясь на знании xml'я [key-vs-select](key-vs-select/).

13. Невнятный тест. Ничего существенного не выявилось [many-modes-vs-one-mode](many-modes-vs-one-mode/).

14. Один шаблон, в котором в match'е несколько нод через pipe или несколько одинаковых на каждую ноду?
    Без разницы [match-sequence-vs-match-pipe](match-sequence-vs-match-pipe/).

15. Насколько дорого использовать `//` в match'е. Невнятно, но вроде бы не очень дорого
    [match-with-double-slash](match-with-double-slash/).

16. `concat` дешевле, чем несколько `value-of` [n-value-of-vs-value-of-concat]((n-value-of-vs-value-of-concat/).

17. Один большой шаблон лучше, чем несколько маленькие [one-big-template-vs-many-small-templates](one-big-template-vs-many-small-templates/).

18. Похоже, что чем выше (в смысле стека вызова шаблонов) выводить что-нибудь в результирующее дерево, тем лучше
    [output-in-seven-steps](output-in-seven-steps/).

19. Лучше всего использовать `method="text"`. Если бы это было возможно всегда
    [output-xml-vs-output-html-vs-output-text](output-xml-vs-output-html-vs-output-text/).

20. Можно, если осторожно, использовать `//` в select'е [select-in-seven-steps](select-in-seven-steps/).

21. Дешевле выбрать все, а ненужное занулить [select-not-all-vs-match-not-all](select-not-all-vs-match-not-all/).

22. Самый быстрый способ выбрать все -- просто `apply-templates`. Потом через `*`, потом через pipe
    [select-star-vs-select-vs-select-pipe](select-star-vs-select-vs-select-pipe/).

23. Два шаблона с предикатом стоят столько же, сколько и один с if'ом
    [two-templates-vs-template-with-if](two-templates-vs-template-with-if/).

24. Ключ строится только если он используется [use-key-vs-define-key](use-key-vs-define-key/).

25. `xsl:text` стоит дороже, чем просто текст [xsl-text-vs-simple-text](xsl-text-vs-simple-text/).

26. Ось parent дороже, чем child. Использовать осторожно [parent-vs-child-axis](parent-vs-child-axis/).

27. Получить значение атрибута стоит дешевле, чем значение вложенного элемента [value-of-id-vs-value-of-@id](value-of-id-vs-value-of-@id/).


