### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

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

# ╔═╡ 6aeb8896-7eb0-11eb-2371-8bce346a4922


# ╔═╡ 6a75bfee-7eb0-11eb-1bf1-b5323ad9bcab


# ╔═╡ Cell order:
# ╠═c6535bfa-7e56-11eb-2789-3b009c1d09de
# ╠═72e3b378-7e58-11eb-3e49-3db713096a4b
# ╟─ee5d052e-7e56-11eb-027b-4fabef79280f
# ╟─edbc990e-7e56-11eb-0474-9bb39c422857
# ╟─c24665a0-7e6c-11eb-35c6-5dac55cd350f
# ╠═6aeb8896-7eb0-11eb-2371-8bce346a4922
# ╠═6a75bfee-7eb0-11eb-1bf1-b5323ad9bcab
