---
title: "Adr1GR Notas"
permalink: /
layout: default
---

##### Esta web esta hecha para uso personal, no es nada profesional ni se corrigen errores de ortografia (uso teclado americano y para algo asi no tengo ganas de ir cambiando de idioma para poner acentos). Son notas personales que hago y subo a esta web para poder acceder en cualquier momento, asi que nadie se tome esto como algo util para aprender. Si quieres informarte mejor aqui tienes un enlace util a la pagina oficial de cucumber: [school.cucumber.io](https://school.cucumber.io/)

# Contendido
1. [Documentado user stories](#documentingUserStories)
2. [Gherkin Keywords](#gherkinKeywords)

# Notas Gherkin 

## Documenting user stories <a name="documentingUserStories"></a>

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
 
## Gherkin Keywords <a name="gherkinKeywords"></a>

#### General

- **Feature**
   Agrupa escenario relacionados. Una feature está compuesta por Summary, Description y List of scenarios. 
  - **Summary**
    One line summary por cada feature. Summary de ejemplo para un E-commerce store:
    ```
    "Shopping basket"
    "Checkout"
    "Authentication"
    "Feature #112" (Si se usa Agile por ejemplo)
    ```
  - **Description**
    Es opcional y puede componerse por mas de una linea de texto. 
    Ejemplo: 
    ```
    Feature: Shopping Basket
    User should be able amend the items in the basket, change quantities, clear the basket //esta es la descripcion
    ```
  - **List of scenarios**
    Debe contener una lista de todos los escenarios.
    Ejemplo:
    ```
    Feature: Shopping Basket
        Scenaro: ...
        Scenaro: ...
        Scenaro: ...
        Scenaro: ...
    ```

- **Scenario**
    Tambien llamado 'example' en algunas implementaciones. Un scenario es una situacion que puede ser testeada, un ejemplo en concreto que ilustra una business rule.
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
    Describe el contexto inicial de la situacion, la "escena" del escenario, normalmente algo que ha pasado en el pasado.
    ```
    "Given I am logged in"
    "Given I have a product in the shopping basket"
    "Given I have a balance of 70"
    "Given I am a registered user"
    ```

- **When**
    Describe la accion que tiene que pasar
    Triggered por un actor, puede ser por una persona o por algo del sistema
    ```
    "When I click the loggin button"
    "When I click the add to cart button"
    "When credit amount is received"
    "When withdrawal succeeds"
    ```

- **Then**
    Describe el resultado o el outcome esperado.
    Tiene que ser observable, por el punto de vista del usuario, o un reporte o incluso un email, por ejemplo. **No puede estar escondido del usuario, como un cambio en la base de datos por ejemplo**
    ```
    "Then an alert appears on screen"
    "Then an email is sent"
    "Then a message appears"
    "Then product is removed from the shopping basket"
    ```

- **And**
    Se usa para remplazar cuando se tienen multiples Given, When o Then

    Por ejemplo, teniendo esto:
    ```
    GIVEN something
    GIVEN something else
    GIVEN something more
    ```

    puedes corregirlo a esto:
    ```
    Given something
    AND something else
    AND something more
    ```

    El software lo usa igual, solo que a la hora de que una persona lo lea es mas sencillo de entender.

- **But**
    Se puede usar cuando el resultado esperado implica algo negativo.
    Por ejemplo, de esto:
    ```
    THEN some result
    THEN something should not happen
    ```
    a esto:
    ```
    THEN some result
    BUT something else should not happen
    ```

    Ejemplo:
    ```
    THEN control is in Edit mode
    AND Save button is visible
    AND Edit button is not visible
    ```
    se deberia corregir de la siguiente manera:
    ```
    THEN control is in Edit mode
    AND Save button is visible
    BUT Edit button is not visible
    ```

- **Asterix (*)**
    Se puede usar cuando hay una lista de cosas, por ejemplo:
    Teniendo
    ```
    GIVEN I am grocery shopping
    GIVEN I buy bananas
    GIVEN I buy cucumber
    GIVEN I buy sausage
    ```
    se puede corregir a 
    ```
    GIVEN I am grocery shopping
    * I buy bananas
    * I buy cucumber
    * I buy sausage
    ```

- **Rule** *Opcional*
    Agrupa uno o mas escenarios que tienen las mismas business rules.
    Es simplemente un mecanismo para agrupar.
    
- **Background**
    Se usa cuando varios escenarios repiten Given statements.
    Por ejemplo, teniendo esto
    ```
    SCENARIO: example
    GIVEN I am logged in
    AND I have permissions to access x page
    WHEN ...

    SCENARIO: example 2
    GIVEN I am logged in
    AND I have permissions to access x page
    WHEN ...
    ```

    Se puede corregir a esto
    ```
    BACKGROUND:
    GIVEN I am logged in
    AND I have permissions to access x page

    SCENARIO: example 1
    WHEN ...
    ...

    SCENARIO: example 2
    WHEN ...
    ...
    ```

    Si hay background lo primero que se ejecuta es este antes que cada escenario.

- **Scenario outline**
    Basicamente es un template de scenarios, cuando por ejemplo tienes los mismo escenarios pero con distintos valores.

    Ejemplo:
    ```
    SCENARIO: example 1
    GIVEN product has stock level 10
    WHEN basket quantity changes by 2
    THEN stock level is 8
    ...

    SCENARIO: example 2
    GIVEN product has stock level 8
    WHEN basket quantity changes by -1
    THEN stock level is 9
    ...
    ```

    se puede corregir a esto
    ```
    SCENARIO OUTLINE:
    GIVEN product has stock level <begin>
    WHEN basket quantity changes by <basket>
    THEN stock level is <end>

    EXAMPLES:
    | begin | basket | end |
    | 10    | 2      | 8   |
    | 8     | -1     | 9   |
    ```

- **@ TAG**
    Se usa para categorizar un escenario o feature dentro de la implementacion de Cucumber.
    
    ```
    @exampletag
    FEATURE some feature

    @anotherexampletag
    SCENARIO ....
    GIVEN .....
    ```

    tambien se le pueden dar mas de un tag:
    ```
    @exampletag
    @exampletag2
    FEATURE some feature

    @anotherexampletag
    @anotherexampletag2
    SCENARIO ....
    GIVEN .....
    ```

    Ayuda a cucumber a ejecutar ciertas features o escenarios que matcheen tags.

    Si tiene el tag ```@ignore``` no se ejecutara.

- **Comments**
    Na, se escriben con ```# comentario```, nunca poner el comentario al lao de algo, siempre arriba.

- **DOC STRINGS**
    Se usan cuando se quiere escribir mucho, comentarios.

    ```
    """"
    Some example text
    =================
    Some really long example test for some step
    """"
    ```

    Tambien se pueden escribir con ``` en vez que con """".

- **Datatables**
    Se usan para pasar una lista de valores a un step.
    ```
    GIVEN the following quantities:
    | product | stock | basket |
    | tv      | 1     | 1      |
    | fridge  | 10    | 1      |
    ```

- **#Language**
    Usar al principio de cada feature. (Recomendacion)
    ```
    # language: es
    ```

