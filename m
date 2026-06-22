Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C5CDB46B
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 05:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbWoS-0005To-4R; Mon, 22 Jun 2026 01:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWoR-0005TU-1v
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 01:03:11 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWoP-0000P4-0P
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 01:03:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c08922c23ebso435296366b.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 22:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782104587; cv=none;
 d=google.com; s=arc-20240605;
 b=C8Kl1a1Apv8sQp8Tiyir1xKiOTBjdY+H3mEoeS9cd31IvE8Y484UPOaTWlcse/NKO1
 V4BcP7z9zHIqRgBNCQs/QJKWCYUZThbRB2qXRJbytHPnKsrZQBtiWuBqGiP10C5omrOP
 w6rBfp8vhODvcKWOoAZ4qF8bdOodR3ObQM87kSxyrc0OaDisJTY4W27wWH6dyDeQInSf
 Oa6jTry67jQADhLIgduvkPOvqpac634W8NrtAUAVYcZzbNeuE3qJno2EIKSExPKFpuwy
 nTnNhCofkNzVcy0Xmtz01lh+IPiKSdzorPJqYGzyCpsWUSX8jVr2Hhdz6olj+Jrhg/n4
 mmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LZ/pK/qrosauCgvZFW7TUEv2Sjon1rM1h6qrA9dYw70=;
 fh=toAstsxmYGAhIYX1eKghSROwUNXGRhGyTTY8Vals/bw=;
 b=P8QNjDFGF5H5hg8Y60sRniSdEcQbSTvGjyddvJmPylpagqjiKL2GrnhfxLj/xZTvfz
 3YOwcdJI+KFNSes5E9FU4EoBqa07jbQrWVRSaO/LPLTX2+Rbqkcjjt4+FrTdYaI/LsUi
 /Hf6wNJwOMiK1dQ2MwH9d/s3fWCbfe8Fwq2rzc6An+hsghAM4gaUBilyzVs5dE/cSNqH
 kqDY4EXpXgFNvXq6ekZ6ZsFB2KEXSekHnggVK5wF1ZhNY0DvXzMggrueps64qp9EV2qS
 /YWalp2Y3XAEc+z+rWVr475nz6vWxIf9wWIWAR7I1rgWjzuJrXjLYXCMMSzODmkHYmrS
 fzVA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782104587; x=1782709387; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZ/pK/qrosauCgvZFW7TUEv2Sjon1rM1h6qrA9dYw70=;
 b=USQmSVPMNyNOkzHcns6w09698GRadM+OsMMZHanhnn+A6VV9FJM8CyRACJfCoxQpFW
 lmsVt/ImiJ6xHlhfVw9xjGbXNX6xXuau/EvnowfbRpR0bPIEuCh/S0ZKYCwDzd98WgBC
 WH7n3nZUSd2AbW/mEIvJ8sNz//ry5GOX8y8uOjb2jExfr5NcV3Lx9n42J6iO7lUVfCMA
 FpMYJDnybZEw2xiNOL2yUzwXezCN/cgGBsuDrqY9IGx6OLAC9HI+lHfwgGgFM9vF6sL+
 5tneltx8osOA2rlcsSMerpsMZZOiqFUVFr16UXixZsh3vJqguKg8OK3dFXRPovLv7yH/
 qW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782104587; x=1782709387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LZ/pK/qrosauCgvZFW7TUEv2Sjon1rM1h6qrA9dYw70=;
 b=q9b0xG5Olut0Qov1iis2o1WznPEGuqNLhUwVQako/o9AWjZCWp/Fj1dJSYlKk4cQ/e
 wls8UuC09ZNHvGNce9+ccwiGkbcU1Is+fO0FAHH7KYrtojyVXhVbTVAFB8M6TR39Rb70
 UVqSJXhl0IPIAorc112MjtpMssLOIO1lQ/4s9aunlZkYLVlcjgCXrOd4y2Qlexedfy52
 iT3v1ZBD6dQ3c0KBQYsj4GGed7z9PvBS53oDwhwYpBvyBtSZvZZCq9TDYKb1Q9KwRcnw
 jmB2UiEulAV8rX4Uw1ylh+XTXmksU5bwX7cI952XPiBeuZQKBgOMMrsl9KeNh904xY/Y
 ZYSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ850ILL04+zaNSGaDGp6cckZr8dFySxFzWBs2tGMqOTnysV385CHRGSJcYG+ChPbwgW7WDl0vrFUE3N@nongnu.org
X-Gm-Message-State: AOJu0YwRs7/NYX8SdqKo3XfxElSIMNP5rgWFIEC8FbrL0/odtj/EZneq
 X752JAnzK7xmLMViztzmH2MK2Lh9q+cZnByoOs4JdDcxXmX/1kkMXxLQ8o83fg5Dt9+tjsoXjKi
 kOONW8ewsW9AgMmDcMYyme5C0Qrxxw5U=
X-Gm-Gg: AfdE7clwSsEWrmxeU3G/HJqcIejaImZsguQ7x2ogAuP5G9zp9N1vQ842wqp8UpkqeEx
 iOcS3IpXn109iwexKo7LOUdOTrRnT5mL6HiW7YLUnY+aCaoiyysudCYW86yzqIhgZLYqX3zQHlQ
 n/kvJiXh86r/RDnFO8v0Gm2iYQd23s2Q9jhpmwyM8wuUqT/WuollWobttn3vciFfvhpkgXoSt9G
 3AwXA7RrTYeGEewmGzWzOaXbCu/fmKZAXrRCHeuzlFeq4+yGzfqrG5QuuL+BBjA/uqX1mkqHaMs
 l5ucCapOyndjTrFL5QX0pnlMx58=
X-Received: by 2002:a17:907:8b8a:b0:bd3:cb24:ae61 with SMTP id
 a640c23a62f3a-c0b601eaa1cmr503084366b.6.1782104586573; Sun, 21 Jun 2026
 22:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-6-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260616235939.1358663-6-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 15:02:39 +1000
X-Gm-Features: AVVi8CeMYzaLvzlFdXpH3IVCZYMDzLxyndXnJtF0DWbXJ0Gj3S0Ehjg64-BKmTc
Message-ID: <CAKmqyKP_CuDeoTYyz73jM_UiQGsUW06yLTEJsnMRSnuCQYWbxw@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/riscv: add create_fdt_plic() helper
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
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

On Wed, Jun 17, 2026 at 10:01=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Consolidate the common plic FDT code between 'virt' and sifive_u boards
> into a single place.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/fdt-common.c         | 30 +++++++++++++++++++++
>  hw/riscv/sifive_u.c           | 34 +++++++-----------------
>  hw/riscv/virt.c               | 49 ++++++++++++-----------------------
>  include/hw/riscv/fdt-common.h |  5 ++++
>  4 files changed, 61 insertions(+), 57 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index b27ff13bca..e0e31af09b 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -200,3 +200,33 @@ create_fdt_socket_cpu_sifive(void *fdt, char *clust_=
name,
>                                     socket_id, socket_hartid_base,
>                                     phandle, intc_phandles, false, false)=
;
>  }
> +
> +void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
> +                     uint32_t plic_phandle, uint32_t int_cells,
> +                     uint32_t addr_cells, uint32_t *plic_cells,
> +                     uint32_t cells_size, uint32_t ndev_sources,
> +                     bool numa_enabled, int socket_id)
> +{
> +    g_autofree char *nodename =3D NULL;
> +    static const char * const plic_compat[2] =3D {
> +        "sifive,plic-1.0.0", "riscv,plic0"
> +    };
> +
> +    nodename =3D g_strdup_printf("/soc/interrupt-controller@%"HWADDR_PRI=
x, addr);
> +
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", int_cells);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", addr_cells);
> +    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> +        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> +    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> +                     plic_cells, cells_size);
> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> +                                 2, addr, 2, size);
> +    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", ndev_sources);
> +    if (numa_enabled) {
> +        qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", socket_id);
> +    }
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
> +}
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7dfc18d3ec..d923f041e0 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -100,14 +100,11 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>      MachineState *ms =3D MACHINE(s);
>      void *fdt;
>      int cpu;
> -    uint32_t *cells;
> +    uint32_t *cells, cells_length;
>      char *nodename;
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle =3D 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>      static const char * const ethclk_names[2] =3D { "pclk", "hclk" };
> -    static const char * const plic_compat[2] =3D {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
>      g_autofree uint32_t *intc_phandles =3D g_new0(uint32_t, ms->smp.cpus=
);
>      g_autofree char *clust_name =3D NULL;
>
> @@ -197,7 +194,8 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>      g_free(nodename);
>
>      plic_phandle =3D phandle++;
> -    cells =3D  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
> +    cells_length =3D ms->smp.cpus * 4 - 2;
> +    cells =3D  g_new0(uint32_t, cells_length);
>      for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
>          /* cpu 0 is the management hart that does not have S-mode */
>          if (cpu =3D=3D 0) {
> @@ -210,26 +208,14 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>              cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_S_EXT);
>          }
>      }
> -    nodename =3D g_strdup_printf("/soc/interrupt-controller@%lx",
> -        (long)memmap[SIFIVE_U_DEV_PLIC].base);
> -    qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
> -                          SIFIVE_U_PLIC_INT_CELLS);
> -    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
> -                          SIFIVE_U_PLIC_ADDR_CELLS);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> -    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> -    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_PLIC].base,
> -        0x0, memmap[SIFIVE_U_DEV_PLIC].size);
> -    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
> -                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
> -    qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
> +
> +    create_fdt_plic(fdt, memmap[SIFIVE_U_DEV_PLIC].base,
> +                    memmap[SIFIVE_U_DEV_PLIC].size,
> +                    plic_phandle, SIFIVE_U_PLIC_INT_CELLS,
> +                    SIFIVE_U_PLIC_ADDR_CELLS, cells,
> +                    cells_length * sizeof(uint32_t),
> +                    SIFIVE_U_PLIC_NUM_SOURCES - 1, false, 0);
>      g_free(cells);
> -    g_free(nodename);
>
>      gpio_phandle =3D phandle++;
>      nodename =3D g_strdup_printf("/soc/gpio@%lx",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fa464e644f..92c30a6f4c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -326,39 +326,25 @@ static void create_fdt_socket_plic(RISCVVirtState *=
s,
>      int cpu;
>      g_autofree char *plic_name =3D NULL;
>      g_autofree uint32_t *plic_cells;
> -    unsigned long plic_addr;
>      MachineState *ms =3D MACHINE(s);
> -    static const char * const plic_compat[2] =3D {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
> +    unsigned long plic_addr =3D s->memmap[VIRT_PLIC].base +
> +                              (s->memmap[VIRT_PLIC].size * socket);
> +    bool numa_enabled =3D riscv_numa_enabled(MACHINE(s));
> +    uint32_t cells_length;
>
> -    plic_phandles[socket] =3D (*phandle)++;
> -    plic_addr =3D s->memmap[VIRT_PLIC].base +
> -                (s->memmap[VIRT_PLIC].size * socket);
>      plic_name =3D g_strdup_printf("/soc/interrupt-controller@%lx", plic_=
addr);
> -    qemu_fdt_add_subnode(ms->fdt, plic_name);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name,
> -        "#interrupt-cells", FDT_PLIC_INT_CELLS);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name,
> -        "#address-cells", FDT_PLIC_ADDR_CELLS);
> -    qemu_fdt_setprop_string_array(ms->fdt, plic_name, "compatible",
> -                                  (char **)&plic_compat,
> -                                  ARRAY_SIZE(plic_compat));
> -    qemu_fdt_setprop(ms->fdt, plic_name, "interrupt-controller", NULL, 0=
);
>
>      if (kvm_enabled()) {
> -        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +        cells_length =3D s->soc[socket].num_harts * 2;
> +        plic_cells =3D g_new0(uint32_t, cells_length);
>
>          for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
>              plic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
>              plic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
>          }
> -
> -        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> -                         plic_cells,
> -                         s->soc[socket].num_harts * sizeof(uint32_t) * 2=
);
>     } else {
> -        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
> +        cells_length =3D s->soc[socket].num_harts * 4;
> +        plic_cells =3D g_new0(uint32_t, cells_length);
>
>          for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
>              plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> @@ -366,19 +352,16 @@ static void create_fdt_socket_plic(RISCVVirtState *=
s,
>              plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
>              plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
>          }
> -
> -        qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
> -                         plic_cells,
> -                         s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
>      }
>
> -    qemu_fdt_setprop_sized_cells(ms->fdt, plic_name, "reg",
> -                                 2, plic_addr, 2, s->memmap[VIRT_PLIC].s=
ize);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name, "riscv,ndev",
> -                          VIRT_IRQCHIP_NUM_SOURCES - 1);
> -    riscv_socket_fdt_write_id(ms, plic_name, socket);
> -    qemu_fdt_setprop_cell(ms->fdt, plic_name, "phandle",
> -        plic_phandles[socket]);
> +    plic_phandles[socket] =3D (*phandle)++;
> +
> +    create_fdt_plic(ms->fdt, plic_addr, s->memmap[VIRT_PLIC].size,
> +                    plic_phandles[socket], FDT_PLIC_INT_CELLS,
> +                    FDT_PLIC_ADDR_CELLS, plic_cells,
> +                    cells_length * sizeof(uint32_t),
> +                    VIRT_IRQCHIP_NUM_SOURCES - 1,
> +                    numa_enabled, socket);
>
>      if (!socket) {
>          platform_bus_add_all_fdt_nodes(ms->fdt, plic_name,
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.=
h
> index 2d6b9a5d03..017278b611 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -30,4 +30,9 @@ void create_fdt_socket_cpu_sifive(void *fdt, char *clus=
t_name,
>                                    int cpu_id, int socket_id,
>                                    int socket_hartid_base, uint32_t *phan=
dle,
>                                    uint32_t *intc_phandles);
> +void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
> +                     uint32_t plic_phandle, uint32_t int_cells,
> +                     uint32_t addr_cells, uint32_t *plic_cells,
> +                     uint32_t cells_size, uint32_t ndev_sources,
> +                     bool numa_enabled, int socket);
>  #endif
> --
> 2.43.0
>
>

