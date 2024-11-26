using UnityEngine;

public class FloatEffect : MonoBehaviour
{
    public float floatStrength = 1.0f; // Ư����ǿ��
    public float floatSpeed = 1.0f; // �������ٶ�

    private Vector3 originalPosition;

    void Start()
    {
        originalPosition = transform.localPosition; // ��¼ԭʼλ��
    }

    void Update()
    {
        // ����ʱ������Һ��������µĸ߶�
        float newY = originalPosition.y + Mathf.Sin(Time.time * floatSpeed) * floatStrength;
        transform.localPosition = new Vector3(originalPosition.x, newY, originalPosition.z);
    }
}