Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C865BC43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfer3-0007WH-LU; Fri, 03 Jul 2026 10:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfer1-0007RX-VC
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 10:26:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfer0-0006Xm-3T
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 10:26:55 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663BITX23108960
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 14:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Owbz78uKnwRwhavIKjpjKyFK7eTJ5vvGWDJKxRHA2hE=; b=nQ/nXdOIDESWulTz
 BSeJ7X6Xt0Uc8KHR58RvJM84nkK8uo1szeVFl09yZwc5Ok4t2ZajNmUb/M02ezz1
 PtSjKYdKgxKlh5kcy70o/EEXUDKZcOipkJtbtjhI4YyVph55mrGqmQy78LMvFWQl
 Udcqd0QEZsQ2Fip5c6Z+u4w5fs4rDAOSHme9GHe8Zofp2UJmzedqnCrZK30L9Rmf
 8ABc6wUOM96kTecqXX9CR8nbDEVfbFECnOzNIPXU17rFgvJv2sNHno0bobaIc822
 0AC+0YZ6F9q4lHluaNaQ3zOXD2CmqpqQlF5/loWYAvaFyd9cPfIhSiidaS2TfZ7D
 uvFsdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybes3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 14:26:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ec45d9628aso14175596d6.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783088811; x=1783693611; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Owbz78uKnwRwhavIKjpjKyFK7eTJ5vvGWDJKxRHA2hE=;
 b=Klj2sMJDQkcg+ofU1X3Km7IuxiQ2qRL39Gd18hv/NkzaSKlYCRtStGJYKm4aZo5zSl
 26MCphdz66IW529A1lE0v2/W+U+XJdWYK/S/09P1Gcab/7I08UOCDIqpMJPdrEtI018Z
 27VMQU5nVn24EG21PMj+MBBocx2pFTvuCl/R1TZ6JVaBKP5bWMF5+FOpZia0ToVlmBGz
 Mn5ygAi53CMXRSzQrifQpsKhpAMMT0aExLLP305N5VXgxdD78z7pmAB93A3jN6rosia0
 YBOBj6HkUcH2QTzK/JeLdvfuFbNv3WRK2wAR7lvhuxDS0T6fqCpmQdWBJqyomt/cdeoY
 Y+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783088811; x=1783693611;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Owbz78uKnwRwhavIKjpjKyFK7eTJ5vvGWDJKxRHA2hE=;
 b=CRKccAHB7Ck780dGlKKzRiXROPAjD1H9kSdlqBtEkAalieGGxeJxa6LX9fMaw/CUWq
 /NkEnKTITL77jmc3XM4xiIAzRHE3w8mxcQI97ii9vC6kVqIi8SemnnuINDDzYY3rZbJN
 dMsg1hL1Otf5+BlV/92z+syJ9SwVG+AsM0QEaO41n4ozT39iYbKDG8gnHuiI6gtIX+l2
 s5+On2pdWXmilalJMV0I4KZ5Hbjp7gZtpdw5RVbA322gqk1w1urrtkHR+L/37HB9i5Tw
 bubLgzqT6xbgDPvrPc2kVxyxCDWRjBAROziSe2FCTO5dWu0AAC32p8JD7pQlPkHeJxJv
 lE4g==
X-Gm-Message-State: AOJu0YxgIRVTpHpgdl5BILn+qwMmgtlV1p33nwoBu2c9KqYjbK+JX1UN
 1S1XfEP9E8GrNYcX8xvVpe9LSwWDJJyxsl7abnmOglpPlRYTwPr8z4uUcDg0TgFOC7285MAnVQW
 6VfXRNuqum6ETB2FugNzbyFccFK3fU7vHdznwHQ+jV3q/4XYwHwpBCYEMZg==
X-Gm-Gg: AfdE7cl5fv2MNSDi7AQT1hlC1vvK51wxFdmnJEEAfz0Cn0gPvbehndUPCuVp36oLn9/
 aP2iYXNekk2Bd19iZ5MMozudXzdh3+McHLyvw8w3EJYXfkKs3koOn2m7EScrf6Spywo+4m/yoVt
 MAlMTPWCw1o4IphdURCWfD4XIwx5fRE/EhYnkXq/VySPjYkS/cCRDeZbMLqNHKznBnnq/58rSaG
 mPHQtWBgvvd8IPpZvHSVwuQerkiUSkC17eJcWI7RDaWiubP6upQUjx6+X433Ij94OvO5+ZfYlb3
 31LnxTP3zHJkn0lclxtC49fdbm+ZX9Sf1TBdvGECZHcHaui5rPwPT4QB163QEQ2kbDgnKKQNySz
 BxoTtQDdXpuFC43SQ/iItifIBZ39ya1tx1cFx/lG7f2wN
X-Received: by 2002:a05:6214:ac5:b0:8f4:4d6:8ad7 with SMTP id
 6a1803df08f44-8f42353027dmr137440906d6.31.1783088810991; 
 Fri, 03 Jul 2026 07:26:50 -0700 (PDT)
X-Received: by 2002:a05:6214:ac5:b0:8f4:4d6:8ad7 with SMTP id
 6a1803df08f44-8f42353027dmr137440326d6.31.1783088810434; 
 Fri, 03 Jul 2026 07:26:50 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f471815818sm56866246d6.31.2026.07.03.07.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 07:26:49 -0700 (PDT)
Message-ID: <104fa6b5-fb9e-42b3-b74b-a31fc554ffc6@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:26:47 -0300
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
 <10315dfc-37f1-40fb-bbf5-b2c5f460c956@oss.qualcomm.com>
 <37525427-720b-48af-a906-8cc1062e7ed0@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <37525427-720b-48af-a906-8cc1062e7ed0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0MiBTYWx0ZWRfX0WOGYOuNY2Nd
 z8CSe6Yl9PJuV9HUMU+3tpiTY7Ubmc107qXCeSzIbrEOdvLJJLJajcmL7MXxqHyCbwbByRReqGh
 +f7ZJUzR0E/sDfDMp0z/Aa3bT8zqj65O4ZyX0RLqDOFRzPpg8pQsMz4swRK6mPx25scs8ngieHp
 nVA3yx9wv87N77c2t689AFQpjn7vqVGpADJEx29HbSmF1yWCkuD5LJXmwC8MiwzOt+ZOOGaZMM5
 fh0wOh1YSVJCYAVLdEbAidFXsUZ9pd7yi+UGYkHm5XCpc+7Ij+RAlG5oX8wUV9UhzMLVYhLrShk
 zioOwmw9kTivlP87AZeENVhgQdlC8VAR/FV8TyjWL8fQvjQmTr54LxW9WYi3HctvIajPigKPLCB
 O5+esbAHGPuKXmZ7v1EMNkRJKnQ9FNMEuTTcM492CEePhXx+MUF3IRLTerMJq7X8cyWvezUzZKv
 5uySOYs+1WyB5ERgvDA==
X-Proofpoint-GUID: ixK5clld2oq2C3IXO3L3o2EqkQ22Cyq2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0MiBTYWx0ZWRfX8BNE1jTHlNv+
 axwASw24ZSZqxIrZVibpQygg9ho0YVHm0Mc+JTMjKkJQ39XvYArx47jGzSrHtlULIlLCbYu2Uje
 KzcGs1Atb3JsuBnx7R9VeFbkwgGhjCg=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47c6ab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=i4LRvFJOLUBMW-A5C7QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: ixK5clld2oq2C3IXO3L3o2EqkQ22Cyq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030142
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



On 7/3/2026 10:58 AM, Philippe Mathieu-Daudé wrote:
> On 3/7/26 15:46, Daniel Henrique Barboza wrote:
>>
>>
>> On 7/3/2026 7:58 AM, Philippe Mathieu-Daudé wrote:
>>> On 2/7/26 15:51, Daniel Henrique Barboza wrote:
>>>> The PMP emulation isn't present in the KVM driver.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
>>>> ---
>>>>   target/riscv/machine.c | 15 +++++++++++----
>>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>>> index ba96ceceef..e1cbcaa349 100644
>>>> --- a/target/riscv/machine.c
>>>> +++ b/target/riscv/machine.c
>>>> @@ -20,6 +20,7 @@
>>>>   #include "cpu.h"
>>>>   #include "qemu/error-report.h"
>>>>   #include "system/kvm.h"
>>>> +#include "system/tcg.h"
>>>>   #include "migration/cpu.h"
>>>>   #include "exec/icount.h"
>>>>   #include "target/riscv/debug.h"
>>>> @@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
>>>>   {
>>>>       RISCVCPU *cpu = opaque;
>>>> -    return cpu->cfg.pmp;
>>>> +    if (kvm_enabled()) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return tcg_enabled() && cpu->cfg.pmp;
>>>>   }
>>>>   static int pmp_post_load(void *opaque, int version_id)
>>>> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int version_id)
>>>>       int i;
>>>>       uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
>>>
>>> Maybe we can use:
>>>
>>>    if (!pmp_needed(opaque)) {
>>>        return 0;
>>>    }
>>
>> Hmmmm I thought that pmp_post_load() already infers pmp_needed() == true.
>> In migration/main.rst we have:
>>
>> ---
>> The 'pre_load' and 'post_load' functions on subsections are only
>> called if the subsection is loaded.
>> ---
>>
>> Hence we'll only execute the post_load() cb for a section/subsection if
>> the section was transferred, and that is determined by the .needed cb.
>> In this particular case we'll only reach pmp_post_load() if
>> pmp_needed() is already true.
> 
> OK.
> 
>>
>>
>> Or am I wrong?  It has been awhile since I last read migration code and
>> I'm not finding docs w.r.t how .needed and .pre/post_load interact
>> with each other.
> 
> Maybe check 'if (cpu->cfg.pmp)' then? What confuses me is the
> 'if (tcg_enabled)' since we already checked that in needed().

That's in there because pmp_update_rule_addr() and pmp_update_rule_nums()
are TCG only and it won't build with --disable-tcg.

And now that I said it out loud maybe this would be clearer:

static int pmp_post_load(void *opaque, int version_id)
{
#ifdef CONFIG_TCG
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
     int i;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;

     for (i = 0; i < pmp_regions; i++) {
         pmp_update_rule_addr(env, i);
     }
     pmp_update_rule_nums(env);
#endif

     return 0;
}

I just checked it and it works with --disable-tcg.  Let me know
if you're ok with it and I'll change it for v4.


Cheers,
Daniel





> 
>>
>>
>>
>>>
>>>> -    for (i = 0; i < pmp_regions; i++) {
>>>> -        pmp_update_rule_addr(env, i);
>>>> +    if (tcg_enabled()) {
>>>
>>> or use it here; also restrict pmp_regions variable scope?
>>
>> Just moved pmp_regions.  Thanks,
>>
>> Daniel
>>
>>>
>>> Anyhow:
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>>>
>>>> +        for (i = 0; i < pmp_regions; i++) {
>>>> +            pmp_update_rule_addr(env, i);
>>>> +        }
>>>> +        pmp_update_rule_nums(env);
>>>>       }
>>>> -    pmp_update_rule_nums(env);
>>>>       return 0;
>>>>   }
>>>
>>> Since you are working in multi-accelerators frontier, keep in
>>> mind in the future we might have some targets migrating between
>>> different accelerators 🤯 :)
>>
> 


