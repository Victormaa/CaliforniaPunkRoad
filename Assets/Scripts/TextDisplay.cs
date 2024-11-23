using System.Collections;
using UnityEngine;
using TMPro; // ���ʹ�� TextMeshPro

public class TextDisplay : MonoBehaviour
{
    public TMP_Text textUI; // ���ʹ����ͨ Text ��Ϊ Text ����
    public float letterDelay = 0.05f; // ÿ����ĸ��ʾ�ļ��ʱ��
    public AudioSource audioSource; // ���ڲ�����Ч�� AudioSource
    public AudioClip[] typeSounds; // һ��������Ч

    private Coroutine typingCoroutine;

    public bool isTyping;

    private void Awake()
    {
        audioSource = GameManager.Instance.publicAudioSource;
    }
    // չʾ����ʾ�ı��ķ���
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

        textUI.text = ""; // ��յ�ǰ����
        textUI.text = fullText;
        PlaySound(); // ������Ч
        isTyping = false;
    }
    private IEnumerator TypeText(string fullText)
    {
        textUI.text = ""; // ��յ�ǰ����
        foreach (char letter in fullText)
        {
            textUI.text += letter; // �����ĸ
            PlaySound(); // ������Ч
            isTyping = true;
            yield return new WaitForSeconds(letterDelay); // �ȴ�
        }

        isTyping = false;
    }

    private void PlaySound()
    {
        if (typeSounds.Length > 0 && audioSource != null && !audioSource.isPlaying)
        {
            AudioClip clip = typeSounds[Random.Range(0, typeSounds.Length)]; // ���ѡ����Ч
            audioSource.PlayOneShot(clip); // ������Ч
        }
    }
}