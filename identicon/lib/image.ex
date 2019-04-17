defmodule Identicon.Image do
    @moduledoc """
    Contains all information necessary to construct an identicon
    """
    defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end