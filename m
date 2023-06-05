Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB7C77B73
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 18:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6FD7-0003BK-Mt; Mon, 05 Jun 2023 14:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6FCu-0003AG-NQ
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 14:45:42 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6FCo-0003wb-SA
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 14:45:30 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-19f68a583a7so4458134fac.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 11:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685990724; x=1688582724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FJWEnXVShKOFm1jgS6FEApH9ZxHdRdduodB+jxkLj8Q=;
 b=YEmhDPsmKbfz0xYXlDCmPgRe+jn7TFK5Tr98eKCZH8aOQeNzqwzfoyDczds+sBZj+b
 dUwuTArQR2WaZi6iNn84dYrquTgGBMLpTyO8rEHLW8C9LCyU+uDUwLDtG9zYZ17I8Oh5
 Ot290NdsNCt8hn8t9FattRpJYeI9/Audsnf8KaJEcQnzdWQCSilr1x+Kri85RpEJXXNJ
 dCEp8kTyR3eFOUdl54BuisEGCmKt4Ze84WddcpATd89S6kUrI3WWuu0kQoI4TYaCqqys
 mr984Rc23Vca8cx9yFVygCaA1wL++fUfq4UUBW6oVsAUDWQXJI/Z87uCRps8feyjJwef
 MRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685990724; x=1688582724;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FJWEnXVShKOFm1jgS6FEApH9ZxHdRdduodB+jxkLj8Q=;
 b=EtltGwXAu8Skdy1+8VDoyrwT14iayIJxfcC5Y3aIMy9O35b0YwdixobgUKweRmYv0x
 9iP+qNWnK4XXav6YsKpmRjsdo7sc+6kCK68nG9OQza7RjoEaHIAH2zDdxcM7FlWPV7ot
 xaG4vMBa6LRFZ3U+7IadgdTYDJOgygWYlMu2KebGK8CmFc3/gZQI0BCMgjjKqbZXKi8R
 Lg51vGB0ssXmZuNKD0+QLwbdMEIuai1Ub9CIc/T8YJnKNoGYc6NIFFS3ACCL6OskB9yv
 fIg6ZREZaMnAs6DyiOoUOIEGzIKpzYGEVE3dmRRhgH/Q15FM0juGzgzjIBSqgyi7qOok
 +UTg==
X-Gm-Message-State: AC+VfDy/SNH10DhM3C12QNV3HB+4jC4t4f1oTpGB3g3zQHRE1AAvxf7u
 J98ZRpAZwSMFcPeW/UNUo0cz0A==
X-Google-Smtp-Source: ACHHUZ5aWVVJJdgPsyreUmfxWq2/0HpvQArBqEA/8I0h0zAwLiaWypZxpNCeKGpI1NAvqTpt56LPdw==
X-Received: by 2002:a05:6870:5b12:b0:19a:29a7:f605 with SMTP id
 ds18-20020a0568705b1200b0019a29a7f605mr353753oab.1.1685990724213; 
 Mon, 05 Jun 2023 11:45:24 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05687091c700b0019edd086f33sm3852035oaf.41.2023.06.05.11.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 11:45:23 -0700 (PDT)
Message-ID: <ed0a1ceb-de35-4085-9e5f-e2bf73374ebc@ventanamicro.com>
Date: Mon, 5 Jun 2023 15:45:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/6] target/riscv: support the AIA device emulation
 with KVM enabled
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, rkanwal@rivosinc.com, anup@brainfault.org,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
 <20230526062509.31682-3-yongxuan.wang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230526062509.31682-3-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



On 5/26/23 03:25, Yong-Xuan Wang wrote:
> Remove M mode AIA devices when using KVM acceleration
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>   hw/riscv/virt.c | 199 +++++++++++++++++++++++++-----------------------
>   1 file changed, 105 insertions(+), 94 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..18b94888ab 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -531,52 +531,54 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>       imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
>       imsic_regs = g_new0(uint32_t, socket_count * 4);
>   
> -    /* M-level IMSIC node */
> -    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> -        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> -        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
> -    }
> -    imsic_max_hart_per_socket = 0;
> -    for (socket = 0; socket < socket_count; socket++) {
> -        imsic_addr = memmap[VIRT_IMSIC_M].base +
> -                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> -        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
> -        imsic_regs[socket * 4 + 0] = 0;
> -        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
> -        imsic_regs[socket * 4 + 2] = 0;
> -        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
> -        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> -            imsic_max_hart_per_socket = s->soc[socket].num_harts;
> +    if (!kvm_enabled()) {
> +        /* M-level IMSIC node */
> +        for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +            imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +            imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
>           }
> -    }
> -    imsic_name = g_strdup_printf("/soc/imsics@%lx",
> -        (unsigned long)memmap[VIRT_IMSIC_M].base);
> -    qemu_fdt_add_subnode(ms->fdt, imsic_name);
> -    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
> -        "riscv,imsics");
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
> -        FDT_IMSIC_INT_CELLS);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
> -        NULL, 0);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
> -        NULL, 0);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> -        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> -    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
> -        socket_count * sizeof(uint32_t) * 4);
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> -        VIRT_IRQCHIP_NUM_MSIS);
> -    if (socket_count > 1) {
> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
> -            imsic_num_bits(imsic_max_hart_per_socket));
> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
> -            imsic_num_bits(socket_count));
> -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-shift",
> -            IMSIC_MMIO_GROUP_MIN_SHIFT);
> -    }
> -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
> +        imsic_max_hart_per_socket = 0;
> +        for (socket = 0; socket < socket_count; socket++) {
> +            imsic_addr = memmap[VIRT_IMSIC_M].base +
> +                         socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> +            imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
> +            imsic_regs[socket * 4 + 0] = 0;
> +            imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
> +            imsic_regs[socket * 4 + 2] = 0;
> +            imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
> +            if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> +                imsic_max_hart_per_socket = s->soc[socket].num_harts;
> +            }
> +        }
> +        imsic_name = g_strdup_printf("/soc/imsics@%lx",
> +            (unsigned long)memmap[VIRT_IMSIC_M].base);
> +        qemu_fdt_add_subnode(ms->fdt, imsic_name);
> +        qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
> +            "riscv,imsics");
> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
> +            FDT_IMSIC_INT_CELLS);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
> +            NULL, 0);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
> +            NULL, 0);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> +            imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> +        qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
> +            socket_count * sizeof(uint32_t) * 4);
> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> +            VIRT_IRQCHIP_NUM_MSIS);
> +        if (socket_count > 1) {
> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
> +                imsic_num_bits(imsic_max_hart_per_socket));
> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
> +                imsic_num_bits(socket_count));
> +            qemu_fdt_setprop_cell(ms->fdt, imsic_name,
> +                "riscv,group-index-shift", IMSIC_MMIO_GROUP_MIN_SHIFT);
> +        }
> +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle);
>   
> -    g_free(imsic_name);
> +        g_free(imsic_name);
> +    }
>   
>       /* S-level IMSIC node */
>       for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> @@ -653,37 +655,40 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>       aplic_s_phandle = (*phandle)++;
>       aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
>   
> -    /* M-level APLIC node */
> -    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> -        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> -        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
> -    }
> -    aplic_addr = memmap[VIRT_APLIC_M].base +
> -                 (memmap[VIRT_APLIC_M].size * socket);
> -    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> -    qemu_fdt_add_subnode(ms->fdt, aplic_name);
> -    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,aplic");
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> -        "#interrupt-cells", FDT_APLIC_INT_CELLS);
> -    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
> -    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
> -        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
> -            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
> -    } else {
> -        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
> -            msi_m_phandle);
> +    if (!kvm_enabled()) {
> +        /* M-level APLIC node */
> +        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> +            aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +            aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
> +        }
> +        aplic_addr = memmap[VIRT_APLIC_M].base +
> +                     (memmap[VIRT_APLIC_M].size * socket);
> +        aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> +        qemu_fdt_add_subnode(ms->fdt, aplic_name);
> +        qemu_fdt_setprop_string(ms->fdt, aplic_name,
> +            "compatible", "riscv,aplic");
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> +            "#interrupt-cells", FDT_APLIC_INT_CELLS);
> +        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, 0);
> +        if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
> +            qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
> +                aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
> +        } else {
> +            qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
> +                msi_m_phandle);
> +        }
> +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
> +            0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
> +            VIRT_IRQCHIP_NUM_SOURCES);
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
> +            aplic_s_phandle);
> +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
> +            aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> +        riscv_socket_fdt_write_id(ms, aplic_name, socket);
> +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
> +        g_free(aplic_name);
>       }
> -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
> -        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
> -        VIRT_IRQCHIP_NUM_SOURCES);
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
> -        aplic_s_phandle);
> -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
> -        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> -    riscv_socket_fdt_write_id(ms, aplic_name, socket);
> -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandle);
> -    g_free(aplic_name);
>   
>       /* S-level APLIC node */
>       for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> @@ -1162,16 +1167,20 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>       int i;
>       hwaddr addr;
>       uint32_t guest_bits;
> -    DeviceState *aplic_m;
> +    DeviceState *aplic_s = NULL;
> +    DeviceState *aplic_m = NULL;
>       bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
>   
>       if (msimode) {
> -        /* Per-socket M-level IMSICs */
> -        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> -        for (i = 0; i < hart_count; i++) {
> -            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> -                               base_hartid + i, true, 1,
> -                               VIRT_IRQCHIP_NUM_MSIS);
> +        if (!kvm_enabled()) {
> +            /* Per-socket M-level IMSICs */
> +            addr = memmap[VIRT_IMSIC_M].base +
> +                   socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> +            for (i = 0; i < hart_count; i++) {
> +                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> +                        base_hartid + i, true, 1,
> +                        VIRT_IRQCHIP_NUM_MSIS);
> +            }
>           }
>   
>           /* Per-socket S-level IMSICs */
> @@ -1184,19 +1193,21 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>           }
>       }
>   
> -    /* Per-socket M-level APLIC */
> -    aplic_m = riscv_aplic_create(
> -        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
> -        memmap[VIRT_APLIC_M].size,
> -        (msimode) ? 0 : base_hartid,
> -        (msimode) ? 0 : hart_count,
> -        VIRT_IRQCHIP_NUM_SOURCES,
> -        VIRT_IRQCHIP_NUM_PRIO_BITS,
> -        msimode, true, NULL);
> -
> -    if (aplic_m) {
> +    if (!kvm_enabled()) {
> +        /* Per-socket M-level APLIC */
> +        aplic_m = riscv_aplic_create(
> +                memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
> +                memmap[VIRT_APLIC_M].size,
> +                (msimode) ? 0 : base_hartid,
> +                (msimode) ? 0 : hart_count,
> +                VIRT_IRQCHIP_NUM_SOURCES,
> +                VIRT_IRQCHIP_NUM_PRIO_BITS,
> +                msimode, true, NULL);
> +    }
> +
> +    if (aplic_m || kvm_enabled()) {

I am struggling to understand why we're checking for "aplic_m" here given that
riscv_aplic_create() will either returning something not NULL or error out via
&error_fatal.

This behavior predates this patch though.



Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>           /* Per-socket S-level APLIC */
> -        riscv_aplic_create(
> +        aplic_s = riscv_aplic_create(
>               memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
>               memmap[VIRT_APLIC_S].size,
>               (msimode) ? 0 : base_hartid,
> @@ -1206,7 +1217,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>               msimode, false, aplic_m);
>       }
>   
> -    return aplic_m;
> +    return kvm_enabled() ? aplic_s : aplic_m;
>   }
>   
>   static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)

