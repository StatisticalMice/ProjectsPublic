### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ c6535bfa-7e56-11eb-2789-3b009c1d09de
begin
	cd(@__DIR__)
	using Pkg
	Pkg.activate(".")
	
	using Images
	using ImageTransformations
	using Plots
	using PlutoUI
end

# ╔═╡ 72e3b378-7e58-11eb-3e49-3db713096a4b
#Pkg.add("Compose")

# ╔═╡ ee5d052e-7e56-11eb-027b-4fabef79280f
begin
	let url = "https://user-images.githubusercontent.com/6933510/107239146-dcc3fd00-6a28-11eb-8c7b-41aaf6618935.png" 
		filename = download(url)
		global philip = load(filename)
	end
	plot(philip, xmirror=true, title = "philip")
end

# ╔═╡ edbc990e-7e56-11eb-0474-9bb39c422857
begin
	let url = "https://raw.githubusercontent.com/StatisticalMice/experiments/master/data/al_capone_cell.jpg" 
		filename = download(url)
		global al_capone_cell = load(filename)
	end
	plot(al_capone_cell, xmirror=true, title="al_capone_cell")
end

# ╔═╡ c24665a0-7e6c-11eb-35c6-5dac55cd350f
begin
	url = "https://mars.nasa.gov/system/downloadable_items/45785_3-PIA24340-NavCam-Left.gif" 
	filename = download(url)
	perseverance_wheel_turning = load(filename)
	l = @layout [a b c]
	p1 = Plots.plot(perseverance_wheel_turning[:,:,1], xmirror=true)
	p2 = Plots.plot(perseverance_wheel_turning[:,:,2], xmirror=true)
	p3 = Plots.plot(perseverance_wheel_turning[:,:,3], xmirror=true)
	plot(p1, p2, p3, layout = l)
end

# ╔═╡ 0d54c4d6-7eb5-11eb-3a1f-d9d02700a379
md"""Select the input image"""

# ╔═╡ 8db72b7a-7eb3-11eb-3021-bb13087484b5
@bind image_selection Select(["Philip", "Cell", "Wheel"])

# ╔═╡ e9a71740-7eb3-11eb-112e-ddd800caad6a
begin
	if image_selection=="Philip"
		input_image = philip
	elseif image_selection=="Cell"
		input_image = al_capone_cell
	elseif image_selection=="Wheel"
		input_image = perseverance_wheel_turning[:,:,1]
	end
	imresize(input_image, ratio=1/8)
end

# ╔═╡ 224fc08c-7eb7-11eb-375e-f35a365f032c
md"""Select the kernel"""

# ╔═╡ 3c105608-7eb7-11eb-1a65-451f61b828d6
@bind kernel_selection Select(["None", "Gaussian", "Laplacian"])

# ╔═╡ 3af4d654-7eb7-11eb-3c5a-395b608ab707
begin
	if kernel_selection=="Gaussian"
		imfilter(input_image, Kernel.gaussian(3))
	elseif kernel_selection=="Laplacian"
		imfilter(input_image, Kernel.Laplacian())
	else
		input_image
	end
end

# ╔═╡ 45e650fa-7eb3-11eb-3dd6-6fa694b5474b


# ╔═╡ 45c7bd36-7eb3-11eb-3049-df6962c27fbb


# ╔═╡ 45aa6cd4-7eb3-11eb-1429-2bae4fa7a60c


# ╔═╡ 45900ae2-7eb3-11eb-0c54-efc2af3537f4


# ╔═╡ Cell order:
# ╠═c6535bfa-7e56-11eb-2789-3b009c1d09de
# ╠═72e3b378-7e58-11eb-3e49-3db713096a4b
# ╟─ee5d052e-7e56-11eb-027b-4fabef79280f
# ╟─edbc990e-7e56-11eb-0474-9bb39c422857
# ╟─c24665a0-7e6c-11eb-35c6-5dac55cd350f
# ╟─0d54c4d6-7eb5-11eb-3a1f-d9d02700a379
# ╟─8db72b7a-7eb3-11eb-3021-bb13087484b5
# ╟─e9a71740-7eb3-11eb-112e-ddd800caad6a
# ╟─224fc08c-7eb7-11eb-375e-f35a365f032c
# ╟─3c105608-7eb7-11eb-1a65-451f61b828d6
# ╟─3af4d654-7eb7-11eb-3c5a-395b608ab707
# ╠═45e650fa-7eb3-11eb-3dd6-6fa694b5474b
# ╠═45c7bd36-7eb3-11eb-3049-df6962c27fbb
# ╠═45aa6cd4-7eb3-11eb-1429-2bae4fa7a60c
# ╠═45900ae2-7eb3-11eb-0c54-efc2af3537f4
