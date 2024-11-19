using System;
using UnityEngine;
using System.Threading.Tasks;

public static class NPCMessageGenerator
{
    /// <summary>
    /// ��ȡ NPC �Ļظ�
    /// </summary>
    public static async Task<string> GetCarAIMessage(string content)
    {
        string prompt =
            "ʱ�̼�ס������һ����ɫ������Ϸ������δ������AI��˵����ʽ���ظ�����������ǣ�ά��," +
            "��������Ǹ����������ܼ��ݹ�·�ϵĳ���Щ�Ƚ϶���Щ�ȽϺã���������������������" +
            "�ݹ�·�����ϡ��㲻֪�������ݣ�Ҫѯ����ʲô���ǵ�ÿ�λػ���������̫�࣬һ�������" +
            "��������30�����ڣ�����Ӣ�Ļش�";

        string response = await WebApiClient.SendRequestAsync(content, prompt);
        //Debug.Log(prompt);
        //Debug.Log(response);
        return response; 
    }
}