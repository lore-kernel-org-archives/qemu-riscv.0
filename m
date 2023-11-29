Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F24C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 13:44:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8Krg-0003rq-Pw; Wed, 29 Nov 2023 08:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r8Krc-0003oH-If
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 08:44:28 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r8Kra-0000rW-3L
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 08:44:28 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1efb9571b13so3938122fac.2
 for <qemu-riscv@nongnu.org>; Wed, 29 Nov 2023 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701265463; x=1701870263; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o98S/88n4Sg1nRgPXw6JINr+MLw+rCCsotvLcDGfIG4=;
 b=XU2/eDsfsn0gGe0wMpQyT1CPL+6hJa9iL88kU/JxyJ9remFxHQ3HOfElPUOfMY5OeQ
 u6HjFuOFjjbatGLV3YTzWm816DfArwNQkDu6cyT7D11A/9m++t4v/OUHNLgsh7JzDSCg
 KqzQl1X+xe0w8d5c2BIOlKoIvCD8ivVKlT5Rw5n0jCPd6AnuBYiiXwZmNjZVjwsJ52T3
 NrFgJ5RmRJ+tHTXdatdPwwEsFMSOrW8UAJdmZqml/gRfT3jp6URZsFeHXju+4YQGE90H
 QD47AeZp1OcUPAprMbsKz+t5BOJdbYfuDfzqJ9wG1xk6LWnowaJMqNKs6g2SQ6Vzorhf
 uX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701265463; x=1701870263;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o98S/88n4Sg1nRgPXw6JINr+MLw+rCCsotvLcDGfIG4=;
 b=l2CW6wNI4yB337cjMPeB4TTNmiZqyYod+dV2dY73MS2XtwjM++UdZxVbIJ9kPveizI
 ynvbPgF1mtcDyxYXsVsiti/gWpRKxeLftZ34uVIQ5Dlp4764YO5pLiRoox71InIg44Go
 hfLr2ofqVdq1LpUaYWQsblaHGMWUARHtdSNSXw8o+8gbXU17JpoCBdhO78THZT+hXX2y
 XYVHfMje9hzUa2pdPrpo/t+/6xbYJge1+lFHP3Z7CndrUZqgUyytypwtjg4xKL4pm+IH
 Ahs3si0yxKMoBJ5paQ3NMW6l8GRpIG4ETZjTQ4kR+9I63WhBLDA/m+4Eq3x4zTd0NEb8
 RLXw==
X-Gm-Message-State: AOJu0YxeL8TU/FFCpXJsA39erkh4ttkd+zAEPTQsWQX3wI9SYroJwJXl
 z7L0UlHj3do2/zeTs/bh72QEnQ==
X-Google-Smtp-Source: AGHT+IEm2GJ/1G6MdRQBE72TeK1H2wn45wO6dQNGvaW/m83sfajebJo6ac8wGV0QObAr+FHjJWxbmw==
X-Received: by 2002:a05:6870:1707:b0:1f9:fa9f:c1da with SMTP id
 h7-20020a056870170700b001f9fa9fc1damr21591385oae.49.1701265463575; 
 Wed, 29 Nov 2023 05:44:23 -0800 (PST)
Received: from [192.168.174.227] (rrcs-71-42-197-3.sw.biz.rr.com.
 [71.42.197.3]) by smtp.gmail.com with ESMTPSA id
 du45-20020a0568703a2d00b001f9e460c816sm3085219oab.42.2023.11.29.05.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 05:44:23 -0800 (PST)
Message-ID: <99ecf338-c150-4deb-85e6-479222db21e5@linaro.org>
Date: Wed, 29 Nov 2023 07:44:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: support new isa extension detection devicetree
 properties
To: Conor Dooley <conor@kernel.org>, qemu-riscv@nongnu.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20231129-pebble-tuition-52fe03be95ae@spud>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231129-pebble-tuition-52fe03be95ae@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 11/29/23 04:39, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A few months ago I submitted a patch to various lists, deprecating
> "riscv,isa" with a lengthy commit message [0] that is now commit
> aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa") in the Linux
> kernel tree. Primarily, the goal was to replace "riscv,isa" with a new
> set of properties that allowed for strictly defining the meaning of
> various extensions, where "riscv,isa" was tied to whatever definitions
> inflicted upon us by the ISA manual, which have seen some variance over
> time.
> 
> Two new properties were introduced: "riscv,isa-base" and
> "riscv,isa-extensions". The former is a simple string to communicate the
> base ISA implemented by a hart and the latter an array of strings used
> to communicate the set of ISA extensions supported, per the definitions
> of each substring in extensions.yaml [1]. A beneficial side effect was
> also the ability to define vendor extensions in a more "official" way,
> as the ISA manual and other RVI specifications only covered the format
> for vendor extensions in the ISA string, but not the meaning of vendor
> extensions, for obvious reasons.
> 
> Add support for setting these two new properties in the devicetrees for
> the various devicetree platforms supported by QEMU for RISC-V. The Linux
> kernel already supports parsing ISA extensions from these new
> properties, and documenting them in the dt-binding is a requirement for
> new extension detection being added to the kernel.
> 
> A side effect of the implementation is that the meaning for elements in
> "riscv,isa" and in "riscv,isa-extensions" are now tied together as they
> are constructed from the same source. The same applies to the ISA string
> provided in ACPI tables, but there does not appear to be any strict
> definitions of meanings in ACPI land either.
> 
> Link: https://lore.kernel.org/qemu-riscv/20230702-eats-scorebook-c951f170d29f@spud/ [0]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/extensions.yaml [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> The apart from the bonding of ACPI and DT definitions which concerns me
> a bit, I'm a wee bit worried about the vendor extensions diverging from
> what ends up in bindings. Ideally I think there should be acked binding
> patches for extensions, but that's well outside of my jurisdiction!
> 
> There's two 80 char line length violations in this, but the file already
> has some > 80 char lines, so I figured that it'd be fine...
> 
> CC: Alistair Francis <Alistair.Francis@wdc.com>
> CC: Bin Meng <bin.meng@windriver.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Weiwei Li <liwei1518@gmail.com>
> CC: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> CC: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> CC: qemu-riscv@nongnu.org
> CC: qemu-devel@nongnu.org
> ---
>   hw/riscv/sifive_u.c |  7 ++-----
>   hw/riscv/spike.c    |  6 ++----
>   hw/riscv/virt.c     |  6 ++----
>   target/riscv/cpu.c  | 50 +++++++++++++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h  |  1 +
>   5 files changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..4e6eed863b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -171,7 +171,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>           int cpu_phandle = phandle++;
>           nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
>           char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> -        char *isa;
>           qemu_fdt_add_subnode(fdt, nodename);
>           /* cpu 0 is the management hart that does not have mmu */
>           if (cpu != 0) {
> @@ -180,11 +179,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>               } else {
>                   qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
>               }
> -            isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> +            riscv_isa_set_props(&s->soc.u_cpus.harts[cpu - 1], fdt, nodename);
>           } else {
> -            isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
> +            riscv_isa_set_props(&s->soc.e_cpus.harts[0], fdt, nodename);
>           }
> -        qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>           qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
>           qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
>           qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> @@ -194,7 +192,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>           qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
>           qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>           qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> -        g_free(isa);
>           g_free(intc);
>           g_free(nodename);
>       }
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 81f7e53aed..1657554d7b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -59,7 +59,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>       MachineState *ms = MACHINE(s);
>       uint32_t *clint_cells;
>       uint32_t cpu_phandle, intc_phandle, phandle = 1;
> -    char *name, *mem_name, *clint_name, *clust_name;
> +    char *mem_name, *clint_name, *clust_name;
>       char *core_name, *cpu_name, *intc_name;
>       static const char * const clint_compat[2] = {
>           "sifive,clint0", "riscv,clint0"
> @@ -113,9 +113,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>               } else {
>                   qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
>               }
> -            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> -            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
> -            g_free(name);
> +            riscv_isa_set_props(&s->soc[socket].harts[cpu], fdt, cpu_name);
>               qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
>               qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
>               qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c7fc97e273..435ad66cd3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -238,7 +238,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>       int cpu;
>       uint32_t cpu_phandle;
>       MachineState *ms = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> +    char *cpu_name, *core_name, *intc_name, *sv_name;
>       bool is_32_bit = riscv_is_32bit(&s->soc[0]);
>       uint8_t satp_mode_max;
>   
> @@ -259,9 +259,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>               g_free(sv_name);
>           }
>   
> -        name = riscv_isa_string(cpu_ptr);
> -        qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
> -        g_free(name);
> +        riscv_isa_set_props(cpu_ptr, ms->fdt, cpu_name);
>   
>           if (cpu_ptr->cfg.ext_zicbom) {
>               qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07..5a7e8d06ad 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -31,6 +31,7 @@
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "fpu/softfloat-helpers.h"
> +#include "sysemu/device_tree.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tcg.h"
>   #include "kvm/kvm_riscv.h"
> @@ -1735,6 +1736,55 @@ char *riscv_isa_string(RISCVCPU *cpu)
>       return isa_str;
>   }
>   
> +static char **riscv_isa_extensions_list(RISCVCPU *cpu, int *count)
> +{
> +    int maxlen = ARRAY_SIZE(riscv_single_letter_exts) + ARRAY_SIZE(isa_edata_arr);
> +    char **extensions = g_new(char *, maxlen);
> +
> +    for (int i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
> +        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> +            extensions[*count] = g_new(char, 2);
> +            snprintf(extensions[*count], 2, "%c",
> +                     qemu_tolower(riscv_single_letter_exts[i]));
> +            (*count)++;
> +        }
> +    }
> +
> +    for (const RISCVIsaExtData *edata = isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset)) {
> +            extensions[*count] = g_new(char, strlen(edata->name) + 1);
> +            snprintf(extensions[*count], strlen(edata->name) + 1, "%s",
> +                     edata->name);

g_strdup.

