Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C37EC61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 17:37:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wze1s-0003ra-ML; Thu, 27 Aug 2026 13:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wze1o-0003r2-Rv
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 13:36:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wze1m-0001Wo-Hp
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 13:36:40 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RHXbQL541062
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 17:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +LarHlMc9PCIKNLJFQnBBhZzlXc9dN6xoGhL9dn0kD8=; b=jF8FMlytCHB5vg44
 +xMVs9iHdTdwAKx7YdY+v2zVCcav0vm7/oIUWM5exqE5Ylcn3pyliFvn06Ak2EB0
 1UdLEe1jjT8sZ7vocxgqdkheADQ5KoezQgZQ6CO0s4vOhUYJhXFavQEoPU2RFkJ8
 aCF1yE184OafOYR3VXWmR41K7Eb4y9jHNIuPStuWvEo1C3GRkiXXEambLbKiddDh
 SP3uoClc5NRn4ILs6Kq9EIxZXu4gfEVm47JFiFM2tebdb5ToYDanOT8BTWwOJz+O
 sYdzPc0THFajCzpy+lsRUhU+DxnwlID1kEt0TS+qyeG9gJ/LhZj6SJpPenONx5ZA
 ztF7fA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee0cdf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 17:36:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90cd2cadc62so1897176d6.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787852195; x=1788456995; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+LarHlMc9PCIKNLJFQnBBhZzlXc9dN6xoGhL9dn0kD8=;
 b=W2VfmvvFLkQmMS2FTIxHN+MVT4+zOSEHz4rJOis7tVUJbq4YjVCUN2m7ai2Y9NLjJa
 +02yqAo/YHxEuD2u2hRoYWC5xO/j0eZgjmp+TteA11lGeZe70iDKbIxgjI+woVyYaXG/
 ncgo/scyC6BO08iVP0Bpebo5G6+HSC/ocEGSQmPCuMMhRTPe2c6ODQNaGm4h18+vAMyn
 nDXOXVNuloLQgpZW6uUujBDGa0or7WURcusl+CSy1xrYdii9vWufBUGDGjtAweZhkjJe
 uXxCn7gxJ8ZTOCxZ5zSu7EBVup4nYl9+LpLLoUuixST4EF8ENaM+iv7fzzYboObO9mZc
 i81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787852195; x=1788456995;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+LarHlMc9PCIKNLJFQnBBhZzlXc9dN6xoGhL9dn0kD8=;
 b=gvQ9vo1Lxx/scQYq6QXjdLgw3p5kDouY5JFavUgaxcej4AX1UMXGVA3dOOlBqcArXp
 radm8I0nkpvs968t7qnW0/67idzQzcmRr0mWldi9nsYOYy9gr2rN/Pa/bOq3Ro+fabf+
 dkhsmbJDRfETa1ozLa1pu7Z72R7Ku3N7/1TwLslo/snMygC/fl3Z+CM4OEED0zRpfURT
 kqgfv/GyXnjy7N23bClLOpmvmPmMLZTLjGy5bwcidEzOYsFRArgQf5tF5r927erJdb7m
 nlruQCCG2VIXRA3mBr18GrB883CV/zOzDPS4fmNJuiUeYr/H5a8MuUbRxZbCqphlX0ic
 I1Kw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLxNFhmx9JiebBHd+G1psedS6zmyPrLkHDQo2C8epnqjcl88ELDbErIfl+iqzdj9QfaLXbHXDwFsCF@nongnu.org
X-Gm-Message-State: AFuF++mMCTz0K62PaUgOodv9sqnxgo2FJN0LuQtOc8JhFHgB9FARMnpa
 +zSVa01HBFcdj2BILfYbtc3PomuLNSw/C1YZMgoloIKdqnJ7VszudXyXbZzu7BL4zoREa042AoE
 pfgJQB/O/4+m1pBUmBPx5JYL3qOxLKS7Aa/UvZBavZVc3lrHPOzLV/YQbIQ==
X-Gm-Gg: AR+sD13C6SAV4EWWkIEOqqDtsdbmsz74A0j++KGpvBfMN0lMoi5TsTEcRGIDyq2601R
 lxW4MgPgitkGzouCLI77Rsg8lwaiZxG2kxVc7/EepvP6RhOxwvd6BVFlXlYJQNg51AGPaBooEpO
 8qvF45QAxz/gI9Y8qn5g7Mi/pZyS/8pnQ9N7DUmFl9uA5qfi/Yo91sXVfIRADHw0AUCdtzvS/EF
 rx+43HxbPV4++6GqWYbKohV+6YdVXmn+foDZbwHj6mUjOmfUv7Jvf0CuNrzN8BfIQdJti0qSBh7
 oMs1dDVPquuKPHWvRpEcazPSHneO8kT2eEFSU48Y1MTG6XVeCw2q1bXXWjO2wl3bVNn3lVhlMr/
 b7fQFbpBSLiIOVeLTfP0V3NTmFzx34MrK/LVZ
X-Received: by 2002:a05:620a:2682:b0:937:1538:6b93 with SMTP id
 af79cd13be357-9391395b42fmr28315485a.40.1787852194978; 
 Thu, 27 Aug 2026 10:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:937:1538:6b93 with SMTP id
 af79cd13be357-9391395b42fmr28307885a.40.1787852194219; 
 Thu, 27 Aug 2026 10:36:34 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd741536csm21522816d6.43.2026.08.27.10.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 10:36:33 -0700 (PDT)
Message-ID: <90e61b69-ac96-4021-b59f-291123ed3454@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 14:36:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] hw/riscv/fdt-common, virt.c: add
 riscv_create_fdt_riscv_iommu_sys()
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-5-daniel.barboza@oss.qualcomm.com>
 <CACPK8Xfizz2EBxq+iyTCRxUCEek-vXaMeCuN1nJACVeSky_g-g@mail.gmail.com>
 <36d95fcc-bd0b-49b5-a6cb-017ab83ef906@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <36d95fcc-bd0b-49b5-a6cb-017ab83ef906@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0OSBTYWx0ZWRfXw6AMr76xGRGo
 /KVaxFdKNb9MWUPcHxgHghsKz2lj6uTe6SxQJEH46ZEzYimecCwX0Q6Inym+JusZbD551ovLhJb
 RTWbQdo+lGvX0vWnYGCwEDqQAmU0BwAIISY8sGneWpDOqxhztEWWh+K3TLKBBpq4YGI6PC7iqEw
 1rXYMNIfc2B6egKDfJInciO+Za1iiv5m1FWcGu7Lkpjq+2t0vX5RBUfTgT6aR1szybUnIsr1R1A
 ouu3knv/9n5UiQutQszL4a17pTVZFjLHU1BSMPIV/ys123hkqNseie9XfgXnwXWG5OlPUix6sA2
 +iZ0PSM/egG1mDRLUGw+Rp7uKgIC+HkvpGp65uphwsM5S707SLgeZXQulZUYR0UXQg3R++ervYZ
 /i2fUTqyOcCqbi0F/utAcN8LmY4GxaACBEGBUjoG2WB18cuVZlCFoeNzWlI6upducfxEhakq+Mw
 /X8Hr6Pj/BSI6uS9DSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0OSBTYWx0ZWRfX5voSGo65+JzQ
 aa9ox28/iPROfvAcmpYsU3YJygXFqL3b0vsdbgEt3PaB3EqDt0Z+acqw3Yujs2CRvjfC95SQpen
 0rV71I1MRS3TtoPXZByOfbdzHlS/Sso=
X-Proofpoint-ORIG-GUID: l3_jBUtbTVT_naOE-2rLbw753w6SBLo8
X-Proofpoint-GUID: l3_jBUtbTVT_naOE-2rLbw753w6SBLo8
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a9075a4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=B3qmolBlM6JKNJlBsRgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270149
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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


On 8/27/2026 10:46 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 8/27/2026 2:55 AM, Joel Stanley wrote:
>> On Thu, 27 Aug 2026 at 07:16, Daniel Henrique Barboza
>> <daniel.barboza@oss.qualcomm.com> wrote:
>>>   void *riscv_create_board_device_tree(const char *model, const char *compatible,
>>>                                        int *fdt_size)
>>> @@ -348,3 +350,41 @@ void riscv_create_fdt_syscon(void *fdt, uint32_t *phandle,
>>>       qemu_fdt_setprop_cell(fdt, name, "value", poweroff);
>>>       g_free(name);
>>>   }
>>> +
>>> +void riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
>>> +                                      uint32_t irq_chip,
>>> +                                      uint32_t msi_phandle,
>>> +                                      uint32_t *iommu_sys_phandle,
>>> +                                      uint32_t iommu_sys_irq)
>>> +{
>>> +    const char comp[] = "riscv,iommu";
>>> +    uint32_t iommu_phandle;
>>> +    g_autofree char *iommu_node = NULL;
>>> +    uint32_t iommu_irq_map[RISCV_IOMMU_INTR_COUNT] = {
>>> +        iommu_sys_irq + RISCV_IOMMU_INTR_CQ,
>>> +        iommu_sys_irq + RISCV_IOMMU_INTR_FQ,
>>> +        iommu_sys_irq + RISCV_IOMMU_INTR_PM,
>>> +        iommu_sys_irq + RISCV_IOMMU_INTR_PQ,
>>> +    };
>>
>> Any reason to pack them into an array? Seems like they could be part
>> of the qemu_fdt_setprop_cells call:
>>
>> qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
>>          iommu_sys_irq + RISCV_IOMMU_INTR_CQ, FDT_IRQ_TYPE_EDGE_LOW,
>>          iommu_sys_irq + RISCV_IOMMU_INTR_FQ, FDT_IRQ_TYPE_EDGE_LOW,
>>          iommu_sys_irq + RISCV_IOMMU_INTR_PM, FDT_IRQ_TYPE_EDGE_LOW,
>>          iommu_sys_irq + RISCV_IOMMU_INTR_PQ, FDT_IRQ_TYPE_EDGE_LOW);
> 
> No particular reason.  I'll make the change.
> 
>>
>>> +
>>> +    iommu_node = g_strdup_printf("/soc/iommu@%"HWADDR_PRIx, addr);
>>> +    iommu_phandle = qemu_fdt_alloc_phandle(fdt);
>>
>> Ohh, that's neat. Any reason we don't use this for all of phandle
>> allocation needs?
> 
> So back in the day we were using a fdt_phandle int variable around, incrementing
> it and using as phandle for nodes. As you might notice in the boards we still have
> a similar pattern going on.
> 
> The choice I made with this particular fdt is because I didn't want to pass a
> 'phandle' argument to the function.  Given that the iommu FDT is the last DT that
> declares a new phandle I could get away with it.
> 
> Otherwise, if there are other DTs that follows it and are assigning DTs using integer
> increment, there's a risk of phandle collision.

In the end I decided to do this:


     if (next_phandle != NULL) {
         *iommu_sys_phandle = (*next_phandle)++;
     } else {
         *iommu_sys_phandle = qemu_fdt_alloc_phandle(fdt);
     }

And now the helper is able to accept a phandle allocation from the board or, in
case the board doesn't care about that, we'll use qemu_fdt_alloc_phandle().

I believe this will make it easier to switch for a strategy where we'll always use
alloc_phandle() in the future.

Cheers,
Daniel

> 
> 
>>
>> We should be consistent, so switch this one to the pattern used by the
>> rest of the file, or (preferably, IMO) switch them all over.
> 
> I agree that we should allocate phandles in an uniform manner, whatever that strategy
> is.  To use alloc_phandle() everywhere we would need to take a look at how every board
> is handling their own phandles first.  I believe this is worth doing, but out of scope
> for this mostly "move stuff around" series we have here.
> 
>>
>>> +    qemu_fdt_add_subnode(fdt, iommu_node);
>>> +
>>> +    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
>>> +    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
>>> +    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
>>> +
>>> +    qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
>>> +    qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
>>> +
>>> +    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
>>> +        iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
>>> +        iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
>>> +        iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
>>> +        iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
>>> +
>>> +    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
>>> +
>>> +    *iommu_sys_phandle = iommu_phandle;
>>
>> Could we just return it? Or have it passed in, so we don't need to return it?
> 
> 
> I guess I could not use alloc_phandle() and receive the phandle from the caller.
> It would be consistent with what we already do in other cases, and then when/if we
> decide to change everything to alloc_phandle() we'll do it in a consistent manner.
> 
> 
> I'll remove "iommu_phandle = qemu_fdt_alloc_phandle(fdt);" and make the caller provide a
> valid phandle in iommu_phandle.  Thanks,
> 
> Daniel
> 
> 
> 


