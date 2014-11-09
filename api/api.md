FORMAT: 1A

# Content API
Content API is a **pastes service** similar to [GitHub's Content](http://gist.github.com).

## Authentication
Currently the Content API does not provide authenticated access.

## Media Types
Where applicable this API uses the [HAL+JSON](https://github.com/mikekelly/hal_specification/blob/master/hal_specification.md) media-type to represent resources states and affordances.

Requests with a message-body are using plain JSON to set or update resource states.

## Error States
The common [HTTP Response Status Codes](https://github.com/for-GET/know-your-http-well/blob/master/status-codes.md) are used.

# Content API Root [/]
Content API entry point.

This resource does not have any attributes. Instead it offers the initial API affordances in the form of the HTTP Link header and 
HAL links.

## Retrieve the Entry Point [GET]

+ Response 200 (application/json)
    + Headers
    

    + Body

            {
                "_links": {
                    "self": { "href": "/" },
                    "content": { "href": "/content?{since}", "templated": true }
                }
            }

# Group Content
Content-related resources of *Content API*.

## Content [/content/{id}]
A single Content object. The Content resource is the central resource in the Content API. It represents one paste - a single text note.

The Content resource has the following attributes: 

- id
- created_at
- description
- content

The states *id* and *created_at* are assigned by the Content API at the moment of creation. 


+ Parameters
    + id (string) ... ID of the Content in the form of a hash.

+ Model (application/json)

    + Headers

    + Body

          {
            "id": 6,
            "guid": "3c158a81-b114-49a2-8be2-a71462b717ec",
            "url": "/content/6",
            "type": "video",
            "section": "Section 3",
            "is_active": false,
            "image": {
              "title": "minim incididunt adipisicing",
              "url": "http://placehold.it/800x600",
              "caption": "fugiat occaecat esse deserunt consequat culpa voluptate tempor"
            },
            "title": "eu elit officia",
            "summary": "Magna mollit cupidatat sunt ex adipisicing do eu enim exercitation eu occaecat. Occaecat ex adipisicing velit irure do tempor enim mollit proident pariatur dolor ut minim. Id irure exercitation fugiat cupidatat dolore sunt Lorem excepteur fugiat anim reprehenderit.\r\n",
            "body": "Dolore consectetur eu do et commodo sunt et reprehenderit nostrud. Proident dolore ipsum amet et incididunt proident adipisicing minim irure sint adipisicing ex mollit anim. Eiusmod consectetur eu excepteur eu reprehenderit aute mollit adipisicing laborum labore pariatur sit. Laborum anim esse incididunt esse. Cillum officia culpa est ullamco sint mollit.\r\nTempor nulla culpa proident nostrud fugiat deserunt eu. Eiusmod ad aliquip nulla minim in laboris sunt fugiat fugiat occaecat ea incididunt officia duis. Est Lorem magna aute dolor laboris cillum deserunt laboris ex enim. Lorem consequat voluptate deserunt fugiat fugiat veniam proident est duis.\r\nDeserunt veniam mollit ullamco nisi non sunt nulla culpa est incididunt dolore fugiat incididunt consequat. Cillum ad laboris deserunt sunt eu duis excepteur Lorem anim sunt nisi. Id aute ad fugiat ex. Occaecat commodo incididunt aute tempor quis nostrud id. Mollit enim consectetur excepteur voluptate nisi sint qui sunt id quis ut mollit. Magna ipsum officia pariatur culpa minim eu proident. Eiusmod excepteur minim dolor anim nostrud eu tempor et sint.\r\nFugiat in incididunt pariatur ullamco ut nostrud nostrud eu. Pariatur dolore quis ad elit. Dolore amet do amet nulla cillum enim excepteur ullamco. Dolore adipisicing ut adipisicing incididunt Lorem duis nostrud esse voluptate non reprehenderit non.\r\nCupidatat in qui officia anim ex irure incididunt enim ipsum. Voluptate laboris consectetur nisi nostrud veniam et dolore. Magna ea eiusmod eiusmod deserunt exercitation nisi eiusmod dolor elit. Dolore amet commodo eiusmod cillum officia sint occaecat culpa. Velit qui minim veniam do Lorem voluptate dolor irure laboris amet. Aute consectetur aliqua anim eu cillum irure aliquip magna. Minim ut sint commodo eiusmod laborum non ex duis ex aliquip qui.\r\nPariatur incididunt fugiat ipsum elit eiusmod enim fugiat labore occaecat aliquip velit dolore. Enim nostrud nisi occaecat adipisicing tempor non excepteur. Commodo do non nulla commodo fugiat incididunt quis ad laborum. Sit voluptate id labore minim occaecat nisi aute. Minim quis non sunt dolor excepteur reprehenderit labore officia anim dolore. Nisi mollit et id ut proident elit aute ea id deserunt amet Lorem.\r\nNon commodo ipsum sint voluptate aute eiusmod ex nostrud occaecat. Reprehenderit nostrud commodo veniam esse amet occaecat ipsum ad id laborum ad. Exercitation minim fugiat adipisicing ea est ullamco ea labore nisi. Labore magna reprehenderit consequat nisi ipsum dolore quis. Anim nisi sunt irure consectetur veniam nostrud ut aute excepteur irure. Aliqua fugiat minim culpa enim voluptate quis laboris reprehenderit cillum proident est proident. Ut adipisicing ullamco ipsum laborum aute ad aliqua veniam est ullamco non aliqua.\r\nDolore est quis voluptate voluptate sint. Exercitation anim mollit est culpa dolore occaecat officia. Officia dolore anim laborum aute est eu cupidatat.\r\nNostrud incididunt nulla mollit dolor ipsum qui minim amet deserunt est magna aliquip. Elit nulla deserunt occaecat enim dolor ut commodo ex quis duis quis. Labore nulla excepteur cupidatat esse proident aliquip Lorem exercitation.\r\nEnim qui voluptate laboris consectetur incididunt officia laborum fugiat laborum veniam tempor. Dolor laboris nisi enim adipisicing aliqua ad dolore nulla in quis. Dolore officia quis dolore eu cillum dolore ex esse pariatur quis voluptate ea veniam.\r\n",
            "tags": [
              "velit",
              "dolore",
              "id",
              "consectetur",
              "ipsum",
              "ut",
              "esse"
            ]
          }

### Retrieve a Single Content [GET]
+ Response 200
    
    [Content][]

### Edit a Content [PATCH]
To update a Content send a JSON with updated value for one or more of the Content resource attributes. All attributes values (states) from the previous version of this Content are carried over by default if not included in the hash.

+ Request (application/json)

        {
            "content": "Updated file contents"
        }

+ Response 200
    
    [Content][]

### Delete a Content [DELETE]
+ Response 204

## Content Collection [/content{?since,limit,topic,section}]
Collection of all Contents.

The Content Collection resource has the following attribute:

- total

In addition it **embeds** *Content Resources* in the Content API.


+ Model (application/json)


    + Headers


    + Body
        {
          total: 13,
          data: [
            {
              "id": 0,
              "guid": "1da786d3-a504-4469-8b0e-63d9283e4f2a",
              "url": "/content/1",
              "type": "article",
              "section": "Section 2",
              "topic": "Section 1",
              "is_active": true,
              "image": {
                "title": "est non enim",
                "url": "http://placehold.it/800x600",
                "caption": "velit deserunt enim enim deserunt Lorem ad exercitation"
              },
              "title": "consectetur consectetur duis",
              "summary": "Sit ea duis sint nostrud ipsum mollit eiusmod ipsum quis reprehenderit cupidatat sunt ea. Amet consectetur magna reprehenderit proident aliquip deserunt. Eu laborum velit id adipisicing. Ullamco quis consequat nostrud ea ipsum nostrud ipsum incididunt esse tempor. Tempor ad aliquip qui anim. Amet culpa laboris quis nisi dolor in sint. Consequat nostrud cillum occaecat laborum minim do officia velit ad voluptate.\r\n",
              "tags": [
                "id",
                "exercitation",
                "mollit",
                "nulla",
                "sint",
                "exercitation",
                "duis"
              ]
            },
            {
              "id": 1,
              "guid": "87ac6160-6d68-418d-8457-194dfddd0394",
              "url": "/content/2",
              "type": "article",
              "section": "Section 4",
              "topic": "Section 3",
              "is_active": true,
              "image": {
                "title": "minim quis culpa",
                "url": "http://placehold.it/800x600",
                "caption": "ut minim proident culpa amet nisi laborum pariatur"
              },
              "title": "elit in aliqua",
              "summary": "Consectetur esse esse et eu. Sit minim ea cillum duis. Ipsum dolore ullamco exercitation ullamco.\r\n",
              "tags": [
                "occaecat",
                "eiusmod",
                "incididunt",
                "adipisicing",
                "ullamco",
                "amet",
                "cupidatat"
              ]
            },
            {
              "id": 2,
              "guid": "99f58967-2013-4b63-ab5a-cc85e4b96cf7",
              "url": "/content/3",
              "type": "video",
              "section": "Section 1",
              "topic": "Section 2",
              "is_active": true,
              "image": {
                "title": "qui voluptate et",
                "url": "http://placehold.it/800x600",
                "caption": "enim reprehenderit anim qui qui minim proident dolor"
              },
              "title": "nulla ex ullamco",
              "summary": "Pariatur amet dolore aute culpa incididunt labore ad ea qui non veniam. Eu aute incididunt cillum esse aliqua culpa ad aliqua qui pariatur irure. Exercitation exercitation nostrud pariatur eiusmod nostrud velit reprehenderit eiusmod voluptate esse. Do ad irure aliquip exercitation proident quis occaecat. Nulla dolor incididunt et aute enim officia voluptate. Velit tempor culpa officia culpa minim eu nisi ex magna ad nulla exercitation. Eiusmod cillum duis laborum labore.\r\n",
              "tags": [
                "culpa",
                "veniam",
                "officia",
                "non",
                "ex",
                "minim",
                "qui"
              ]
            },
            {
              "id": 3,
              "guid": "a956d960-4cb1-4bef-a379-97b50ae7e986",
              "url": "/content/4",
              "type": "page",
              "section": "Section 3",
              "topic": "Section 4",
              "is_active": false,
              "image": {
                "title": "elit est adipisicing",
                "url": "http://placehold.it/800x600",
                "caption": "culpa veniam in sit adipisicing ipsum minim nulla"
              },
              "title": "non consequat quis",
              "summary": "Quis ullamco excepteur velit commodo dolore fugiat. Enim incididunt ea nulla velit. Nisi reprehenderit sunt aliqua commodo aliquip nostrud. Consequat adipisicing aliquip do pariatur minim cillum adipisicing. Veniam veniam non adipisicing non nostrud eiusmod sit qui ipsum. Aliquip magna ut voluptate incididunt sunt pariatur fugiat laborum. Commodo anim labore voluptate ea do proident tempor velit amet quis esse incididunt deserunt nulla.\r\n",
              "tags": [
                "laboris",
                "adipisicing",
                "magna",
                "sint",
                "magna",
                "cupidatat",
                "quis"
              ]
            },
            {
              "id": 4,
              "guid": "fd00818e-bac1-4954-9257-9e9f2e8e277f",
              "url": "/content/5",
              "type": "video",
              "section": "Section 3",
              "topic": "Section 1",
              "is_active": true,
              "image": {
                "title": "excepteur aute voluptate",
                "url": "http://placehold.it/800x600",
                "caption": "aliqua nostrud velit velit veniam id voluptate anim"
              },
              "title": "officia incididunt proident",
              "summary": "Et mollit culpa cillum anim commodo deserunt culpa labore aliquip elit sint ad. Qui deserunt nulla mollit in officia culpa aute labore do duis culpa eu. Magna dolor elit eu sint eu ut velit occaecat eiusmod quis cupidatat tempor. Excepteur laboris occaecat sit cupidatat amet amet tempor. Irure ut est eiusmod nostrud anim.\r\n",
              "tags": [
                "anim",
                "Lorem",
                "anim",
                "consequat",
                "reprehenderit",
                "laboris",
                "do"
              ]
            },
            {
              "id": 5,
              "guid": "f7c5b746-28c9-420c-af38-fdbebee8c621",
              "url": "/content/6",
              "type": "page",
              "section": "Section 1",
              "topic": "Section 3",
              "is_active": true,
              "image": {
                "title": "reprehenderit cillum magna",
                "url": "http://placehold.it/800x600",
                "caption": "qui laborum ipsum sint duis deserunt voluptate do"
              },
              "title": "reprehenderit adipisicing minim",
              "summary": "Do voluptate ut esse esse cillum. Sint officia officia magna ipsum excepteur esse veniam anim. Tempor esse nisi proident aliqua mollit aute. Ipsum velit sit cillum irure quis quis tempor ullamco irure proident proident Lorem.\r\n",
              "tags": [
                "et",
                "aute",
                "officia",
                "proident",
                "consequat",
                "ea",
                "magna"
              ]
            },
            {
              "id": 6,
              "guid": "8f01fa1f-a7f6-4ce0-b2f0-3e8f9b808706",
              "url": "/content/7",
              "type": "article",
              "section": "Section 4",
              "topic": "Section 4",
              "is_active": true,
              "image": {
                "title": "laboris proident fugiat",
                "url": "http://placehold.it/800x600",
                "caption": "ipsum ut culpa enim pariatur ullamco veniam eu"
              },
              "title": "ullamco consequat qui",
              "summary": "Laborum cillum cillum consectetur aliqua. Consequat qui et tempor culpa in. Pariatur officia velit occaecat deserunt ex eiusmod nulla excepteur ea velit aliquip. Ex reprehenderit ut laboris amet quis commodo enim deserunt. Enim enim irure aliquip commodo. Laboris duis eiusmod non minim culpa minim deserunt fugiat nisi mollit voluptate do deserunt. Id deserunt enim proident ex consectetur qui exercitation labore ex.\r\n",
              "tags": [
                "qui",
                "aute",
                "consectetur",
                "incididunt",
                "minim",
                "consequat",
                "dolore"
              ]
            },
            {
              "id": 7,
              "guid": "ecda83f2-8a43-4a0f-a5ba-c785893ecada",
              "url": "/content/8",
              "type": "page",
              "section": "Section 1",
              "topic": "Section 1",
              "is_active": true,
              "image": {
                "title": "tempor ex cillum",
                "url": "http://placehold.it/800x600",
                "caption": "consectetur officia excepteur veniam amet eiusmod sint deserunt"
              },
              "title": "qui aliqua velit",
              "summary": "Minim cillum aliquip sunt aute proident proident sint ea et tempor consequat quis sunt ullamco. Amet qui occaecat anim cupidatat culpa magna ad sunt aute anim ad sint mollit ex. Mollit Lorem minim duis reprehenderit mollit voluptate. Labore officia enim irure proident qui. Fugiat elit Lorem eiusmod labore ut culpa excepteur do aliquip est proident amet aute mollit.\r\n",
              "tags": [
                "reprehenderit",
                "proident",
                "proident",
                "sit",
                "sunt",
                "qui",
                "laboris"
              ]
            },
            {
              "id": 8,
              "guid": "ae33727e-4fca-4313-8246-fbcf17939838",
              "url": "/content/9",
              "type": "article",
              "section": "Section 2",
              "topic": "Section 3",
              "is_active": false,
              "image": {
                "title": "qui nulla et",
                "url": "http://placehold.it/800x600",
                "caption": "sit nulla tempor sunt esse ad cupidatat quis"
              },
              "title": "excepteur sint nisi",
              "summary": "Incididunt pariatur cillum ea qui non ea magna labore sint exercitation magna. Nostrud est ad voluptate laborum ipsum. Officia sunt veniam tempor mollit Lorem sint est tempor ullamco aute sint velit. Do ut incididunt sunt consectetur. Deserunt labore dolor occaecat officia laboris. Sit et amet nisi adipisicing cupidatat in do ex consectetur Lorem qui amet.\r\n",
              "tags": [
                "non",
                "minim",
                "id",
                "ipsum",
                "commodo",
                "ad",
                "Lorem"
              ]
            },
            {
              "id": 9,
              "guid": "c6badab0-beba-47a3-a68d-b5a88183bb35",
              "url": "/content/10",
              "type": "page",
              "section": "Section 1",
              "topic": "Section 4",
              "is_active": true,
              "image": {
                "title": "laborum et fugiat",
                "url": "http://placehold.it/800x600",
                "caption": "nostrud non eiusmod nostrud pariatur exercitation reprehenderit duis"
              },
              "title": "consequat veniam labore",
              "summary": "Id labore aliqua labore fugiat veniam non. Ad occaecat ex ad do qui consequat occaecat. Fugiat anim in aliqua Lorem minim dolore elit cillum culpa voluptate. Non voluptate excepteur adipisicing commodo sunt sint velit enim esse reprehenderit. Consectetur anim cupidatat est deserunt consequat incididunt dolor fugiat. Incididunt laborum cupidatat nulla deserunt culpa.\r\n",
              "tags": [
                "exercitation",
                "magna",
                "labore",
                "commodo",
                "duis",
                "eu",
                "culpa"
              ]
            },
            {
              "id": 10,
              "guid": "c8657f48-2771-4834-b678-01a6d748d0bd",
              "url": "/content/11",
              "type": "page",
              "section": "Section 4",
              "topic": "Section 4",
              "is_active": true,
              "image": {
                "title": "minim sunt duis",
                "url": "http://placehold.it/800x600",
                "caption": "reprehenderit ut duis ad excepteur nisi ad commodo"
              },
              "title": "aliqua do eiusmod",
              "summary": "Reprehenderit officia sint sit ipsum aute incididunt incididunt Lorem. Est eiusmod ex et incididunt. Magna exercitation est sunt nisi non non laboris aliqua excepteur. Pariatur dolore in reprehenderit occaecat qui. Dolore deserunt cupidatat deserunt labore est fugiat pariatur cupidatat nulla do occaecat adipisicing fugiat non.\r\n",
              "tags": [
                "veniam",
                "ut",
                "consequat",
                "voluptate",
                "cupidatat",
                "sint",
                "ex"
              ]
            },
            {
              "id": 11,
              "guid": "cf05268f-df3c-4a20-8ffd-879649e1933a",
              "url": "/content/12",
              "type": "page",
              "section": "Section 4",
              "topic": "Section 1",
              "is_active": true,
              "image": {
                "title": "sint enim incididunt",
                "url": "http://placehold.it/800x600",
                "caption": "irure ut minim pariatur cupidatat labore officia magna"
              },
              "title": "enim veniam deserunt",
              "summary": "Velit veniam reprehenderit aute eu adipisicing voluptate est minim incididunt ut sit laborum. Eu occaecat laborum cupidatat ipsum ullamco est exercitation mollit occaecat nostrud incididunt id laboris. Do est eu id exercitation. Qui esse dolor qui voluptate consectetur. Ex mollit deserunt anim mollit adipisicing et. Duis nostrud incididunt reprehenderit tempor qui et amet dolore qui. Dolore veniam exercitation aliqua duis eu sunt consectetur.\r\n",
              "tags": [
                "ad",
                "incididunt",
                "ex",
                "in",
                "reprehenderit",
                "quis",
                "eiusmod"
              ]
            },
            {
              "id": 12,
              "guid": "2986160a-36f9-4f83-9d28-dd4369e1d087",
              "url": "/content/13",
              "type": "page",
              "section": "Section 3",
              "topic": "Section 2",
              "is_active": false,
              "image": {
                "title": "mollit ea nostrud",
                "url": "http://placehold.it/800x600",
                "caption": "adipisicing aliquip cupidatat dolor qui labore enim do"
              },
              "title": "laboris magna cillum",
              "summary": "Velit voluptate do laboris ullamco occaecat anim anim Lorem sit elit. Duis dolore voluptate et sunt. Do ullamco magna consequat dolore. Occaecat officia pariatur adipisicing dolore ullamco exercitation cupidatat minim sint. Ea Lorem ullamco reprehenderit velit qui aute enim adipisicing elit non amet laborum tempor. In eiusmod deserunt eu voluptate ex velit Lorem laboris irure in mollit est excepteur tempor.\r\n",
              "tags": [
                "commodo",
                "labore",
                "ullamco",
                "tempor",
                "veniam",
                "id",
                "est"
              ]
            }
          ]
        }

### List All Contents [GET]
+ Parameters
    + limit (optional, number) ...
    + type (optional, string) ... 
    + topic (optional, string) ... 
    + section (optional, string) ... 
    + since (optional, string) ... Timestamp in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ` Only content updated at or after this time are returned.

+ Response 200

    [Content Collection][]

### Create a Content [POST]
To create a new Content simply provide a JSON hash of the *description* and *content* attributes for the new Content. 

+ Request (application/json)

          {
            "type": "page",
            "section": "Section 3",
            "topic": "Section 2",
            "is_active": false,
            "starred": "true",
            "image": {
              "title": "mollit ea nostrud",
              "url": "http://placehold.it/800x600",
              "caption": "adipisicing aliquip cupidatat dolor qui labore enim do"
            },
            "title": "laboris magna cillum",
            "summary": "Velit voluptate do laboris ullamco occaecat anim anim Lorem sit elit. Duis dolore voluptate et sunt. Do ullamco magna consequat dolore. Occaecat officia pariatur adipisicing dolore ullamco exercitation cupidatat minim sint. Ea Lorem ullamco reprehenderit velit qui aute enim adipisicing elit non amet laborum tempor. In eiusmod deserunt eu voluptate ex velit Lorem laboris irure in mollit est excepteur tempor.\r\n",
            "tags": [
              "commodo",
              "labore",
              "ullamco",
              "tempor",
              "veniam",
              "id",
              "est"
            ]
          }

+ Response 201

    [Content][]

## Star [/content/{id}/star]
Star resource represents a Content starred status. 

The Star resource has the following attribute:

- starred


+ Parameters

    + id (string) ... ID of the gist in the form of a hash

+ Model (application/json)


    + Headers

    + Body

          {
            "id": 12,
            "guid": "2986160a-36f9-4f83-9d28-dd4369e1d087",
            "url": "/content/13",
            "type": "page",
            "section": "Section 3",
            "topic": "Section 2",
            "is_active": false,
            "starred": "true",
            "image": {
              "title": "mollit ea nostrud",
              "url": "http://placehold.it/800x600",
              "caption": "adipisicing aliquip cupidatat dolor qui labore enim do"
            },
            "title": "laboris magna cillum",
            "summary": "Velit voluptate do laboris ullamco occaecat anim anim Lorem sit elit. Duis dolore voluptate et sunt. Do ullamco magna consequat dolore. Occaecat officia pariatur adipisicing dolore ullamco exercitation cupidatat minim sint. Ea Lorem ullamco reprehenderit velit qui aute enim adipisicing elit non amet laborum tempor. In eiusmod deserunt eu voluptate ex velit Lorem laboris irure in mollit est excepteur tempor.\r\n",
            "tags": [
              "commodo",
              "labore",
              "ullamco",
              "tempor",
              "veniam",
              "id",
              "est"
            ]
          }

### Star a Content [PUT]
+ Response 204

### Unstar a Content [DELETE]
+ Response 204

### Check if a Content is Starred [GET]
+ Response 200

    [Star][]