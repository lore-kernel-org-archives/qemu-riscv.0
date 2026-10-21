Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA7606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GX6oXlDW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dBAygf03
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJe7S-0000A4-PU; Wed, 21 Oct 2026 17:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJe7R-000097-2x
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 17:45:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJe7O-0004JQ-Do
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 17:45:08 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKe36u2748281
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EIoM+lCW4z2L0CXpt4kinjXL059khLznWAiIehGqN9o=; b=GX6oXlDWTLhvm3MY
 Nk8M9DTtKSUNnFxaWa8/vXMoSnLGN0h8tUMGD6fwB30qKvBvmHNzLaAUgrpeZvNR
 DY6HrHtWQeIh3iqMIRkUYzgi9ljcuWVUWcKnl6y8b1ApnGw8vEa9bhb8UC1yAQSj
 EZjr3KL7a1CUq5gZo7z0lIHKHcE4wH3bg5Yw9I5Qn1LBqPRD9Orcb/WGSOf3H39w
 uvrhLA8CgIE/Ev1SmZwm87F63Ked9vE5RjynL5uvXRGE/FyF9hl25FpbRIK8CduG
 1B4NivN37OqZ4yQPwTgGaiugGijhz7SPBFMaf89x28pTI0y6MCbazqSTnlErpAd+
 xLj6YQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke196p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:45:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-536778a8137so23692101cf.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 14:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792619103; x=1793223903; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EIoM+lCW4z2L0CXpt4kinjXL059khLznWAiIehGqN9o=;
 b=dBAygf03rzgtA8OqY5+MQb1p/r0SPZQfgEGw0B1VW+mqPSLpV6FAqhjrRj9yBpkJpu
 TxozdiuNvKnkwtA7g/AFa9OZJ7rPG9mRZa/8j3jTOuZ0t7PcWcrkGbTgAZxXHs/FmS+q
 LLGP3ZqA90ApP77Q8YjwuZNt3IhLkl1ZLuoQw36cSqWLFQzdompcHfoS1ul07tACdh6e
 WnHdD4Dwlegv8cvxUH+kSRnWI9qHelII+O1WqaX/jhhhFjfTMaOirKHQgwxUjOKSQf8X
 l2PBkYNUUlX7rTCld199aEVSQUkGdPcblnlQNrhuzXpaARoLr0+xdjtDdfszOJpDL3pG
 RQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792619103; x=1793223903;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EIoM+lCW4z2L0CXpt4kinjXL059khLznWAiIehGqN9o=;
 b=TFyAMHXY2IC6p2zDpMVBk7Lr6VE/MiBXgx1oFnzH9EBOaMN7xxPI1+CdqIb84SIgPy
 GONsA4N7044MzYNicZS/64sMUZQSJ0gr0sgx49ZqlV8bRRR1Jw+sXZ7uLn0Ne1wYg1sx
 OG9n3q/9NabS/HfXg7tl+0KMgG4Ydr+VYAsGQx610Pb/REKFK+YNjtDjqOF/oWYBkdpu
 9JV0eAjyV4YvUMuL2bIBi33oZdKja6c4z7+7zKRqkMWvKFyHncrjjBrkhOXfULanv8Df
 i4FmtraGKQ1JRn2B2Zg3P8AAkXoRjubLBPs7vj3ZHU55ESTNPaYUXSwnvJzygOQUOZSg
 Q+gQ==
X-Gm-Message-State: AFq9FYJVU7RDmigBkF7tqcZjbSf5Ln62V31VCx3Jg7OH8E7nVlttkU9u
 2lhawnKdTpOREJ1gUejdUk408X2QmkaPbvhIzosMtJn7i2k2l8YoBo6ozrX6l3pmP0cQLjmWUNF
 wnzwyMvvMIqjAaO3q2lL6KunESoPQhdCpLgip27qknA45OuD02XKrcOiQ0Q==
X-Gm-Gg: AYBFou0YotK/SpUgUXVUuuZGe/aYyIBhZ7U+vYJ8+j0wy17wBskp9BsetaQVv0NAtAi
 +6AzT67hXxSf8NWadbMxpjIUoxYOgjq3PGqK/r+2O7QaV52E1vIk6nSEBxV0a5EWMNFoPDZdEIG
 jyb7WZcCPC9HgDGh1j7qASKTedtB7b1l1suwlzG7riQuirXMTLX+g6WdyYL8p9iwBjS08zTxQbi
 xaqDSMdGa4X+Tj4dKNz7ck0iV4VfLYElyXcNtW7sMxITV6T3MCejV9TXNPwriAV2FW8F+W4vYpf
 rlSuJmMUAnqVqcr6+ZG77xr+IC9zjkgVOpOUqASAoURRy4n2aFW71Om4Vf9IJrtgWuZQ9fmDlG4
 EyptJQeoeh+FEBF9NBJZIs3KJGRD78AXwbX9/JRMgTcoUeeyDkJksumFz46A40RnokL03PeOt
X-Received: by 2002:ac8:5f0f:0:b0:536:72b4:b84c with SMTP id
 d75a77b69052e-5369b7d6695mr49542171cf.27.1792619102641; 
 Wed, 21 Oct 2026 14:45:02 -0700 (PDT)
X-Received: by 2002:ac8:5f0f:0:b0:536:72b4:b84c with SMTP id
 d75a77b69052e-5369b7d6695mr49541811cf.27.1792619101921; 
 Wed, 21 Oct 2026 14:45:01 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab729156sm10011841cf.14.2026.10.21.14.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 14:45:01 -0700 (PDT)
Message-ID: <11ea19d9-944a-41c6-a764-a63f920d093a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 18:44:58 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT]Re: [PATCH v2 4/4] hw/riscv: share the PLIC interrupt cells
 between boards
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Ralf Ramsauer <ralf@vmexit.de>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Bin Meng <bmeng.cn@gmail.com>,
 Lukas Landgraf <lukas.landgraf@st.oth-regensburg.de>
References: <20261021110838.3097959-1-ralf@vmexit.de>
 <20261021110838.3097959-5-ralf@vmexit.de>
 <2949aabb-200f-44bd-9b9d-4d0ceaaf77e4@oss.qualcomm.com>
 <76e826d2-7345-4434-8fb4-c529ca9a8031@oth-regensburg.de>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <76e826d2-7345-4434-8fb4-c529ca9a8031@oth-regensburg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fgMoE3p5tIG0YGkzeLrPi4fhKBva8TKR
X-Proofpoint-ORIG-GUID: fgMoE3p5tIG0YGkzeLrPi4fhKBva8TKR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4NiBTYWx0ZWRfX7seTFADXA+MT
 d10OJMdXmX+BBe+1E2BCz5ye2sqsi2cuw4sQYZd3FFolrx+Rr9aFAoYX+VLmZbvNmCRKDXdbNL+
 xj2MZfidUTACH3Sxej8wgMhcw/FTuU8=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad9325f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=60qsV3r3EIY7WK28VR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4NiBTYWx0ZWRfXx4SPblRzgeza
 JkvCtfVHL/9H8vzjyH3uued6SRdlvdhV3CqCxeEuXKLIndDtzF8VF2/f/8VwHAGC1qha9vlowDV
 5xEfMdrjHp+Z3Dw1oWg+zLNX4xa8T68vNOLD3SMHfjkwQOeUNcdIrmSPAS+OSofPY0KUw796+u9
 olNs3BsE7LYcZUiDgFN7dJhaJ7PkZE7xDBWYeBXUEaOZMvXliRYpUPJdUoTAmN1y/7ifhcrbBUG
 sN1kFLPTshbViqRLa10WddG6Gjqg3LMcdT+6byK0znS6O0I2KTBZt4Agpu9pblglV2xpZ3dWEA9
 q+B8ogZOk5HBGKUbSsv9e1oB15NXr4VMI/p4ZBKfRRUOjjQJ2GwHCLlfZn36zo7V/exRb4EZmy0
 StwwDdrWAIRMEd2NA7UmdnTZM/yBEp4jGwDeAQ5MaZzhms4NCojLVQGifZpvsNQkW1HPSFosAEb
 NylGGkm631XzMimj/CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210086
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/2026 5:29 PM, Ralf Ramsauer wrote:
> On 10/21/26 20:50, Daniel Henrique Barboza wrote:
>>
>>
>> On 10/21/2026 8:08 AM, Ralf Ramsauer wrote:
>>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>
>>> virt and sifive_u now describe a hart's PLIC contexts with the same rule:
>>> a machine context unless the hart runs under KVM, where there is no
>>> M-mode, and a supervisor context if the hart has supervisor mode.
>>> Writing that rule down twice is what let the virt device tree drift away
>>> from riscv_plic_hart_config_string().
>>>
>>> This makes the sifive_u device tree ask whether KVM is in use, which it
>>> did not do before.  Its PLIC device already does, so the two now agree.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>> Cleanup, not a fix.  Can be dropped, the rest does not depend on it.
>>>
>>>    hw/riscv/fdt-common.c         | 20 ++++++++++++++++++++
>>>    hw/riscv/sifive_u.c           | 10 ++--------
>>>    hw/riscv/virt.c               | 12 +++---------
>>>    include/hw/riscv/fdt-common.h |  3 +++
>>>    4 files changed, 28 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
>>> index ce2dcb43b4..70f96734b4 100644
>>> --- a/hw/riscv/fdt-common.c
>>> +++ b/hw/riscv/fdt-common.c
>>> @@ -10,6 +10,7 @@
>>>    #include "qemu/error-report.h"
>>>    #include "system/device_tree.h"
>>> +#include "system/kvm.h"
>>>    #include "hw/core/boards.h"
>>>    #include "hw/core/sysbus-fdt.h"
>>>    #include "hw/riscv/fdt-common.h"
>>> @@ -212,6 +213,25 @@ riscv_create_fdt_socket_cpu_sifive(void *fdt,
>>> char *clust_name,
>>>                                       phandle, intc_phandles, false,
>>> false);
>>>    }
>>> +uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
>>> +                                   uint32_t intc_phandle)
>>> +{
>>> +    uint32_t len = 0;
>>> +
>>> +    /* harts running under KVM have no M-mode */
>>> +    if (!kvm_enabled()) {
>>
>> In this file we're trying to keep it as bland as possible w.r.t
>> accelerator logic.
>> The idea is that the boards will do accelerator considerations and just
>> point
>> the fdt functions what to write in the fdt.  This will make it less
>> annoying to deal
>> with accel differences across multiple files ... ideally.
>>
>> For example in virt.c we have:
>>
>>       riscv_fdt_create_cpu_socket_subnode(ms->fdt,
>>           kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc-
>>   >harts[0]) :
>>                           RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
>>
>> The above calls this fdt helper:
>>
>> void riscv_fdt_create_cpu_socket_subnode(void *fdt,
>>                                            uint64_t timebase_frequency)
>>
>> I.e. the fdt helper only cares about timebase_frequency to blindly put
>> it in the
>> fdt.  It doesn't care if it's kvm or not.
>>
>> So for this helper I suggest something like:
>>
>> uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
>>                                      uint32_t intc_phandle, bool has_m_mode)
>>
>> {
>>       uint32_t len = 0;
>>
>>       if (has_m_mode) {
>>           ...
>>       }
>>       ...
>> }
>>
>> And then virt.c and sifive_u.c makes accellerator considerations if needed.
>> E.g.:
>>
>>
>> riscv_plic_hart_fdt_cells(&cells[cells_length], hart,
>>                             intc_phandles[cpu], !kvm_enabled());
> 
> Understand, makes sense and that's no big deal. Will send a v3-fix for
> just this one, to not annoy again with a full series, unless there's
> anything bigger left.

In fact it's preferrable if you could re-send everything as v3 adding my
r-bs in patches 1-3 and updating patch 4.  It's easier for the maintainer to
pick up the patches later.


Thanks,
Daniel

> 
> Thanks,
>     Ralf
> 
>>
>>
>> Thanks,
>> Daniel
>>
>>> +        cells[len++] = cpu_to_be32(intc_phandle);
>>> +        cells[len++] = cpu_to_be32(IRQ_M_EXT);
>>> +    }
>>> +
>>> +    if (riscv_cpu_has_supervisor_mode(hart)) {
>>> +        cells[len++] = cpu_to_be32(intc_phandle);
>>> +        cells[len++] = cpu_to_be32(IRQ_S_EXT);
>>> +    }
>>> +
>>> +    return len;
>>> +}
>>> +
>>>    void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>>>                               uint32_t plic_phandle, uint32_t int_cells,
>>>                               uint32_t addr_cells, uint32_t *plic_cells,
>>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>>> index 8f50c67a14..456b6da3e6 100644
>>> --- a/hw/riscv/sifive_u.c
>>> +++ b/hw/riscv/sifive_u.c
>>> @@ -201,14 +201,8 @@ static void create_fdt(SiFiveUState *s, const
>>> MemMapEntry *memmap,
>>>        for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>>>            /* cpu 0 is the management hart that does not have S-mode */
>>>            hart = cpu ? &s->soc.u_cpus.harts[cpu - 1] : &s-
>>>> soc.e_cpus.harts[0];
>>> -
>>> -        cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
>>> -        cells[cells_length++] = cpu_to_be32(IRQ_M_EXT);
>>> -
>>> -        if (riscv_cpu_has_supervisor_mode(hart)) {
>>> -            cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
>>> -            cells[cells_length++] = cpu_to_be32(IRQ_S_EXT);
>>> -        }
>>> +        cells_length +=
>>> riscv_plic_hart_fdt_cells(&cells[cells_length], hart,
>>> +                                                  intc_phandles[cpu]);
>>>        }
>>>        riscv_create_fdt_plic(fdt, memmap[SIFIVE_U_DEV_PLIC].base,
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index a2851b506d..a325891dca 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -161,15 +161,9 @@ static void create_fdt_socket_plic(RISCVVirtState
>>> *s,
>>>        cells_length = 0;
>>>        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
>>> -        if (!kvm_enabled()) {
>>> -            plic_cells[cells_length++] =
>>> cpu_to_be32(intc_phandles[cpu]);
>>> -            plic_cells[cells_length++] = cpu_to_be32(IRQ_M_EXT);
>>> -        }
>>> -
>>> -        if (riscv_cpu_has_supervisor_mode(&s->soc[socket].harts[cpu])) {
>>> -            plic_cells[cells_length++] =
>>> cpu_to_be32(intc_phandles[cpu]);
>>> -            plic_cells[cells_length++] = cpu_to_be32(IRQ_S_EXT);
>>> -        }
>>> +        cells_length +=
>>> riscv_plic_hart_fdt_cells(&plic_cells[cells_length],
>>> +                                                  &s-
>>>> soc[socket].harts[cpu],
>>> +                                                  intc_phandles[cpu]);
>>>        }
>>>        plic_phandles[socket] = (*phandle)++;
>>> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-
>>> common.h
>>> index eb9db8278d..14116a95cf 100644
>>> --- a/include/hw/riscv/fdt-common.h
>>> +++ b/include/hw/riscv/fdt-common.h
>>> @@ -93,6 +93,9 @@ void riscv_create_fdt_socket_cpu_sifive(void *fdt,
>>> char *clust_name,
>>>                                            int socket_hartid_base,
>>>                                            uint32_t *phandle,
>>>                                            uint32_t *intc_phandles);
>>> +/* Describe one hart's PLIC contexts, returns the number of cells
>>> written */
>>> +uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
>>> +                                   uint32_t intc_phandle);
>>>    void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>>>                               uint32_t plic_phandle, uint32_t int_cells,
>>>                               uint32_t addr_cells, uint32_t *plic_cells,
>>
> 


