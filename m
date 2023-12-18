Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F9C46CA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:38:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF5Og-0000g0-JM; Sun, 17 Dec 2023 23:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF5Ob-0000c2-N1; Sun, 17 Dec 2023 23:38:25 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF5OZ-000265-G6; Sun, 17 Dec 2023 23:38:25 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7ca9c5921ceso715149241.1; 
 Sun, 17 Dec 2023 20:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702874302; x=1703479102; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYUGIF33nzOuEVqpkxlZR0N1egiN1v7BwFeFgckKDBY=;
 b=Yil5FOpEAiX2iBv7hF5adv6/YqeXZjBEErIm5Q5OHWxTtQNCBYduvE3bfpPpE8sXbH
 4Eoj35ty6I4OlFevr5Of7LBCXs1Y+xTAb06vGfZaB4q82nTacTivE5qam1kcIfp9xYei
 3X8ZUtuFJ1f1WK9GZFCUV7R+zv7fhHQ6l8eFSoC/l6njMHE/iJUg/dgDuBQ9WvQ0HC8a
 xx7YjNX4oxQRgLjU4RK9BTmKrn3RSUFU8hd6t6wVAji/kCvim0KuorG41BZYQ7YSg2sS
 jhz+lNLeeNNEGOqYcZDdNmGYQqFkTj4SmJ60l0i6JygorlTmz3yTyFSHJ608enhFLFXL
 AfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702874302; x=1703479102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYUGIF33nzOuEVqpkxlZR0N1egiN1v7BwFeFgckKDBY=;
 b=Ya+lHVHNWK7gWA0z6p7hH3U2aGxcms9gQ9qzaUsu7vwybS6dTQC/QO/983rewAyRU6
 Eoi9x8MwrCuOHKGZj8/u/wX2VFW7gY36DY33mH28xcpm6AdfTaFnwo15aJs/vru9Peh/
 A9n3ogL14t/af1N7vemG0BenuEnK4mWZHs7ti1ZH9T1u3mlT5uxq6dLovMoAjybHJ49U
 CyUBK+V/vEUkdZUeaqCt/u0/REcMGj1GKAB5pMg20qw7hKhu/mEh8efDpkMdn8S5IBDE
 KbGEhdEWo3kNUpfDNg4PEXxqqIqAPpJENvfiErhZAwsm+g4Jp45YwipQobYrP75tynIl
 BYhw==
X-Gm-Message-State: AOJu0YzwMXYC2TAc6AAMLL9cfkW2nlblg4ptP59Hgn56dXQjcQK7pzkf
 bERMwQ5i1PQcRwkcg3Jk0szL/f2zmv4xHp7wDaY=
X-Google-Smtp-Source: AGHT+IFaZt+hQTTUzv6fmahh+IuEbV92EaoPD7uHXrhDMMC10rNnQYmjqteAYrISDvtfzKSSkcG9XxzlKTgk9H1JvOo=
X-Received: by 2002:a05:6122:3214:b0:4b6:bc91:92d with SMTP id
 ci20-20020a056122321400b004b6bc91092dmr585908vkb.15.1702874301879; Sun, 17
 Dec 2023 20:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20231208-sponge-thickness-c0e9511b1baf@spud>
In-Reply-To: <20231208-sponge-thickness-c0e9511b1baf@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 14:37:55 +1000
Message-ID: <CAKmqyKNmepRv7i43U-2V2LYzkQB1bG9WWvS1PUJdrF3ynX5NmQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: support new isa extension detection devicetree
 properties
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Fri, Dec 8, 2023 at 10:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
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
> ---
> Changes in v2:
> - use g_strdup() for multiletter extension string copying
> - wrap stuff in #ifndef to prevent breaking the user mode build
> - rename riscv_isa_set_props() -> riscv_isa_write_fdt()
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
>  hw/riscv/sifive_u.c |  7 ++-----
>  hw/riscv/spike.c    |  6 ++----
>  hw/riscv/virt.c     |  6 ++----
>  target/riscv/cpu.c  | 50 +++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h  |  1 +
>  5 files changed, 57 insertions(+), 13 deletions(-)
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
> index c7fc97e273..05beb0a297 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -238,7 +238,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *ms =3D MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> +    char *cpu_name, *core_name, *intc_name, *sv_name;
>      bool is_32_bit =3D riscv_is_32bit(&s->soc[0]);
>      uint8_t satp_mode_max;
>
> @@ -259,9 +259,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
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
> index 83c7c0cf07..ce413b9f00 100644
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
> @@ -1735,6 +1736,55 @@ char *riscv_isa_string(RISCVCPU *cpu)
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
> +    for (const RISCVIsaExtData *edata =3D isa_edata_arr; edata && edata-=
>name; edata++) {
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
> +
> +    riscv_isa =3D riscv_isa_string(cpu);
> +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", riscv_isa);
> +
> +    snprintf(isa_base, maxlen, "rv%di", TARGET_LONG_BITS);

This should dynamically come from misa_mxl_max not the compile time target

Alistair

> +    qemu_fdt_setprop_string(fdt, nodename, "riscv,isa-base", isa_base);
> +
> +    isa_extensions =3D riscv_isa_extensions_list(cpu, &count);
> +    qemu_fdt_setprop_string_array(fdt, nodename, "riscv,isa-extensions",
> +                                  isa_extensions, count);
> +
> +    for (int i =3D 0; i < count; i++) {
> +        g_free(isa_extensions[i]);
> +    }
> +}
> +#endif
> +
>  static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
>  {
>      ObjectClass *class_a =3D (ObjectClass *)a;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf58b0f0b5..5bbce607c4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -496,6 +496,7 @@ void riscv_cpu_list(void);
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

