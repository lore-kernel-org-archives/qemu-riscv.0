Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D8BC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 13:59:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfePt-0008DS-Va; Fri, 03 Jul 2026 09:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfePq-0008Cn-FD
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 09:58:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfePo-0007MM-PR
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 09:58:50 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663DBoQf3195143
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 13:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xwOJ6c9ApN6oCJWZ20hHRQ8ber0OuBFlNjJbbxVUtEg=; b=ZhaffRysCtAjHPMk
 6iOoz4SSfcgEvjIKg8uftP/LaWB/zLZU2J+89sfxM6UGmeqBcrbCJ6Nd00muIWZ2
 xvdivHWLHa9FSHFqKiO8qVMpR/hsORJte6NSvMIm3a6YjGci2k3DpYEQ3mSWxOQB
 13EYTujg0vc6LLxAa5qyA1b0CNW24M/XDNySHUGdHnwUAnvP5R0vm45IQNO8JgIk
 f/XlGYeHbF4dlObQSJ4Sdh3BvsH6VJbv6Z2lD+gbcyr3hv02RhL7HrYhqdIKMu+E
 7XMMDqdNTiMAoWwzsMSU0AoVbQstoDaDPBpQh15AQ/MopTImFElI+w8mJBgqCRC6
 Jg6P8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jysf5s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 13:58:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-915d3261c5cso59285185a.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783087126; x=1783691926; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xwOJ6c9ApN6oCJWZ20hHRQ8ber0OuBFlNjJbbxVUtEg=;
 b=X1NFazCvPekaw808tMNFt0mL7hlDhwNlL8t0Cqb6N6w00+wM+ngC3Ip5sC6n2Aafg5
 NhgSX3VCFLJCg26+EOtb2beV/T1GcOASOS6zuDHxvonr5yOn4rjZNrwB+RepqAWW3sQQ
 D+LsF+36x3UtRb/9U13vWSZUxwkxBKyAdwvEVHb+YGwKzfSccDBwuvTihFrpkO2y7Dko
 D21Oo0GcQRZfdzTM6wus+bv/G37BvRsAUB9iSZURk7JSR2vg0CIno40vhijHz63cbSlu
 lEuquMuuaFLXt/aArY31bhTehZBsCPDpmQvBMJCnlwWWD7tBYsygJk5tUeZY8zrpILWI
 z0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783087126; x=1783691926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xwOJ6c9ApN6oCJWZ20hHRQ8ber0OuBFlNjJbbxVUtEg=;
 b=tLSaTTHCEWLRTGMDo+ulU5zirN30+EJK/0xqmt6jSurr4/uBvIj3+j39e7rUKjDjZs
 +l2KaHEB451wF3k6rYChO0YnGP3bsfTxOiX75RgAKrUmciQiAKzHGc2C5rKq0OQs3/fD
 1bACXLwluih30Rr1KAsHktIRMpbuN6EYVEuGW1SN5+EBLs/Ng5VhiIsjZkiiXm7zulu1
 VNZTAKHSKKCYaKzq2aamePHIq74eT6xJjvVKxFcFJKkwvWXdiFV0F0iSJuudVVH31fJY
 QPbDmhkMxDke0a6UBKgfopZs2Qwb3o/aFLGvxunBInKE78oX8oWFvXgvKjfpy+UXB+sS
 Wm9Q==
X-Gm-Message-State: AOJu0YzjDawjSAKgjsqUvXO6cmZEAuXg3EKJuvXgyrMV08n350O+UZs5
 JlihCp7GC5V9rU4iXD3JLgx8yNEaumPe+wRwtvu/ctxQ5JvIw90NbnNVOUDXGbFs3Awxk7vz2wJ
 U0r9UV88u8Q+rFGbvXLXzcKWoKDidkNzPpNDMEedIs5JwfuaClgI+oEE+Vw==
X-Gm-Gg: AfdE7cnqNJbGAvVO3k79mpGKs8vnxiMFPL5eUTuo8PHUexE67FnW4ksl4vSV5kolhvG
 6S3XyBU3/oMkjIf38Ak/i2e2sf2hwILT5TGtZdMrCZUjL268+yWlciyxDj8HyNr2zAZcE0zdT73
 HUNRR/+X0xQivt3IkWgYZbsXAid4I3fn7kjxoGz8gzkwq3i7Di4ESP2otbPWGEQbygItlD8Zfds
 6KJk9eDKzzQrORyZdLJZaCkQsWdO7YFB2k2nrL18sljnup1UG0Xev1HlfuIibYUML8GQFZKUfJu
 z+U2N0m5UViDLWgH+PP1oYS84IPH/W0y2+EBgvrI1u14eI/DQeyhaHHGOshf3ilWBMRijm71FrD
 HMrYyAQxNayKg1O4zvVHwU+pow11DeSPCY0JL19STp9lsCJ24jMjpM1Q6XPwG7Q==
X-Received: by 2002:a05:620a:45aa:b0:915:a457:bf94 with SMTP id
 af79cd13be357-92e7b422de7mr1149265085a.48.1783087125529; 
 Fri, 03 Jul 2026 06:58:45 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:915:a457:bf94 with SMTP id
 af79cd13be357-92e7b422de7mr1149260685a.48.1783087125005; 
 Fri, 03 Jul 2026 06:58:45 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cfb6f199sm26085395e9.3.2026.07.03.06.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 06:58:44 -0700 (PDT)
Message-ID: <37525427-720b-48af-a906-8cc1062e7ed0@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-4-daniel.barboza@oss.qualcomm.com>
 <18ce4e8c-bb35-49c2-abee-9145a33d95ec@oss.qualcomm.com>
 <10315dfc-37f1-40fb-bbf5-b2c5f460c956@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <10315dfc-37f1-40fb-bbf5-b2c5f460c956@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzOCBTYWx0ZWRfX4bmnUyQnbva5
 VuhgP+Lzz6AxfqCst2gOhQJO278dpHiXVfcs3YyK7O6kDEGIy8Ubrj0vO+Cx6kClRbt3sVuzvwG
 BSrEZL5FDjTaruH5ZLeJHAaKaPuTvEIDwUbN47XMm1MEnxHExb/CcCKtrEPILGrftJEI35li7KG
 6tPYX1loSKeerzXy7XQhSwByER5fCkc+xpI6iePaQml93yCI6WgqdQ7oFncx7Y0DAepIyrAn6az
 cWQDMuGgiIOY005zgPG5G/wWMaEvR2XCXGiRSWYI7lsgGbcmrUZex7KUTF8yxEnWvM+1Cjmugij
 bJN5L/8RoFn916iEyHitWmTm75GOWirPnKlOPYWWeWRPa3fXNavKrccgsLbPqXC7nZ2hHvRRSOF
 ADbZ7N3H1/FltrHi4EFPLz/RCr6iQ/8ArnqMMdOkfQFq+0dBmameNrll9vxWDxfummIp6G6yWZZ
 +VmsfYPA6dBBJdDxUpw==
X-Proofpoint-GUID: _Aa_dVFN5MuAgJFvuprPIeIrqYRPrHol
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47c016 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=BP7IqNw7tyCuCp4NixIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: _Aa_dVFN5MuAgJFvuprPIeIrqYRPrHol
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzOCBTYWx0ZWRfX35pB9CRUf3A7
 wpbqX3YgvXaXSXZuyUDDgn7ytwO5Ug+vFv/H4gy9vF39vM27hx6cyT8CUdSE9N7ddIl2Nbyx6Qr
 4ZkRf7EtSZXul8ybJaxz/J62hNXP55U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030138
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

On 3/7/26 15:46, Daniel Henrique Barboza wrote:
> 
> 
> On 7/3/2026 7:58 AM, Philippe Mathieu-Daudé wrote:
>> On 2/7/26 15:51, Daniel Henrique Barboza wrote:
>>> The PMP emulation isn't present in the KVM driver.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
>>> ---
>>>   target/riscv/machine.c | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>> index ba96ceceef..e1cbcaa349 100644
>>> --- a/target/riscv/machine.c
>>> +++ b/target/riscv/machine.c
>>> @@ -20,6 +20,7 @@
>>>   #include "cpu.h"
>>>   #include "qemu/error-report.h"
>>>   #include "system/kvm.h"
>>> +#include "system/tcg.h"
>>>   #include "migration/cpu.h"
>>>   #include "exec/icount.h"
>>>   #include "target/riscv/debug.h"
>>> @@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
>>>   {
>>>       RISCVCPU *cpu = opaque;
>>> -    return cpu->cfg.pmp;
>>> +    if (kvm_enabled()) {
>>> +        return false;
>>> +    }
>>> +
>>> +    return tcg_enabled() && cpu->cfg.pmp;
>>>   }
>>>   static int pmp_post_load(void *opaque, int version_id)
>>> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int 
>>> version_id)
>>>       int i;
>>>       uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
>>
>> Maybe we can use:
>>
>>    if (!pmp_needed(opaque)) {
>>        return 0;
>>    }
> 
> Hmmmm I thought that pmp_post_load() already infers pmp_needed() == true.
> In migration/main.rst we have:
> 
> ---
> The 'pre_load' and 'post_load' functions on subsections are only
> called if the subsection is loaded.
> ---
> 
> Hence we'll only execute the post_load() cb for a section/subsection if
> the section was transferred, and that is determined by the .needed cb.
> In this particular case we'll only reach pmp_post_load() if
> pmp_needed() is already true.

OK.

> 
> 
> Or am I wrong?  It has been awhile since I last read migration code and
> I'm not finding docs w.r.t how .needed and .pre/post_load interact
> with each other.

Maybe check 'if (cpu->cfg.pmp)' then? What confuses me is the
'if (tcg_enabled)' since we already checked that in needed().

> 
> 
> 
>>
>>> -    for (i = 0; i < pmp_regions; i++) {
>>> -        pmp_update_rule_addr(env, i);
>>> +    if (tcg_enabled()) {
>>
>> or use it here; also restrict pmp_regions variable scope?
> 
> Just moved pmp_regions.  Thanks,
> 
> Daniel
> 
>>
>> Anyhow:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>>
>>> +        for (i = 0; i < pmp_regions; i++) {
>>> +            pmp_update_rule_addr(env, i);
>>> +        }
>>> +        pmp_update_rule_nums(env);
>>>       }
>>> -    pmp_update_rule_nums(env);
>>>       return 0;
>>>   }
>>
>> Since you are working in multi-accelerators frontier, keep in
>> mind in the future we might have some targets migrating between
>> different accelerators 🤯 :)
> 


