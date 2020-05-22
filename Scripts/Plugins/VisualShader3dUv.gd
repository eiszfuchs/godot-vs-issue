tool
extends VisualShaderNodeCustom
class_name VisualShaderNode3dUv


func _get_name():
	return "Tool3dUv"

func _get_category():
	return "Workarounds"

func _get_description():
	return "Get the 3D UV of skymap"

func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR

func _get_input_port_count():
	return 0

func _get_input_port_name(port):
	return null

func _get_input_port_type(port):
	return VisualShaderNode.PORT_TYPE_SAMPLER

func _get_output_port_count():
	return 1

func _get_output_port_name(port):
	return "result"

func _get_output_port_type(port):
	return VisualShaderNode.PORT_TYPE_VECTOR

func _get_global_code(mode):
	return """
	"""

func _get_code(input_vars, output_vars, mode, type):
	return """
	float theta = UV.y * 3.14159;
	float phi = UV.x * 3.14159 * 2.0;

	vec3 unit = vec3(0.0, 0.0, 0.0);
	unit.x = sin(phi) * sin(theta);
	unit.y = cos(theta) * -1.0;
	unit.z = cos(phi) * sin(theta);

	%s = normalize(unit);
	""" % [output_vars[0]]
