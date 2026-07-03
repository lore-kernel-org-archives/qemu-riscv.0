Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7C4C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 16:02:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfgKH-0004In-Ne; Fri, 03 Jul 2026 12:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfgJZ-00047x-Ad
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 12:00:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfgJX-0002MX-KT
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 12:00:29 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663A2uG73772703
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 16:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D9yKp3ZZGm39sMrmqjMtzaMN+dCyINSfUcdAfaRLQgA=; b=OCs10qwnQjs07JPQ
 h4hSYQtlza707wuD2cCoCAqXHyM+LolJwRTaTb4VJ3KXWPmEXw8VgZED4MHl79W8
 MKcDC1l3JD7/ODJes1x8ZSGX+JZtbgpPCawKqgFekL8jM8/gNnUGgTv8U8teOroC
 xcKhGd2Nr0FoAHv/DZAshBkISkbbct0J+pELMjwBDYcLE+1lxRQ/yMhzP15NtxBq
 X8mBrzPu2WisDryGtOrN5UFuWBCRMI3CP2CHCj7gI9hy0fia2tI7Em7etWF/pm2u
 AAY+ewB+uF6D70eoyJvku5w5rJP1sP74W95zXP8oXewGVBxVmS0SKLwrdpKEX/aC
 drZjQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b0399sk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 16:00:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e82060977so76075585a.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783094425; x=1783699225; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D9yKp3ZZGm39sMrmqjMtzaMN+dCyINSfUcdAfaRLQgA=;
 b=KbFC/nn51QW/RBK4qPIwzL4WJ75GGCDP1sS8Q1jO8fZ8xQ8Xq6S+4Spzw2uMSvBHaV
 BeCwHFb5FAnX7gq5F4hLP+ZZ4uw+rZWSCmd7cg3wx1Zk++6mDYnnqZTfbcKu9wUOoThy
 rIlhjeTftFz1MsxZvsTMOVYxzSyAHI3L6fDWwIh1nLcXa2M9vSbuEonHP1o60wrxxmGq
 36yO5F/W1B9pDzb0sumW26tkqz96hmA29BDBuPzELGzGVL4RgkNtyLOldpU9IesODU6X
 xElHqW7Q4bhIdwis6R6vBi9S8FNndhEQsnm1CczZmRAhsDVpHWJl97UrfbL11nskWZRP
 vqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783094425; x=1783699225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D9yKp3ZZGm39sMrmqjMtzaMN+dCyINSfUcdAfaRLQgA=;
 b=HFZZ5HYBnLyvVNehLTRs31Me4rJRnlCD7c1epR5GEzT+CNEcfKqPxczm7kC6eCI8tC
 FFCpZ6H7h9HHLJXmX40iaESI0e2HQO8cNJAktZ5C+db4PXbcgPjo90mM2U8k1yNU4D1Y
 U02ztrfXzwpLukNCPWQhI8QvOiX8BSLVxELS9cB3ODTKkl0trT/SzKhtcvfD20i0fDxu
 Gs2lcl9wSVy/sMoFu+WelmfjfzKMZLZ93dbtbbbhi3K0XR71GH9OAilZxJVh+rA9hq+i
 TOhPph80XXtOlIOGO3kT5E8s9N0X+9ctLvPx+xoBQ+MmLraQpyKcxi95yOeyzt0vaN6t
 hvpQ==
X-Gm-Message-State: AOJu0Yzu0OZUah1ktPKwUrKDRrYREeaKHpFK5GSmmTT+xB+uf9oiVFdk
 Pd2akrAl7iKVwfYAyZ7896SDpGSiDhACpNKuwiQJzOTDWno0Y2A1D2scrX95WNpZjdo9aMlCsRw
 rCYTXvyZMHmjRNZFvovfTbx+QAezqPi5usb5HxTy6o+4aEfHrxe9+estiMA==
X-Gm-Gg: AfdE7cmkuKC7WdN7qjgErzMHqdUrgfeIczdKLp55TQt9D2dWynJMFb/d0Z/mPjuOHir
 wERQzkEn2OVQa5jXrCru9/0jqnh3tNfO1fPWoli69iI1qh59MgbMxPw7hSh6yMaYBEgCogG5k1F
 r2RnZ5wlzvF7uFJjbJNbZtF9iynF3n+2XFgE3YW64W3zuq5RY/pETLFDLN1ydFm9WY4qiajg3Xq
 zsIYazoplFP8HUw4usQ7hSsdjT2/YmKhuzLmz/CUtdfQtYMBU3njxelZ3YtGxwRPOroA+kF98aY
 uwriheiSoh2gYTxw8VBK6rymBJ2X2Qmd9ryDxkPqw44AMXBlzoOKf/sMgEKizCp61qQdh57Im73
 53qeiFKIvZbovbYmBmP8kXM31GTxFzmR59jUqz6ACSHB32a3QhDSAb4l4VIDxrA==
X-Received: by 2002:a05:620a:408b:b0:925:dce9:4773 with SMTP id
 af79cd13be357-92e8b56256cmr585041485a.35.1783094424220; 
 Fri, 03 Jul 2026 09:00:24 -0700 (PDT)
X-Received: by 2002:a05:620a:408b:b0:925:dce9:4773 with SMTP id
 af79cd13be357-92e8b56256cmr585023585a.35.1783094423196; 
 Fri, 03 Jul 2026 09:00:23 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bf11eba5sm144992625e9.0.2026.07.03.09.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 09:00:22 -0700 (PDT)
Message-ID: <7865c724-97be-4e51-9352-c256154fd665@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 18:00:20 +0200
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
 <37525427-720b-48af-a906-8cc1062e7ed0@oss.qualcomm.com>
 <104fa6b5-fb9e-42b3-b74b-a31fc554ffc6@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <104fa6b5-fb9e-42b3-b74b-a31fc554ffc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1OCBTYWx0ZWRfX20XG3HhLeGYh
 BMJFT+rMWIU6tFyzAlxu7tWCxcJELYigr/a98kiVur/Uz69RbLj1K9759AcVTC2YLWdbZfsQ396
 kqwYFx7UZKHqzLR0pvQNdHyeNy8A3JU=
X-Proofpoint-GUID: 2Pw4crS-OKp3AiVAo3J5mBKMUp9eV8qn
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47dc99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=KNUYBBPBvgDUunmgLloA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1OCBTYWx0ZWRfXyxPTIuvYJi95
 JJBsP4Y9K0Mjumq+C1YVym07lKpO9NtYrKAiKQJw4TF8cDUhLrghp6Q/YRHnW7aNEZ7vp02DxQ6
 meiwAY7LNo+qy6klWQuzuvI/HE4lGQR48ew/eEwT7D/ROGzQw/UJgI/QPaboxZJc4CqnBsK7nzp
 0FKEKkRm7e+Qy1OzrahNQPWIqcklVD8RhWgYloEqtAxQLm8idYh28uj/HdFlOuIdOr5TItjAE3H
 Gur96Cihdlnzx0dDncHnlhJbH6IXRe1Hij2kiX/PiraB6eca/vHtHrtzt8BBi8bwVRoMAqRhFCt
 Het3NV8wcDoeGiYrGpu0RyRaE5OEf35WbG4IahI/cztBZtnmBEozYv7uskC30Gunyu8usnhbaUE
 LxK3stu8qC0WNicypJ87sEgrbXIpNf75vVHvpqrQYFXBCRkq52ORfwdZuX8bLfjiLfqCGK8r4M1
 3dEW6E6CZznCDTxnGfw==
X-Proofpoint-ORIG-GUID: 2Pw4crS-OKp3AiVAo3J5mBKMUp9eV8qn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030158
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

On 3/7/26 16:26, Daniel Henrique Barboza wrote:
> 
> 
> On 7/3/2026 10:58 AM, Philippe Mathieu-Daudé wrote:
>> On 3/7/26 15:46, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 7/3/2026 7:58 AM, Philippe Mathieu-Daudé wrote:
>>>> On 2/7/26 15:51, Daniel Henrique Barboza wrote:
>>>>> The PMP emulation isn't present in the KVM driver.
>>>>>
>>>>> Signed-off-by: Daniel Henrique Barboza 
>>>>> <daniel.barboza@oss.qualcomm.com>
>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
>>>>> ---
>>>>>   target/riscv/machine.c | 15 +++++++++++----
>>>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>>>> index ba96ceceef..e1cbcaa349 100644
>>>>> --- a/target/riscv/machine.c
>>>>> +++ b/target/riscv/machine.c
>>>>> @@ -20,6 +20,7 @@
>>>>>   #include "cpu.h"
>>>>>   #include "qemu/error-report.h"
>>>>>   #include "system/kvm.h"
>>>>> +#include "system/tcg.h"
>>>>>   #include "migration/cpu.h"
>>>>>   #include "exec/icount.h"
>>>>>   #include "target/riscv/debug.h"
>>>>> @@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
>>>>>   {
>>>>>       RISCVCPU *cpu = opaque;
>>>>> -    return cpu->cfg.pmp;
>>>>> +    if (kvm_enabled()) {
>>>>> +        return false;
>>>>> +    }
>>>>> +
>>>>> +    return tcg_enabled() && cpu->cfg.pmp;
>>>>>   }
>>>>>   static int pmp_post_load(void *opaque, int version_id)
>>>>> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int 
>>>>> version_id)
>>>>>       int i;
>>>>>       uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
>>>>
>>>> Maybe we can use:
>>>>
>>>>    if (!pmp_needed(opaque)) {
>>>>        return 0;
>>>>    }
>>>
>>> Hmmmm I thought that pmp_post_load() already infers pmp_needed() == 
>>> true.
>>> In migration/main.rst we have:
>>>
>>> ---
>>> The 'pre_load' and 'post_load' functions on subsections are only
>>> called if the subsection is loaded.
>>> ---
>>>
>>> Hence we'll only execute the post_load() cb for a section/subsection if
>>> the section was transferred, and that is determined by the .needed cb.
>>> In this particular case we'll only reach pmp_post_load() if
>>> pmp_needed() is already true.
>>
>> OK.
>>
>>>
>>>
>>> Or am I wrong?  It has been awhile since I last read migration code and
>>> I'm not finding docs w.r.t how .needed and .pre/post_load interact
>>> with each other.
>>
>> Maybe check 'if (cpu->cfg.pmp)' then? What confuses me is the
>> 'if (tcg_enabled)' since we already checked that in needed().
> 
> That's in there because pmp_update_rule_addr() and pmp_update_rule_nums()
> are TCG only and it won't build with --disable-tcg.
> 
> And now that I said it out loud maybe this would be clearer:
> 
> static int pmp_post_load(void *opaque, int version_id)
> {
> #ifdef CONFIG_TCG
>      RISCVCPU *cpu = opaque;
>      CPURISCVState *env = &cpu->env;
>      int i;
>      uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
> 
>      for (i = 0; i < pmp_regions; i++) {
>          pmp_update_rule_addr(env, i);
>      }
>      pmp_update_rule_nums(env);
> #endif
> 
>      return 0;
> }
> 
> I just checked it and it works with --disable-tcg.  Let me know
> if you're ok with it and I'll change it for v4.

Yes, this is clearer, thanks!

