# frozen_string_literal: true
quests = [
    # Антека
    {title: 'Анкета',
     state: :active,
     description: 'Расскажи нам немного о себе',
     code: 'anketa',
     points: 3,
     answer: ''},

    # Что ты знаешь о “compact” ?
    {title: 'Что ты знаешь о “compact” ?',
     state: :active,
     description: 'Мы уверены, что ты знаком с методом Array#compact, запиши более простым методом аналогичную функцию. Дано: a - массив',
     code: 'compact',
     points: 5,
     answer: 'a-[p]'},

    # Работаешь со String’ами?
    {title: 'Работаешь со String’ами?',
     state: :active,
     description: 'Напиши код, который будет показывать есть ли в сроке “String” подстрока “ng”, “String”.include? “ng”  не предлагать :-)',
     code: 'strings',
     points: 4,
     answer: '“String”[“ng”]'},

    # Немного искусства
    {title: 'Немного искусства',
     state: :active,
     description: 'Сделай фото в соцсетях с хэштегом: #railsclub&atconsulting2016 на фотографии обязательно должен быть логотип АТ Consulting и 2 участника конференции',
     code: 'photo',
     points: 5,
     answer: ''},

    # БОЛЬШИЕ ЧИСЛА
    {title: 'БОЛЬШИЕ ЧИСЛА',
     state: :active,
     description: 'Как еще можно записать число 1 000 000 в ruby',
     code: 'bignums',
     points: 3,
     answer: '“String”[“ng”]'},

    # История АТ Consulting
    {title: 'История АТ Consulting',
     state: :active,
     description: 'В каком году была основана компания AT Consulting',
     code: 'athistory',
     points: 3,
     answer: '2001'
    },

    # Алгоритм 1
    {title: 'Алгоритм 1',
     state: :active,
     description: 'Сумма всех натуральных чисел, меньших 10 и кратных 3 либо 5 равна 23, чему равна сумма чисел меньших 1000?',
     code: 'alg1',
     points: 3,
     answer: '233168'},

    # Про длину массива
    {title: 'Про длину массива',
     state: :active,
     description: 'Покажи каким способом можно выяснить, что в массиве “a” строго больше 5 элементов ?',
     code: 'array',
     points: 3,
     answer: 'a[5]'},

    # Про интервалы
    {title: 'Про интервалы',
     state: :active,
     description: 'Как Range (1...10), превратить в массив',
     code: 'range',
     points: 3,
     answer: '[*1...10]'},

    # Рефакторинг
    {title: 'Рефакторинг',
     state: :active,
     description: 'Дано: a,b - массивы, наш стажер написал следующий код: a = a + b <br /> a.uniq!<>br />Помоги ему сделать код немного лучше',
     code: 'refactoring',
     points: 3,
     answer: 'a|=b'},


    # Алгоритм 2
    {title: 'Алгоритм 2',
     state: :active,
     description: '2520 наименьшее число, которое делится на все числа от 1 до 10 без остатка. Какое наименьшее число, которое будет делиться на все числа от 1 до 20 без остатка? Напиши алгоритм и у тебя будет возможность получить дополнительно 2 бала. :-)',
     code: 'alg2',
     points: 3,
     answer: '232792560'},

    # Поговорим про руби
    {title: 'Поговорим про руби',
     state: :active,
     description: 'Каким языком был вдохновлен Матц при выборе названия языка?',
     code: 'perl',
     points: 1,
     answer: 'perl'},

    # GC
    {title: 'GC в руби',
     state: :active,
     description: 'Что говорил Матц о GC в руби',
     code: 'gc',
     points: 3,
     answer: 'Это полезней для вашего здоровья'},

    # Алгоритм 3
    {title: 'Алгоритм 3',
     state: :active,
     description: 'Напиши последние 10 цифр суммы 1^1 + 2^2 + 3^3 + ... + 1000^1000',
     code: 'alg3',
     points: 2,
     answer: '9110846700'}
]

quests.each do |quest_data|
  Quest.create(quest_data)
end
