
public abstract class XC_Process {

	public Map<String, Object> inputData;

	public abstract Map<String, Object> execute ();

	public abstract void setInputData (Map<String, Object> inputData);

	public abstract Map<String, Object> getInputData ();
}