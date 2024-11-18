[System.Serializable]
public class Contact
{
    public int ID;
    public string Name;
    public string Biography; // ���˼��
    public string Background; // ���˱���

    public bool IsOnline;
    public MoodType Mood;       // ��ϵ�˵�����
    public int Affinity;        // ��ϵ�˵ĺøж� (��Χ -5��10)

    public enum MoodType
    {
        Bored = 0,   // ����
        Happy = 1,   // ����
        Angry = 2    // ����
    }

    public Contact(int id, string name)
    {
        ID = id;
        Name = name;
        IsOnline = true; // Ĭ������
        Mood = MoodType.Bored;  // Ĭ������ֵ
        Affinity = 0;  // Ĭ�Ϻøж�
    }
}