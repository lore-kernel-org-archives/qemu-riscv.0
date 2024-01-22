Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA8C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:20:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmin-00043D-98; Mon, 22 Jan 2024 00:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmil-00042O-PG; Mon, 22 Jan 2024 00:19:44 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmij-0008TG-2M; Mon, 22 Jan 2024 00:19:42 -0500
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4698c58c589so482991137.3; 
 Sun, 21 Jan 2024 21:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705900778; x=1706505578; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QF3+TdlUVJLciGJyFWZlQu4W45ewlo8TeuR2Rzw96PQ=;
 b=MrbE6sht85rl+JpKpKPSrUTnl2oWndn09cnW8UvyLDXXcFbeZsl8BWuNPy91bRBNil
 SKeLLhViYkJKethQOjqpyDxG4ZaCKR7X/6sPmyIFfJeLEHQJo0lrRj9AxDaJJCW16m/r
 sO/KB/OyG0rTd3GSq51JNNTKUz+M1DSe+wa+DEFnaaTeyV12b92DTYoGAb0XGRL/PaZW
 n29SEnQx7KBuIF1ljT+Z7XcevB7oDJ7rUBLdtzXyjwr3gAo4H7Q4Bt1+elQyeyMl3i71
 huqpE6ViElWg3pauq87YYapIAutX2Uw0c53m8RQ3grzRAqaLdDZxmeFy4maRa88VeJiS
 3uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705900778; x=1706505578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QF3+TdlUVJLciGJyFWZlQu4W45ewlo8TeuR2Rzw96PQ=;
 b=Mz07+IKBP64HFHhyj/bBfQJWZ0kOehxZyzf27EVdi26LPiO9qlDckvvJ+lyXyv5/MF
 8mNhewA3Zm+X7p2Ay53TMhxnzC4tuZcajI4dp2RddXxK7wFTkI/C2BtdPgqftGUWjYuj
 IoHqnwpu7tjrJTP49HX8yNOHDafyidQn0qIF6cr9EH3NYFv+twGVF0qJs1WunAkzenja
 4ITuGXSlqpyoBZDO29U7Qanzu17b1wBNV3s6r4LS8LwTm3jmkypfd59duL/X2D1NWp3X
 VNcHFRJ6faMRA3Sz1QgxogkOB3oLE50u/skpPb77wJmvxoUuwM5OIyZy8skFSq68e74F
 0q+Q==
X-Gm-Message-State: AOJu0YzsCQCMH/UXGWVMBcPnc1BWjCJsJ/ZKMmZH3E5/ygt/aXuBBWiF
 RIcbcf5ycG+0e1M+OprmhvECgywTBf3rd95oaHSH58T8CG3X4nSAUly9HIcB/XlU34oLPlaNTJQ
 Gg2LLqa/ki7OJWdyNCX798BgOg9w=
X-Google-Smtp-Source: AGHT+IHVMTUNogKF/jxFNPDQQZRxq10nA4wXFEHHoToQ0tfGujZ8+c+QCVQJAa8dh3T7PgkRj6kuAMiEYVcb6lNgfKo=
X-Received: by 2002:a67:f709:0:b0:469:a5dd:6470 with SMTP id
 m9-20020a67f709000000b00469a5dd6470mr1572061vso.18.1705900778440; Sun, 21 Jan
 2024 21:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20240110-mold-renovate-256db1b5c70e@spud>
 <20240110-sasquatch-vaporizer-b1d92e7ea9dc@spud>
In-Reply-To: <20240110-sasquatch-vaporizer-b1d92e7ea9dc@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:19:12 +1000
Message-ID: <CAKmqyKP10dkUERtRpe7RAs9TH3i2zHh6MkhQq-hwbJs0P+Z03w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] target/riscv: support new isa extension detection
 devicetree properties
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jan 10, 2024 at 8:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
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
> Link: https://lore.kernel.org/qemu-riscv/20230702-eats-scorebook-c951f170=
d29f@spud/ [0]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/riscv/extensions.yaml [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c |  7 ++----
>  hw/riscv/spike.c    |  6 ++---
>  hw/riscv/virt.c     |  6 ++---
>  target/riscv/cpu.c  | 53 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h  |  1 +
>  5 files changed, 60 insertions(+), 13 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..2f227f15bc 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -171,7 +171,6 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>          int cpu_phandle =3D phandle++;
>          nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
> -        char *isa;
>          qemu_fdt_add_subnode(fdt, nodename);
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu !=3D 0) {
> @@ -180,11 +179,10 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>              } else {
>                  qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "risc=
v,sv48");
>              }
> -            isa =3D riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> +            riscv_isa_write_fdt(&s->soc.u_cpus.harts[cpu - 1], fdt, node=
name);
>          } else {
> -            isa =3D riscv_isa_string(&s->soc.e_cpus.harts[0]);
> +            riscv_isa_write_fdt(&s->soc.e_cpus.harts[0], fdt, nodename);
>          }
> -        qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
>          qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> @@ -194,7 +192,6 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc=
");
>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> -        g_free(isa);
>          g_free(intc);
>          g_free(nodename);
>      }
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 81f7e53aed..64074395bc 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -59,7 +59,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>      MachineState *ms =3D MACHINE(s);
>      uint32_t *clint_cells;
>      uint32_t cpu_phandle, intc_phandle, phandle =3D 1;
> -    char *name, *mem_name, *clint_name, *clust_name;
> +    char *mem_name, *clint_name, *clust_name;
>      char *core_name, *cpu_name, *intc_name;
>      static const char * const clint_compat[2] =3D {
>          "sifive,clint0", "riscv,clint0"
> @@ -113,9 +113,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
>              } else {
>                  qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv48");
>              }
> -            name =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
> -            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
> -            g_free(name);
> +            riscv_isa_write_fdt(&s->soc[socket].harts[cpu], fdt, cpu_nam=
e);
>              qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv"=
);
>              qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
>              qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index f9fd1341fc..c47b2d397a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -215,7 +215,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *ms =3D MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> +    char *cpu_name, *core_name, *intc_name, *sv_name;
>      bool is_32_bit =3D riscv_is_32bit(&s->soc[0]);
>      uint8_t satp_mode_max;
>
> @@ -236,9 +236,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>              g_free(sv_name);
>          }
>
> -        name =3D riscv_isa_string(cpu_ptr);
> -        qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
> -        g_free(name);
> +        riscv_isa_write_fdt(cpu_ptr, ms->fdt, cpu_name);
>
>          if (cpu_ptr->cfg.ext_zicbom) {
>              qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-s=
ize",
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5b5da970f2..1c8c81ca4c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -31,6 +31,7 @@
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "fpu/softfloat-helpers.h"
> +#include "sysemu/device_tree.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/tcg.h"
>  #include "kvm/kvm_riscv.h"
> @@ -1875,6 +1876,58 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      return isa_str;
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +static char **riscv_isa_extensions_list(RISCVCPU *cpu, int *count)
> +{
> +    int maxlen =3D ARRAY_SIZE(riscv_single_letter_exts) + ARRAY_SIZE(isa=
_edata_arr);
> +    char **extensions =3D g_new(char *, maxlen);
> +
> +    for (int i =3D 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
> +        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> +            extensions[*count] =3D g_new(char, 2);
> +            snprintf(extensions[*count], 2, "%c",
> +                     qemu_tolower(riscv_single_letter_exts[i]));
> +            (*count)++;
> +        }
> +    }
> +
> +    for (const RISCVIsaExtData *edata =3D isa_edata_arr; edata->name; ed=
ata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset)) {
> +            extensions[*count] =3D g_strdup(edata->name);
> +            (*count)++;
> +        }
> +    }
> +
> +    return extensions;
> +}
> +
> +void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
> +{
> +    const size_t maxlen =3D sizeof("rv128i");
> +    g_autofree char *isa_base =3D g_new(char, maxlen);
> +    g_autofree char *riscv_isa;
> +    char **isa_extensions;
> +    int count =3D 0;
> +    int xlen =3D 16 << cpu->env.misa_mxl_max;
> +
> +    riscv_isa =3D riscv_isa_string(cpu);
> +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", riscv_isa);
> +
> +    snprintf(isa_base, maxlen, "rv%di", xlen);
> +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa-base", isa_base);
> +
> +    isa_extensions =3D riscv_isa_extensions_list(cpu, &count);
> +    qemu_fdt_setprop_string_array(fdt, nodename, "riscv,isa-extensions",
> +                                  isa_extensions, count);
> +
> +    for (int i =3D 0; i < count; i++) {
> +        g_free(isa_extensions[i]);
> +    }
> +
> +    g_free(isa_extensions);
> +}
> +#endif
> +
>  #define DEFINE_CPU(type_name, initfn)      \
>      {                                      \
>          .name =3D type_name,                 \
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5f3955c38d..192d0c2d31 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -510,6 +510,7 @@ char *riscv_isa_string(RISCVCPU *cpu);
>  #define cpu_mmu_index riscv_cpu_mmu_index
>
>  #ifndef CONFIG_USER_ONLY
> +void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
>  void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                       vaddr addr, unsigned size,
>                                       MMUAccessType access_type,
> --
> 2.39.2
>
>

