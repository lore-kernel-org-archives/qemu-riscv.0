Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hun8O-0001Yw-Fj
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 20:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34713)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hun8M-0001V3-IW
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hun8L-0002FA-A1
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:15:22 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44482)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hun8I-0002Ef-PX; Mon, 05 Aug 2019 20:15:18 -0400
Received: by mail-lj1-x243.google.com with SMTP id k18so80702807ljc.11;
 Mon, 05 Aug 2019 17:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gryw8rWwvINbLBq7JAV4m4tjiKca1RGo53G4pIS5XuQ=;
 b=PVfvb8tXkE2+yLpq+02RwZNL2LB9jG+YBeeDk2jazjTSI43BPQUIurc5JAixBAZXlr
 3jpZTW+l9zN8BcuGgJGwPN1LIwnLQ3y8o+sUtT9/GB6gc2221AoIcY1PENCfoytEnhe/
 sR7I2wU+4ExeNmGdI6tmj1sRHD31v3JH3MB0d1+NoU4yRS4v3Q5lSBehKsvTlaKq21FW
 Q3FTZLkWNM2TFwRQ2jPNWCLQfdTWNrvGYIbhcA0VmsFZ3x0ppS5Das7Wk3DKlutf5G48
 QFaqbyZ9WIuAbhtt8wEdRH1mENkLwKSdRcHFUy0Sf34WvISZHc/pSG9NHtYAtOEuQD/E
 gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gryw8rWwvINbLBq7JAV4m4tjiKca1RGo53G4pIS5XuQ=;
 b=M2ZmebWVpgB7yWymvfULeKzB/7rCr05RdFtbS5i43sFtEdL3oBluIVaoDASDhev5Na
 skvlHx0VyORxSe1Vguq2YiSCqMCDnDfZNV5Itvtc8npeFl7rpn+St/ThVNy7cqgeMOHf
 Zq3n6+GZ1j8MnFVaUVvlNK5Z6kGajJrLe1GulGtmBhjFVf4D0JoUdAs4iFcEXcrowwFt
 kBt3FigXnNladS5mmFI/952NKz7nB52WGuCPb34U4KQmhHoSYMbDGhy455XTyzEDOvsM
 +ykYVmpaxJiL9ku8toBurAl6MYEDmuubAwIHrFFsZKeSDBNoaCAC4+0y7gSnhsXhLBZ1
 Z7kg==
X-Gm-Message-State: APjAAAXXn1dPU/XK7R0NDHxPo+BgOCZtMU8GrObyzidd2clkdkU0fXaA
 zKDZF0ssw3gp39uUeub1hLVJ0v2WS+aQmf0tAkA=
X-Google-Smtp-Source: APXvYqy+AaCBocQGsnJoKBpntacH/KSwI47QxkMq+ScMBrhcsuJLme0hzoyLQk+KmfvTDG1B0CiCa1waWz6d2sCkspk=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr206190lja.94.1565050517075;
 Mon, 05 Aug 2019 17:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 17:11:37 -0700
Message-ID: <CAKmqyKPHv8MxcnsK3RvP9X7q-pzgCRy-iQaADJ4zyqJrcE-w4A@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 01/28] riscv: hw: Remove
 superfluous "linux, phandle" property
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Aug 2019 00:15:23 -0000

On Mon, Aug 5, 2019 at 9:06 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> "linux,phandle" property is optional. Remove all instances in the
> sifive_u and virt machine device tree.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 3 ---
>  hw/riscv/virt.c     | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 71b8083..ef36948 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -125,7 +125,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
>          qemu_fdt_add_subnode(fdt, intc);
>          qemu_fdt_setprop_cell(fdt, intc, "phandle", cpu_phandle);
> -        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", cpu_phandle);
>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> @@ -184,7 +183,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
>      qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "linux,phandle", plic_phandle);
>      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
>      g_free(cells);
>      g_free(nodename);
> @@ -197,7 +195,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
>          SIFIVE_U_GEM_CLOCK_FREQ);
>      qemu_fdt_setprop_cell(fdt, nodename, "phandle", ethclk_phandle);
> -    qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", ethclk_phandle);
>      ethclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
>      g_free(nodename);
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 25faf3b..00be05a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -170,11 +170,9 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
>          qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
>          qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
> -        qemu_fdt_setprop_cell(fdt, nodename, "linux,phandle", cpu_phandle);
>          intc_phandle = phandle++;
>          qemu_fdt_add_subnode(fdt, intc);
>          qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandle);
> -        qemu_fdt_setprop_cell(fdt, intc, "linux,phandle", intc_phandle);
>          qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
>          qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
> @@ -250,7 +248,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
>      qemu_fdt_setprop_cells(fdt, nodename, "phandle", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "linux,phandle", plic_phandle);
>      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
>      g_free(cells);
>      g_free(nodename);
> --
> 2.7.4
>
>

