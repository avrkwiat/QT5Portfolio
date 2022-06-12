#ifndef ValuesFromC_H
#define ValuesFromC_H

#include <QObject>
#include <QDate>

class ValuesFromC : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QString state READ state WRITE setstate NOTIFY stateChanged )
    Q_PROPERTY( int bakeProcent READ bakeProcent WRITE setbakeProcent NOTIFY bakeProcentChanged )
    Q_PROPERTY( bool contact READ contact WRITE setcontact NOTIFY contactChanged )

public:
    QString state() const;
    int bakeProcent() const;
    bool contact() const;

    void setstate(const QString& state );
    void setbakeProcent(const int& bakeProcent );
    void setcontact(const bool& contact );

    bool isBake = false;
signals:
    void stateChanged(const QString &newState);
    void bakeProcentChanged();
    void contactChanged();
public slots:
    void onButtonClicked(const QString &);
    void onbakeStart(const QString &);
    void changeValueSymulation();
private:
    QString m_state;
    int m_bakeProcent;
    bool m_contact;
};

#endif // ValuesFromC_H
