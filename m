Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3C3CD13CF
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:51:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3Pf-0005NT-BW; Sun, 17 Sep 2023 21:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3Pb-0005Mv-Bn; Sun, 17 Sep 2023 21:50:56 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3PX-0002td-SA; Sun, 17 Sep 2023 21:50:54 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7a8b5ec9a6fso554733241.2; 
 Sun, 17 Sep 2023 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695001850; x=1695606650; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9w5ZXGKeG5dokRCRd2H0b/+bJrchSbN4oHQDLHZnb0w=;
 b=j58GbTydkjc5EsLKymQfIFeVaa7o16yzjaHrTnUCdyG4KLgxOw5F53MlebBuZwGXb/
 IWH4JVQlGCQ9IphEC+csMMGzkbdHtjlqUEwXkGGE6n9uR+8qGTZEVRFWHaFctsvvqw6u
 aY0iWxZUX6cB4IOgp1jX3uKhpgBI2zsUf/gv4240HrtkSsMSIIyv2TZS9aO0KiAOYLE9
 flmEZ1Gjd+v16cN4mQjC0BGcakqHSj81GpgT8v2vMwpJnpqTot1Kw/V5zBcjWozmGVcH
 Fv2bc7v7aQQMzeJxvIK7sv0ad/97yZL3QB7CX6PrEmCryuG4UC+sgFsHtjCb91ybxzCg
 sj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695001850; x=1695606650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9w5ZXGKeG5dokRCRd2H0b/+bJrchSbN4oHQDLHZnb0w=;
 b=HjTWFwmxAH+AuMSHesyrrdSCadZLeusTQiUMC+FyCJqAp66cbSM8q1xCVWwmmAKPWU
 K9qqREgyq7iUkjAf2Coc5nlJ6lyQXewfLmXl+y25dibgEg750AHtO1jKgF0ywN8MAF9f
 lzIuNQvRIeCIUaxYtKEzYpeM4bdKna+6kDKLGXl9QtZ3N1W2d0YOQEAAaokRHU3eLlHp
 sOx26quKTEcVankWJ9hvVGTZES4zsO78/Yu+u3prz7EsPWfemeq0ei9mQtTmCe6f8toy
 tnja5D1WQ5rfzJ3bNCh/fRwMcHagFWpWLVUEol68qBj9PG/8LW6TMFRv04luRiQKd8h6
 8xrA==
X-Gm-Message-State: AOJu0YwGiuTRf6E5FVYTbRNoStDlVcYVLFmdabXfnf7gJCr3Q/ZVugWC
 hktQWvr5u8OCNvRgRvOYa0tRxvGdf2aDsT5iqKFgGEDvArU=
X-Google-Smtp-Source: AGHT+IHhylMLZ5mlvIrEBDPQfyKJEriiQBybD2mrEEJGXYRjRfV2aoM17k4T1O5uhQTVc3WFGALwl8WHxgkGziIOT+8=
X-Received: by 2002:a67:d00b:0:b0:44d:5105:b143 with SMTP id
 r11-20020a67d00b000000b0044d5105b143mr6669391vsi.27.1695001850283; Sun, 17
 Sep 2023 18:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230914080740.7561-1-nikita.shubin@maquefel.me>
 <20230914080740.7561-2-nikita.shubin@maquefel.me>
In-Reply-To: <20230914080740.7561-2-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:50:23 +1000
Message-ID: <CAKmqyKN9vBu0aGtov1qy6RvavZ57-c4J+dSwZxZwsiwyQ3gyTQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] hw/riscv: hart: replace array access with
 qemu_get_cpu()
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Sunil V L <sunilvl@ventanamicro.com>, Nikita Shubin <n.shubin@yadro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 14, 2023 at 6:09=E2=80=AFPM Nikita Shubin <nikita.shubin@maquef=
el.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Replace all RISCVHartArrayState->harts[idx] with
> qemu_get_cpu()/cpu_by_arch_id().

Thanks for the patch

Why do we want this change though?

>
> cpu_index is guaranteed to be continuus by cpu_get_free_index(), so they
> can be accessed in same order they were added.
>
> "Hart IDs might not necessarily be numbered contiguously in a
> multiprocessor system, but at least one hart must have
> a hart ID of zero."
>
> This states that hart ID zero should always be present, this makes using
> cpu_by_arch_id(0) safe.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  hw/riscv/boot.c            |  6 ++++--
>  hw/riscv/sifive_u.c        |  7 +++++--
>  hw/riscv/spike.c           | 17 ++++++++++-------
>  hw/riscv/virt-acpi-build.c |  2 +-
>  hw/riscv/virt.c            | 17 +++++++++--------
>  5 files changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..041f966e58 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,8 @@
>
>  bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
> +    RISCVCPU *hart =3D RISCV_CPU(cpu_by_arch_id(0));
> +    return hart->env.misa_mxl_max =3D=3D MXL_RV32;
>  }
>
>  /*
> @@ -385,6 +386,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine,=
 RISCVHartArrayState *harts
>                                 uint64_t fdt_load_addr)
>  {
>      int i;
> +    RISCVCPU *hart =3D RISCV_CPU(cpu_by_arch_id(0));
>      uint32_t start_addr_hi32 =3D 0x00000000;
>      uint32_t fdt_load_addr_hi32 =3D 0x00000000;
>
> @@ -414,7 +416,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine,=
 RISCVHartArrayState *harts
>          reset_vec[4] =3D 0x0182b283;   /*     ld     t0, 24(t0) */
>      }
>
> -    if (!harts->harts[0].cfg.ext_icsr) {
> +    if (!hart->cfg.ext_icsr) {
>          /*
>           * The Zicsr extension has been disabled, so let's ensure we don=
't
>           * run the CSR instruction. Let's fill the address with a non
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..3d09d0ee0e 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -168,6 +168,7 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
>      for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu--) {
> +        RISCVCPU *hart;
>          int cpu_phandle =3D phandle++;
>          nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
> @@ -180,9 +181,11 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>              } else {
>                  qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "risc=
v,sv48");
>              }
> -            isa =3D riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> +            hart =3D RISCV_CPU(qemu_get_cpu(cpu - 1));
> +            isa =3D riscv_isa_string(hart);

This doesn't look right. The existing code accesses the u_cpus/e_cpus.
The new code doesn't do that. You need to change this offset based on
the number of e/u cpus (depending on order).

Alistair

>          } else {
> -            isa =3D riscv_isa_string(&s->soc.e_cpus.harts[0]);
> +            hart =3D RISCV_CPU(qemu_get_cpu(0));
> +            isa =3D riscv_isa_string(hart);
>          }
>          qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 81f7e53aed..f3ec6427a1 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -97,29 +97,32 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
>      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
>
>      for (socket =3D (riscv_socket_count(ms) - 1); socket >=3D 0; socket-=
-) {
> +        uint32_t num_harts =3D s->soc[socket].num_harts;
> +        uint32_t hartid_base =3D s->soc[socket].hartid_base;
> +
>          clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
>          qemu_fdt_add_subnode(fdt, clust_name);
>
> -        clint_cells =3D  g_new0(uint32_t, s->soc[socket].num_harts * 4);
> +        clint_cells =3D  g_new0(uint32_t, num_harts * 4);
>
> -        for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
> +        for (cpu =3D num_harts - 1; cpu >=3D 0; cpu--) {
> +            int cpu_index =3D hartid_base + cpu;
> +            RISCVCPU *hart =3D RISCV_CPU(qemu_get_cpu(cpu_index));
>              cpu_phandle =3D phandle++;
>
> -            cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
> -                s->soc[socket].hartid_base + cpu);
> +            cpu_name =3D g_strdup_printf("/cpus/cpu@%d", cpu_index);
>              qemu_fdt_add_subnode(fdt, cpu_name);
>              if (is_32_bit) {
>                  qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv32");
>              } else {
>                  qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv48");
>              }
> -            name =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
> +            name =3D riscv_isa_string(hart);
>              qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
>              g_free(name);
>              qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv"=
);
>              qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
> -            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> -                s->soc[socket].hartid_base + cpu);
> +            qemu_fdt_setprop_cell(fdt, cpu_name, "reg", cpu_index);
>              qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu")=
;
>              riscv_socket_fdt_write_id(ms, cpu_name, socket);
>              qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..d885220cc9 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -158,7 +158,7 @@ static void build_rhct(GArray *table_data,
>      isa_offset =3D table_data->len - table.table_offset;
>      build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
>
> -    cpu =3D &s->soc[0].harts[0];
> +    cpu =3D RISCV_CPU(cpu_by_arch_id(0));
>      isa =3D riscv_isa_string(cpu);
>      len =3D 8 + strlen(isa) + 1;
>      aligned_len =3D (len % 2) ? (len + 1) : len;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5edc1d98d2..f3132ecc1b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -239,16 +239,18 @@ static void create_fdt_socket_cpus(RISCVVirtState *=
s, int socket,
>      uint32_t cpu_phandle;
>      MachineState *ms =3D MACHINE(s);
>      char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> +    uint32_t num_harts =3D s->soc[socket].num_harts;
> +    uint32_t hartid_base =3D s->soc[socket].hartid_base;
>      bool is_32_bit =3D riscv_is_32bit(&s->soc[0]);
>      uint8_t satp_mode_max;
>
> -    for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
> -        RISCVCPU *cpu_ptr =3D &s->soc[socket].harts[cpu];
> +    for (cpu =3D num_harts - 1; cpu >=3D 0; cpu--) {
> +        int cpu_index =3D hartid_base + cpu;
> +        RISCVCPU *cpu_ptr =3D RISCV_CPU(qemu_get_cpu(cpu_index));
>
>          cpu_phandle =3D (*phandle)++;
>
> -        cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
> -            s->soc[socket].hartid_base + cpu);
> +        cpu_name =3D g_strdup_printf("/cpus/cpu@%d", cpu_index);
>          qemu_fdt_add_subnode(ms->fdt, cpu_name);
>
>          if (cpu_ptr->cfg.satp_mode.supported !=3D 0) {
> @@ -275,8 +277,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv"=
);
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
> -        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
> -            s->soc[socket].hartid_base + cpu);
> +        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg", cpu_index);
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "device_type", "cpu")=
;
>          riscv_socket_fdt_write_id(ms, cpu_name, socket);
>          qemu_fdt_setprop_cell(ms->fdt, cpu_name, "phandle", cpu_phandle)=
;
> @@ -717,12 +718,12 @@ static void create_fdt_pmu(RISCVVirtState *s)
>  {
>      char *pmu_name;
>      MachineState *ms =3D MACHINE(s);
> -    RISCVCPU hart =3D s->soc[0].harts[0];
> +    RISCVCPU *hart =3D RISCV_CPU(qemu_get_cpu(0));
>
>      pmu_name =3D g_strdup_printf("/pmu");
>      qemu_fdt_add_subnode(ms->fdt, pmu_name);
>      qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu"=
);
> -    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
> +    riscv_pmu_generate_fdt_node(ms->fdt, hart->cfg.pmu_num, pmu_name);
>
>      g_free(pmu_name);
>  }
> --
> 2.39.2
>
>

