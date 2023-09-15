---
title: "Adr1GR Notas"
permalink: /
layout: default
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
- **Condiciones**: prerequisitos (El usuario tiene que estar logeado? Registrado? O viendo alguna pagina en concreto)
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

|           | User Story                 | Gherkin |
| --------- | -------------------------- | ------- |
| WHO       | CUSTOMER                   | GIVEN   |
| CONDITION | ON PRODUCT PAGE            | GIVEN   |
| ACTION    | CLICKS "Buy" BUTTON        | WHEN    |
| RESULT    | PRODUCT AÑADIDO A LA CESTA | THEN    |
 
## Gherkin Keywords

#### General

- **Feature**: Agrupa escenario relacionados. Una feature está compuesta por Summary, Description y List of scenarios. 
  - **Summary**: One line summary por cada feature. Summary de ejemplo para un E-commerce store:
    ```
    "Shopping basket"
    "Checkout"
    "Authentication"
    "Feature #112" (Si se usa Agile por ejemplo)
    ```
  - **Description**: Es opcional y puede componerse por mas de una linea de texto. 
    Ejemplo: 
    ```
    Feature: Shopping Basket
    User should be able amend the items in the basket, change quantities, clear the basket //esta es la descripcion
    ```
  - **List of scenarios**: Debe contener una lista de todos los escenarios.
    Ejemplo:
    ```
    Feature: Shopping Basket
        Scenaro: ...
        Scenaro: ...
        Scenaro: ...
        Scenaro: ...

- **Scenario**: Tambien llamado 'example' en algunas implementaciones. Un scenario es una situacion que puede ser testeada, un ejemplo en concreto que ilustra una business rule.
  Un scenario tiene 3 cosas:
  - **Sumary**: Basicamente el titulo.
    ```
    "User can view a product details"
    "User can add a product to the shopping basket"
    "User can change password"
    ```
  - **Description**: opcional y larga, donde se dan detalles.
    ```
    Scenario: User can check out of basket page
    User should be able to press checkout button to go to the checkout while viweing the basket page
    ```
  - **List of steps**: Lista de pasos que tienen que ejecutar para validar del software.

#### Steps keywords

- **Given**
    