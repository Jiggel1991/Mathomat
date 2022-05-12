#ifndef MATH_H
#define MATH_H

#include <QObject>
#include <QString>
#include <QStringList>
#include <QtMath>
#include <QQueue>
#include <QStack>

#define SQUARE_ROOT     QChar(0x221A)
#define PI              QChar(0x03A0)
#define ZERO            QChar(0x2070)

class Math : public QObject
{
    Q_OBJECT
public:
    explicit Math(QObject *parent = nullptr);

    Q_INVOKABLE QString getPiSymbol();
    Q_INVOKABLE QString getSquareRootSymbol();
    Q_INVOKABLE double calculateTerm(QString term);
    Q_INVOKABLE bool checkSyntax(QString term);
    Q_INVOKABLE bool isMathError(double result);
    Q_INVOKABLE QStringList splitInfix(QString infix);
    Q_INVOKABLE bool isOperator(QChar c);
    bool isVariable(QChar c);
    bool isNumber(QChar c);
    bool isCharacter(QChar c);
    Q_INVOKABLE bool degreeActivated() const;
    Q_INVOKABLE void setDegreeActivated(bool state);
    Q_INVOKABLE QString decToBin(QString dec);
    Q_INVOKABLE QString decToOct(QString dec);
    Q_INVOKABLE QString decToHex(QString dec);
    Q_INVOKABLE QString binToDec(QString bin);
    Q_INVOKABLE QString octToDec(QString oct);
    Q_INVOKABLE QString hexToDec(QString hex);

signals:

private:
    /** members **/
    bool _degreeActivated;
    double ANS;
    /** methods **/
    QString checkNegative(QString term);
    bool isAngleFunction(QString string);
    bool isLogarithm(QString string);
    bool isNaturalNumber(double number);
    bool isFactorial(QChar c);
    int precedence(QChar c);
    double calculateSinus(double angle);
    double calculateCosinus(double angle);
    double calculateTangens(double angle);
    double calculateFactorial(double value);
    QQueue<QString> infixToPostfix(QString infix);
    double calculatePostfix(QQueue<QString> postfix);

};

#endif // MATH_H
