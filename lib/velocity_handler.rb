require 'velocity-1.6.2-dep.jar'

java_import org.apache.velocity.app.Velocity
java_import org.apache.velocity.VelocityContext

class VelocityHandler < ActionView::TemplateHandler
  def self.call(template)
    template_path_relative_to_views_path = template.identifier.gsub(::Rails.root.join('app', 'views').to_s, "")
    
    <<-CODE
      velocity_context = VelocityContext.new
      local_assigns.each {|key, value| velocity_context.put(key.to_s, value)}

      output_writer = java.io.StringWriter.new
      input = <<-TEMPLATE
      #{template.source}
      TEMPLATE
      
      Velocity.set_property(Velocity::FILE_RESOURCE_LOADER_PATH, Rails.root.join('app', 'views').to_s)
      Velocity.evaluate(velocity_context, output_writer, '#{template_path_relative_to_views_path}', input)
      output_writer.to_s
    CODE
  end
end