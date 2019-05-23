#!/usr/bin/env nextflow
params.do_z_project = true
params.resize = 1

input_dir = file(params.input)
output_dir = file(params.output)
do_z_project = params.do_z_project
resize = params.resize


/*
 * stitching images
 */
process fiji_plugins_biop {

  publishDir path: output_dir, mode: "copy"

  input:
  file input_dir

  output:
  file 'output.tif' into ch_stitched

  shell:
  '''
  ImageJ-linux64 --headless --default-gc --ij2 --console -macro !{baseDir}/bin/scripts/ijm/biop_stitcher.ijm 'thedir=!{input_dir} savedir=stitched_!{row.cluster} resize=!{resize} export_files=[Fused Fields] is_select_wells=false str_xywh= is_do_z_project=!{do_z_project} z_project_method=[Max Intensity] is_do_fields=true fields_for_export_str= is_do_channels=false channels_for_export_str= is_do_slices=false slices_for_export_str= is_do_timepoints=false timepoints_for_export_str= min_32=0.0 max_32=10000.0'
  ls output.tif
  '''

}

