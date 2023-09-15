---
title: "Adr1GR Notas"
permalink: /
layout: default
remote_theme: pages-themes/architect@v0.2.0
plugins:
- jekyll-remote-theme # add this line to the plugins list if you already have one
---

# Notas Gherkin

## Documenting user stories

- Una historia de usuario tiene que ser un recorrido informal de alguna funcionalidad o feature. 
- Tiene que estar escrita desde la perspectiva del usuario.
- Tiene que tener un expected result.
- Tiene que tener acciones que permitan al usuario llegar a ese resultado esperado.
- Tiene que tener condiciones para poder hacer las acciones que le permitan llegar a ese resultado esperado.
- Son parte de Agile and Kanban.

Para crear una historia de usuario se necesitan los siguiente fundamentos.
- **Role/Actor**: Quien is involved (Admin, customer, visitor...)
- **Condiciones**: prerequisitos (El usuario tiene que estar logeado? Registrado? O viendo alguna pagina en concreto.)
- **Action**: Que es lo que el actor tiene que hacer (Pulsar un boton, enviar un email...)
- **Resultado**: Que es lo que pasa despues de realizar las acciones (Tiene que salir un popup, llevarle a cierta pagina...)

### Ejemplo

Customer can buy a product on the website.
Cuales son las **condiciones**? Tiene que estar en la pagina del producto.
Lo que sabemos es el rol, el **actor**: Customer.
Nos especifican que hay un boton en la pagina "Buy" y tiene que ser clickado, ya tenemos una **accion**. Pero no sabemos ni que website ni que boton, asi que volvemos a preguntar a la empresa.
Ahora sabemos que tiene que clickar en el boton "Buy" en la pagina del producto (La **preCondition**).
Entonces nos dicen que el producto se tiene que agregar a la cesta.
De momento nos quedaria algo tal que asi:
*Customer clicka en el boton "Buy" en la pagina del producto y el producto se añade a la cesta.*
Ahora tenemos el **expected result**, se añade al carro.

Esto ayuda a la hora de pasarlo a Gherkin, porque ahora solo hay que pasarlo. Esto seria lo que nos han dado de forma mas cercana a Gherkin:

|          | User Story | Gherkin |
|----------|------------|----------|
| WHO      | CUSTOMER   | GIVEN |
| CONDITION| ON PRODUCT PAGE | GIVEN |
| ACTION   | CLICKS "Buy" BUTTON | WHEN |
| RESULT   | PRODUCT AÑADIDO A LA CESTA | THEN |

## Gherkin

