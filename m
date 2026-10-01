Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57998CA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 13:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCH2Y-0000km-KH; Thu, 01 Oct 2026 09:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCH1v-0000hU-D7
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:41:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCH1s-0007YN-7E
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:40:57 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691AkBHI3388120
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 13:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I1ry2hqtlM6+ycp+jQDXy0kAQRh2IWE47tSm+AaQiBY=; b=Vwv2ikBdD7MQvrj0
 XgfLdUG+NJvpEn/wfoG5MF52zwghDTNs+aE/ZqQL0WjWY6VupI05zCzkeCv7pA9+
 U56IO+vI76+iwcc2NEmQy3/fW2LYT92OYuLOKmHO7SvS/rNlhJlrTFy5/Zs+Rzm4
 BybLpmNR7qyoSeL+V+8FUKRBhroWKUtmoeSOW1D0UzRSIZWfJK7cfXsm1cIVH1zM
 2AKP5MZVZtdXt/2SFzH/CKL9pqwO259jQLAZU0NnDGD/AAyhgNtRDPLEC5SADVGe
 Qi7vMA+r3cZlv3T2DXH7ymPHhl5QdiHUMnBUalugOrXHGBwwvk4nFLydJs5vcOPq
 QWL7Dg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8nne-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 13:40:54 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-98a829c43f3so172311241.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790862053; x=1791466853; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I1ry2hqtlM6+ycp+jQDXy0kAQRh2IWE47tSm+AaQiBY=;
 b=UnTVBC/1tlM+tKyQVzpi2jBrhxT8cvkARiJYjVBCQUMt4VRhatMFd8o1artWluH5oJ
 RrBA4Bwcv5kPqfnq2ztDNeUGN72aOaXb3EKQ+QnqHchgZF9jldota0ytKkacmNZ233ml
 k2ghgeT0hZ3mSd6nVK08KBETHromSOcLXgYiC/CCE64pCRThDA5yreEFRvL7i84Tsk2X
 96A7eOgEOBPo9n4krSpbMqBlKa5pMKQOQQH9iAZnxi1yvT4hbbxB3dVZW8ud2daWpvQd
 LsPGMWbTZdsgu6TSQrxvkgK4L8zqO2PmnvBaKas2CaEvYYA45NbuFf7b6ysxOFbl+vKG
 u9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790862053; x=1791466853;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I1ry2hqtlM6+ycp+jQDXy0kAQRh2IWE47tSm+AaQiBY=;
 b=jqK2dqAS+M+UjP8ZiIifn2sMYt+ayz8CNMWU+xLc9UEV6nl+7hhbMCo3UlL5A03gw/
 iKveEgK133j5dZnw1D9iTMNfZpSpbyTRqAbiRVX6FEah4FIi8pH0IgPcQuBZbVSWB66O
 IQgFV8jtTiyuQX0WoN8rwd7+Z/c2d373txOrNCNFzI9+fWUvkS68N6ACJexb4IsA2gjk
 RDo9aYrZCEG0hI60iMuoXwM5uZmwedOVIhpjQog8kkNg4pDnfw0thsU7DkRlLLMNgQWR
 bZrut34jqPKZjCsC9MjyDEJoce+njYeDzd7u5J2UpQYrsYJuWioEc0hP7huCbN1QVKWB
 z/wQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZ0kEs9urxK9DLiSYir9eeKXR4FPwvjaFBc/3THrRYlXlpg+uTnpeIC52BY/Y9W80SiCAGQQI3pbl4@nongnu.org
X-Gm-Message-State: AFq9FYKBoCkpXvTtcwJQzR23mPLb7VrbANTFL0GC+UAdp5qKAfGVA2De
 KeAFM4UnyRRFXYCzpamrFdaN7uVa5SpB5LIFjkMCAI5uJf2Yg+9ZGgY5ToANXywTxMRNCHaOWbw
 ki+msH+JFQKVf1rcWrawsAHG6f/XcFkvqgBYx63Ce3rTvQ/ziWsuXKtDaJA==
X-Gm-Gg: AYBFou2qdn9yxWYzyCpxveu7DJKfUVdgw+pHB8uaYXxrKSFKh1CBdFsH1kYNC5zXZYF
 UaFvt/a6p5RvWrM2CyBWQg0vCysh/45hoFaI6rCuHJ9m3shpPBRmBW+4gWqR2C5lTU8Y0rT7gy9
 NTCoxq663hXOR2mUm/KQOMAcGgBV9fY79f5vYfm36lpfPUCRI2MZli73H56jBLM4c8h6RaKAXJx
 UNrZV/ZP06cnEuHDHfFZhx7waDifckw3/+XDhd/LNeiQe9B+PCuuRUIDJNDZaqAcOk2LgCWjNYU
 RConYFv+2MBqjLJyv3rmentEuLCHmdGilqSoTz15C0VEFlo0lVEzUqCT8iY7oku7aV/O0nbDyjo
 rkku9J+xdanTF5l53BCauVw==
X-Received: by 2002:a05:6102:3fa3:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7be735975ffmr1079573137.29.1790862053278; 
 Thu, 01 Oct 2026 06:40:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa3:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7be735975ffmr1079560137.29.1790862052780; 
 Thu, 01 Oct 2026 06:40:52 -0700 (PDT)
Received: from [10.111.137.66] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0692b1c9sm6125022f8f.27.2026.10.01.06.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 06:40:51 -0700 (PDT)
Message-ID: <75d53637-5cb8-4a03-bcd8-97acd646b527@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] target/hexagon: Move to do_interrupt() (BQL
 acquired internally)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-9-philmd@oss.qualcomm.com>
 <ee1807fd-eb2d-4fcb-b7e5-e44e64829b5a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ee1807fd-eb2d-4fcb-b7e5-e44e64829b5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s--541aAT_mVTxOg3B_TED0HD_sXGNIc
X-Proofpoint-ORIG-GUID: s--541aAT_mVTxOg3B_TED0HD_sXGNIc
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe62e6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=neIvRC4PW-D10HVD7IUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX+TS4eyIgtY7c
 eMc1OTYoi7BMIysvCFXT4let8fcFqBfyJdqaFfLj+xfY3YOg0J1MvSNT+m5Yb6KYLK7g/oGnTHZ
 UMDS7EyGGd9xo8ziORDRyP0cHklILqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX4PK6qf49DI3k
 ufdrJua5c4XSlfoQVD/izoxh3iJXATAxIttEtU6K0JRr6+MvReIKPlQrZmtJ9+En1TPRz6rJtHC
 nRr/CcDI+vG0wW41klwZC66mFnVQ1Jnj3JtdSWGmRA9Pr2JZpQW26Z1D0h9dN73kM2bF9AeJrqD
 KAicKAgJW6mEwlFGFlYfG4wjKpuD9ds7uh2ymTass03Od8pnzeRmxx804k9j80gpgsfWumD4VkO
 UbuwFjlNc9c5nfVncwHsO8rIlmP5lFv42ltm71uGuanRHZjjbJW4wxpevLBStO45B2l80hYKkYZ
 tfeFCBb5AliWoEv6nAKVJezP0zkGMlBcO559Nw4s4yq9p4ARJ1bw7laLxXeQ9ZyzvxD+/Ex/CRb
 38chkJmGYjdfcUAQX0sL7XPZOlTH4KiDMCuvD8xIVuQ0wAATONSwOqVSbBFor2XfUZw0pgJND5j
 W2tHZ7HRnzcnG8x/p6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2026-09-13 5:55, Richard Henderson wrote:
> On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
>> hexagon_cpu_do_interrupt() already acquires the BQL internally,
>> so register it as do_interrupt() instead of do_interrupt_locked().
>> This reflects the actual locking model used by the target.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   target/hexagon/cpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
>> index b5dcbfc99db..7067e5b70f7 100644
>> --- a/target/hexagon/cpu.c
>> +++ b/target/hexagon/cpu.c
>> @@ -769,7 +769,7 @@ static const TCGCPUOps hexagon_tcg_ops = {
>>       .tlb_fill = hexagon_tlb_fill,
>>       .do_unaligned_access = hexagon_cpu_do_unaligned_access,
>>       .cpu_exec_halt = hexagon_cpu_has_work,
>> -    .do_interrupt_locked = hexagon_cpu_do_interrupt,
>> +    .do_interrupt = hexagon_cpu_do_interrupt,
>>   #endif /* !CONFIG_USER_ONLY */
>>   };
> 
> Eh.  Except all that hexagon does is acquire the lock at the beginning 
> of the function and keep it for the entire duration.  I think hexagon 
> should stay using _locked and *not* do internal locking.

I'm rewording to clarify:

```
   target/hexagon: Use do_interrupt() for internal BQL locking

   hexagon_cpu_do_interrupt() acquires the BQL with BQL_LOCK_GUARD() and
   holds it throughout exception delivery. Register it as do_interrupt()
   to match this locking contract and allow removal of
   do_interrupt_locked().
```

