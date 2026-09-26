extends MeshInstance3D
class_name Elements

enum Colours {
	R,
	G,
	B
}

enum GameElements {
	SULFUR, # R
	HYDROGEN, # G
	OXYGEN # B
}

class Element:
	var element: GameElements
	var colour: Colours

	func _init(_element, _colour):
		element = _element
		colour = _colour

var elements: Array[Element] = [
	Element.new(GameElements.SULFUR, Colours.R),
	Element.new(GameElements.HYDROGEN, Colours.G),
	Element.new(GameElements.OXYGEN, Colours.B)
]
