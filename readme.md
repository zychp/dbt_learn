I removed the dependencies.yml from the root level.
This was due to the server error, cross project are not allowed for my account.
I see there is a package installed in my dbt_packages folder.
The contenets of the dependencies.yml were:
models:
  - name: model_name
    columns:
      - name: col_a
        tests:
          - dbt_utils.expression_is_true:
              expression: '>= 1'