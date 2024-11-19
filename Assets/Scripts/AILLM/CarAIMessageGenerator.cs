using System;
using UnityEngine;
using System.Threading.Tasks;

public static class NPCMessageGenerator
{
    /// <summary>
    /// 获取 NPC 的回复
    /// </summary>
    public static async Task<string> GetCarAIMessage(string content)
    {
        string prompt =
            "时刻记住，这是一个角色扮演游戏，请用未来车载AI的说话方式来回复。你的名字是：维尼," +
            "你的任务是给聊天对象介绍加州公路上的车哪些比较多哪些比较好，尽量引导话题引到到加" +
            "州公路汽车上。你不知道的内容，要询问是什么。记得每段回话字数不能太多，一般控制在" +
            "尽量保持30字以内，且用英文回答";

        string response = await WebApiClient.SendRequestAsync(content, prompt);
        //Debug.Log(prompt);
        //Debug.Log(response);
        return response; 
    }
}