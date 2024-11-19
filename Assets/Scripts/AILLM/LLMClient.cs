using System;
using UnityEngine;
using System.Collections.Generic;
using System.Net.WebSockets;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

/// <summary>
/// �������ǻ���֪��ģ�� WebAPI ���н����Ŀͻ����ࡣ
/// </summary>
public class WebApiClient
{
    private static ClientWebSocket webSocket; // ���� WebSocket ���ӵ�ʵ��
    private static CancellationToken cancellationToken; // ȡ�����������
    private const string xAppId = "0d189f7f"; // Ӧ�� APPID���滻Ϊ���ʵ�� APPID��
    private const string apiSecret = "Zjc3M2QzNjBlMmUwZWU1YTEwYWRlMmRj"; // �ӿ���Կ���滻Ϊ���ʵ�� API Secret��
    private const string apiKey = "8d50a532188a78634866483c75e0e41e"; // �ӿ���Կ���滻Ϊ���ʵ�� API Key��
    private static string hostUrl = "wss://spark-api.xf-yun.com/v3.5/chat"; // WebSocket �ӿ� URL

    /// <summary>
    /// �������󲢽�����Ӧ���첽������
    /// </summary>
    /// <param name="messageText">���͵���Ϣ�ı�</param>
    /// <returns>API ��Ӧ���ַ���</returns>
    public static async Task<string> SendRequestAsync(string messageText, string systemPrompt)
    {
        string authUrl = GetAuthUrl(); // ��ȡ��֤ URL
        string url = authUrl.Replace("http://", "ws://").Replace("https://", "wss://"); // �滻Ϊ WebSocket URL

        using (webSocket = new ClientWebSocket())
        {
            try
            {
                await webSocket.ConnectAsync(new Uri(url), cancellationToken); // ���ӵ� WebSocket

                // ���� JSON ������
                JsonRequest request = new JsonRequest
                {
                    header = new Header { app_id = xAppId, uid = "12345" }, // ����ͷ����Ϣ
                    parameter = new Parameter
                    {
                        chat = new Chat
                        {
                            domain = "generalv3.5", // ģ������
                            temperature = 0.5, // �¶Ȳ�����ֵ
                            max_tokens = 1024 // ���������
                        }
                    },
                    payload = new Payload
                    {
                        message = new Message
                        {
                            text = new List<Content>
                                {
                                    new Content { role = "system", content = systemPrompt }, // ��Ϣ����
                                    new Content { role = "user", content = messageText }, // ��Ϣ����
                                }
                        }
                    }
                };

                //};//Debug�����б�
                string jsonString = JsonConvert.SerializeObject(request); // �����������л�Ϊ JSON �ַ���
                byte[] frameData = Encoding.UTF8.GetBytes(jsonString); // �� JSON �ַ���ת��Ϊ�ֽ�����

                await webSocket.SendAsync(new ArraySegment<byte>(frameData), WebSocketMessageType.Text, true, cancellationToken); // ��������

                return await ReceiveResponseAsync(); // ���ղ�������Ӧ
            }
            catch (Exception e)
            {
                return $"Error: {e.Message}"; // �����쳣�����ش�����Ϣ
            }
        }
    }

    /// <summary>
    /// �첽���� WebSocket ��Ӧ�ķ�����
    /// </summary>
    /// <returns>API ��Ӧ���ַ���</returns>
    private static async Task<string> ReceiveResponseAsync()
    {
        byte[] receiveBuffer = new byte[1024]; // ���ջ�����
        StringBuilder response = new StringBuilder(); // ���ڹ�����Ӧ���ַ���
        WebSocketReceiveResult result = await webSocket.ReceiveAsync(new ArraySegment<byte>(receiveBuffer), cancellationToken); // ��������

        while (!result.CloseStatus.HasValue)
        {
            if (result.MessageType == WebSocketMessageType.Text)
            {
                string receivedMessage = Encoding.UTF8.GetString(receiveBuffer, 0, result.Count); // ������յ�����Ϣ
                JObject jsonObj = JObject.Parse(receivedMessage); // ����Ϣ����Ϊ JSON ����
                int code = (int)jsonObj["header"]["code"]; // ��ȡ��Ӧ����

                if (code == 0)
                {
                    int status = (int)jsonObj["payload"]["choices"]["status"]; // ��ȡ״̬
                    JArray textArray = (JArray)jsonObj["payload"]["choices"]["text"]; // ��ȡ�ı�����
                    string content = (string)textArray[0]["content"]; // ��ȡ����
                    response.Append(content); // ��ӵ���Ӧ�ַ���

                    if (status == 2)
                    {
                        int totalTokens = (int)jsonObj["payload"]["usage"]["text"]["total_tokens"]; // ��ȡ��������
                        return response.ToString(); // ����������Ӧ
                    }
                }
                else
                {
                    return $"Request error: {receivedMessage}"; // ���ش�����Ϣ
                }
            }
            else if (result.MessageType == WebSocketMessageType.Close)
            {
                return "WebSocket connection closed"; // WebSocket ���ӹر�
            }

            result = await webSocket.ReceiveAsync(new ArraySegment<byte>(receiveBuffer), cancellationToken); // ������һ������
        }

        return response.ToString(); // ����������Ӧ
    }

    /// <summary>
    /// ��ȡ������֤�� URL��
    /// </summary>
    /// <returns>��֤ URL �ַ���</returns>
    static string GetAuthUrl()
    {
        string date = DateTime.UtcNow.ToString("r");

        Uri uri = new Uri(hostUrl);
        StringBuilder builder = new StringBuilder("host: ").Append(uri.Host).Append("\n").//
                                Append("date: ").Append(date).Append("\n").//
                                Append("GET ").Append(uri.LocalPath).Append(" HTTP/1.1");

        string sha = HMACsha256(apiSecret, builder.ToString());
        string authorization = string.Format("api_key=\"{0}\", algorithm=\"{1}\", headers=\"{2}\", signature=\"{3}\"", apiKey, "hmac-sha256", "host date request-line", sha);
        //System.Web.HttpUtility.UrlEncode

        string NewUrl = "https://" + uri.Host + uri.LocalPath;

        string path1 = "authorization" + "=" + Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(authorization));
        date = date.Replace(" ", "%20").Replace(":", "%3A").Replace(",", "%2C");
        string path2 = "date" + "=" + date;
        string path3 = "host" + "=" + uri.Host;

        NewUrl = NewUrl + "?" + path1 + "&" + path2 + "&" + path3;
        return NewUrl;
    }

    /// <summary>
    /// ʹ�� HMAC-SHA256 �㷨����ǩ����
    /// </summary>
    /// <param name="key">��Կ</param>
    /// <param name="data">Ҫǩ��������</param>
    /// <returns>ǩ���� Base64 �ַ���</returns>
    private static string HMACsha256(string key, string data)
    {
        byte[] keyBytes = Encoding.UTF8.GetBytes(key);
        using (var hmac = new HMACSHA256(keyBytes))
        {
            byte[] dataBytes = Encoding.UTF8.GetBytes(data);
            byte[] hashBytes = hmac.ComputeHash(dataBytes);
            return Convert.ToBase64String(hashBytes); // ���� Base64 �����ǩ��
        }
    }
}

// ����Ϊ��������ඨ��
public class JsonRequest
{
    public Header header { get; set; }
    public Parameter parameter { get; set; }
    public Payload payload { get; set; }
}

public class Header
{
    public string app_id { get; set; }
    public string uid { get; set; }
}

public class Parameter
{
    public Chat chat { get; set; }
}

public class Chat
{
    public string domain { get; set; }
    public double temperature { get; set; }
    public int max_tokens { get; set; }
}

public class Payload
{
    public Message message { get; set; }
}

public class Message
{
    public List<Content> text { get; set; }
}

public class Content
{
    public string role { get; set; }
    public string content { get; set; }
}

