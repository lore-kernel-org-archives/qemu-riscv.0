Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A158C4451B
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 13:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkj3H-00014W-1x; Fri, 17 Jul 2026 09:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkj3E-00013u-Gn
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 09:56:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkj3A-00033W-MA
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 09:56:28 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HCT1xL1884520
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 13:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o0otUhr3HybB4K0rizzhKOsjcP83WY6S2MmHWbPqW9w=; b=cp21ZP5E9FmiWqV4
 vTapvwsFeDpw5LWbcgmbPmtmH8xhGjOebjMVSwKyGchyyhVafJmqCaKQ3C/qKxrO
 e5W6cl9ZCIzvmC05rVqPGQXJOaNcy0xVB/GG1hmY3lTQ/xBd2emlRhmnDiNpPXlr
 KZYWE9hW8AzRLbABRZHdtIbRAW+guEjCxfEfcnKrD1XumRJvwezI3/DMlRqVwHL2
 4mw8nvoZWO3oF9VOmlqNiZ61C6t8EM/hpWR4Ez/KFeMjo5cNCs6KIzoKm/YLCidt
 WRsIz7QNj20IBYiQq4eSOtax9HSwgShwYQL58Lm2JTdbbDd4PQ/tN+QYVFWGqrm8
 TWBW5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfh00q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 13:56:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1ada6c43so14804091cf.3
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784296582; x=1784901382; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o0otUhr3HybB4K0rizzhKOsjcP83WY6S2MmHWbPqW9w=;
 b=aka2RXGkv/JEY3ZSFNTiW1F0BO/ftkUkV6DX1gjFMX6OnHQdagg89pj780DxdkqcJC
 fP+7bTdgO+7dx911lp6GSCknLQne7mg4F18IcAsEwdiDamw88Uda9wAGdD2nfwKDanAH
 YFroqFlbwSk3NT0EogzSWfZbZ4Fo9AlcmVKtXbqzioPbwGguDdnJZmaLK3voEL4FZEwI
 Ez1bXMRKkqK5Uz3YlcBOCditqe2ZxhIsKN7GzT6T9dxDfcCFj9IfSBY+0wDzFOiKcF2Y
 W1XZyuoD0I3MftrnqYRw2mw18tlMR9Pojk87uMsnrWpyWkT026AmEmXVIzfNFk3VGgR2
 U/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784296582; x=1784901382;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o0otUhr3HybB4K0rizzhKOsjcP83WY6S2MmHWbPqW9w=;
 b=R9heDY3m6tdqrr9hVB8UyDCD5I/za3+d/eX2eTmzys+VTeV8Q5aLdAy9C9xws/XjOu
 FIn7BatCLCIS7jiPOCSD1tQCvhhRZgiFB0ypyrDLkPZyy5EybwYynOXI7ktsugvjxQiS
 +ln8HmwrEpxthtgvxe5/hkVwvO2cUUwp09WwGMdJr50uMbOu1K2M0tJLgGrTs7jmCYLa
 YQCyJ9/fBp6MmSb/8bgX1OKQt5EjX++zTc0SxJTGH0XPBlyzGrwBmGFPaPoCWuNl4qsD
 NTfmmTzIFN5l8G41u94CLJDWSrfaPlRbCziTuNyzuXSc6jz3gkpqy+Az7uflzxv2kWx6
 rXEg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8NPwt5h4kF4IevzT7GfUVIT+3jOgBbjRte6isvfqT3EJuNrciPUIqKNlRJvYpYUhr0cNl6J5hFZYh@nongnu.org
X-Gm-Message-State: AOJu0Yxhq301/dz0rY02jADCJe3BoylTQzCljm55K05EnRX4UEkfQ/rK
 HT8zT74YcO65yP2h6SkxNNpIVMIomxohYoQKq/6S/MEY0/YeRCOiEjOuxI2IvIQXZPxgUQmz7qv
 RzRbavumidx9zqi9AiJWc8+K6PMw73+BJ7adBGYKMr6MVVFJIO7TaWxoTXA==
X-Gm-Gg: AfdE7cmMSBnRzilqwAh3JvuA4eberqNwKk7I6D+AOObdR/z3CPmv5l4AlfmX4Ykf24m
 xhNbCKj8c5XGdkiAldCVuTx+RM+rOq3jkc7StOyU4YXpyMwEeUjV8TJoOxNBibykrVP61tatYyA
 aojT8MI/rncR566N8ZhZ3NewNh2WJl4Uyw+Q+q21YcT34ysQg8yGYqTtGAkcPfLzFehhp3kJOzv
 GVhaHLT3m5j9pSC9sjDiBYXwBNUnfafSAxeU+rtdn9Ipqpz2nnHZc8/+KOfED/5TrSaRw95UPv1
 rqXTJGrNLpi0kX+y2FxGo3dNRLQN/j0zeDCtmrlPfvcbXNRtzEULfmX6D0pVbtTCZa+6hv0d0ah
 TOwbmBugVVZBPTF825d6BOOwjvFqmn1MxOGqx2g==
X-Received: by 2002:a05:622a:1e17:b0:51c:1638:8663 with SMTP id
 d75a77b69052e-5213c7e69a5mr25153161cf.53.1784296581506; 
 Fri, 17 Jul 2026 06:56:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:51c:1638:8663 with SMTP id
 d75a77b69052e-5213c7e69a5mr25152871cf.53.1784296580944; 
 Fri, 17 Jul 2026 06:56:20 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5214fae3268sm11990811cf.24.2026.07.17.06.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2026 06:56:20 -0700 (PDT)
Message-ID: <6225b3ef-461f-458e-9275-ec471d6fd2d6@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:56:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] hw/riscv/k230: wire up the RMU device
To: Chao Liu <chao.liu.zevorn@gmail.com>
Cc: jack wang <163wangjack@gmail.com>, qemu-devel@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:K230 Machines" <qemu-riscv@nongnu.org>
References: <20260709031237.21284-1-163wangjack@gmail.com>
 <20260709031237.21284-3-163wangjack@gmail.com>
 <9e600f36-96ac-4eb9-a901-47d4ea6cc748@oss.qualcomm.com>
 <aloupwOnk4bggOy5@ChaodeMacBook-Pro.local>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aloupwOnk4bggOy5@ChaodeMacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0MSBTYWx0ZWRfX23hcq/IApRUB
 RDVA66jruU4WPh3OcRNh8HUIcKC6/qxqdwhxRJBgg58Gasn1xmd7uOiXeMaOw4Cr3gi1LtP2tud
 A9EFrtFwO1a74JpR3KY8jP1nFsocOjRW9VMdDDP2oJcrCmWAR9htLlCyNDoVcHP7iV6d3MhqlVB
 QDYTOjCgDewPM7Y+scYTRDPTw6T0FiyIaAjx86wGni0oLpowdGLPl1alqIGY8bWBeTtfI3svwQl
 lEsRhLNkCD7gW5nEV04EYXywMUiIEqY+cHLtap45ffakeWR1KeSzaecG6MODGrFs0xyM1IWCow8
 LVQJx9v0h1fEfdyCw9qQJ6YgvcAGd3rNgDWQkr4aVjkAIrb5HVTXfalA9t9RRUkL3RrnwIBKzIF
 veN2ZYLmoZ7C4hIeahnsvm8m3KSonwMm2MdliNcTckWSvyGu8IcZTfMv+OQ6goz5LYiWuI62ea+
 zdOkFwqt6a0ZYW7n/1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0MSBTYWx0ZWRfX5lCOjPQ+Dh7C
 i3rVfAwjbLn4lAQj5sDJyDGrvdz5RDdtY2BQPxAxrdqhdFAV7M3jDLzqQ6nIQOBlXZm1hTvkMDp
 P/weNizZ2YEei43si+4BDrhlwLtYMS0=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a3486 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=Zfw3-bMTAAAA:8 a=pGLkceISAAAA:8 a=eALVAItKQTg6htMRc2IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=vDjR-8MehHraQiPHcxf4:22
X-Proofpoint-GUID: qy7qrC247nRpZ4pp0DddKx67Cz-BQxir
X-Proofpoint-ORIG-GUID: qy7qrC247nRpZ4pp0DddKx67Cz-BQxir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170141
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_OTHER_BAD_TLD=2,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 7/17/2026 10:41 AM, Chao Liu wrote:
> On Thu, Jul 16, 2026 at 02:56:30PM +0800, Daniel Henrique Barboza wrote:
> 
> Hi Daniel,
>> Hi,
>>
>> On 7/9/2026 12:12 AM, jack wang wrote:
>>> From: Jack Wang <163wangjack@gmail.com>
>>>
>>> Replace the "rmu" create_unimplemented_device() stub with a real
>>> K230RmuState instance mapped at the K230_DEV_RMU memmap entry, select
>>> K230_RMU from the K230 Kconfig, and document the device.
>>
>> So, as I said in patch 1, applying this patch will fix the qtest that you
>> introduced there.  I believe we want to either squash this patch in patch
>> 1 or move the qtest creation to this patch.  Both are fine to me.
>>
>>>
>>> Closes: gevico/qemu-camp-2026-k230#11
>>
>> Not sure what gevico is (seems like a bootcamp, according to Google at least)  but
>> the "Closes" tag usually contains a gitlab bug or any other link that is publicly
>> available.  It's better to remove it.
>>
> I believe this link refers to:
> https://github.com/gevico/qemu-camp-2026-k230/issues/11
> 
> However, according to the QEMU development collaboration workflow,
> we don't need to add it.
> 
> Gevico, here is the English transliteration for the Chinese "格维". This
> is a major open-source community in China focused on technical software,
> which I currently organize and own.
> 
> Within our community, we run a QEMU technical training camp primarily
> centered on the RISC-V architecture and exploratory work regarding
> GPGPU microarchitecture.
> 
> One of our key projects involves hardware modeling for the K230, where
> we are implementing a digital satellite-borne computer. The recent
> contributions seen upstream were primarily patches sent by participants
> of this project. We are currently in the process of contributing our
> results from this stage to the QEMU upstream.

Thanks for the info.  This seems very interesting indeed, and please keep
the QEMU contributions flowing :D


Cheers,
Daniel

> 
> If you are interested in this, you can visit the link below.
> https://qemu.gevico.online/tutorial/2026/ch3/qemu-k230/
> 
> Thanks,
> Chao
>>
>> Thanks,
>> Daniel
>>
>>
>>> Signed-off-by: Jack Wang <163wangjack@gmail.com>
>>> ---
>>>    docs/system/riscv/k230.rst |  1 +
>>>    hw/riscv/Kconfig           |  1 +
>>>    hw/riscv/k230.c            | 10 +++++++---
>>>    include/hw/riscv/k230.h    |  2 ++
>>>    4 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/docs/system/riscv/k230.rst b/docs/system/riscv/k230.rst
>>> index cea8202e55..3f2313a127 100644
>>> --- a/docs/system/riscv/k230.rst
>>> +++ b/docs/system/riscv/k230.rst
>>> @@ -19,6 +19,7 @@ The ``k230`` machine supports the following devices:
>>>    * Core Local Interruptor (CLINT)
>>>    * Platform-Level Interrupt Controller (PLIC)
>>>    * 2 K230 Watchdog Timer
>>> +* K230 Reset Management Unit (RMU)
>>>    * 5 UART
>>>    Boot options
>>> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
>>> index 54e41a6afc..bffa4e69c8 100644
>>> --- a/hw/riscv/Kconfig
>>> +++ b/hw/riscv/Kconfig
>>> @@ -149,3 +149,4 @@ config K230
>>>        select SERIAL_MM
>>>        select UNIMP
>>>        select K230_WDT
>>> +    select K230_RMU
>>> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
>>> index 502281c52c..b55e90c0d2 100644
>>> --- a/hw/riscv/k230.c
>>> +++ b/hw/riscv/k230.c
>>> @@ -110,6 +110,7 @@ static void k230_soc_init(Object *obj)
>>>        object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
>>>        object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
>>>        object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
>>> +    object_initialize_child(obj, "k230-rmu",  &s->rmu,    TYPE_K230_RMU);
>>>        qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
>>>        qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
>>> @@ -206,6 +207,12 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>>>        sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[1]), 0,
>>>                           qdev_get_gpio_in(DEVICE(s->c908_plic), K230_WDT1_IRQ));
>>> +    /* RMU (reset management unit) */
>>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rmu), errp)) {
>>> +        return;
>>> +    }
>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rmu), 0, memmap[K230_DEV_RMU].base);
>>> +
>>>        /* unimplemented devices */
>>>        create_unimplemented_device("kpu.l2-cache",
>>>                                    memmap[K230_DEV_KPU_L2_CACHE].base,
>>> @@ -268,9 +275,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>>>        create_unimplemented_device("cmu", memmap[K230_DEV_CMU].base,
>>>                                    memmap[K230_DEV_CMU].size);
>>> -    create_unimplemented_device("rmu", memmap[K230_DEV_RMU].base,
>>> -                                memmap[K230_DEV_RMU].size);
>>> -
>>>        create_unimplemented_device("boot", memmap[K230_DEV_BOOT].base,
>>>                                    memmap[K230_DEV_BOOT].size);
>>> diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
>>> index 592e1c26bf..13f2a1ab0b 100644
>>> --- a/include/hw/riscv/k230.h
>>> +++ b/include/hw/riscv/k230.h
>>> @@ -18,6 +18,7 @@
>>>    #include "hw/core/boards.h"
>>>    #include "hw/riscv/riscv_hart.h"
>>>    #include "hw/watchdog/k230_wdt.h"
>>> +#include "hw/misc/k230_rmu.h"
>>>    #define C908_CPU_HARTID   (0)
>>> @@ -33,6 +34,7 @@ typedef struct K230SoCState {
>>>        RISCVHartArrayState c908_cpu; /* Small core */
>>>        K230WdtState wdt[2];
>>> +    K230RmuState rmu;
>>>        MemoryRegion sram;
>>>        MemoryRegion bootrom;
>>


