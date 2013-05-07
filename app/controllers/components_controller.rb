class ComponentsController < ApplicationController

  def index
    @components = Component.paginate(page: params[:page], per_page: 10).order('element_id,specification_id,package_id ASC')
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
    @element_list = Element.all.map { |element| [element.name, element.id] }
  end

  def edit
    @component = Component.find(params[:id])
  end

  def create
    if params[:element_name].blank? && !params[:specification_name].blank? && !params[:package_name].blank?
      specification = Specification.create(element_id: params[:component][:element_id], name: params[:specification_name])
      package = Package.create(specification_id: specification.id, name: params[:package_name])
      params[:component][:specification_id], params[:component][:package_id] = specification.id, package.id
    elsif params[:element_name].blank? && params[:specification_name].blank? && !params[:package_name].blank?
      package = Package.create(specification_id: params[:component][:specification_id], name: params[:package_name])
      params[:component][:package_id] = package.id
    elsif params[:element_name].blank? && params[:specification_name].blank? && params[:package_name].blank?
      return
    else
      element = Element.create(name: params[:element_name])
      specification = Specification.create(element_id: element.id, name: params[:specification_name])
      package = Package.create(specification_id: specification.id, name: params[:package_name])
      params[:component][:element_id], params[:component][:specification_id], params[:component][:package_id] = element.id, specification.id, package.id
    end

    @component = Component.create(params[:component])
    redirect_to @component, notice: '入库成功！'
  end

  def update
    @component = Component.find(params[:id])

    if @component.update_attributes(params[:component])
      redirect_to @component, notice: '元件更新成功！'
    else
      render action: "edit"
      render json: @component.errors, status: :unprocessable_entity
    end
  end

  def get_specification_options
    specification_options = ""
    specifications = Specification.find_all_by_element_id(params[:id])
    specifications.each do |s|
      specification_options << "<option value=\"#{s.id}\">#{s.name}</option>"
    end
    specification_options << "<option value=\"-输入-\">-输入-</option>,"

    packages = Package.find_all_by_specification_id(specifications.first.id)
    packages.each do |p|
      specification_options << "<option value=\"#{p.id}\">#{p.name}</option>"
    end
    specification_options << "<option value=\"-输入-\">-输入-</option>"
    render :text => specification_options
  end

  def get_package_options
    package_options = ""
    packages = Package.find_all_by_specification_id(params[:id])
    packages.each do |p|
      package_options << "<option value=\"#{p.id}\">#{p.name}</option>"
    end
    package_options << "<option value=\"-输入-\">-输入-</option>"
    render :text => package_options
  end
end
