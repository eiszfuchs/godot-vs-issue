tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeTextureSize


func _get_name():
	return "TextureSize"

func _get_category():
	return "Workarounds"

func _get_description():
	return "Get the size of a texture"

func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR

func _get_input_port_count():
	return 1

func _get_input_port_name(port):
	return "sampler"

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

# I hate to do this, why isn't this available in Visual Shaders?
func _get_code(input_vars, output_vars, mode, type):
	return """
	vec2 size = vec2(textureSize(%s, 0));
	%s = vec3(size, 0.0);
	""" % [input_vars[0], output_vars[0]]
