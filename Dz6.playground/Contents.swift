import UIKit

var greeting = "Hello, playground"

// TODO: Более логично использовать название в единственном числе - Student. Так как кортеж содержит информации об одном студенте.
typealias Students = (name: String, age: Int, faculty: Set<String>, grades: [String: Double])


// TODO: Чтобы протестировать вывод, тебе нужно доработать здесь функцию.
// Есть 2 варианта либо вынести  var students: [Students] = [] наружу, чтобы потом обращаться к переменной.
// Либо сделать сосздание массива полностью внутри функции и чтобы она возвращала массив студентов, которых потом можно передеать в другие функции для теста.
// TODO: Некорректное название функции. Фактически ты добавляешь новых студентов в список, а название printInfo
func printStudentInfo (_ name: String, _ age: Int, _ faculty: Set<String>,_ grades: [String: Double]) {
    var students: [Students] = []
    var infoResult = (name: name, age: age, faculty: faculty, grades: grades)
    students.append(infoResult)
    
}

printStudentInfo("Ivan", 21, ["Art", "Music"], ["Chemistry": 7, "English": 10, "Math": 8])
printStudentInfo("Irina", 20, ["Dance", "Music"], ["Chemistry": 7, "Histiry": 9, "Physics": 8])
printStudentInfo("Sasha", 22, ["Art", "Science"], ["Physics": 7, "English": 10, "Math": 8])
printStudentInfo("Alex", 21, ["Art", "Music", "Dance"], ["Biology": 10, "Chemistry": 10, "English": 10])
printStudentInfo("Marina", 20, ["Dance", "Science", "Art", "Music"], ["Chemistry": 6, "English": 7, "Math": 9])


func printInfoStudents(students: [Students]) -> String {
    var result: String = ""
    for student in students {
        result += "Name: \(student.name), Age: \(student.age), Faculty: \(student.faculty), Grades: \(student.grades)"
    }
    return result
}


func calculateAverageGrade(student: Students) -> Double? {
    if student.grades.isEmpty {
        return nil
    } else {
        return student.grades.values.reduce(0, + ) / Double(student.grades.count)
    }
}


func getTopStudents(student: [Students], top: Int) -> [(name: String, averageGrade: Double)] {
    let studentsAverageGrade = student.compactMap { students -> (name: String, averageGrade: Double)? in
        if let averageGrade = calculateAverageGrade(student: students) {
            return (name: students.name, averageGrade: averageGrade)
        } else {
            return nil
        }
    }
    // TODO: Отступы уехали
        let studentSorted = studentsAverageGrade.sorted { $0.averageGrade > $1.averageGrade }
        return Array(studentSorted.prefix(top))
    }
    
    
  
    func findStudentsByAge(students: [Students], age: Int) -> [Students] {
        // TODO: Пробелы с внутренних сторон фигурных скобок
        students.filter {$0.age == 21}
    }
    
    
    // MARK: С точки зрения логики работает все правильно, можно немного упростить.
    // В одну строку. Set(students.flatMap { $0.faculty })
    // Мы можем массив привести к множество, в таком случае из массива автоматически уберутся все дубли.
    func getUniqueOptionalSubjects(students: [Students]) -> Set<String> {
        var studentsFaculty = Set<String>()
        var facultyOfStudent = students.flatMap { $0.faculty }
        return studentsFaculty.union(facultyOfStudent)
    }
    
   
