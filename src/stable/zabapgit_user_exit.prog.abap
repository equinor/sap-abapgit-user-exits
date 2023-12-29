*&---------------------------------------------------------------------*
*&  Include  ZABAPGIT_USER_EXIT
*&---------------------------------------------------------------------*
CLASS zcl_abapgit_user_exit DEFINITION FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_abapgit_exit.

  PRIVATE SECTION.
    CONSTANTS root_package_open_source TYPE devclass VALUE 'ZGS_OPEN_SOURCE'.
ENDCLASS.


CLASS zcl_abapgit_user_exit IMPLEMENTATION.
  METHOD zif_abapgit_exit~adjust_display_commit_url.
  ENDMETHOD.

  METHOD zif_abapgit_exit~adjust_display_filename.
  ENDMETHOD.

  METHOD zif_abapgit_exit~allow_sap_objects.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_local_host.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_proxy_authentication.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_proxy_port.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_proxy_url.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_supported_data_objects.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_supported_object_types.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_tadir.
  ENDMETHOD.

  METHOD zif_abapgit_exit~create_http_client.
  ENDMETHOD.

  METHOD zif_abapgit_exit~custom_serialize_abap_clif.
  ENDMETHOD.

  METHOD zif_abapgit_exit~deserialize_postprocess.
  ENDMETHOD.

  METHOD zif_abapgit_exit~determine_transport_request.
  ENDMETHOD.

  METHOD zif_abapgit_exit~enhance_repo_toolbar.
  ENDMETHOD.

  METHOD zif_abapgit_exit~get_ci_tests.
  ENDMETHOD.

  METHOD zif_abapgit_exit~get_ssl_id.
  ENDMETHOD.

  METHOD zif_abapgit_exit~http_client.
  ENDMETHOD.

  METHOD zif_abapgit_exit~on_event.
  ENDMETHOD.

  METHOD zif_abapgit_exit~pre_calculate_repo_status.
    IF is_repo_meta-package IS INITIAL OR is_repo_meta-package(1) = '$'.
      RETURN.
    ENDIF.

    SELECT SINGLE FROM tdevc
      FIELDS parentcl
      WHERE devclass = @is_repo_meta-package
      INTO @DATA(parent_package).
    IF sy-subrc = 0 AND parent_package = root_package_open_source.
      zcl_abapgit_xml_stripper=>process_files( EXPORTING iv_config = |remove PROG:/PROGDIR/APPL\n|
                                                                   & |remove PROG:/PROGDIR/SECU|
                                               CHANGING  ct_local  = ct_local
                                                         ct_remote = ct_remote ).
    ENDIF.
  ENDMETHOD.

  METHOD zif_abapgit_exit~serialize_postprocess.
  ENDMETHOD.

  METHOD zif_abapgit_exit~validate_before_push.
  ENDMETHOD.

  METHOD zif_abapgit_exit~wall_message_list.
  ENDMETHOD.

  METHOD zif_abapgit_exit~wall_message_repo.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_max_parallel_processes.
  ENDMETHOD.

  METHOD zif_abapgit_exit~change_rfc_server_group.
  ENDMETHOD.
ENDCLASS.
