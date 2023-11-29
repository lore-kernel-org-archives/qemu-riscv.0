Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CA4C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:37:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8Lgq-0000q0-SB; Wed, 29 Nov 2023 09:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r8Lgp-0000nn-8z
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 09:37:23 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r8Lgb-0003ns-8y
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 09:37:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cfae5ca719so39782735ad.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Nov 2023 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701268626; x=1701873426; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MMlYXSm/iH6tffbc+x+QhBGul4QYtsYYXYs5BjatTAM=;
 b=BccdCgWMlhty62PCgX0kTeZhzbAAeo1yZox8cXwuzzEFCfYzRJ2S1wlp03IbzNjTjq
 QedrABv0PWrtINV25DCOfFE4ip4Gcshb6BKvBZkbxdBqV7Mkrbzdem+31u1fFE1xiZzI
 lTjQrTi8Cfdb2ma4WORSC5NHnxxHuhpUEzuidUOLrs0Ot2YNJ+ySvVVGoCSCDoWtEfU2
 xw9OL5EyJYxukwnRvlIWq7RblSi9JFoY1ze/MitzRbC7vprT7H3Q7JFknKAvj9maCAEb
 2DjsUidAeYQ5OZVOWOWLvEf87mwiXER/OLcvt895y1Scz2TwKWCSXhUKNePFxCenLkSi
 JVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701268626; x=1701873426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MMlYXSm/iH6tffbc+x+QhBGul4QYtsYYXYs5BjatTAM=;
 b=FleLKCvv7pSJUQ9msCTZtJTmYiQSHxCFC80XV+iO/Zd9Qsyj6/UdiYiDAXiLj4c9zD
 YlTyVgYXE65q4kJ+OoIHMKRhpl7Ek1QRn4wAYSj10ne7VwmJVx9HgBxH0PsjLZqy8Prl
 /rMBJI+kgt8q0rP9LscgQ8xYz9Rx9i2vxGG59kzm424OPto8u7TqFnPqDI/U2gQ9fkHg
 zPXUXVqTTtyka1e/PQfR/dGpDNXf1MeIAWunS5zUMdAu5mCPrSN2B05aq8+L4fl57vOq
 BNfn81itDEn1Au6RB9zcN7m0iAIK2PLz/zbSSSthuxArzhHEaeFzOjjxhMDBXqVQK8ui
 SwQw==
X-Gm-Message-State: AOJu0YzpzcGkZIspZTLDN2STea05q9d41Qg7o3PhgDds5UfQvC5/nxr9
 21UqAOrxFkRtdA0f72/R75ilug==
X-Google-Smtp-Source: AGHT+IF8dp6KPsVGWrlE60Xwuq7tchHi+mil5lTtWMf71/hFRbadlZOyWlPUbDuIxUDRrvUiv+gM3A==
X-Received: by 2002:a17:902:e542:b0:1d0:1ad0:2de2 with SMTP id
 n2-20020a170902e54200b001d01ad02de2mr1119130plf.39.1701268625750; 
 Wed, 29 Nov 2023 06:37:05 -0800 (PST)
Received: from [192.168.68.109] (200-206-229-234.dsl.telesp.net.br.
 [200.206.229.234]) by smtp.gmail.com with ESMTPSA id
 m19-20020a170902bb9300b001d008d81fe8sm2553966pls.190.2023.11.29.06.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 06:37:05 -0800 (PST)
Message-ID: <651f0ec5-1639-4b4b-ac3e-151e0af45214@ventanamicro.com>
Date: Wed, 29 Nov 2023 11:37:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: support new isa extension detection devicetree
 properties
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, qemu-riscv@nongnu.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel@nongnu.org
References: <20231129-pebble-tuition-52fe03be95ae@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231129-pebble-tuition-52fe03be95ae@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 11/29/23 07:39, Conor Dooley wrote:
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

What about new extensions? Do we still need them to be present in riscv,isa
or can we just add them to riscv,isa-extensions? Eventually we'll want applications
to move on and stop using riscv,isa altogether, but if we keep adding new
extensions to it this process will take longer.

> The apart from the bonding of ACPI and DT definitions which concerns me
> a bit, I'm a wee bit worried about the vendor extensions diverging from
> what ends up in bindings. Ideally I think there should be acked binding
> patches for extensions, but that's well outside of my jurisdiction!
> 
> There's two 80 char line length violations in this, but the file already
> has some > 80 char lines, so I figured that it'd be fine...

It's fine to me.


One comment down below:

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
> +            (*count)++;
> +        }
> +    }
> +
> +    return extensions;
> +}
> +
> +void riscv_isa_set_props(RISCVCPU *cpu, void *fdt, char *nodename)
> +{
> +    const size_t maxlen = sizeof("rv128i");
> +    g_autofree char *isa_base = g_new(char, maxlen);
> +    g_autofree char *riscv_isa;
> +    char **isa_extensions;
> +    int count = 0;
> +
> +    riscv_isa = riscv_isa_string(cpu);
> +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", riscv_isa);
> +
> +    snprintf(isa_base, maxlen, "rv%di", TARGET_LONG_BITS);
> +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa-base", isa_base);
> +
> +    isa_extensions = riscv_isa_extensions_list(cpu, &count);
> +    qemu_fdt_setprop_string_array(fdt, nodename, "riscv,isa-extensions",
> +                                  isa_extensions, count);
> +
> +    for (int i = 0; i < count; i++) {
> +        g_free(isa_extensions[i]);
> +    }
> +}

This will break user-mode build:

[2025/2626] Linking target qemu-riscv64
FAILED: qemu-riscv64
(...)
/usr/bin/ld: libqemu-riscv64-linux-user.fa.p/target_riscv_cpu.c.o: in function `riscv_isa_set_props':
/home/danielhb/work/qemu/build/../target/riscv/cpu.c:1774: undefined reference to `qemu_fdt_setprop_string'
/usr/bin/ld: /home/danielhb/work/qemu/build/../target/riscv/cpu.c:1777: undefined reference to `qemu_fdt_setprop_string'
/usr/bin/ld: /home/danielhb/work/qemu/build/../target/riscv/cpu.c:1780: undefined reference to `qemu_fdt_setprop_string_array'
collect2: error: ld returned 1 exit status

The reason here is that the function has qemu_fdt* functions that user-mode doesn't
know about.

A quick fix would be to fold both this function and riscv_isa_extensions_list()
in #ifndef CONFIG_USER_ONLY. You'll also need to move the function declaration in cpu.h to
the #ifndef CONFIG_USER_ONLY block a handful of lines after where riscv_isa_set_props()
is being declared. Like this:


diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a7e8d06ad..8c3e31ab44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1736,6 +1736,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
      return isa_str;
  }
  
+#ifndef CONFIG_USER_ONLY
  static char **riscv_isa_extensions_list(RISCVCPU *cpu, int *count)
  {
      int maxlen = ARRAY_SIZE(riscv_single_letter_exts) + ARRAY_SIZE(isa_edata_arr);
@@ -1784,6 +1785,7 @@ void riscv_isa_set_props(RISCVCPU *cpu, void *fdt, char *nodename)
          g_free(isa_extensions[i]);
      }
  }
+#endif

   static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
  {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 021796fe01..763769403e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -490,13 +490,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
  char *riscv_isa_string(RISCVCPU *cpu);
-void riscv_isa_set_props(RISCVCPU *cpu, void *fdt, char *nodename);
  void riscv_cpu_list(void);
  
  #define cpu_list riscv_cpu_list
  #define cpu_mmu_index riscv_cpu_mmu_index
  
  #ifndef CONFIG_USER_ONLY
+void riscv_isa_set_props(RISCVCPU *cpu, void *fdt, char *nodename);
  void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                       vaddr addr, unsigned size,
                                       MMUAccessType access_type,



As a bonus, I would rename riscv_isa_set_props() to something like riscv_write_isa_fdt()
to be closer to what the function is doing.


Finally, is this the intended result? I got this DTs by using a simple buildroot with
rv64:

# cat  /proc/device-tree/cpus/cpu@0/riscv,isa-base
rv64i#
#
# cat  /proc/device-tree/cpus/cpu@0/riscv,isa
rv64imafdch_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu#
#
# cat  /proc/device-tree/cpus/cpu@0/riscv,isa-extensions
imafdchzicbomzicbozzicntrzicsrzifenceizihintntlzihintpausezihpmzawrszfazcazcdzbazbbzbczbssstcsvadu#



Thanks,


Daniel


> +
>   static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
>   {
>       ObjectClass *class_a = (ObjectClass *)a;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf58b0f0b5..d2dae07665 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -490,6 +490,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr);
>   char *riscv_isa_string(RISCVCPU *cpu);
> +void riscv_isa_set_props(RISCVCPU *cpu, void *fdt, char *nodename);
>   void riscv_cpu_list(void);
>   
>   #define cpu_list riscv_cpu_list

