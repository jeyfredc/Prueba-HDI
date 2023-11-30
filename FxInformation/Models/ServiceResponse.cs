namespace FxInformation.Models
{
    public class ServiceResponse<T>
    {
        public bool IsError { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
    }
}