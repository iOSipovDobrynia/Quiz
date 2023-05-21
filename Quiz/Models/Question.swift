//
//  Question.swift
//  Quiz
//
//  Created by Goodwasp on 09.05.2023.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу вы предпочитаете?",
                responseType: .single,
                answers: [
                    Answer(title: "Морковка", animal: .rabbit),
                    Answer(title: "Кость", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Капуста", animal: .tortoise)
                ]
            ),
            Question(
                title: "Что вам больше нравится?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Прыгать", animal: .rabbit),
                    Answer(title: "Играть", animal: .dog),
                    Answer(title: "Лежать", animal: .cat),
                    Answer(title: "Ходить (медленно)", animal: .tortoise)
                ]
            ),
            Question(
                title: "Насколько вы любите поездки на машине",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Безразличен", animal: .tortoise),
                    Answer(title: "Обожаю", animal: .dog)
                ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case rabbit = "🐰"
    case cat = "🐱"
    case tortoise = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Собака – друг человека"
        case .rabbit:
            return "Кролик — это символ изобилия, счастья, долгой радостной жизни."
        case .cat:
            return "Коты символизируют хитроумие, внимательность, чувственную красоту"
        case .tortoise:
            return "Черепаха олицетворяет постоянство, время, мудрость и силу."
        }
    }
}
