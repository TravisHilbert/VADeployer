# clone the latest sample
$workspaceDir = (Get-ChildItem Env:PWD).Value

git clone https://github.com/microsoft/botframework-solutions.git $workspace/va_src

copy-item -Path $workspace/va_src/samples/csharp/assistants/virtual-assistant -Destination $workspace/va -Recurse

# update the sample scripts to run the locally installed dispatch tool
cd $workspace/va/VirtualAssistantSample/Deployment/Scripts

(Get-Content -Path './deploy_cognitive_models.ps1') -replace 'dispatch create' ,'dotnet /node_modules/botdispatch/bin/netcoreapp2.1/Dispatch.dll create' | Set-Content './deploy_cognitive_models.ps1'
(Get-Content -Path './deploy_cognitive_models.ps1') -replace 'dispatch init'   ,'dotnet /node_modules/botdispatch/bin/netcoreapp2.1/Dispatch.dll init'   | Set-Content './deploy_cognitive_models.ps1'
(Get-Content -Path './deploy_cognitive_models.ps1') -replace 'dispatch add'    ,'dotnet /node_modules/botdispatch/bin/netcoreapp2.1/Dispatch.dll add'    | Set-Content './deploy_cognitive_models.ps1'

(Get-Content -Path './update_cognitive_models.ps1') -replace 'dispatch create' ,'dotnet /node_modules/botdispatch/bin/netcoreapp2.1/Dispatch.dll create' | Set-Content './update_cognitive_models.ps1'
(Get-Content -Path './update_cognitive_models.ps1') -replace 'dispatch init'   ,'dotnet /node_modules/botdispatch/bin/netcoreapp2.1/Dispatch.dll init'   | Set-Content './update_cognitive_models.ps1'
(Get-Content -Path './update_cognitive_models.ps1') -replace 'dispatch add'    ,'dotnet /node_modules/botdispatch/bin/netcoreapp2.1/Dispatch.dll add'    | Set-Content './update_cognitive_models.ps1'