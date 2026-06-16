Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F6ECD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 02:43:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZJlV-00023o-Ks; Mon, 15 Jun 2026 22:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZJlU-00023Z-BT
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 22:43:00 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZJlS-0001KG-Bp
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 22:43:00 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-beb2a97cc9aso762078066b.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 19:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781577777; cv=none;
 d=google.com; s=arc-20240605;
 b=PaaLLDR68ddgQau65eFgaRbsEEPY2cLUfb7dkanncSVEq/55eidYgnmhJHlBktxT/7
 FViYB1qZ3SXBRPkWW3Aa3gkrnxosyCEppB4NN0c5fRo/slqSWlCAs1Nj5LXditVztKC9
 a/l1FVWiq5J6QGNFYmU/xujK4i27e8d2xu52CytpxwPIa//8juOuy0Ai7d9KOUwvlr83
 +MWGM3u7/xYYb2PfFroDtT6wrMW1JfhlTZcHp71M/AbRuifUv55sj6p0mUofbbXMEr93
 SEQOB53kS7bJF8tpRq48WKHU0ECCBzKg6pwNHIn+RC17lnmdLdQHd9SWW4VS24P3yMzN
 N26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tr5s7Buxuq9f15DCOB5+a6BDYosGBWZk2lLo6oyVcwg=;
 fh=rO7w6iSmqgshIB/xAzuhGRXlWIZqGLBOIdq2cPZs1DQ=;
 b=GGv6mJxn8ONksOIvFYHzxyX8kdJov+YjQJAzJB3VtkB7C1y/X1OI+DBammQP5W+FfC
 //ITyL6NmvNfurCmMgxS05WtDkd3fOJbfyu/pxDCFiZoeNlV2SOyPNNwlcSDWA2Rusaz
 neNOZvANoNjLL6FQb9r+I4foyMJo4tDETYCqrUj8910dOGnV2Lcu6KmJxP0cBueE2q5w
 BaeoTApr0ZxQHhbQWTYKfGv2Z/wCsenUDN+yXgPqlus0WgnOD9OwUXqmZtfX+tatxrQM
 RDyrEPlxYYk+wS9d3WNu4mN7/Om7R9JC8d88kUHWu1v7VL2dFIBjBAB8aJBdfBhU78B5
 915A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781577777; x=1782182577; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tr5s7Buxuq9f15DCOB5+a6BDYosGBWZk2lLo6oyVcwg=;
 b=SgwHF9S/Lr15LL0ZLBG8HaaXceLDEzDoEzcthhV447PiayZYrpLEPPPR6+2zHRHZZC
 JsLp4fKknmdEr28sOg/vmZpyzTFNgmnKE2lp+qHEKF/NGw3dflGUnD3y0x/WarapB3W3
 z1/4TRq+g0X5gK1w3bTgbdq1MUckRuUJArcpVxg48+i6ocXgGWMPCLl9LF3rtl8xM9PG
 i5rjYM2P6xUiX2Dgx6hjSBU0a6+sayfkXUS0UBow9+Mdz92/yVIKDC3r6wpQGseGC7Bs
 8SCeRFY6MEtFBTYNng5XQncbJyxESgmQE2W/DMednaOoYaIYU5R5M/HoqSSAMZRK3GEs
 tm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781577777; x=1782182577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tr5s7Buxuq9f15DCOB5+a6BDYosGBWZk2lLo6oyVcwg=;
 b=IywbfYcz8ilYlgPGjYuAQIbtVFA0VIVKpRmQnWtnZGBCvdop3cNizqEWXJTxeitWQA
 skJTKVj/3rZkXUFtJd2OZbFGyDnAF1k3xsyPoL9v2IZO6aqcUAahJ5ot0zIdZwDSAI7G
 hqPHU8LwAKhqZ4oB/p74h6S34qUE94PV1X31otenKLVMOXAwGzsehbyk/K9TCD3c+Dcj
 +2hohne7zOHVoXaY4rUV5D3QwrX/J++LpTbx5mvrxU6OdpDYAXJPRJkTZjRMhpNCdfAa
 TuKI2VApF1aTxLDJqMOjXDwp9blnxNL0aOdQ2yaf4LtkdBfkNl+gRxyKMexWAcar5lP5
 fHOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+JhlrnpI21lm6+9yL0YX8mcQOdMVNn+ZfTBGg+FCAqG8lMFqsc22J0s+0StZxnHUijnWT1g34hBE2@nongnu.org
X-Gm-Message-State: AOJu0YzkLqsQMAbZDce+TF2Su3Qv8nEFNzcVTC2YF7DFKbbYph8ZMRxW
 V845S6t/qLn6xyCWnpCScl9r6XlEgbbWs4MNQ2XcCHJlBpBX9ckJQ4a7UAiNgO144ZWrDMRUDhn
 gb+LqdoK9o7B5x71d5h0EN1V4KN5TSFw=
X-Gm-Gg: Acq92OG2uSxzoLEb76n1WdnA8oTkgQAQDBE6mvuoqdm8sXAj1c2iSf3ooeOXKkz2f3W
 J3GZnfXeKzEhJ0pUGfBV0ZOuJ+s7nSatkqYTFnzuRlBxJUNyMybT6rIoFMYJHkKQwaqhiWadM4+
 gK6x+QKPIA03T+L6m0bgZ48KxBhY+kV4WPOut9xIVoR4aHrhqgF4uV2HUtYm6Ik/bto7BZBcP2z
 x7IH8QIZGKA/e+gdw2bDV2I4bmNh6WbZaqM3QM3KF9AnkKMp0XF6Gnumbv/buaZyWgv9ygtn2Gz
 xut0x8TZbJzmQC5zZyrxheHETPAlPHmkyhh9AQ==
X-Received: by 2002:a17:907:1ca1:b0:bd9:2b46:99b0 with SMTP id
 a640c23a62f3a-c04159d7bd7mr106747466b.49.1781577776357; Mon, 15 Jun 2026
 19:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-3-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 12:42:29 +1000
X-Gm-Features: AVVi8CddP2IdGmbQCnszS-UepCNSdQf-GoKdOGodSaNK5z-sml_hVlk_Olr-qoM
Message-ID: <CAKmqyKPNGT9yN83bKCAbrF9EM5_x3pTQA8N59w5sq6cmRrKCBA@mail.gmail.com>
Subject: Re: [PATCH 02/13] hw/riscv: add fdt-common helper
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 16, 2026 at 6:39=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> There's too much duplication between RISC-V boards and one of the most
> common culprits is the FDT functions.
>
> Add a new file for board FDT helpers.  Start by creating a helper that
> initializes the FDT and init it with the common board boilerplate.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/fdt-common.c         | 37 +++++++++++++++++++++++++++++++++++
>  hw/riscv/meson.build          |  1 +
>  hw/riscv/sifive_u.c           | 20 +++----------------
>  hw/riscv/spike.c              | 19 +++---------------
>  hw/riscv/virt.c               | 19 +++---------------
>  include/hw/riscv/fdt-common.h | 14 +++++++++++++
>  6 files changed, 61 insertions(+), 49 deletions(-)
>  create mode 100644 hw/riscv/fdt-common.c
>  create mode 100644 include/hw/riscv/fdt-common.h
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> new file mode 100644
> index 0000000000..b155246998
> --- /dev/null
> +++ b/hw/riscv/fdt-common.c
> @@ -0,0 +1,37 @@
> +/*
> + * RISC-V board helpers for FDT generation.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/error-report.h"
> +#include "system/device_tree.h"
> +#include "hw/riscv/fdt-common.h"
> +
> +void *create_board_device_tree(const char *model, const char *compatible=
,
> +                               int *fdt_size)
> +{
> +    void *fdt =3D create_device_tree(fdt_size);
> +
> +    if (!fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
> +    }
> +
> +    qemu_fdt_setprop_string(fdt, "/", "model", model);
> +    qemu_fdt_setprop_string(fdt, "/", "compatible", compatible);
> +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> +
> +    qemu_fdt_add_subnode(fdt, "/soc");
> +    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> +    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> +    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> +
> +    return fdt;
> +}
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index 533472e22a..f19db0dd7f 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -1,5 +1,6 @@
>  riscv_ss =3D ss.source_set()
>  riscv_ss.add(files('boot.c'))
> +riscv_ss.add(files('fdt-common.c'))
>  riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
>  riscv_ss.add(files('riscv_hart.c'))
>  riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 3abbd6c823..5d3b2751ad 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -52,6 +52,7 @@
>  #include "hw/riscv/sifive_u.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/machines-qom.h"
> +#include "hw/riscv/fdt-common.h"
>  #include "hw/char/sifive_uart.h"
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/sifive_plic.h"
> @@ -112,23 +113,8 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>          "sifive,plic-1.0.0", "riscv,plic0"
>      };
>
> -    fdt =3D ms->fdt =3D create_device_tree(&s->fdt_size);
> -    if (!fdt) {
> -        error_report("create_device_tree() failed");
> -        exit(1);
> -    }
> -
> -    qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed =
A00");
> -    qemu_fdt_setprop_string(fdt, "/", "compatible",
> -                            "sifive,hifive-unleashed-a00");
> -    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> -    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> -
> -    qemu_fdt_add_subnode(fdt, "/soc");
> -    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> -    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> -    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> -    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> +    fdt =3D ms->fdt =3D create_board_device_tree("SiFive HiFive Unleashe=
d A00",
> +        "sifive,hifive-unleashed-a00", &s->fdt_size);
>
>      hfclk_phandle =3D phandle++;
>      nodename =3D g_strdup_printf("/hfclk");
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index f9d00e0d5c..79c9bb041f 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -32,6 +32,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/spike.h"
>  #include "hw/riscv/boot.h"
> +#include "hw/riscv/fdt-common.h"
>  #include "hw/riscv/numa.h"
>  #include "hw/riscv/machines-qom.h"
>  #include "hw/char/riscv_htif.h"
> @@ -66,16 +67,8 @@ static void create_fdt(SpikeState *s, const MemMapEntr=
y *memmap,
>          "sifive,clint0", "riscv,clint0"
>      };
>
> -    fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
> -    if (!fdt) {
> -        error_report("create_device_tree() failed");
> -        exit(1);
> -    }
> -
> -    qemu_fdt_setprop_string(fdt, "/", "model", "ucbbar,spike-bare,qemu")=
;
> -    qemu_fdt_setprop_string(fdt, "/", "compatible", "ucbbar,spike-bare-d=
ev");
> -    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> -    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> +    fdt =3D ms->fdt =3D create_board_device_tree("ucbbar,spike-bare,qemu=
",
> +        "ucbbar,spike-bare-dev", &fdt_size);
>
>      qemu_fdt_add_subnode(fdt, "/htif");
>      qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
> @@ -84,12 +77,6 @@ static void create_fdt(SpikeState *s, const MemMapEntr=
y *memmap,
>              0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
>      }
>
> -    qemu_fdt_add_subnode(fdt, "/soc");
> -    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> -    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> -    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> -    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> -
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 0c489bb412..cb1d83fd48 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -36,6 +36,7 @@
>  #include "hw/riscv/riscv-iommu-bits.h"
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
> +#include "hw/riscv/fdt-common.h"
>  #include "hw/riscv/machines-qom.h"
>  #include "hw/riscv/numa.h"
>  #include "kvm/kvm_riscv.h"
> @@ -1150,22 +1151,8 @@ static void create_fdt(RISCVVirtState *s)
>      uint8_t rng_seed[32];
>      g_autofree char *name =3D NULL;
>
> -    ms->fdt =3D create_device_tree(&s->fdt_size);
> -    if (!ms->fdt) {
> -        error_report("create_device_tree() failed");
> -        exit(1);
> -    }
> -
> -    qemu_fdt_setprop_string(ms->fdt, "/", "model", "riscv-virtio,qemu");
> -    qemu_fdt_setprop_string(ms->fdt, "/", "compatible", "riscv-virtio");
> -    qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
> -    qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
> -
> -    qemu_fdt_add_subnode(ms->fdt, "/soc");
> -    qemu_fdt_setprop(ms->fdt, "/soc", "ranges", NULL, 0);
> -    qemu_fdt_setprop_string(ms->fdt, "/soc", "compatible", "simple-bus")=
;
> -    qemu_fdt_setprop_cell(ms->fdt, "/soc", "#size-cells", 0x2);
> -    qemu_fdt_setprop_cell(ms->fdt, "/soc", "#address-cells", 0x2);
> +    ms->fdt =3D create_board_device_tree("riscv-virtio,qemu", "riscv-vir=
tio",
> +                                       &s->fdt_size);
>
>      /*
>       * The "/soc/pci@..." node is needed for PCIE hotplugs
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.=
h
> new file mode 100644
> index 0000000000..adf9b33dfd
> --- /dev/null
> +++ b/include/hw/riscv/fdt-common.h
> @@ -0,0 +1,14 @@
> +/*
> + * RISC-V board helpers for FDT generation.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef RISCV_VIRT_FDT_H
> +#define RISCV_VIRT_FDT_H
> +
> +void *create_board_device_tree(const char *model, const char *compatible=
,
> +                               int *fdt_size);
> +#endif
> --
> 2.43.0
>
>

