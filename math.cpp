#include "math.h"
#include <QDebug>
#include <bitset>

Math::Math(QObject *parent) : QObject(parent),
  _degreeActivated(true),
  ANS(0)
{

}

QString Math::getPiSymbol()
{
    return PI;
}

QString Math::getSquareRootSymbol()
{
    return SQUARE_ROOT;
}

double Math::calculateTerm(QString term)
{
    QString newTerm = checkNegative(term);
    double result = calculatePostfix(infixToPostfix(newTerm));
    return result;
}

QStringList Math::splitInfix(QString infix)
{
    QStringList list;
    QString split;
    /** split the infix string **/
    for(int i=0; i<infix.length(); i++){
        if(isNumber(infix[i]) || infix[i] == '#' || infix[i] == '.' || infix[i] == ',' || isCharacter(infix[i])){
            split.append(infix[i]);
            if(i == infix.length() - 1)
                list.append(split);
        }
        else{
            list.append(split);
            list.append(QString(infix[i]));
            split.clear();
        }
    }
    /** delete all empty strings from list **/
    for(int i=0; i<list.size(); i++){
        if(list[i].isEmpty()){
            list.removeAt(i);
        }
    }
    return list;
}

QString Math::checkNegative(QString term)
{
    /** if the fist character is a minus, change it to "#" **/
    if(term.front() == '-')
        term[0] = '#';
    for(int i=1; i<term.size(); i++){
        /** check if there is an operator before a minus and change it to "#" **/
        if(term[i] == '-' && isOperator(term[i-1]))
                term[i] = '#';
        /** check if there is a opening bracket before a minus and change it to "#" **/
        else if(term[i] == '-' && term[i-1] == '(')
            term[i] = '#';
    }
    return term;
}

bool Math::checkSyntax(QString term)
{
    /** check if the term is empty **/
    if(term.isEmpty())
        return false;
    /** check if the first character is an operator except minus **/
    if(term[0] == '+' || term[0] == '*' ||term[0] == '/' ||term[0] == '^')
        return false;
    /** check if the first character is "!" **/
    if(term[0] == '!')
        return false;
    /** check if the last character is an operator or a character **/
    if(isOperator(term[term.count()-1]) || isCharacter(term[term.count()-1]))
        return false;

    int numberOfBrackets = 0;
    int numberOfOperators = 0;
    int numberOfAmountBrackets = 0;

    for(int i=0; i<term.count(); i++){
        /** check if the number of opening brackets is equal to number of closing brackets **/
        if(term[i] == '(')
            numberOfBrackets++;
        if(term[i] == ')')
            numberOfBrackets--;
        /** check if there is an closing bracket before an opening bracket **/
        if(numberOfBrackets < 0)
            return false;
        /** check if all amount bracket has a closing one **/
        if(term[i] == '|')
            numberOfAmountBrackets++;
    }
    if(numberOfBrackets != 0)
        return false;
    if(numberOfAmountBrackets%2 != 0)
        return false;

    for(int i=0; i<term.count()-1; i++){
        /** check for a number after a variable **/
        if(isVariable(term[i]) && isNumber(term[i+1]))
            return false;
        /** check if there is an minus before an operator **/
        if(term[i] == '-' && isOperator(term[i+1]))
            return false;
        /** count the numbers of operators in a row **/
        if(term[i] == '+' || term[i] == '*' || term[i] == '/' || term[i] == '^')
            numberOfOperators++;
        if(!isOperator(term[i]))
            numberOfOperators = 0;
        /** check if there are 2 operators in a row **/
        if(numberOfOperators > 1)
            return false;
        /** check for empty brackets **/
        if(term[i] == '(' && term[i+1] == ')')
            return false;
        /** check for operators before a closing bracket **/
        if(isOperator(term[i]) && term[i+1] == ')')
            return false;
        /** check for operators before factorial **/
        if(isOperator(term[i]) && isFactorial(term[i+1]))
            return false;
        /** check for operators after an opening bracket except minus **/
        if(term[i] == '(' && (term[i+1] == '+' || term[i+1] == '*' || term[i+1] == '/' || term[i+1] == '^'))
            return false;
        /** check for number before character(sin, cos, tan) **/
        if(isNumber(term[i]) && isCharacter(term[i+1]))
            return false;
        /** check for number, character or brackets after factorial **/
        if(isFactorial(term[i]) && (isNumber(term[i+1]) || isCharacter(term[i+1]) || term[i+1] == '(' || term[i+1] == ')'))
            return false;
        /** check for empty amount **/
        if(term[i] == '|' && term[i+1] == '|')
            return false;
    }

    return true;
}

bool Math::isMathError(double result)
{
    if(result == INFINITY)
        return true;
    else
        return false;
}

bool Math::degreeActivated() const
{
    return _degreeActivated;
}

void Math::setDegreeActivated(bool state)
{
    _degreeActivated = state;
}

QString Math::decToBin(QString dec)
{
    QString bin;
    int decimal = dec.toInt();
    int rem;

    if(decimal == 0)
        return "0";

    while(decimal != 0){
        rem = decimal % 2;
        bin.insert(0, QString::number(rem));
        decimal = decimal / 2;
    }

    return bin;
}

QString Math::decToOct(QString dec)
{
    QString oct;
    int decimal = dec.toInt();
    int rem;

    if(decimal == 0)
        return "0";

    while(decimal != 0){
        rem = decimal % 8;
        oct.insert(0, QString::number(rem));
        decimal = decimal / 8;
    }

    return oct;
}

QString Math::decToHex(QString dec)
{
    QString hex;
    QString hexSymbols = "0123456789ABCDEF";
    qlonglong decimal = dec.toLongLong();
    int rem;

    if(decimal == 0)
        return "0";

    while(decimal != 0){
        rem = decimal % 16;
        hex.insert(0, hexSymbols.at(rem));
        decimal = decimal / 16;
    }

    return hex;
}

QString Math::binToDec(QString bin)
{
    QString binary = bin;
    qlonglong decimal = 0;

    for(int i=0; i<binary.length(); i++){
        decimal = decimal + binary.at(i).digitValue() * qPow(2, binary.length() - (i+1));
    }

    return QString::number(decimal);
}

QString Math::octToDec(QString oct)
{
    QString octal = oct;
    long long decimal = 0;

    for(int i=0; i<octal.length(); i++){
        decimal = decimal + octal.at(i).digitValue() * qPow(8, octal.length() - (i+1));
    }

    return QString::number(decimal);
}

QString Math::hexToDec(QString hex)
{
    QStringList hexadecimal;
    for(int i=0; i<hex.length(); i++){
        if(isNumber(hex.at(i)))
            hexadecimal.append(hex.at(i));
        else if(hex.at(i) == 'A')
            hexadecimal.append("10");
        else if(hex.at(i) == 'B')
            hexadecimal.append("11");
        else if(hex.at(i) == 'C')
            hexadecimal.append("12");
        else if(hex.at(i) == 'D')
            hexadecimal.append("13");
        else if(hex.at(i) == 'E')
            hexadecimal.append("14");
        else if(hex.at(i) == 'F')
            hexadecimal.append("15");
    }

    qlonglong decimal = 0;

    for(int i=0; i<hexadecimal.length(); i++){
        decimal = decimal + hexadecimal.at(i).toInt() * qPow(16, hexadecimal.length() - (i+1));
    }
    qDebug() << decimal;
    return QString::number(decimal);
}

bool Math::isOperator(QChar c)
{
    if(c == '+' || c == '-' || c == '*' || c == '/' || c == '^')
        return true;
    else
        return false;
}

bool Math::isNumber(QChar c)
{
    if(c >= '0' && c <= '9')
        return true;
    else
        return false;
}

bool Math::isVariable(QChar c)
{
    if(c == 'x' || c== 'X' || c == 'y' || c == 'Y' || c == 'z' || c == 'Z')
        return true;
    else
        return false;
}

bool Math::isCharacter(QChar c)
{
    if(((c >= 'a' && c <= 'w') || (c >= 'A' && c <= 'W')) && c != 'e')
        return true;
    else
        return false;
}

bool Math::isAngleFunction(QString string)
{
    if(string == "sin" || string == "cos" || string == "tan" || string == "arcsin" || string == "arccos" || string == "arctan")
        return true;
    else
        return false;
}

bool Math::isLogarithm(QString string)
{
    if(string == "ln" || string == "log")
        return true;
    else
        return false;
}

bool Math::isNaturalNumber(double number)
{
    if(number < 0)
        return false;

    int roundedNumber = qFloor(number);
    double n = number - roundedNumber;

    if(n != 0)
        return false;

    return true;
}

bool Math::isFactorial(QChar c)
{
    if(c == '!')
        return true;
    else
        return false;
}

int Math::precedence(QChar c)
{
    if(c == '!')
        return 4;
    if(c == '^' || c == SQUARE_ROOT)
        return 3;
    else if(c == '*' || c == '/')
        return 2;
    else if(c == '+' || c == '-')
        return 1;
    else
        return -1;
}

double Math::calculateSinus(double angle)
{
    if(_degreeActivated){
        /** check if the number has decimal places **/
        int integerAngle = (int)angle;
        double doubleAngle = (double)integerAngle;
        /** if the angle is a factor of 180°, return 0 **/
        if(doubleAngle == angle && !(integerAngle % 180))
            return 0;
        /** calculate the sinus if not **/
        else
            return qSin(qDegreesToRadians(angle));
    }
    else{
        int integerAngle = angle / M_PI;
        double doubleAngle = (double)integerAngle;
        /** check if the number is a factor of PI and return 0 **/
        if(doubleAngle == angle / M_PI)
            return 0;
        /** calculate the sinus if not **/
        else
            return qSin(angle);
    }
}

double Math::calculateCosinus(double angle)
{
    if(_degreeActivated){
        /** check if the number has decimal places **/
        int integerAngle = (int)angle;
        double doubleAngle = (double)integerAngle;
        /** if the angle is a factor of 180° + 90, return 0 **/
        if(doubleAngle == angle && !((integerAngle + 90) % 180)){
            return 0;
        }
        /** calculate the cosinus if not **/
        else
            return qCos(qDegreesToRadians(angle));
    }
    else{
        int integerAngle = (angle + M_PI_2) / M_PI;
        double doubleAngle = (double)integerAngle;
        /** check if the number is a factor of PI and return 0 **/
        if(doubleAngle == (angle + M_PI_2) / M_PI)
            return 0;
        /** calculate the cosinus if not **/
        else
            return qCos(angle);
    }
}

double Math::calculateTangens(double angle)
{
    if(_degreeActivated){
        /** check if the number has decimal places **/
        int integerAngle = (int)angle;
        double doubleAngle = (double)integerAngle;
        /** if the angle is a factor of 180°, return 0 **/
        if(doubleAngle == angle && !(integerAngle % 180)){
           return 0;
        }
        /** if the angle is a factor of 180° + 90, return infinity **/
        else if(doubleAngle == angle && !((integerAngle + 90) % 180)){
            return INFINITY;
        }
        /** calculate the tangens if not **/
        else
            return qTan(qDegreesToRadians(angle));
    }
    else{
        int integerAngle = angle / M_PI;
        double doubleAngle = (double)integerAngle;
        /** check if the number is a factor of PI and return 0 **/
        if(doubleAngle == angle / M_PI){
            return 0;
        }
        integerAngle = (angle + M_PI_2) / M_PI;
        doubleAngle = (double)integerAngle;
        /** check if the number is a factor of PI + PI/2 and return infinity **/
        if(doubleAngle == (angle + M_PI_2) / M_PI)
            return INFINITY;
        /** calculate the tangens if not **/
        else
            return qTan(angle);
    }
}

double Math::calculateFactorial(double value)
{
    if(value == 1 || value == 0)
        return 1;
    if(!isNaturalNumber(value))
        return INFINITY;

    double factor = value;
    double result = value;

    for(int i=1; i<factor; i++){
        result *= factor - i;
    }
    return result;
}

QQueue<QString> Math::infixToPostfix(QString infix)
{
    /** check for number before variable or pi **/
    for(int i=0; i<infix.count()-1; i++){
        if(isNumber(infix[i]) && (infix[i+1] == PI || infix[i+1] == 'e'))
            infix.insert(i+1, '*');
    }
    QStringList infixList = splitInfix(infix);
    QStack<QString> stack;
    QQueue<QString> postfix;
    for(int i=0; i<infixList.count(); i++){
        if(isNumber(infixList[i].front()) || infixList[i].front() == '#')
            postfix.append(infixList[i]);
        else if(infixList[i].front() == PI || infixList[i].front() == 'e')
            postfix.append(infixList[i]);
        else if(infixList[i] == "ANS")
            postfix.append(infixList[i]);
        else if(infixList[i].front() == '(')
            stack.push(infixList[i]);
        else if(infixList[i].front() == ')'){
            while((stack.top().front() != '(') && (!stack.empty())){
                postfix.append(stack.pop());
            }
            if(stack.top().front() == '('){
                stack.pop();
                if(!stack.isEmpty()){
                    if(isAngleFunction(stack.top()) || stack.top().front() == SQUARE_ROOT)
                        postfix.append(stack.pop());
                }
            }
        }
        else if(isOperator(infixList[i].front())){
            if(stack.isEmpty())
                stack.push(infixList[i]);
            else{
                if(precedence(infixList[i].front()) > precedence(stack.top().front()))
                    stack.push(infixList[i]);
                else if(precedence(infixList[i].front()) == precedence(stack.top().front()) && infixList[i].front() == '^')
                    stack.push(infixList[i]);
                else{
                    while(!stack.empty() && (precedence(infixList[i].front()) <= precedence(stack.top().front()))){
                        postfix.append(stack.pop());
                    }
                    stack.push(infixList[i]);
                }
            }
        }
        else if(isAngleFunction(infixList[i]))
            stack.push(infixList[i]);
        else if(isLogarithm(infixList[i]))
            stack.push(infixList[i]);
        else if(infixList[i].front() == SQUARE_ROOT)
            stack.push(infixList[i]);
        else if(isFactorial(infixList[i].front()))
            stack.push(infixList[i]);
        /**  **/
        else if(infixList[i].front() == '|'){
            QString amountTerm;
            i++;
            while(infixList[i].front() != '|'){
                amountTerm.append(infixList[i]);
                i++;
            }
            double amountResult = calculateTerm(amountTerm);
            if(amountResult < 0)
                amountResult *= -1;
            postfix.append(QString::number(amountResult));
        }
    }
    while(!stack.empty()){
        postfix.append(stack.pop());
    }
    return postfix;
}

double Math::calculatePostfix(QQueue<QString> postfix)
{
    QStack<double> stack;
    int postfixSize = postfix.count();
    for(int i=0; i<postfixSize; i++){
        /** if the queues head is a number, push it to the stack **/
        if(postfix.head().front() >= '0' && postfix.head().front() <= '9'){
            double operand = postfix.dequeue().toDouble();
            stack.push(operand);
        }
        /** if the queues head is a negative number, push it to the stack **/
        else if(postfix.head().front() == '#'){
            QString temp = postfix.dequeue();
            temp[0] = '-';
            stack.push(temp.toDouble());
        }
        /** if the queues head is pi, push it to the stack **/
        else if(postfix.head().front() == PI){
            stack.push(M_PI);
            postfix.dequeue();
        }
        /** if the queues head is e, push it to the stack **/
        else if(postfix.head().front() == 'e'){
            stack.push(M_E);
            postfix.dequeue();
        }
        /** if the queues head is ANS push it to the stack **/
        else if(postfix.head() == "ANS"){
            stack.push(ANS);
            postfix.dequeue();
        }
        /** if the queue head is a "+", pop the first two numbers of the stack and add them **/
        else if(postfix.head().front() == '+'){
            double operand_2 = stack.pop();
            double operand_1 = stack.pop();
            double intermediateResult = operand_1 + operand_2;
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "-", pop the first two numbers of the stack and subtract them **/
        else if(postfix.head().front() == '-'){
            double operand_2 = stack.pop();
            double operand_1 = stack.pop();
            double intermediateResult = operand_1 - operand_2;
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "*", pop the first two numbers of the stack and multiplicate them **/
        else if(postfix.head().front() == '*'){
            double operand_2 = stack.pop();
            double operand_1 = stack.pop();
            double intermediateResult = operand_1 * operand_2;
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "/", pop the first two numbers of the stack and divide them **/
        else if(postfix.head().front() == '/'){
            double operand_2 = stack.pop();
            double operand_1 = stack.pop();
            double intermediateResult = operand_1 / operand_2;
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "^", pop the first two numbers of the stack and exponentiate them **/
        else if(postfix.head().front() == '^'){
            double operand_2 = stack.pop();
            double operand_1 = stack.pop();
            double intermediateResult = qPow(operand_1, operand_2);
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "!", pop the first number of the stack and calculate its factorial **/
        else if(postfix.head().front() == '!'){
            double intermediateResult = calculateFactorial(stack.pop());
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "sin", pop the first number of the stack and calculate the sinus **/
        else if(postfix.head() == "sin"){
            double intermediateResult = calculateSinus(stack.pop());
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "cos", pop the first number of the stack and calculate the cosinus **/
        else if(postfix.head() == "cos"){
            double intermediateResult = calculateCosinus(stack.pop());
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** if the queue head is a "tan", pop the first number of the stack and calculate the tangens **/
        else if(postfix.head() == "tan"){
            double intermediateResult = calculateTangens(stack.pop());
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** arcsin **/
        else if(postfix.head() == "arcsin"){
            double sinus = stack.pop();
            double intermediateResult;
            if(_degreeActivated){
                intermediateResult = qRadiansToDegrees(qAsin(sinus));
            }
            else{
                intermediateResult = qAsin(sinus);
            }
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** arccos **/
        else if(postfix.head() == "arccos"){
            double cosinus = stack.pop();
            double intermediateResult;
            if(_degreeActivated){
                intermediateResult = qRadiansToDegrees(qAcos(cosinus));
            }
            else{
                intermediateResult = qAcos(cosinus);
            }
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** arctan **/
        else if(postfix.head() == "arctan"){
            double tangens = stack.pop();
            double intermediateResult;
            if(_degreeActivated){
                intermediateResult = qRadiansToDegrees(qAtan(tangens));
            }
            else{
                intermediateResult = qAtan(tangens);
            }
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** ln **/
        else if(postfix.head() == "ln"){
            double numerus = stack.pop();
            double intermediateResult = qLn(numerus);
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** log **/
        else if(postfix.head() == "log"){
            double numerus = stack.pop();
            double intermediateResult = qLn(numerus) / qLn(10);
            stack.push(intermediateResult);
            postfix.dequeue();
        }
        /** square root **/
        else if(postfix.head().front() == SQUARE_ROOT){
              double operand = stack.pop();
              double intermediateResult = qSqrt(operand);
              stack.push(intermediateResult);
              postfix.dequeue();
        }
    }
    double result = stack.pop();
    ANS = result;
    return result;
}
