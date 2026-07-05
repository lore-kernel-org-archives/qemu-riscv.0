Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A47C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 22:05:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgUy6-0002xn-FN; Sun, 05 Jul 2026 18:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgUxn-0002hg-OM
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 18:05:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgUxl-0002X0-Vm
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 18:05:23 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 665Lxhtt2841074
 for <qemu-riscv@nongnu.org>; Sun, 5 Jul 2026 22:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DH8pzOmc9lSj+TaHJtAy1BByOmTt0UHjszdsdLBbFUc=; b=Xa2lIRZEUheZhQWP
 fMfx4AnDGWzO7sKLT2FpY6fT2d+x3Q5fB4w2pt/lybee7IAwpb4Vyp+rv0Y2RGlv
 BnsltYRhOCDEfuz78j+tT8BeJAeUexDujoG/ApPAF0dYoyebHlxlVSQV8xA9szkN
 5gOzEiMyFxLHlWjiF7awXvrwOqM7n2Yf27fdVp+Q+NoaEBsrF7JIAi219Taw1EM5
 esywovRBM/hxR4hMlLr4IGV4e9IoHmvyWvYtu7XkHGUSrFs2rgDbEeGO5pu7PRer
 hmdJmtvtE3jVMZ0G4+//sM4PcK9RtU24vllqvzRbmPNcT1UQ53YSyY4qF5AsXg6s
 Ya2ymg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3kju-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 22:05:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e61b38eddso437278485a.2
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783289119; x=1783893919; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DH8pzOmc9lSj+TaHJtAy1BByOmTt0UHjszdsdLBbFUc=;
 b=CWNtGIJjkG5X/ab/ZGrpgsX2XKqm4IzIrYcL9kY1++McxWCMW1U4zR8yK6+WI24KGh
 5psHN01g1MFG8TBcXX6NaTuVETsdftaRAQSzq4T7p17N26LRDpSjmVix1+5DE9Wf7h0a
 4i6e37OTKs8zGEsh/oYTSAbzL/rLOD7xWiKoIJzxGA5q1RZf8Fx7fD9WErz+OzKQS1F5
 CMrjtqQSze/W8oS7ZrSTwkBgYnxVn1jZOM2U9ZcDvEu5TQTa1jE7s2Yg/Fq6Ai85kBAB
 yhXAaKjfofhHISmaZ7Q34mEW+RJ3DoCo0+GrMWyfBY1UcCRV+xj3lXANVAsLLZhSR861
 ExeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783289119; x=1783893919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DH8pzOmc9lSj+TaHJtAy1BByOmTt0UHjszdsdLBbFUc=;
 b=bgvssR2nrHnQGFYsjIcAUuQra965FrF/yQ4G269tVpTO5rlOfGPs3qH886DabN4QvU
 TLrinwdCbLI2/6Htno5XlPaucVJ+h8LrBwGY7D+pDQbeb/u2V5Qjnd1SXQkbxMjiWyrr
 NRt/wY6P2+yg8B9gPSa13sklqbGbt3NLvyJaB6gNXnqrmX+I1zVWbx4z5OL1rmePflOB
 4N3hsrpZNTVfBAMZTJYpHUEHyIQN3I9z3dA7o9YiWTM2tpt81ttSClwS5MmieovNG2Px
 FkMbht7Yy7ZD4Har8Hri5lPaIxyWSKvi8nDBQep7kiPgx0O7J72mynvXBDPIvRZHTdtA
 mvww==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwN99vYFnZbumONaMFeLz7/j/pnUnYbWXTjcpbYO+FbX3K+k4D0u6HDQneLCsBKbijL02E4eJ2EElQ@nongnu.org
X-Gm-Message-State: AOJu0YyRDDsm2x6YYyAuTRYvh1DJqOKbbayvcFK/GrHDwv2AtfRpwYTf
 HgWS/BQSKBg+1q0xYtj9M5RrFrmp4ABlXmqMfXKMJq9HXyUYzn/KQeDa3bQyL2ctER9JZihxYTK
 /CPA3d/wcIFgNTObS/40/w8ze0SJqB6d4HeEOjGdhKSzZODyejhzLwZ/kKA==
X-Gm-Gg: AfdE7cmdoy4F0X2UVQOPMEpi0qYWGp4/2rb5+xVn6L8VKOUNGlIhZKcBLxWyO0ItLdR
 fDqZf6Ghd8yU2gpEeKXnAYpHeNcIG8FLNisfPCQPrOpBT5yx8/80sMnFl+/Djte8j43YBri1cnP
 owiaIg2hTYLJD6jsfsIIJC8lsC8x7DU5R/pAwz9u6JEPqsPXCkcrdyXB1uFaHIzjXsFeRJ0Udf6
 CEl9g3CHEIwk7qjdfzQwUBucpawRhRAqjokOW/lQf9to/h/7ZFIB8ViUiS518aXycocbhGOFNik
 2eH0O0pk7gCxWxHNT9IOSGj4EVOm0jp0jA4YpBCSk8U0mHUOYm8sGEgW0zBSl8vb6/kLqpjkbzi
 QiMipmybcYinHCAGW+a8E7D4/xlPsHGZWO2K4tMsjT+aXLo0=
X-Received: by 2002:a05:620a:4693:b0:915:c7ad:8bd2 with SMTP id
 af79cd13be357-92e9a3be669mr1067116385a.30.1783289119374; 
 Sun, 05 Jul 2026 15:05:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:915:c7ad:8bd2 with SMTP id
 af79cd13be357-92e9a3be669mr1067111985a.30.1783289118768; 
 Sun, 05 Jul 2026 15:05:18 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b62c53c1sm610661066b.45.2026.07.05.15.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 15:05:17 -0700 (PDT)
Message-ID: <6c0ff642-8125-4c35-8ed0-8f89da555ee9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 00:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv/virt: Add optional UART1
Content-Language: en-US
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <tencent_06551FAEA44CD75E915AE611FCA0C99CDD09@qq.com>
 <24329582-f5cf-41de-aabe-c2c3d54f03ea@oss.qualcomm.com>
 <tencent_3045B23CF7A9872F29FC351E24D8F9373F07@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <tencent_3045B23CF7A9872F29FC351E24D8F9373F07@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ad520 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=dZbOZ2KzAAAA:8 a=4iFUP5XX9WVA2vuhWywA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIzOSBTYWx0ZWRfX9qCBGO3ZgIJB
 6WJSd4M2scU/bfgMGoiuiorGr0OujMIbueXsTUb6+4AhYklyg7z2K8CkHCkfLsy4o6joWLKMbsW
 LeInHvCci9Bzf8hM2jBxQsP60E79hMXbs2xjiLASxkv7LL6Yx0dqPUxQ6pAUR2JiW+18sa1H9sp
 D74zy3+DdRASkO15ynze7/WmpeWftQV1e0PBwfuxYZSJawtSNZnVb1L0/qrYAB4UH7F/c/P4fAJ
 f+zjbqwyvfqg5xOO4hCkuK2b0/6d79W4LXxaxSBNsmGAl8F5DDEnwhux1418gdYNjKjNqqEgLo1
 Jy/ScK5XuUuY1TglgI6xOxmWeDN9jsipGXs7d0y24trKQUjQ89rfHKt7ZTjizhnIWbAP609Xxyn
 FA0rBwpSNls9A34pgBS1BthbOvNurijmWjtQnTn3jtZbpyLyNBEf8jYcyUrXPjr46Ivr4CfM3QV
 j6xmyMVb0iUKZu4z6pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIzOSBTYWx0ZWRfX1TF10McWqoRf
 ur60SnHHsdLqv72VF+qch+Mqn9EFGGVOvBng6Edc/mn7Fv8zPkHQa3xGTT+KLBZVVr64iKrHyNN
 84vzfvD3w6GGXLjliibo4koj/HE64Ao=
X-Proofpoint-ORIG-GUID: IW_X09enQJ0pQNiCLRWbVDt29gG3ZE-1
X-Proofpoint-GUID: IW_X09enQJ0pQNiCLRWbVDt29gG3ZE-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050239
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 4/7/26 03:41, Yanfeng Liu wrote:
> 
> Philippe,
> 
> The v1 always creates UART1 carelessly, then Peter suggested following
> 5d8a250f9068 (openrisc) and e7100972f2 (arm) to reduce guest breakage.

Oh I missed that. I'm confused because I thought not checking for
backend use of a chardev (in particular calling serial_hd) was part
of Peter's recommendations, since he did that cleanup years ago. I'll
let him finish his review of your series then; simply ignore my
comments.

Regards,

Phil.

> 
> I looked around and noticed the pattern is used in arm/virt, arm/msf2-
> soc, arm/kzm, xrtensa/sim, and ppc/e500 etc.
> 
> Please give me clear direction here.
> 
> Regards,
> Yanfeng
> 
> 
> On Fri, 2026-07-03 at 11:31 +0200, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 3/7/26 06:24, Yanfeng Liu wrote:
>>> This adds optional UART1 to RiscV virt board if required at
>>> runtime to simplify multicore development.
>>>
>>> Note that UART0 remains default serial_hd(0) and it is:
>>>
>>> - the lowest address UART
>>> - first serial in DTB
>>> - behind /aliases/serial0 in DTB
>>> - the /chosen/stdout-path in DTB
>>>
>>> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
>>> ---
>>>    docs/system/riscv/virt.rst |  5 ++++-
>>>    hw/riscv/virt-acpi-build.c | 12 ++++++++----
>>>    hw/riscv/virt.c            | 39 ++++++++++++++++++++++++++++-----
>>> -----
>>>    include/hw/riscv/virt.h    |  3 +++
>>>    4 files changed, 44 insertions(+), 15 deletions(-)
>>
>>
>>> @@ -1567,6 +1579,13 @@ static void virt_machine_init(MachineState
>>> *machine)
>>>            0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
>>>            serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>>    
>>> +    if (serial_hd(1)) {
>>
>> Checking for chardev backend connected to map a peripheral block
>> is an anti-pattern; the block exists on HW regardless.
>>
>>> +        serial_mm_init(system_memory, s->memmap[VIRT_UART1].base,
>>> +            0, qdev_get_gpio_in(mmio_irqchip, UART1_IRQ), 399193,
>>> +            serial_hd(1), DEVICE_LITTLE_ENDIAN);
>>> +        s->uart1_present = true;
>>
>> Thus we want to always instantiate all UART peripherals.
>>
>> If you drop the uart1_present field then the patch LGTM.
>>
>>> +    }
>>> +
>>>        sysbus_create_simple("goldfish_rtc", s-
>>>> memmap[VIRT_RTC].base,
>>>            qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
>>>    
>>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>>> index 18a2a323a3..7d57c8292e 100644
>>> --- a/include/hw/riscv/virt.h
>>> +++ b/include/hw/riscv/virt.h
>>> @@ -59,6 +59,7 @@ struct RISCVVirtState {
>>>        int aia_guests;
>>>        char *oem_id;
>>>        char *oem_table_id;
>>> +    bool uart1_present;
>>>        OnOffAuto acpi;
>>>        const MemMapEntry *memmap;
>>>        struct GPEXHost *gpex_host;
> 
> 


