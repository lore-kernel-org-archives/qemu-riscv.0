Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A052DCD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:15:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKGl-0000pW-PV; Mon, 15 Jun 2026 23:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKGk-0000p9-27
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:15:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKGh-0001yc-Jl
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:15:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-68acf0a15b3so6184918a12.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579713; cv=none;
 d=google.com; s=arc-20240605;
 b=NfesOG69d4kLcxMadmMQmuB99ITIrlqfd7olgBl8GrfDj3en+81pldxl7ajfLMpitk
 rX+E3V1hylHIA0QALreaNyFueJjWfZUxOTintfibqDJxBGOf97bOHBjNVNNene5mAOzJ
 KwbKZGEbYiOoE94KM7H3p/Y02ZI2SmdOV4dV8iMiOdhKJXCjEUtcYrK/c4YNsbx/I/3w
 GiSNtd4kZX0VRtYGS93SZ7qdvPkAU9kKI1oWttuoFMfCzKwhJQj5tGGK4wXVkD8TdfrG
 3cBH1xwqM3TjzHaI0zNSHWvPArgQ79ITfVaqpmIgoFicku5cTYtvyBQDkGHAMXHTfXTS
 aM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2//7fekKtdDPkgBvtLRGOmWSThEKpL0MI6l5G2YadNg=;
 fh=rVedaLcyba/r7QsUhoKXoMS2tFGUPMt+l4Oe1If/kpY=;
 b=lRAAZvTrk9j8pLqLAk3/TKOcu+ZB+fKinWPlwW3cgKAWP8PI+9kTUByy7ZfT5mTRr7
 bRbAj3u5ApLSMpwEbGU5yghE9wEZNC7BXVK4tu6bPjpGAr+whPePWwwi4GMoz/mAzS1i
 /CsTwY7d8ZR59+SLor1+ZzEt9w57sUlNq2MydUjdoGrUbEfrAkmmXUtGWf7InYU+82oc
 SClotWSYLy0tuYFVtVUKjrzZHSsFiG4YXOdKIKWOgAM76fenzw79RonQiY4tXLpqjK0x
 u0JvGS1XtwgSGawPKwLzBYHMqQqySXnmvPRgZTsY7WvLNyik6mAAtD9/HYyzB3oBN0pn
 kz7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579713; x=1782184513; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2//7fekKtdDPkgBvtLRGOmWSThEKpL0MI6l5G2YadNg=;
 b=Edj1zrqWvf8SkGs8Xd2pkzXziB6wGUjmnQG0SdkDwO5djEg2YBCnMcIDJnqSnga74c
 JVxpd6fSo1GxNOfy2bVkwYFW8AYYtj/hNqvvmaJbRC9mlV8LEo9q4MBVeZCsSTaa1eG1
 9aJwySgxyhhLj1GNKupJIXvX55xriO8vb9qrRBqVo6sn/e+bDbOSlGnjXMhJdaCWoAyi
 jHAYzm9nxOUExfllo6HbfLD9NTDoC2jwpwHwomWhjUQC8JoeO1LLGQ3oeR1vI8FMvRbt
 /8NnIubJU+83xGHU1BGAFoA0Er3U0fZXjtkCGNIEYeSl8K3V2YbLAh42kye44qmbimt+
 pcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579713; x=1782184513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2//7fekKtdDPkgBvtLRGOmWSThEKpL0MI6l5G2YadNg=;
 b=qQW6E5z0n6+PFJji4DIagLKmDC5cOgHkzSPhK5jGj7EcOMmL2r/UZfczLiESFo89la
 9og9fmWhQspDUyDM1m2x58Khj8D1O0vfRyDmnxspxJgSQvgUaps/dngs9HIG1PhyHPGl
 95w0sgBAg63T2jhQ4yAWD54aOnclnxGQEmlOIlhMtiNFjCP5jcAAaclXh9HLmXQ8jzo6
 OFi6tNzUvJzFyxbT4DLd+KV61FWSWFyqYEac6Horp5/oDDfRyyEOPvIlI4DCYmAnUrVF
 PykXyFl4mdfG8auVY1SHDy+e1at7XOQBxXTe1jxrCvnZsnh64myDewWGMFLmQZFE7aOx
 xSCQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DYiyBdPUJK77bHRa0xBt7KmSDGDQUMFfzoDWIW/E6+TsPIyFNfghAxu1nUqsU5C2A1J2rCQqFpeES@nongnu.org
X-Gm-Message-State: AOJu0YzigGbyJp88sbxgv1iD9cAv6nJn/wYE7oVg03Jdb+/oOqJTmJR7
 QRbYzk3tb9Svze4qGLOUQC6xBjxceyZG7KYOIcq67/1iMhXpv4PDCJYqX5Jxy7xDjlVvWGLb7mT
 dn5YLmB6weQLYPnTLRqErWyftn5eyma0=
X-Gm-Gg: Acq92OHg/ZgZagdQ8mq9+eujYnUUBWdQMXHzSXC/DPGrrcglBK1Sw+v0R/NQ+daUDid
 lByPqOJ7IFrYAgVaOiR0+CbbsquBMtowtvjmKgRc3zMSoK3aG2TDOJCgvwH//xAnJWIoSq3nuGs
 ZlDD5mMjLq/kEgJz/5p1+kgUcrVODujHb1yejeT9DL5fdEvwXs+8DJqvNqxFUnEbZvw6B0KlS5R
 Kqr77iL5W46bjf3yswMbsqNYlKJwQvs8VBXxk1BVqq81V5u+nXwobeRUXY0qFr9nmCFDWVkD0LC
 MtCQ28Ps5zKM5YrwKtz7usX6OEII6BSBVCzAh9w644Nsmzgb
X-Received: by 2002:a05:6402:1ec7:b0:691:7054:8c6a with SMTP id
 4fb4d7f45d1cf-695087df672mr793580a12.20.1781579712706; Mon, 15 Jun 2026
 20:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-8-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-8-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:14:44 +1000
X-Gm-Features: AVVi8Cf-txzAHHbpjJBy1yrNFquJBwPseazDhfxWYZrzZWPVQnyzaC8acLSTyz4
Message-ID: <CAKmqyKOVtBTwY1Wpv5KGvEM12H6hMa1=ySfQwjK1gDrXQhC-ng@mail.gmail.com>
Subject: Re: [PATCH 07/13] hw/riscv: add create_fdt_clint() helper
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
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

On Tue, Jun 16, 2026 at 6:42=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Move all clint FDT generation to fdt-common.c reducing code repetition.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/fdt-common.c         | 33 +++++++++++++++++++++++++
>  hw/riscv/sifive_u.c           | 25 +++----------------
>  hw/riscv/spike.c              | 31 ++++-------------------
>  hw/riscv/virt.c               | 46 ++++++-----------------------------
>  include/hw/riscv/fdt-common.h |  5 ++++
>  5 files changed, 54 insertions(+), 86 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index 719c36e001..d2661ec389 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -12,6 +12,7 @@
>  #include "system/device_tree.h"
>  #include "hw/core/boards.h"
>  #include "hw/riscv/fdt-common.h"
> +#include "target/riscv/cpu_bits.h"
>
>  void *create_board_device_tree(const char *model, const char *compatible=
,
>                                 int *fdt_size)
> @@ -50,3 +51,35 @@ void create_fdt_socket_memory(void *fdt, hwaddr addr, =
uint64_t size,
>          qemu_fdt_setprop_cell(fdt, mem_name, "numa-node-id", socket_id);
>      }
>  }
> +
> +void create_fdt_socket_clint(void *fdt, hwaddr addr, uint64_t size,
> +                             int socket_id, uint32_t *intc_phandles,
> +                             int num_harts, bool numa_enabled)
> +{
> +    g_autofree uint32_t *clint_cells =3D g_new0(uint32_t, num_harts * 4)=
;
> +    g_autofree char *clint_name =3D NULL;
> +    static const char * const clint_compat[2] =3D {
> +        "sifive,clint0", "riscv,clint0"
> +    };
> +
> +    for (int cpu =3D 0; cpu < num_harts; cpu++) {
> +        clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> +        clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> +        clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
> +        clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> +    }
> +
> +    clint_name =3D g_strdup_printf("/soc/clint@%"HWADDR_PRIx, addr);
> +    qemu_fdt_add_subnode(fdt, clint_name);
> +    qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
> +                                  (char **)&clint_compat,
> +                                  ARRAY_SIZE(clint_compat));
> +    qemu_fdt_setprop_sized_cells(fdt, clint_name, "reg",
> +                                 2, addr, 2, size);
> +    qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> +                     clint_cells, num_harts * sizeof(uint32_t) * 4);
> +
> +    if (numa_enabled) {
> +        qemu_fdt_setprop_cell(fdt, clint_name, "numa-node-id", socket_id=
);
> +    }
> +}
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ce86989bc8..9a791b36d6 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -105,9 +105,6 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle =3D 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>      static const char * const ethclk_names[2] =3D { "pclk", "hclk" };
> -    static const char * const clint_compat[2] =3D {
> -        "sifive,clint0", "riscv,clint0"
> -    };
>      static const char * const plic_compat[2] =3D {
>          "sifive,plic-1.0.0", "riscv,plic0"
>      };
> @@ -180,25 +177,9 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>          g_free(nodename);
>      }
>
> -    cells =3D  g_new0(uint32_t, ms->smp.cpus * 4);
> -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> -        cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> -        cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> -        cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
> -        cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> -    }
> -    nodename =3D g_strdup_printf("/soc/clint@%lx",
> -        (long)memmap[SIFIVE_U_DEV_CLINT].base);
> -    qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_CLINT].base,
> -        0x0, memmap[SIFIVE_U_DEV_CLINT].size);
> -    qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, ms->smp.cpus * sizeof(uint32_t) * 4);
> -    g_free(cells);
> -    g_free(nodename);
> +    create_fdt_socket_clint(fdt, memmap[SIFIVE_U_DEV_CLINT].base,
> +                            memmap[SIFIVE_U_DEV_CLINT].size, 0,
> +                            intc_phandles, ms->smp.cpus, false);
>
>      nodename =3D g_strdup_printf("/soc/otp@%lx",
>          (long)memmap[SIFIVE_U_DEV_OTP].base);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 82005ec163..b15188fb07 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -58,13 +58,10 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
>      unsigned long clint_addr;
>      int cpu, socket;
>      MachineState *ms =3D MACHINE(s);
> -    uint32_t *clint_cells;
>      uint32_t cpu_phandle, phandle =3D 1;
> -    char *clint_name, *clust_name;
> +    char *clust_name;
>      char *core_name, *cpu_name, *intc_name;
> -    static const char * const clint_compat[2] =3D {
> -        "sifive,clint0", "riscv,clint0"
> -    };
> +    bool numa_enabled =3D riscv_numa_enabled(ms);
>
>      fdt =3D ms->fdt =3D create_board_device_tree("ucbbar,spike-bare,qemu=
",
>          "ucbbar,spike-bare-dev", &fdt_size);
> @@ -136,29 +133,11 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
>          create_fdt_socket_memory(fdt, memaddr, memsize, socket,
>                                   riscv_numa_enabled(ms));
>
> -        clint_cells =3D  g_new0(uint32_t, s->soc[socket].num_harts * 4);
> -
> -        for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> -            clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu])=
;
> -            clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> -            clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu])=
;
> -            clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> -        }
> -
>          clint_addr =3D memmap[SPIKE_CLINT].base +
>              (memmap[SPIKE_CLINT].size * socket);
> -        clint_name =3D g_strdup_printf("/soc/clint@%lx", clint_addr);
> -        qemu_fdt_add_subnode(fdt, clint_name);
> -        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
> -            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> -        qemu_fdt_setprop_cells(fdt, clint_name, "reg",
> -            0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
> -        qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> -            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
> -        riscv_socket_fdt_write_id(ms, clint_name, socket);
> -
> -        g_free(clint_name);
> -        g_free(clint_cells);
> +        create_fdt_socket_clint(fdt, clint_addr, memmap[SPIKE_CLINT].siz=
e,
> +                                socket, intc_phandles,
> +                                s->soc[socket].num_harts, numa_enabled);
>          g_free(clust_name);
>      }
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index df3eadef78..b134f11266 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -302,42 +302,6 @@ static void create_fdt_socket_cpus(RISCVVirtState *s=
, int socket,
>      }
>  }
>
> -static void create_fdt_socket_clint(RISCVVirtState *s,
> -                                    int socket,
> -                                    uint32_t *intc_phandles)
> -{
> -    int cpu;
> -    g_autofree char *clint_name =3D NULL;
> -    g_autofree uint32_t *clint_cells =3D NULL;
> -    hwaddr clint_addr;
> -    MachineState *ms =3D MACHINE(s);
> -    static const char * const clint_compat[2] =3D {
> -        "sifive,clint0", "riscv,clint0"
> -    };
> -
> -    clint_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
> -
> -    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> -        clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> -        clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
> -        clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
> -        clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
> -    }
> -
> -    clint_addr =3D s->memmap[VIRT_CLINT].base +
> -                 s->memmap[VIRT_CLINT].size * socket;
> -    clint_name =3D g_strdup_printf("/soc/clint@%"HWADDR_PRIx, clint_addr=
);
> -    qemu_fdt_add_subnode(ms->fdt, clint_name);
> -    qemu_fdt_setprop_string_array(ms->fdt, clint_name, "compatible",
> -                                  (char **)&clint_compat,
> -                                  ARRAY_SIZE(clint_compat));
> -    qemu_fdt_setprop_sized_cells(ms->fdt, clint_name, "reg",
> -        2, clint_addr, 2, s->memmap[VIRT_CLINT].size);
> -    qemu_fdt_setprop(ms->fdt, clint_name, "interrupts-extended",
> -        clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> -    riscv_socket_fdt_write_id(ms, clint_name, socket);
> -}
> -
>  static void create_fdt_socket_aclint(RISCVVirtState *s,
>                                       int socket,
>                                       uint32_t *intc_phandles)
> @@ -728,6 +692,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
>      uint32_t xplic_phandles[MAX_NODES];
>      g_autofree uint32_t *intc_phandles =3D NULL;
>      int socket_count =3D riscv_socket_count(ms);
> +    bool numa_enabled =3D riscv_numa_enabled(ms);
>
>      qemu_fdt_add_subnode(ms->fdt, "/cpus");
>      qemu_fdt_setprop_cell(ms->fdt, "/cpus", "timebase-frequency",
> @@ -762,8 +727,13 @@ static void create_fdt_sockets(RISCVVirtState *s,
>              create_fdt_socket_aclint(s, socket,
>                                       &intc_phandles[phandle_pos]);
>          } else if (tcg_enabled()) {
> -            create_fdt_socket_clint(s, socket,
> -                                    &intc_phandles[phandle_pos]);
> +            hwaddr clintaddr =3D s->memmap[VIRT_CLINT].base +
> +                               s->memmap[VIRT_CLINT].size * socket;
> +
> +            create_fdt_socket_clint(ms->fdt, clintaddr,
> +                                    s->memmap[VIRT_CLINT].size,
> +                                    socket, &intc_phandles[phandle_pos],
> +                                    s->soc[socket].num_harts, numa_enabl=
ed);
>          }
>      }
>
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.=
h
> index 81689f418b..6e81d6cd6c 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -13,4 +13,9 @@ void *create_board_device_tree(const char *model, const=
 char *compatible,
>                                 int *fdt_size);
>  void create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
>                                int socket_id, bool numa_enabled);
> +void create_fdt_clint(void *fdt, hwaddr addr, uint64_t size,
> +                      uint32_t *intc_phandles, int num_harts);
> +void create_fdt_socket_clint(void *fdt, hwaddr addr, uint64_t size,
> +                             int socket_id, uint32_t *intc_phandles,
> +                             int num_harts, bool numa_enabled);
>  #endif
> --
> 2.43.0
>
>

