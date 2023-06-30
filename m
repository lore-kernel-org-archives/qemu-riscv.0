Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C1EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:40:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFAbL-0006xy-2F; Fri, 30 Jun 2023 05:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFAbG-0006xZ-Fp
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:39:34 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFAbE-0004TE-7n
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:39:34 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a0423ea74eso1214767b6e.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688117970; x=1690709970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5urSgy5I4IwvaiQtXhKePvn+VEkDW0bmkYukGeBOKUg=;
 b=mBtlFxps3CFG0cZJeYavid28sTJg6TLipdixle/XTiIa6Rg/rGQN6UTUVNnfvuWFJ6
 W9/Db7JptYAD2nh+xN4JRcaaBBsYufZ2TZSz0pKeN86IuMynvYAFcfyEEiP8/U/hKzeB
 zH7TmOFp3z45lhILy9E20i1zRvnl4vjqvWLQwXAbuhm45QAnHPNJVw07HQFlQXeFdLNp
 /eKQLWSL1VxvI9bmzmC6QqMqQVKAvC6Mz4nR+wFyMzVX8WZlSkeLB8NTtlY9bLDqNHCU
 VHqrt6jthqDy0kciAMDrzcxZjSjWq6bun/c9/F9Gnp6uWBswDJmlEqthkMjofaMtptMq
 9xSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688117970; x=1690709970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5urSgy5I4IwvaiQtXhKePvn+VEkDW0bmkYukGeBOKUg=;
 b=PHtHyjPv0pftw3TgvVKZz5swhBLD0Gz+tzT7oHLmerKYgUsiabF2xpNtRkTFqcSRPU
 JzPsGwMTB4xPb42xb3jZKSDHMQydQ4V/iHhvCpkZGnFBGkQoh9ZINmyRar2qxuJq+dSC
 N3cD02rivdCiowDogxZh95kXDPsNU7XnrNp7Z7DmhPF29vsUI2+2bEH1+9fxNeskAZB9
 9b9uefAEPHRnlYeSdWjVJXosaZTGLsay+326qCo0wXFeOTmGfKx+A9Bz1p650zQ6noiE
 LHz2I67bDrzO2K8lq57PPDhoKyf3e6Js5tKvopcPHtGnLidT9Q1Dk3afCuP33W2QBAe5
 w4fQ==
X-Gm-Message-State: AC+VfDzEXsbfJUS1AHGpaBvS9ntfS/eQ2IRpcZr1+LPi+B/ebk2Pp6Dq
 Xam4uy2v2OaENI8/qQOGAP0zyQ==
X-Google-Smtp-Source: ACHHUZ4zNxrBUYSxsgdWcWTPSSlTuUsj8ubrAV6YxUMvSX0p3pvOHvZwDI/1wT0Scsjx9UMZ3zVU5Q==
X-Received: by 2002:a05:6808:15a4:b0:3a2:79ea:d372 with SMTP id
 t36-20020a05680815a400b003a279ead372mr2538146oiw.52.1688117970683; 
 Fri, 30 Jun 2023 02:39:30 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 1-20020aca1001000000b003a368f3e0a6sm2115286oiq.3.2023.06.30.02.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 02:39:30 -0700 (PDT)
Message-ID: <52f4fdec-a74d-002d-a3b0-144463ca6fd6@ventanamicro.com>
Date: Fri, 30 Jun 2023 06:39:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/6] target/riscv: support the AIA device emulation
 with KVM enabled
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230621145500.25624-3-yongxuan.wang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230621145500.25624-3-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/21/23 11:54, Yong-Xuan Wang wrote:
> Remove M mode AIA devices when using KVM acceleration
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt.c | 207 +++++++++++++++++++++++++-----------------------
>   1 file changed, 108 insertions(+), 99 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 245c7b97b2..4a1d29a741 100644
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
> @@ -1184,29 +1193,29 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>           }
>       }
>   
> -    /* Per-socket M-level APLIC */
> -    aplic_m = riscv_aplic_create(
> -        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
> -        memmap[VIRT_APLIC_M].size,
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
> +    /* Per-socket S-level APLIC */
> +    aplic_s = riscv_aplic_create(
> +        memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
> +        memmap[VIRT_APLIC_S].size,
>           (msimode) ? 0 : base_hartid,
>           (msimode) ? 0 : hart_count,
>           VIRT_IRQCHIP_NUM_SOURCES,
>           VIRT_IRQCHIP_NUM_PRIO_BITS,
> -        msimode, true, NULL);
> -
> -    if (aplic_m) {
> -        /* Per-socket S-level APLIC */
> -        riscv_aplic_create(
> -            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
> -            memmap[VIRT_APLIC_S].size,
> -            (msimode) ? 0 : base_hartid,
> -            (msimode) ? 0 : hart_count,
> -            VIRT_IRQCHIP_NUM_SOURCES,
> -            VIRT_IRQCHIP_NUM_PRIO_BITS,
> -            msimode, false, aplic_m);
> -    }
> +        msimode, false, aplic_m);
>   
> -    return aplic_m;
> +    return kvm_enabled() ? aplic_s : aplic_m;
>   }
>   
>   static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)

