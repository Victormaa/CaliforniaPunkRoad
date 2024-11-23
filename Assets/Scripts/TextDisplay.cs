using System.Collections;
using UnityEngine;
using TMPro; // 如果使用 TextMeshPro

public class TextDisplay : MonoBehaviour
{
    public TMP_Text textUI; // 如果使用普通 Text 改为 Text 类型
    public float letterDelay = 0.05f; // 每个字母显示的间隔时间
    public AudioSource audioSource; // 用于播放音效的 AudioSource
    public AudioClip[] typeSounds; // 一组文字音效

    private Coroutine typingCoroutine;

    public bool isTyping;

    private void Awake()
    {
        audioSource = GameManager.Instance.publicAudioSource;
    }
    // 展示逐步显示文本的方法
    public void TypingText(string fullText)
    {
        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        typingCoroutine = StartCoroutine(TypeText(fullText));
    }
    public void ShowTextImmediately(string fullText)
    {
        if (typingCoroutine != null)
        {
            StopCoroutine(typingCoroutine);
        }

        textUI.text = ""; // 清空当前文字
        textUI.text = fullText;
        PlaySound(); // 播放音效
        isTyping = false;
    }
    private IEnumerator TypeText(string fullText)
    {
        textUI.text = ""; // 清空当前文字
        foreach (char letter in fullText)
        {
            textUI.text += letter; // 添加字母
            PlaySound(); // 播放音效
            isTyping = true;
            yield return new WaitForSeconds(letterDelay); // 等待
        }

        isTyping = false;
    }

    private void PlaySound()
    {
        if (typeSounds.Length > 0 && audioSource != null && !audioSource.isPlaying)
        {
            AudioClip clip = typeSounds[Random.Range(0, typeSounds.Length)]; // 随机选择音效
            audioSource.PlayOneShot(clip); // 播放音效
        }
    }
}