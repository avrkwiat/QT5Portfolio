#include "ValuesFromC.h"
#include <QDebug>

QString ValuesFromC::state() const
{
    return m_state;
}
int ValuesFromC::bakeProcent() const
{
    return m_bakeProcent;
}
bool ValuesFromC::contact() const
{
    return m_contact;
}

/*********Signal SETER**************/
void ValuesFromC::setstate(const QString &state)
{
    if ( state == m_state )
        return;
    m_state = state;
    emit stateChanged(state);
}
void ValuesFromC::setbakeProcent(const int &bakeProcent)
{
    if ( bakeProcent == m_bakeProcent )
        return;
    m_bakeProcent = bakeProcent;
    emit bakeProcentChanged();
}
void ValuesFromC::setcontact(const bool &contact)
{
    if ( contact == m_contact )
        return;
    m_contact = contact;
    emit contactChanged();
}

/********Event*********/
void ValuesFromC::onButtonClicked(const QString &str)
{
    qDebug() << str;
}
void ValuesFromC::onbakeStart(const QString &str)
{
    if(str == "ON"){
        isBake=true;       
        qDebug() << "Start bake!";
    }else{
        isBake = false;
        qDebug() << "Stop bake!";
    }

}

/***************Symulation Timer********************/
int timer =0;
void ValuesFromC::changeValueSymulation()
{
    if(isBake){
        timer++;
        setbakeProcent(timer);
        qDebug() << timer;

        if(timer==31){
            isBake = false;
        }else if(timer==61){
            isBake = false;
        }
    }
}
