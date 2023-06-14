Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A529EB64D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 09:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9MZi-0003cb-Nc; Wed, 14 Jun 2023 05:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9MZg-0003bp-Qx
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:13:56 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9MZe-0007dm-Ei
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:13:56 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-392116ae103so4086293b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Jun 2023 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686734033; x=1689326033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cYybuTeu6BuHpEsVXpzc7x3UwI3Gafb5xCG88rmIUhs=;
 b=QFhpktgSKJhZ4yjkcuEQAIQ3dEYZJ6TU7UUI//fmeT6dd3G2qJmf3vZRvyru/tLjYv
 6cmrXNzSl8QGUPRGXj8wI1lF4qOGNbTrSCjnRkqx9h2KU/YLfA1dqF+6H/5zum3vJbrs
 mgbqvYegfn5T2MxACArvVdecHHOoMKxDevJ9ZqKtlhvIkeikmr8N7OsLxSjzGiie2e5c
 EE/YgxRAWCoFvfHYib3+I1IDOYpze7Xn1WdDUwRiT9dF/1Fmam2FzDAxUvh+WhyMWkHm
 OPoIsIKOneSBmB4h1MY19eDiw1m0bhp1nYI8QOB/f4+EWrzY38JCyFOSxOcE/UCmOcey
 4H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686734033; x=1689326033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYybuTeu6BuHpEsVXpzc7x3UwI3Gafb5xCG88rmIUhs=;
 b=XypU/dvLK9lmzvaHsgwoYKn2HtyMVxj/ZlknbKKPSHx9tLv+tyQ9CO3h/9Bmp5R+9C
 L11n+aiC8M2EWjdEW/xgpIrFCi4e6cAsYU1fye3v598Ww4EhncRUnyZrHNK/cPeNCJUr
 YZiskgzMzz+nv7eeCz4l329pBIwFiYFcXH3mw4GSvFApyxPPkYEUjCEWCWnHtoIPgm6Q
 FKZtyCfUWUqRRxFf+SXAZLjaUjZhdT8rrpbJM8b+446Y9EnV8z75JUubOk/o0in7/EVi
 wNLb1wKRFJXjixWcdY0O+ktzGE21GwKuz95xTqxYHClL3ADaERSQwJTvBe12q27ZRztC
 mzHQ==
X-Gm-Message-State: AC+VfDzrniVGjcgPfdhYlVXtYuznB/sJdE+lRWiEWqJqUjb4oGqw1KuI
 BWw3Ldor97sz3ivy3UnvYJmwnQ==
X-Google-Smtp-Source: ACHHUZ65Wg/4IFG8r1W1TXXbMUgwPujuDRXLU0vwZgnIV4Gr+NIvg1vRLmfi0IY6ZGMbbLTfANHdnQ==
X-Received: by 2002:aca:220b:0:b0:39a:bcbd:d0d5 with SMTP id
 b11-20020aca220b000000b0039abcbdd0d5mr8825871oic.51.1686734033034; 
 Wed, 14 Jun 2023 02:13:53 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.210])
 by smtp.gmail.com with ESMTPSA id
 b20-20020aca2214000000b00398e4c99380sm5658730oic.12.2023.06.14.02.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:13:52 -0700 (PDT)
Message-ID: <be0fe4d5-428a-a58d-591d-136817ac98d4@ventanamicro.com>
Date: Wed, 14 Jun 2023 06:13:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/6] target/riscv: support the AIA device emulation
 with KVM enabled
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
 <20230526062509.31682-3-yongxuan.wang@sifive.com>
 <ed0a1ceb-de35-4085-9e5f-e2bf73374ebc@ventanamicro.com>
 <CAMWQL2gc4GEmEtHdhu64wYT9Smx88k6gQyLYu=cx5fBrQ0X=JA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAMWQL2gc4GEmEtHdhu64wYT9Smx88k6gQyLYu=cx5fBrQ0X=JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,

On 6/12/23 03:50, Yong-Xuan Wang wrote:
> Hi Daniel,
> 
> I think this checking can be removed too. Would you send a patch to
> fix it? Or I can remove it in this patch.

Please go ahead and fix it on this patch. Thanks,


Daniel

> 
> Regards,
> Yong-Xuan
> 
> On Tue, Jun 6, 2023 at 2:45 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 5/26/23 03:25, Yong-Xuan Wang wrote:
>>> Remove M mode AIA devices when using KVM acceleration
>>>
>>> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>>> Reviewed-by: Jim Shu <jim.shu@sifive.com>
>>> ---
>>>    hw/riscv/virt.c | 199 +++++++++++++++++++++++++-----------------------
>>>    1 file changed, 105 insertions(+), 94 deletions(-)
>>>
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index 4e3efbee16..18b94888ab 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -531,52 +531,54 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>>>        imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
>>>        imsic_regs = g_new0(uint32_t, socket_count * 4);
>>>
>>> -    /* M-level IMSIC node */
>>> -    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>>> -        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
>>> -        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
>>> -    }
>>> -    imsic_max_hart_per_socket = 0;
>>> -    for (socket = 0; socket < socket_count; socket++) {
>>> -        imsic_addr = memmap[VIRT_IMSIC_M].base +
>>> -                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>> -        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
>>> -        imsic_regs[socket * 4 + 0] = 0;
>>> -        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
>>> -        imsic_regs[socket * 4 + 2] = 0;
>>> -        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
>>> -        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
>>> -            imsic_max_hart_per_socket = s->soc[socket].num_harts;
>>> +    if (!kvm_enabled()) {
>>> +        /* M-level IMSIC node */
>>> +        for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>>> +            imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
>>> +            imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
>>>            }
>>> -    }
>>> -    imsic_name = g_strdup_printf("/soc/imsics@%lx",
>>> -        (unsigned long)memmap[VIRT_IMSIC_M].base);
>>> -    qemu_fdt_add_subnode(ms->fdt, imsic_name);
>>> -    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
>>> -        "riscv,imsics");
>>> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
>>> -        FDT_IMSIC_INT_CELLS);
>>> -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
>>> -        NULL, 0);
>>> -    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
>>> -        NULL, 0);
>>> -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
>>> -        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
>>> -    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
>>> -        socket_count * sizeof(uint32_t) * 4);
>>> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
>>> -        VIRT_IRQCHIP_NUM_MSIS);
>>> -    if (socket_count > 1) {
>>> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
>>> -            imsic_num_bits(imsic_max_hart_per_socket));
>>> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
>>> -            imsic_num_bits(socket_count));
>>> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-shift",
>>> -            IMSIC_MMIO_GROUP_MIN_SHIFT);
>>> -    }
>>> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
>>> +        imsic_max_hart_per_socket = 0;
>>> +        for (socket = 0; socket < socket_count; socket++) {
>>> +            imsic_addr = memmap[VIRT_IMSIC_M].base +
>>> +                         socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>> +            imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
>>> +            imsic_regs[socket * 4 + 0] = 0;
>>> +            imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
>>> +            imsic_regs[socket * 4 + 2] = 0;
>>> +            imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
>>> +            if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
>>> +                imsic_max_hart_per_socket = s->soc[socket].num_harts;
>>> +            }
>>> +        }
>>> +        imsic_name = g_strdup_printf("/soc/imsics@%lx",
>>> +            (unsigned long)memmap[VIRT_IMSIC_M].base);
>>> +        qemu_fdt_add_subnode(ms->fdt, imsic_name);
>>> +        qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
>>> +            "riscv,imsics");
>>> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
>>> +            FDT_IMSIC_INT_CELLS);
>>> +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
>>> +            NULL, 0);
>>> +        qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
>>> +            NULL, 0);
>>> +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
>>> +            imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
>>> +        qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
>>> +            socket_count * sizeof(uint32_t) * 4);
>>> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
>>> +            VIRT_IRQCHIP_NUM_MSIS);
>>> +        if (socket_count > 1) {
>>> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
>>> +                imsic_num_bits(imsic_max_hart_per_socket));
>>> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
>>> +                imsic_num_bits(socket_count));
>>> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name,
>>> +                "riscv,group-index-shift", IMSIC_MMIO_GROUP_MIN_SHIFT);
>>> +        }
>>> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
>>>
>>> -    g_free(imsic_name);
>>> +        g_free(imsic_name);
>>> +    }
>>>
>>>        /* S-level IMSIC node */
>>>        for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>>> @@ -653,37 +655,40 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>>>        aplic_s_phandle = (*phandle)++;
>>>        aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
>>>
>>> -    /* M-level APLIC node */
>>> -    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
>>> -        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
>>> -        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
>>> -    }
>>> -    aplic_addr = memmap[VIRT_APLIC_M].base +
>>> -                 (memmap[VIRT_APLIC_M].size * socket);
>>> -    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
>>> -    qemu_fdt_add_subnode(ms->fdt, aplic_name);
>>> -    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
>>> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
>>> -        "#interrupt-cells", FDT_APLIC_INT_CELLS);
>>> -    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
>>> -    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
>>> -        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
>>> -            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
>>> -    } else {
>>> -        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
>>> -            msi_m_phandle);
>>> +    if (!kvm_enabled()) {
>>> +        /* M-level APLIC node */
>>> +        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
>>> +            aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
>>> +            aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
>>> +        }
>>> +        aplic_addr = memmap[VIRT_APLIC_M].base +
>>> +                     (memmap[VIRT_APLIC_M].size * socket);
>>> +        aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
>>> +        qemu_fdt_add_subnode(ms->fdt, aplic_name);
>>> +        qemu_fdt_setprop_string(ms->fdt, aplic_name,
>>> +            "compatible", "riscv,aplic");
>>> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name,
>>> +            "#interrupt-cells", FDT_APLIC_INT_CELLS);
>>> +        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
>>> +        if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
>>> +            qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
>>> +                aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
>>> +        } else {
>>> +            qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
>>> +                msi_m_phandle);
>>> +        }
>>> +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
>>> +            0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
>>> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
>>> +            VIRT_IRQCHIP_NUM_SOURCES);
>>> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
>>> +            aplic_s_phandle);
>>> +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
>>> +            aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
>>> +        riscv_socket_fdt_write_id(ms, aplic_name, socket);
>>> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
>>> +        g_free(aplic_name);
>>>        }
>>> -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
>>> -        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
>>> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
>>> -        VIRT_IRQCHIP_NUM_SOURCES);
>>> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
>>> -        aplic_s_phandle);
>>> -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
>>> -        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
>>> -    riscv_socket_fdt_write_id(ms, aplic_name, socket);
>>> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
>>> -    g_free(aplic_name);
>>>
>>>        /* S-level APLIC node */
>>>        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
>>> @@ -1162,16 +1167,20 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>>>        int i;
>>>        hwaddr addr;
>>>        uint32_t guest_bits;
>>> -    DeviceState *aplic_m;
>>> +    DeviceState *aplic_s = NULL;
>>> +    DeviceState *aplic_m = NULL;
>>>        bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
>>>
>>>        if (msimode) {
>>> -        /* Per-socket M-level IMSICs */
>>> -        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>> -        for (i = 0; i < hart_count; i++) {
>>> -            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
>>> -                               base_hartid + i, true, 1,
>>> -                               VIRT_IRQCHIP_NUM_MSIS);
>>> +        if (!kvm_enabled()) {
>>> +            /* Per-socket M-level IMSICs */
>>> +            addr = memmap[VIRT_IMSIC_M].base +
>>> +                   socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>> +            for (i = 0; i < hart_count; i++) {
>>> +                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
>>> +                        base_hartid + i, true, 1,
>>> +                        VIRT_IRQCHIP_NUM_MSIS);
>>> +            }
>>>            }
>>>
>>>            /* Per-socket S-level IMSICs */
>>> @@ -1184,19 +1193,21 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>>>            }
>>>        }
>>>
>>> -    /* Per-socket M-level APLIC */
>>> -    aplic_m = riscv_aplic_create(
>>> -        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
>>> -        memmap[VIRT_APLIC_M].size,
>>> -        (msimode) ? 0 : base_hartid,
>>> -        (msimode) ? 0 : hart_count,
>>> -        VIRT_IRQCHIP_NUM_SOURCES,
>>> -        VIRT_IRQCHIP_NUM_PRIO_BITS,
>>> -        msimode, true, NULL);
>>> -
>>> -    if (aplic_m) {
>>> +    if (!kvm_enabled()) {
>>> +        /* Per-socket M-level APLIC */
>>> +        aplic_m = riscv_aplic_create(
>>> +                memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
>>> +                memmap[VIRT_APLIC_M].size,
>>> +                (msimode) ? 0 : base_hartid,
>>> +                (msimode) ? 0 : hart_count,
>>> +                VIRT_IRQCHIP_NUM_SOURCES,
>>> +                VIRT_IRQCHIP_NUM_PRIO_BITS,
>>> +                msimode, true, NULL);
>>> +    }
>>> +
>>> +    if (aplic_m || kvm_enabled()) {
>>
>> I am struggling to understand why we're checking for "aplic_m" here given that
>> riscv_aplic_create() will either returning something not NULL or error out via
>> &error_fatal.
>>
>> This behavior predates this patch though.
>>
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>
>>>            /* Per-socket S-level APLIC */
>>> -        riscv_aplic_create(
>>> +        aplic_s = riscv_aplic_create(
>>>                memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
>>>                memmap[VIRT_APLIC_S].size,
>>>                (msimode) ? 0 : base_hartid,
>>> @@ -1206,7 +1217,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>>>                msimode, false, aplic_m);
>>>        }
>>>
>>> -    return aplic_m;
>>> +    return kvm_enabled() ? aplic_s : aplic_m;
>>>    }
>>>
>>>    static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)

