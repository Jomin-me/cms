class PcbBomsController < ApplicationController
  def index
    session[:pcb_boms] = nil
    @pcb_boms = PcbBom.find_by_sql("select name from pcb_boms group by name")

  end

  def new
    @pcb_bom = PcbBom.new
    @element_list = Element.all.map { |element| [element.name, element.id] }
  end

  def edit
    @pcb_boms = PcbBom.find_all_by_name(params[:id])
  end

  def create
    if params[:commit] == '添加'
      component = Component.find_by_element_id_and_specification_id_and_package_id(params[:element_id], params[:specification_id], params[:package_id])
      params[:pcb_bom][:comp_id] = component.id
      if session[:pcb_boms].blank?
        session[:pcb_boms] = Set.new
      end
      session[:pcb_boms].add(params[:pcb_bom])
      redirect_to action: 'new'
      return
    end

    session[:pcb_boms].each do |p|
      p[:name] = params[:pcb_bom][:name]
      PcbBom.create(p)
    end
    redirect_to pcb_boms_url
  end

  def destroy
    @pcb_bom = PcbBom.find(params[:id])
    @pcb_bom.destroy

    redirect_to edit_pcb_bom_url(@pcb_bom.name)
  end

end
