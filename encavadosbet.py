#!/usr/bin/python3 

import bottle
import os
from time import sleep
from functools import lru_cache
from bottle import (post, request, response, route, run, url, Response, static_file, template)
from string import Template
from bottle import TEMPLATE_PATH
import sqlite3

app = bottle.default_app()
TEMPLATE_PATH.insert(0, os.path.abspath(os.path.dirname(__file__)))
cand_template = Template(' <section class=\"card\"> <header> </header> <img src=\"$image.jpg\" width=\"200\" height=\"200\"> <ul> <li>&nbsp;$name</li> <li>&nbsp;$curso</li> <li>&nbsp;$matriculas MATRICULAS</li> </ul> <button> Apostar </button> <progress value=\"$votos\" max=\"$totalvotos\"> </section>')

abs_app_dir_path = os.path.dirname(os.path.realpath(__file__))

bd = sqlite3.connect('final.db')
bd_cursor = bd.cursor()

no_login_bar = ''' <ul class="topbar" >
  <li><a href="#login" onclick="login_click()">Mostar Carta de Caloiro &nbsp;</a></li>
  <li><a href="#register"> Registar Carta de Caloiro</a></li>

  <li style="float:right"><a class="active" href="#about">Engenharia</a></li>
</ul> '''

def check_login(username, password):
    if username == "Oco" and password == "Oco":
        return True
    else:
        return False

def get_candidates():

    final_string = ''
    cand = bd_cursor.execute('''SELECT NAME, MATRICULAS, CURSO, IMAGE FROM voter WHERE active != 0 ''').fetchall()
    total_votes = int(bd_cursor.execute("SELECT Sum(cnt) from (select Count(token) as cnt from voter inner join vote ON vote.what_candidate = voter.token GROUP by Name)").fetchone()[0])
    print("Total Number of votes: " + str(total_votes))
    new_candidates = []

    for ca in cand:
        new_candidate = {}
        new_candidate['name'] = ca[0]
        new_candidate['matriculas'] = ca[1]
        new_candidate['curso'] = ca[2]
        new_candidate['image'] = ca[3]
        new_candidate['votos'] = bd_cursor.execute("SELECT Count(token) from voter inner join vote ON vote.what_candidate = voter.token WHERE NAME = ?", (ca[0],)).fetchone()[0]
        new_candidate['totalvotos'] = total_votes
        new_candidates.append(new_candidate)


    for candidate in sorted(new_candidates, key=lambda k: k['votos'], reverse = True) :
        print(candidate)
        complete_card = cand_template.substitute(candidate)
        final_string += complete_card

    return final_string

def get_userbar(username):
    user = bd_cursor.execute('''SELECT NAME, MATRICULAS, CURSO, IMAGE FROM voter WHERE NAME == ? ''', (username, )).fetchone()
    login_bar = Template(''' <ul class="topbar" >
  <li> <div> <img src="$image.jpg" alt="thumbnail" width="60" height="60" > </div> </li>
  <li><a> $name </a></li>
  <li><a> $matriculas inscricoes </a></li>
  <li style="float:right"><a class="active" href="#about">$curso</a></li>
</ul>''').substitute(image=user[3],name = user[0], matriculas = user[1], curso = user[2])
    return login_bar

@route('/')
def check_app():

    username = request.get_cookie("account", secret='some-secret-key')
    if username:
        print("User " + str(username) + " entered") 
        return template('page.tpl', {'topbar':get_userbar(str(username)), 'cards':get_candidates()})
    else:
        print("UnKnown user entered")
        return template('page.tpl', {'topbar':no_login_bar, 'cards':get_candidates()})

    


@route('/login', method='POST')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if check_login(username, password):
        response.set_cookie("account", username, secret='some-secret-key')
        return template('page.tpl', {'topbar':get_userbar(username), 'cards':get_candidates()})
        #return template("<p>Welcome {{name}}! You are now logged in.</p>", name=username)
    else:
        return template('page.tpl', {'topbar':no_login_bar, 'cards':get_candidates()})
        #return "<p>Login failed.</p>"

@route('/restricted')
def restricted_area():
    username = request.get_cookie("account", secret='some-secret-key')
    if username:
        return template("Hello {{name}}. Welcome back.", name=username)
    else:
        return "You are not logged in. Access denied."


@route('/<filename:path>')
def send_static(filename):
    return static_file(filename, root=abs_app_dir_path)




if __name__ == '__main__':
    # use the Bottle framework run function to start the development server
    run(host='0.0.0.0', port=8080, debug=True, reloader=True)



