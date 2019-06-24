#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QJsonObject>
class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int time READ mintime WRITE setTime NOTIFY minTimeChanged)
    Q_PROPERTY(int score READ highscore WRITE setScore NOTIFY highScoreChanged)
signals:
    void minTimeChanged();
    void highScoreChanged();
public:
    explicit Data(QObject *parent = nullptr);
    Q_INVOKABLE int mintime();
//    Q_INVOKABLE void setTime(int time, int highscore);
    Q_INVOKABLE void setTime(int time);

    Q_INVOKABLE int highscore();
    Q_INVOKABLE void setScore(int highscore);
    Q_INVOKABLE void read(const QJsonObject &json);
    Q_INVOKABLE void write(QJsonObject &json) const;
    Q_INVOKABLE void saveData();
    Q_INVOKABLE bool loadData();
protected:
    int m_highscore;
    int m_mintime;
};

#endif // DATA_H
