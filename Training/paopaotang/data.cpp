#include "data.h"
#include <QFile>
#include <QJsonDocument>
Data::Data(QObject *parent) : QObject(parent)
{
    m_mintime=0;
}

int Data::mintime()
{
    return m_mintime;
}

void Data::setTime(int time)
{
    m_mintime = time;
}
//void Data::setTime(int time, int score)
//{
//    if(score == m_highscore){
//        if(time < m_mintime)
//            m_mintime = time;
//    }
//}

int Data::highscore()
{
    return m_highscore;
}

void Data::setScore(int highscore)
{
    if(highscore > m_highscore){
        m_highscore = highscore;
    }
}

void Data::read(const QJsonObject &json)
{
    if (json.contains("highscore"))
        m_highscore = json["highscore"].toInt();
    if(json.contains("mintime"))
        m_mintime = json["mintime"].toInt();
}

void Data::write(QJsonObject &json) const
{
    json["highscore"] = m_highscore;
    json["mintime"] = m_mintime;
}

void Data::saveData()
{
    QFile saveFile(QStringLiteral("save.json"));

    if (!saveFile.open(QIODevice::ReadWrite)) {
        qWarning("Couldn't open save file.");
        return ;
    }

    QJsonObject gameObject;
    write(gameObject);
    QJsonDocument saveDoc(gameObject);
    saveFile.write(saveDoc.toJson());
}

bool Data::loadData()
{
    QFile loadFile(QStringLiteral("save.json"));

    if (!loadFile.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QByteArray saveData = loadFile.readAll();

    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));

    read(loadDoc.object());
    return true;
}
