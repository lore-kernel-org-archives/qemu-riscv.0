Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5BFCDE000
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 16:30:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcmxZ-00014J-Cl; Thu, 25 Jun 2026 12:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcmxX-00013o-R1
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 12:29:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcmxV-000559-S7
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 12:29:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65PFeiqa2544163
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 16:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 frOH9uM9RUyqGUjmnClzsXZKSWUDl1YsRr58UHTvyPk=; b=mkpsmh6OdAo+iCMs
 Ur5XzkZcHGi/pXshVgRdqf8PBcOMdE3nJo5MeMxR+IKDz0TmaCxFbeTUlwl5ndRQ
 LjT2SD7P5J34hl19Lh6AsFl3PdLZU1vBGfSDQ6J3svSi3/OhJfPw8aVFMueQbcBw
 Y0w2f2rOllp1RCfam5y2tbmOrDiXwoX3pUalyJOQzUAddVCKG/NnEMCGT17NOLQR
 5I/28oqoZ3pjxsJ+gzixhZqbulRRrGlsuPDSB+PESRFnwgOo0DyI21CbpYGVW4aF
 +NI+IPLzQInQGE9aq1XOoAzSHxeMkdtz5tEpAm7vfdB5OLbFBNMFNGV+no/7ADQj
 E/ZqRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q2ssg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 16:29:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-91574ad681eso11766885a.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782404983; x=1783009783; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=frOH9uM9RUyqGUjmnClzsXZKSWUDl1YsRr58UHTvyPk=;
 b=MzffX0k7aIjJ8GMQy3Cf1Es9aVUkdstqzfxH1sOopPwarmy4BLtr5+YvBcyX/XzeMv
 AN8jS6HIyY7Wa0C5MKZp4UReN1i+HN9KEiHcD6rdb8kdz/57qwVwyBLBN+GVaXOFAtrS
 JmB4xLGNHX9L5K8H7VFyf5ISI9RK3hAsNhNFoUFDkjbXbzfpovQUqHsQMowiVZxXhiWP
 dC3zVlyUTNNrjBx7ri4prZyQUDE1NeLGw77IiesL/fv2u42keTAxrwjrDbIBuBsCpDEq
 J+Af5OpjSN2/FDz/ram7frumCr08x2VzthRkmwRiV7pbloeCvqwOB1U4WJ48pxQRfVOP
 FOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782404983; x=1783009783;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=frOH9uM9RUyqGUjmnClzsXZKSWUDl1YsRr58UHTvyPk=;
 b=kmFMOgNHcGcCy/quAQoI+/bjzMm1kIdA/JyfL+JsxjFpu/7DMdeNTCT0BC001w30VY
 9w7EVNpS6rGmAF8Gq+1Z4SqOxvhczmyCH3C93WIRQhLmlcq9T1Jj5zbGEaT/Wzzs2gEd
 KUG3D2mJnNdoQW5TMU1AO7cFlD7FxwArMqCZHQmU/DpB1vbLTpOP2XYHpoFDWXgQtYYV
 jO1TfXqKQQoj9xcZIhz/97NdEnY33uvMIGPpZhCS2/NAkAt+bC9Mk76LrmtZKO5mEDAH
 pv4GHpoUCUSRoXzyPR8CB14M0N1hni6ycuLdP4qLg3zRsyHFwLJDoJS0QkqKeEJ+BXJo
 VvQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8RF/mYtp2DZ5R2sgH/AlbG9pJDO0TPk6B6MkZo0U3PPUgkx+wEwsCWTxrmXij28se10Ka/b59l57Il@nongnu.org
X-Gm-Message-State: AOJu0YwTC2omuk/29TTRRNrwXFe/aT9TBlfyw1PMkdPhq2kmNUzodDgS
 q8pq9uJOMItOe0qszatc73Nc06GKuCirOuQ+yk6Ans7iMLVSVcUd3ESZXmaasRjU+1sDlHXtq/4
 1/XXUyr6AdspQMczQib7b9qzQWjx5wgHORQeGvyB7hHbJyRlfl1FSCWqQqw==
X-Gm-Gg: AfdE7clyF9sDz5kkV5JfAMi/gPXyOwmD5xbUIzcUBTVqdz8GMoZwSmv6XJQ1J7SlMhq
 qBg1xIfwSdbr0ma/KYTlpAq5TDxyAFBS+xt/jT3ISZWnci9SAavOw1J9uKSeypqQgzsIgzq/YPY
 utJg8tHNOgObkBGy7ttIJvvFb3s6VliUMVdoNLlq2tAxChUT8g6ziopyKHHDHfRZlDw/LkujEe4
 +s2AcjTYiJbrrBG9TgvhGbJYsoPIeq0yzM1X4We1YmYMtI6udTe5ujuVQf0/IsbphGu162xs9dk
 2knhsTVDl+nYGFcSRR67NCUvx0Fvp0h3sj6EX/BwUOckl13epfltveAqh1QT0CJUZCkkiAZhvlT
 O8VAg2Y4UFpoAfSo6Bfg25eafEzWnmaNZikSV0KCGQcU3
X-Received: by 2002:a05:620a:318e:b0:915:9051:ba2 with SMTP id
 af79cd13be357-9293ddaeba9mr476273585a.49.1782404982495; 
 Thu, 25 Jun 2026 09:29:42 -0700 (PDT)
X-Received: by 2002:a05:620a:318e:b0:915:9051:ba2 with SMTP id
 af79cd13be357-9293ddaeba9mr476265685a.49.1782404981868; 
 Thu, 25 Jun 2026 09:29:41 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-925fa56463dsm874621085a.0.2026.06.25.09.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 09:29:41 -0700 (PDT)
Message-ID: <18878720-7dd1-4463-9a42-e4b91cfcfaf6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:29:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Report QEMU CPU archid as 42
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Atish Patra <atish.patra@linux.dev>, qemu-riscv@nongnu.org
References: <20260624-marchid-v1-1-a0af7997071f@gmail.com>
 <15e2ffbd-cb14-4767-ab56-e647fdc38b15@oss.qualcomm.com>
 <88192e79-65af-4c91-9824-99dc810c7cd0@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <88192e79-65af-4c91-9824-99dc810c7cd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _Vq4Da2iJHByizUOnYjcFsMI0mY19SgZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE0MSBTYWx0ZWRfX3Bv/oitlG3ni
 rvVE1ZQGrVeD84iuP07vyrz5ImPnt1Y1tHhGCREhbK3DveGE01gTQeGxhQ7AQOMG9DvtGUwqgBh
 csQlqLpnB+c5PAas0jk615OjW39C+G4=
X-Proofpoint-GUID: _Vq4Da2iJHByizUOnYjcFsMI0mY19SgZ
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d5777 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xvfqbYfxAAAA:20 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=h0uksLzaAAAA:8
 a=CtIvD7FJ-Gc6_f__wLwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=MSi_79tMYmZZG2gvAgS0:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE0MSBTYWx0ZWRfX2KiwV1EnTPML
 IQT3E7sDqri7RzST8s3QNQOFHc9PkpFLmnu34w0P7Msd5p7VeWlsNWlhxMEBcGBb3aT6y4PA3GC
 ymo0a2asmuB5Gxo2D8bmLjhWFMpf40eOuXBWUkOdArPcpm5VCQK4LWUrMKbiK/7ZJUyz9PEwZgB
 kSmTfechn+L/2O0hCi1FC68Nn6eIN4/2vcvn3qKyzg4d3/IQov7Y+DnklHbBawBEpDAj9SKwHB4
 u6ryHHP55xbrwAwgL3JceAXDSroc9N0IISHBkbceO80ngDfRcbfG9G73hp+UM1kJIABKFFkNHke
 KX31XoTI8AN1St34d4J3cuCQBW9QISCo+4YV+dx0hmgMLHcgZivCml+s6R9+VttakijGL4Tl6qi
 TEXvIwYdpOcoxy8j+RzxG1MYJXipt5fXOdpgMfsd2YuoxPKgrdMdUFDUJQHQzJhGx7hZdNoXGju
 Ks9B5cQWvUVi4hBPSBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250141
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 6/25/2026 12:10 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 25/6/26 14:13, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> On 6/25/2026 3:26 AM, Charlie Jenkins wrote:
>>> When a non-vendor CPU is used, report the archid as 42 which has been
>>> allocated for QEMU in the riscv isa manual [1]. This can help software
>>> check if it is running in QEMU.
>>>
>>> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
>>>
>>> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
>>> ---
>>> This series was original proposed by Palmer Dabbelt [1] with a follow up
>>> by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.
>>>
>>> When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
>>> marchid will now be reported as 42.
>>>
>>>> qemu-system-riscv64 ... -cpu rv64
>>>
>>> processor       : 0
>>> hart            : 0
>>> isa             : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
>>> mmu             : sv57
>>> mvendorid       : 0x0
>>> marchid         : 0x2a
>>> mimpid          : 0x0
>>> hart isa        : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
>>>
>>> When booting with a vendor CPU like veyron-v1, the proper marchid will
>>> still appear.
>>>
>>>> qemu-system-riscv64 ... -cpu veyron-v1
>>>
>>> processor       : 0
>>> hart            : 0
>>> isa             : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
>>> mmu             : sv48
>>> mvendorid       : 0x61f
>>> marchid         : 0x8000000000010000
>>> mimpid          : 0x111
>>> hart isa        : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
>>>
>>> [1] https://lore.kernel.org/all/20240131182430.20174-1- palmer@rivosinc.com/
>>
>> Thanks for linking the discussion.  I have but a vague memory of it and the link
>> helped.
>>
>>
>>> ---
>>>   target/riscv/cpu.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index fa497e5e8a..59d63f82c2 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -44,6 +44,9 @@
>>>   #endif
>>>   /* RISC-V CPU definitions */
>>> +#define RISCV_CPU_MVENDORID 0
>>> +#define RISCV_CPU_MARCHID 42
> 
> Worth adding a comment (possibly linking to the previous URL)
> making explicit this is an assigned number and not the answer
> for the ultimate question of life, the universe, and everything.

Don't forget to thank for all the fish!

> 
>>> +#define RISCV_CPU_MIMPID 0
>>>   static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
>>>   const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>>>                                 RVC, RVS, RVU, RVH, RVG, RVB, 0};
>>> @@ -1198,6 +1201,12 @@ static void riscv_cpu_init(Object *obj)
>>>       }
>>>   #endif
>>> +    if (!riscv_cpu_is_vendor(obj)) {
>>> +        RISCV_CPU(obj)->cfg.mvendorid = RISCV_CPU_MVENDORID;
>>> +        RISCV_CPU(obj)->cfg.marchid = RISCV_CPU_MARCHID;
>>> +        RISCV_CPU(obj)->cfg.mimpid = RISCV_CPU_MIMPID;
>>> +    }
>>> +
>>
>> Two things:
>>
>> - we have a 'cpu' pointer at the start so you can use cpu->cfg... instead;
> 
> Yep, cleaner.
> 
>>
>> - the "cpu_is_vendor" check shouldn't be needed.  Whatever is set as default during
>> cpu_init() must be overwritten by CPUDef settings done in each DEFINE_RISCV_CPU()
>> macro.
>>
>> This happens at this point:
>>
>>
>>      env->misa_ext_mask = env->misa_ext = mcc->def->misa_ext;
>>      riscv_cpu_cfg_merge(&cpu->cfg, &mcc->def->cfg);  <================
>>
>> Therefore we can remove the "cpu_is_vendor" check and just assign the default QEMU IDs
>> as long as we do it before cpu_cfg_merge(e.g. right after "cpu-  >cfg.max_satp_mode = -1;").
>> If we do that we'll ensure that all CPUs will carry the RVI archid 42 unless told otherwise
>> by the CPU definition.
>>
>> Yes, this will end up changing the IDs for vendor CPUs that don't set their own IDs.  This is
>> fine - if the CPU doesn't bother setting its own ID this means that the CPU is perfectly
>> fine with whatever default ID QEMU will provide.
> 
> Should we check for unset marchid and warn or even not accept config
> with this field unset?

Hmmm maybe we can adopt a new policy where new CPUs must have an explicit
ID set, even if zero, to be clear that the CPU doesn't care about the
field.  But I wouldn't bother about existing vendor CPUs that doesn't set
mvendorid TBH ... people will most likely complain about existing CPUs
throwing warnings that they weren't throwing before.


Cheers,
Daniel

> 
>>
>>
>> Thanks,
>> Daniel
>>
>>
>>>       accel_cpu_instance_init(CPU(obj));
>>>   }
>>>
>>> ---
>>> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
>>> change-id: 20260624-marchid-80d176b873d8
>>>
>>> Best regards,
>>> -- 
>>> - Charlie
>>>
>>
>>
> 


