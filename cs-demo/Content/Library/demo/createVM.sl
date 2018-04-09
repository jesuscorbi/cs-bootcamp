namespace: demo
flow:
  name: createVM
  inputs:
    - Host: 10.0.46.10
    - Username: "Capa1\\1299-capa1user "
    - password: Automation123
    - datacenter: Capa1 Datacenter
    - image: Ubuntu
    - folder: Students/jcorbi
    - prefix_list: '1-,2-,3-'
  workflow:
    - Generateuuid:
        do:
          io.cloudslang.demo.uuid: []
        publish:
          - uuid: '${"Cor-"+uuid}'
        navigate:
          - SUCCESS: SubString
    - SubString:
        do:
          io.cloudslang.demo.uuid:
            - input_0: null
        publish: []
        navigate:
          - SUCCESS: Clone_VM
    - Clone_VM:
        do:
          io.cloudslang.demo.uuid:
            - input_0: '${Host}'
            - input_1: '${Username}'
            - input_2: '${password}'
            - input_3: '${image}'
            - input_4: '${datacenter}'
            - input_5: '${folder}'
            - input_6: '${prefix_list}'
            - input_7: vm_source_identifier
        publish:
          - uuid: '${"Cor-"+uuid}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Generateuuid:
        x: 102
        y: 150
      SubString:
        x: 199
        y: 30
      Clone_VM:
        x: 335
        y: 30
        navigate:
          dc8b556e-6593-1698-4c15-05b297561ff6:
            targetId: 4700b498-c16c-2c4f-524a-d0d6b21e4cf5
            port: SUCCESS
    results:
      SUCCESS:
        4700b498-c16c-2c4f-524a-d0d6b21e4cf5:
          x: 579
          y: 211
