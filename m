Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D20C44500
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 13:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfeEs-00089a-Ov; Fri, 03 Jul 2026 09:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfeEV-00088J-Ez
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 09:47:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfeET-0004bG-Dc
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 09:47:06 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663BPj3m3108955
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 13:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vsRSNqARpRkb7JvKOYiFGrmveTVefTAeqjsyKSKiOHI=; b=FnIk+9UXcXAADLYb
 G0GKg1dBAMmEMaalueW7QHfVy/GOehB7lhGMrmyg9BZ8y9zLXu14MAkDHReq2myo
 KjthO55GnnCZXaBk/sgqqYN1L97+xD+N+nzsOskh9vVLac281n4NXPle45Foibdh
 /1gUdclfT9/QrFbmrEfSg8TviDPzhHCiCz4/Z5svD3Xs9HyFtkOGalP/ZONoEB0w
 mi9NGXV7lUNwohziZNkc9QeQpBMR7xxhmP2RKu7X/07E0yZV7BzTOyq7ZQNU4m1R
 WhEohYWdPcuGjKST/Os8d2oJepPZhsYqOpCrtyfRea0Xprye/ibRs/ZgEFO+y6K3
 8GXrXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybahv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 13:47:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bf321d786so6948421cf.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783086423; x=1783691223; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vsRSNqARpRkb7JvKOYiFGrmveTVefTAeqjsyKSKiOHI=;
 b=CKm/tD/9kppJe9h4ECF/dlqFFS7WFPlBNQ4Fc5zZVz3LpZg+Tw5uWBcM25yuKX8HV2
 eiIRqDE0h+P//hheM/kiL4iPYAs6x+JtFW9JPZHhbuoZ8SSiCs+tE/18nOLP7h2dC+9i
 SQ1TDAYcVGMrDz0s843YftvffBg/7fBVTb7UJPHO9wmXAGeFYo2wSOE5kzYQ4+7HF07H
 1g+wHU+J3tPZ8zXsT7pgKgcP5vWfM5Fdw74Z5+/A7eW6cjukm3/cDAdxuVOiu4rMq4S2
 pf21nghplKQOpqn653r+snVqiuImrNXeJtBz/Nu/61sAt0QY6FXWxV9mO0N5/QlW3yS/
 JHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783086423; x=1783691223;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vsRSNqARpRkb7JvKOYiFGrmveTVefTAeqjsyKSKiOHI=;
 b=qGLsVyubZFiJJnBdclp9QPVQWAKIcCFTnmg/h+4AGHJpNsYzFMrmdjHPpv1yisFsQF
 dG3XZ8yHymZvKIoqOpYMcSQOM98pgM+Hq7UqH2Fr/ZxxTxMWNh6+VlRdTfjhQbHVxXxK
 o3Gu20l3zpKfaa7BXlcwR2J/sJqJRKHRmvtJxuEn7kdCGgvcrg13cE6WpMJhnyp16BSe
 e4mmr9t9ceVoQL6PsPZUGs38EEhkX3zpXz2cL57LPU3u3lpWT9WKfbGgUJKhtPEhAPc0
 VSdsUIEt3qWbAPJkacHXxRw/K18360fAmrYeTYQuRTKMPqL4399Owb8KVrhoFSDsvtsA
 6byw==
X-Gm-Message-State: AOJu0Yzy9gN1NpFMdxw5wbiqLwKms9cE+F4523MHHIOTb4wFEYuR8paT
 CSgv5CBjMan5oZqSzSRBBJ5XP8q1n5aOragUcg2fWbln0LSN9bCsBaiAfiQi+joQBC9xu2eGM9f
 mpZgJFJ/ZBiOnm0HzsvRs6EsmvfLT+g41IZJgbOoIx1kT74xq/7wXfw71gw==
X-Gm-Gg: AfdE7ckk7Kih7yxezqTHkrQpS8nJaPx3chhRAN6uEEES2Mr25P9V5dRhzUi4c5RXKUc
 V/ejaRpcPQfvsMWrdhowikfj3niY8r2EEk09IpnUWVKR7jyFijjkv2jPMx2MD33goMbKxWSaApL
 V/f9O03ITsRWtLGhSg5K8Rr/oYAiPJcanuj5/XpTPVb/8rBh1znOJGmxPGdBbtsjQwzHFkVC79X
 1b96WbBnrXyi3IlW0JUwWBpzS/W+PIA6e3ngnkkDSPf0+Z2Vplxndqne1n/7jhIbBTHk3Lv3QLv
 1JXOVDRAjSKs0qXZPiLja2UnpaH8C2+AFepK8l5FgF4avUEQEOePmP7CKnMzS70RChyOFLLyjHX
 MBaCaHN/PfEzLN770rUo8htLn8rllbJdw/MjeZdBUoimt
X-Received: by 2002:a05:622a:1e0a:b0:517:c38c:74b2 with SMTP id
 d75a77b69052e-51c2aee7f9dmr122273741cf.54.1783086422917; 
 Fri, 03 Jul 2026 06:47:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0a:b0:517:c38c:74b2 with SMTP id
 d75a77b69052e-51c2aee7f9dmr122273111cf.54.1783086422374; 
 Fri, 03 Jul 2026 06:47:02 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c4190e9e0sm15990081cf.0.2026.07.03.06.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 06:47:01 -0700 (PDT)
Message-ID: <10315dfc-37f1-40fb-bbf5-b2c5f460c956@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:46:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-4-daniel.barboza@oss.qualcomm.com>
 <18ce4e8c-bb35-49c2-abee-9145a33d95ec@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <18ce4e8c-bb35-49c2-abee-9145a33d95ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX5zbSVZFLbuu6
 LNi6qV53lyPqyayaINA2lvE4Wf27fSQsxSS7GiP+BpfkvtslyKOyczQJUvpIcXun2mj0u4LbsOJ
 bSgagJLX82NcyNBoy1MKTiZjF1U5DuxX6pmJTiZsqtbATysMI2CyVgJjaarOWV32ITg0yyCwrlK
 z61hxfGzPIQyF8yCKthEKkm68Sia5LAq4ow+dXArMls//sWvx1asB1VBQ6l4RB/PejBpUjAx1Ht
 4/Ocnwo54tyxZmd2/X4QuWVQBCREQnbCNtC2ZL7cFMKVbzsyyQEEry7XODbjqleAUOXRGT/eX6Y
 Nnu6yfPizSUqfQabeMM2mVJXdddb0IXUtdHVh6JMJ2fLVM4GaAU2xDUPDWOOY59rIdCn52/mfKX
 giwABY3lolGa0syHIZ854lsk4/5eihp7ypPS6u6++u7L0FwysDD3SsmYmWYfTl4OMmpw48jyws1
 elfyQ8IF0Wlg6SqoMVA==
X-Proofpoint-GUID: s0Om2Nu_DGXBBCv69rkitAon_u-4hmtS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX4B8kYyDWaRyo
 FLsyft0B0Ej1Xt7B7eNVaID0opvMspKy+Hc4dUtO1Nc88WJL0f3nn90Wf/3hezuqA4BZYk70I6M
 Il5X+YZSa/YaJfeIw/6xwZuNHIbKcsc=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47bd57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=rs0RgS9yrw13dJXldI0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: s0Om2Nu_DGXBBCv69rkitAon_u-4hmtS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/3/2026 7:58 AM, Philippe Mathieu-Daudé wrote:
> On 2/7/26 15:51, Daniel Henrique Barboza wrote:
>> The PMP emulation isn't present in the KVM driver.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
>> ---
>>   target/riscv/machine.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index ba96ceceef..e1cbcaa349 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -20,6 +20,7 @@
>>   #include "cpu.h"
>>   #include "qemu/error-report.h"
>>   #include "system/kvm.h"
>> +#include "system/tcg.h"
>>   #include "migration/cpu.h"
>>   #include "exec/icount.h"
>>   #include "target/riscv/debug.h"
>> @@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
>>   {
>>       RISCVCPU *cpu = opaque;
>> -    return cpu->cfg.pmp;
>> +    if (kvm_enabled()) {
>> +        return false;
>> +    }
>> +
>> +    return tcg_enabled() && cpu->cfg.pmp;
>>   }
>>   static int pmp_post_load(void *opaque, int version_id)
>> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int version_id)
>>       int i;
>>       uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
> 
> Maybe we can use:
> 
>    if (!pmp_needed(opaque)) {
>        return 0;
>    }

Hmmmm I thought that pmp_post_load() already infers pmp_needed() == true.
In migration/main.rst we have:

---
The 'pre_load' and 'post_load' functions on subsections are only
called if the subsection is loaded.
---

Hence we'll only execute the post_load() cb for a section/subsection if
the section was transferred, and that is determined by the .needed cb.
In this particular case we'll only reach pmp_post_load() if
pmp_needed() is already true.


Or am I wrong?  It has been awhile since I last read migration code and
I'm not finding docs w.r.t how .needed and .pre/post_load interact
with each other.



> 
>> -    for (i = 0; i < pmp_regions; i++) {
>> -        pmp_update_rule_addr(env, i);
>> +    if (tcg_enabled()) {
> 
> or use it here; also restrict pmp_regions variable scope?

Just moved pmp_regions.  Thanks,

Daniel

> 
> Anyhow:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
>> +        for (i = 0; i < pmp_regions; i++) {
>> +            pmp_update_rule_addr(env, i);
>> +        }
>> +        pmp_update_rule_nums(env);
>>       }
>> -    pmp_update_rule_nums(env);
>>       return 0;
>>   }
> 
> Since you are working in multi-accelerators frontier, keep in
> mind in the future we might have some targets migrating between
> different accelerators 🤯 :)


