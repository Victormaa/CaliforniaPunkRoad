using System.Collections;
using UnityEngine;
using TMPro; // ���ʹ�� TextMeshPro
using UnityEngine.UI;

public class TextDisplay : MonoBehaviour
{
    public Text textUI; // ���ʹ����ͨ Text ��Ϊ Text ����
    public float letterDelay = 0.05f; // ÿ����ĸ��ʾ�ļ��ʱ��
    public AudioSource audioSource; // ���ڲ�����Ч�� AudioSource
    public AudioClip[] typeSounds; // һ��������Ч

    private Coroutine typingCoroutine;

    public bool isTyping;

    private int TypingSoundDelay = 0;
    private int typingSoundCounter;
    private void Awake()
    {
        audioSource = GameManager.Instance.publicAudioSource;
        typingSoundCounter = 0;
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
        typingSoundCounter = TypingSoundDelay;
        PlaySound(); // ������Ч
        isTyping = false;
    }
    private IEnumerator TypeText(string fullText)
    {
        textUI.text = ""; // ��յ�ǰ����
        typingSoundCounter = 0;
        foreach (char letter in fullText)
        {
            textUI.text += letter; // �����ĸ
            PlaySound(); // ������Ч
            typingSoundCounter += 1;
            isTyping = true;
            yield return new WaitForSeconds(letterDelay); // �ȴ�
        }

        isTyping = false;
    }

    private void PlaySound()
    {
        if (typeSounds.Length > 0 && audioSource != null && !audioSource.isPlaying && typingSoundCounter >= TypingSoundDelay)
        {
            AudioClip clip = typeSounds[Random.Range(0, typeSounds.Length)]; // ���ѡ����Ч
            audioSource.PlayOneShot(clip); // ������Ч
            typingSoundCounter = 0;
        }
    }
}