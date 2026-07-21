Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29101C4452D
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 19:02:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmFjT-0005qY-I7; Tue, 21 Jul 2026 15:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmFjN-0005hY-VD
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 15:02:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmFjK-0000Xf-Aq
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 15:02:16 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LH2UWp2548696
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 19:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QQcit1q4zrxsxP8H4kYgkzTUZRdtT6xIydcTKqebWvU=; b=e4/tefLK+6R/51Z4
 dLO9L9vBGZMhkYt/bv3m6l5xdzBNjR4oV3BnmcqhtudhYR5moX02s0epjYH9tDtG
 HzNalB3gc860XVv5oEpZX/uKsFrUcdjSMEB+h4AErsMJwLx637G+nAPBZl55rf7i
 lIU7XWo1RzEQej/dxDzq7r6XqCaTMyGM8DWKPOVsONbKYbpzt9Z8KHWMytFeFYtV
 XqBBzQYvKsNN0Vf0pLDvI1pH0WGGujzgNj8Lvbf4H9SyCBbdDWfUPrjCeylm71CS
 EZV56pKfoy0miIGEd2VbL8wxxi1mUCWxLPJXdtb0z36pujf35Wv3A0xu6x4pmvTr
 Urf5gA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3jhn1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 19:02:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so1061131385a.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784660530; x=1785265330; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QQcit1q4zrxsxP8H4kYgkzTUZRdtT6xIydcTKqebWvU=;
 b=CyJp+pBfdUt/KyLAR2nlzV5x3d/zC2UdMtpKD4yGmeBt5aPYsN1lMQwC9nTowBHvuq
 DRezXwcNh8VJE2hifwYj5tCPupOHjVJVAnc2DGFlN6R8lXYqxALIMNeGStIprNuH36pL
 fCqs4jdqhlkFtv39NLxkDEpyt/B6NshNpTbh3kYUfn7GJqgM22hEnvyQNVbYMwbkqQAz
 74KANjFpGA5gzV9O2beBirx5gjp9IJnELkr+EjbkJbq053QYU3NfVOrjjS7nboUBe/UK
 qEgL2CZX2B3+t4VG5fxJpTQ+CuA/GJyxrvQmd8etiKpbsZVYgmqn/RKEvKyJt364BJ9A
 sIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784660530; x=1785265330;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QQcit1q4zrxsxP8H4kYgkzTUZRdtT6xIydcTKqebWvU=;
 b=VTmwTBk2Xw+ai/kgcGLKhecMRE/CHhJNhJpr2JjNEw3LT2DbqtC1GaF1cGXz2o44Pu
 AhKazWLx6rlpnoy6Pr0eDSGM2XQzIsG0G0PqqvIWfP0vELLtKF7MPBMmLJ1nCC1j3ywn
 rK9NpvubxQUYopVQY/kyG7mrd2zVu1NR8R78zab6jOlhpCx2f1Wnei1GWtxOHY+rk0WS
 CBMWRC+Bd2Kl+2nz0ZlRnzqFtA3Lsh0GhgD3vwA6GQ0E5YcMLeV3XpeNkLvx+WHJXS6Y
 cJqm4fFw8ewU7v3Aai/Duv8sUmwtaO0aHOkv21g1phajnT+NenLOZuS9bXQyfqLnlJga
 f1iQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoKdUGmNlQXiQiNoSUOeJs6SjGbCBttb+pNGZaKkfa3xo80xcbw2gQD1FCqSeGmRebqj5MGpiZRvFfy@nongnu.org
X-Gm-Message-State: AOJu0YwYxBKgZA/aeGB/q0pwQftqyUmhFrzFfzjBHIfGurDJ661cbGzz
 kl6XAF+knZrf3RDFDeY/IWGZoYGrCft3lRYwwA+YmErFM7Jv5/rPNxCKjOGN5k0OnrFD6Fx+k8z
 Dy6dkMPr90g8l6vGT4zEdUxMUN7lKBRstCJr3sqm/9/42aWq3t0tTFSXRkw==
X-Gm-Gg: AR+sD12T/CPvWeen5RyaHK+sQ2yUdgEh057fJixZ11eXjLnTYg7VNlOQDWAT9tqXIFb
 DmAJ1odRTQacjfH5NRXK+94LEE2uNDmeg1ogni9IVBerf+RQbD8R8UgIP6Fzqphc2lGGDFZ6vYw
 CQX9o/Fn0prdQnRbZ9++HQdcNaD1jGE3iJAmoSpFIB+n0kuOwwlN9C47l1EjiR3x9LyUM1srlbr
 atJ6sfQohvB4pHhlff2XgPRVDBoKFLpwiKV9r20a51Eux15EvrRxbYP1GVS/82Kd0mbYHtgUcUJ
 yqgMFnIWjc+Gd4JNEsUDx1ZYhfOkFM2+z/abbwurKsdCmI9ZXGPb+0/fKEzPzkUTV754+ET5CFH
 Dskm+JwoA/S9zmzKBaVDhoNxZTn5XBFAIBPYBxQ==
X-Received: by 2002:ad4:5ae9:0:b0:8e9:f62b:8fa2 with SMTP id
 6a1803df08f44-907783dded3mr204376536d6.55.1784660529702; 
 Tue, 21 Jul 2026 12:02:09 -0700 (PDT)
X-Received: by 2002:ad4:5ae9:0:b0:8e9:f62b:8fa2 with SMTP id
 6a1803df08f44-907783dded3mr204376116d6.55.1784660529258; 
 Tue, 21 Jul 2026 12:02:09 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907ba8b92c0sm2995116d6.6.2026.07.21.12.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 12:02:08 -0700 (PDT)
Message-ID: <7c85ba9f-a9ef-4880-9905-61f6397c23b4@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:02:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regular QEMU RISC-V Call
To: Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>, Michael Neuling <mikey@neuling.org>
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
 <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
 <ad259828-65b3-4c4a-bf3f-73cc195c19f5@alistair23.me>
 <68917b26-32a2-49e6-94ea-1ca587948f23@app.fastmail.com>
 <e282de71-5390-41d8-8a8d-6156aae01079@alistair23.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e282de71-5390-41d8-8a8d-6156aae01079@alistair23.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwMCBTYWx0ZWRfX8nTjAmifHjvJ
 hU+ZJMFozpL3w4x9Uhx5dNzwGR1baKbBMVkDxR/sVHPZvtik4yQJ7FhqdGmPea1x/nLwrmAGJEL
 mHiUkPpWejdINCyIYwzJmkX6zWnUHpVk2NP+Wbk3v9bJk/P/ps0zIVu9SSJrYcH7HxrdD6ODCEz
 zanpBWkzGNhAxQfBNRiJNW7jv8SCedccb3/DQo1QmpKTyfb7ajM6Yj55Yd45Jpz9RdENSFLioDp
 /BCHn4KA8it8MbqO7szE1611ylVx9zYpK8q80JujBVPNCxFi1jjkMx99KqqZHZ6rCX0ND6A6G4n
 SqCuY/UmDKLc9PDeNYwYxa6jnEXazWc3i6w/UeIQTYgnFLCrhMGtzZfhSzCu/0YRJdoU8lD5yJS
 jPGPzEBLtPmJraLmhXcnT1ppFn1qRWg4zlpcXKYU9CP+TQ6WEE0TZ8ziS/qdobsT+J5mneraQDg
 qm+ok6saxhfPmJBnDdg==
X-Proofpoint-ORIG-GUID: qFci9-CzHd3C0eCrO8HFpjihK3vkK3LT
X-Proofpoint-GUID: qFci9-CzHd3C0eCrO8HFpjihK3vkK3LT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwMCBTYWx0ZWRfX4I0mF8+fM/7l
 N+M6xBEtj6LpIufuBTd14phuJMMI/VDOnkVLYPC8Mo8GehfxWYRfTqFUqLLl7eZ3dnW/dUX7o7G
 YZBTSr1ssHYJv3PZMmKbKJztM32P4Jc=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fc232 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yMhMjlubAAAA:8 a=VwQbUJbxAAAA:8 a=NojvYFcnAAAA:8 a=geJiPS1HS6w1hIBJGI4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=D5talKjwNa0n2BCLPXqP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210200
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/21/2026 3:37 PM, Alistair Francis wrote:
> On 17/6/26 09:18, Alistair wrote:
>> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
>>> On 16/6/26 16:07, Joel Stanley wrote:
>>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
>>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
>>>
>>> That means the meeting should start in a little less then 13 and a half
>>> hours! I'll send out a Teams invite tomorrow
> 
> Hey!
> 
> I realised that it's now been a month. I leave for holidays in a few days, am currently recovering from some sickness and don't have any agenda items. So let's skip this month and start again in August

In fact the meeting was yesterday according to the calendar invite Palmer sent
:D figured that ppl forgot about it and I dropped the call after 10 minutes.

If we're going to stick with Palmer's existing invite the next meeting will be
August 18th 10AM UTC+10.

As an agenda for next call I have a couple of topics:

- ongoing Debug related work.  Hopefully we'll have some Debug 0.13/1.0 patches
under review by that date;
- there is a chance that common efforts led by ARM folks (single binary, multi accel ..)
will spill in the RISC-V tree.  I'll talk with Phil and Pierrick later this week and see
if there's something to do on our side.


Cheers,
Daniel


> 
> Alistair
> 
>>
>> Call in details are below. Starting in 40 minutes!
>>
>> ________________________________________________________________________________
>> Microsoft Teams meeting
>>
>> Join:
>> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
>>
>> Meeting ID:
>> 275 503 449 279 724
>>
>> Passcode:
>> kS9Vg23i
>>
>> ________________________________________
>> Need
>>   help? |
>> System reference
>> Dial in by phone
>>
>> +1
>>   408-627-4258,,498330396#
>> United States, San Jose
>> Find
>>   a local number
>> Phone conference ID:
>> 498 330 396#
>>
>> Join on a video conferencing device
>>
>> Tenant key:
>> wdc@m.webex.com
>>
>> Video ID:
>> 119 833 426 2
>>
>> More
>>   info
>> For organizers:
>> Meeting
>>   options |
>> Reset dial-in PIN
>>
>> ________________________________________________________________________________
>>
>>>
>>>>
>>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
>>>>
>>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
>>>>
>>>> Two agenda items:
>>>>
>>>> * RISC-V Code Policy
>>>>
>>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
>>>>
>>>> Good idea writing down your expectations somewhere everyone can see.
>>>> Do you want to raise it as a topic and we can talk it through?
>>>
>>> Yep!
>>>
>>>>
>>>> * Machine model use cases
>>>>
>>>> I wanted to share my perspective on the system emulator machines, what
>>>> they are for, who they are for, and hear what others had to say.
>>>
>>> Sounds good as well
>>>
>>> Alistair
>>>
>>>>
>>>> See you on the call tomorrow.
>>>>
>>>> Cheers,
>>>>
>>>> Joel
>>>
>>>
> 


