Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1D4C00528
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 14:12:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQTd7-0003Jg-3j; Mon, 31 Jul 2023 10:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qQTd5-0003GL-W3
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 10:12:12 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qQTd2-0006zA-M4
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 10:12:11 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bb07d274feso3624601a34.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690812726; x=1691417526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqwR6AdhNK6JHv6Bea2K63f4F47Voo7lal+nAQ6q8EQ=;
 b=cVD/kH/XnSuHi8ty6DakS6Y7h8a9GJ3X0kYHE7NBRJW56hXB/KsdAenm3j96KHvR/Q
 1h5F2TrbeNq6pR8MI3o9Y/gK8xtb3wEjZv8N67/8f7mZG72jnTQykyj2/JKqSl4XI01i
 1vxc97aXqZu2MUxp7qtHWIXzrU3LXtgZbPRfj/xmwB+r5zo89dJAVQEYHMUCTBo2iMn+
 H9zOJs0fiD/VC+UvU/gfzDQYtCBq71QY9Grp0DLvoQdkhkcoeFC9onj04ucNxrc1Ezzb
 04QNBGw1fRo+2aMycTbcLJ2vpIHvX1LG4mm1mik6W7caZe4CN3EjtHE09KOnp8yMuoIM
 2SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690812726; x=1691417526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PqwR6AdhNK6JHv6Bea2K63f4F47Voo7lal+nAQ6q8EQ=;
 b=li9sD+t9BI0HdPyLtx5o4OuvNtfNzHII1+6uWQl84TqypY0knwC9ubPoxkUeUA3sDu
 rYov537AJ6WWZozaOCaYT2wpc47JymgF0Q+01pnIuQt5OhnqYmIw3iTjUkFBTXxSEBiF
 wXRF8WsCkbPnmhxZLTMIMimFLowa2hAiL+cu4x9PP0ZBynUk7J8H9NtbLIBOeU/75Y9l
 xdtucKeL1PnvyzhcuAUk9xh/sHiEIcnLO6FVrldv79+MyfCqDSNeTZiIM80OmR79W0ra
 mYWUWdSOxafBP8vA1hRZz00+CeJvVTYUpY8GY35NTL4QSF2LocyshcT7RdDT3/HI6IvP
 0uyA==
X-Gm-Message-State: ABy/qLbM/afQV77NCmr1IlMe9NysUNJ5c08RbPA6VfjTIhx1unnDVXBI
 zqmUckmOMXZ/5jt6aGVJCghUUQ==
X-Google-Smtp-Source: APBJJlHk4dskhqgIeGGtzHfU/VNYKycZfsOm4cPCNfOuFuoj9/iKMyfZ/IwXfbIqhjS6fZlNUDoecQ==
X-Received: by 2002:a05:6870:2109:b0:1a3:2447:7f4a with SMTP id
 f9-20020a056870210900b001a324477f4amr11081591oae.32.1690812726159; 
 Mon, 31 Jul 2023 07:12:06 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 q20-20020a9d6554000000b006b9cc007e87sm4108841otl.20.2023.07.31.07.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 07:12:05 -0700 (PDT)
Message-ID: <43c6120f-ed43-d45c-a3a5-a3bf22fd8f67@ventanamicro.com>
Date: Mon, 31 Jul 2023 11:12:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] hw/riscv: hart: allow other cpu instance
Content-Language: en-US
To: Nikita Shubin <nikita.shubin@maquefel.me>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230727080545.7908-1-nikita.shubin@maquefel.me>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230727080545.7908-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 7/27/23 05:05, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> Allow using instances derivative from RISCVCPU
> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> Currently it is not possible to overload instance of RISCVCPU,
> i.e. something like this:
> 
> static const TypeInfo riscv_cpu_type_infos[] = {
>       {
>          .name = TYPE_ANOTHER_RISCV_CPU,
>          .parent = TYPE_RISCV_CPU,
>          .instance_size = sizeof(MyCPUState),
>          .instance_init = riscv_my_cpu_init,
>      }
> };
> 
> Because we have RISCVHartArrayState.harts with exactly
> the size of RISCVCPU.
> 
> Using own instances can be used to store some internal hart state.
> ---
>   hw/riscv/boot.c               |  5 +++--
>   hw/riscv/riscv_hart.c         | 20 ++++++++++++--------
>   hw/riscv/sifive_u.c           |  7 +++++--
>   hw/riscv/spike.c              |  4 +++-
>   hw/riscv/virt-acpi-build.c    |  2 +-
>   hw/riscv/virt.c               |  6 +++---
>   include/hw/riscv/riscv_hart.h | 18 +++++++++++++++++-
>   7 files changed, 44 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..c0456dcc2e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,8 @@
>   
>   bool riscv_is_32bit(RISCVHartArrayState *harts)
>   {
> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
> +    RISCVCPU *hart = riscv_array_get_hart(harts, 0);
> +    return hart->env.misa_mxl_max == MXL_RV32;
>   }
>   
>   /*
> @@ -414,7 +415,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>           reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
>       }
>   
> -    if (!harts->harts[0].cfg.ext_icsr) {
> +    if (!riscv_array_get_hart(harts, 0)->cfg.ext_icsr) {
>           /*
>            * The Zicsr extension has been disabled, so let's ensure we don't
>            * run the CSR instruction. Let's fill the address with a non
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..74fc10ef48 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -43,24 +43,28 @@ static void riscv_harts_cpu_reset(void *opaque)
>   }
>   
>   static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
> -                               char *cpu_type, Error **errp)
> +                               char *cpu_type, size_t size, Error **errp)
>   {
> -    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
> -    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
> -    s->harts[idx].env.mhartid = s->hartid_base + idx;
> -    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
> -    return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
> +    RISCVCPU *hart = riscv_array_get_hart(s, idx);
> +    object_initialize_child_internal(OBJECT(s), "harts[*]",
> +                                    hart, size, cpu_type);
> +    qdev_prop_set_uint64(DEVICE(hart), "resetvec", s->resetvec);
> +    hart->env.mhartid = s->hartid_base + idx;
> +    qemu_register_reset(riscv_harts_cpu_reset, hart);
> +    return qdev_realize(DEVICE(hart), NULL, errp);
>   }
>   
>   static void riscv_harts_realize(DeviceState *dev, Error **errp)
>   {
>       RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
> +    size_t size = object_type_get_instance_size(s->cpu_type);
>       int n;
>   
> -    s->harts = g_new0(RISCVCPU, s->num_harts);
> +    s->harts = g_new0(RISCVCPU *, s->num_harts);
>   
>       for (n = 0; n < s->num_harts; n++) {
> -        if (!riscv_hart_realize(s, n, s->cpu_type, errp)) {
> +        s->harts[n] = RISCV_CPU(object_new(s->cpu_type));
> +        if (!riscv_hart_realize(s, n, s->cpu_type, size, errp)) {
>               return;

Not an issue with this patch but riscv_hart_realize() can use some review. I
I think that we're doing stuff in the wrong place. Perhaps I'll look into it.


>           }
>       }
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 35a335b8d0..b8a54db81b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -104,6 +104,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>       char *nodename;
>       uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>       uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
> +    RISCVCPU *hart;
>       static const char * const ethclk_names[2] = { "pclk", "hclk" };
>       static const char * const clint_compat[2] = {
>           "sifive,clint0", "riscv,clint0"
> @@ -180,9 +181,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>               } else {
>                   qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
>               }
> -            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> +            hart = riscv_array_get_hart(&s->soc.u_cpus, cpu - 1);
> +            isa = riscv_isa_string(hart);
>           } else {
> -            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
> +            hart = riscv_array_get_hart(&s->soc.e_cpus, 0);
> +            isa = riscv_isa_string(hart);
>           }
>           qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>           qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 81f7e53aed..85b7568dad 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -61,6 +61,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>       uint32_t cpu_phandle, intc_phandle, phandle = 1;
>       char *name, *mem_name, *clint_name, *clust_name;
>       char *core_name, *cpu_name, *intc_name;
> +    RISCVCPU *hart;
>       static const char * const clint_compat[2] = {
>           "sifive,clint0", "riscv,clint0"
>       };
> @@ -103,6 +104,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>           clint_cells =  g_new0(uint32_t, s->soc[socket].num_harts * 4);
>   
>           for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> +            hart = riscv_array_get_hart(&s->soc[socket], cpu);
>               cpu_phandle = phandle++;
>   
>               cpu_name = g_strdup_printf("/cpus/cpu@%d",
> @@ -113,7 +115,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>               } else {
>                   qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
>               }
> -            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> +            name = riscv_isa_string(hart);
>               qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
>               g_free(name);
>               qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..7cff4e4baf 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -158,7 +158,7 @@ static void build_rhct(GArray *table_data,
>       isa_offset = table_data->len - table.table_offset;
>       build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
>   
> -    cpu = &s->soc[0].harts[0];
> +    cpu = riscv_array_get_hart(&s->soc[0], 0);
>       isa = riscv_isa_string(cpu);
>       len = 8 + strlen(isa) + 1;
>       aligned_len = (len % 2) ? (len + 1) : len;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..59b42cc5e4 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -236,7 +236,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>       uint8_t satp_mode_max;
>   
>       for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> -        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
> +        RISCVCPU *cpu_ptr = riscv_array_get_hart(&s->soc[socket], cpu);
>   
>           cpu_phandle = (*phandle)++;
>   
> @@ -730,12 +730,12 @@ static void create_fdt_pmu(RISCVVirtState *s)
>   {
>       char *pmu_name;
>       MachineState *ms = MACHINE(s);
> -    RISCVCPU hart = s->soc[0].harts[0];
> +    RISCVCPU *hart = riscv_array_get_hart(&s->soc[0], 0);
>   
>       pmu_name = g_strdup_printf("/soc/pmu");
>       qemu_fdt_add_subnode(ms->fdt, pmu_name);
>       qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu");
> -    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
> +    riscv_pmu_generate_fdt_node(ms->fdt, hart->cfg.pmu_num, pmu_name);
>   
>       g_free(pmu_name);
>   }
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index bbc21cdc9a..a5393c361b 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -38,7 +38,23 @@ struct RISCVHartArrayState {
>       uint32_t hartid_base;
>       char *cpu_type;
>       uint64_t resetvec;
> -    RISCVCPU *harts;
> +    RISCVCPU **harts;
>   };
>   
> +/**
> + * riscv_array_get_hart:
> + */
> +static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *harts, int i)
> +{
> +    return harts->harts[i];
> +}

I don't see too much gain in this API because you'll still need a RISCVHartArrayState
instance anyways, which is the most annoying part. E.g:

> -    cpu = &s->soc[0].harts[0];
> +    cpu = riscv_array_get_hart(&s->soc[0], 0);



> +
> +/**
> + * riscv_array_get_num_harts:
> + */
> +static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *harts)
> +{
> +    return harts->num_harts;
> +}

Same with this API, which you didn't end up using in this patch. Thanks,


Daniel

> +
>   #endif

