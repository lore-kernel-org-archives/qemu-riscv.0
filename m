Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzoFJ-0004VW-8s
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 16:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1hzoF5-0004PX-Le
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 16:27:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hzoF4-00077H-DH
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 16:27:03 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hzoF1-00075V-G8; Mon, 19 Aug 2019 16:26:59 -0400
Received: by mail-lj1-x243.google.com with SMTP id m24so2987426ljg.8;
 Mon, 19 Aug 2019 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2tHNO/2YKUjne/eJzPQiDdmnwhtdEyOWxg+vIIKrmiU=;
 b=h+qOJnedymDCFRkXHbSBUcKRjlBCfxwQ+1OgDC4O6V3URkVhTUhaiT2X7EgbrED8xx
 +8wsYyFWBjwOxLS6kTvhfNt5wvktdiEh09pNlM6efHWpaUtxVmu/CfOMpbj3AkLXz4+4
 sdEMRbIwA6dUWmnhF9hjcOTee6+L26wgnyH4yk//U8mQjbiL/vB+psvJSBaM67E3/eqL
 MTCc3wpwpiMzIdLDlDSTYHVN7QXzmYhnxtagYQ+Riu/wsgcks7uqhe6tPLiCPLxkoPpE
 ZTudqB6H6PsLObNYozRnWr4+zt72Qm+h/fKZad7NoFTJBET45FXbWaXaohzordxCluNj
 4zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tHNO/2YKUjne/eJzPQiDdmnwhtdEyOWxg+vIIKrmiU=;
 b=GEUgzasR8GxIyUoXsxiKt99bt/Mq+cF/hosAxyMzWNP84KA/07oivFTcdp+ospu/Qq
 fTrG11SLjcsK7IBOP/INTDHHnDRuNGgkni2yude5d17/0PySpPz4ysoXk9cuOd7ny9PJ
 Kh6WsiQE2pDj8fiM/0qdv5YLUB3VLNb3nZ7WP75Iuh2LyKv9yaNSsUJVEhpNwlsykAlO
 VJHvAFcXoKHpsvbTiUrRIsuMURdmWkZutx5BOSu3Qk2eF5PRZJXbTbwFyjbvnFtZ07FI
 td7Brpr3Koitv9guXUz4J2Yr8TwzuUkkN2JVmenYWYVV/AruufqjoR6AxxNsNWM9k3eC
 LFxg==
X-Gm-Message-State: APjAAAWRgjyjU1xETZtpfck2fHEQPnBDujpzFt44BSpyIlelKdP0uhR4
 uojsvrztjfhG3ffFUgf0r0hof8zWg3xBXlo+lql7u0dF
X-Google-Smtp-Source: APXvYqwMM8H9nwYDKsmsiYIQLimupad8z1NumoibTiI9icIsS6Ebb752Dqeipum+Oy+fW7dEpLh4/jG4V0NQUe1awMo=
X-Received: by 2002:a05:651c:1023:: with SMTP id
 w3mr12949411ljm.94.1566246418221; 
 Mon, 19 Aug 2019 13:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
 <1566191521-7820-19-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1566191521-7820-19-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Aug 2019 13:22:57 -0700
Message-ID: <CAKmqyKNoxtymAE84qdvKG-wsXcEF9oiWfYhvjrRPMtn2Gbwa=Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 18/28] riscv: sifive_u:
 Generate hfclk and rtcclk nodes
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
X-List-Received-Date: Mon, 19 Aug 2019 20:27:05 -0000

On Sun, Aug 18, 2019 at 10:29 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> To keep in sync with Linux kernel device tree, generate hfclk and
> rtcclk nodes in the device tree, to be referenced by PRCI node.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/sifive_u.c         | 23 +++++++++++++++++++++++
>  include/hw/riscv/sifive_u.h |  2 ++
>  2 files changed, 25 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 284f7a5..08db741 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -80,6 +80,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      char ethclk_names[] = "pclk\0hclk\0tx_clk";
>      uint32_t plic_phandle, ethclk_phandle, phandle = 1;
>      uint32_t uartclk_phandle;
> +    uint32_t hfclk_phandle, rtcclk_phandle;
>
>      fdt = s->fdt = create_device_tree(&s->fdt_size);
>      if (!fdt) {
> @@ -98,6 +99,28 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
>
> +    hfclk_phandle = phandle++;
> +    nodename = g_strdup_printf("/hfclk");
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", hfclk_phandle);
> +    qemu_fdt_setprop_string(fdt, nodename, "clock-output-names", "hfclk");
> +    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> +        SIFIVE_U_HFCLK_FREQ);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
> +    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
> +    g_free(nodename);
> +
> +    rtcclk_phandle = phandle++;
> +    nodename = g_strdup_printf("/rtcclk");
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", rtcclk_phandle);
> +    qemu_fdt_setprop_string(fdt, nodename, "clock-output-names", "rtcclk");
> +    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> +        SIFIVE_U_RTCCLK_FREQ);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "fixed-clock");
> +    qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x0);
> +    g_free(nodename);
> +
>      nodename = g_strdup_printf("/memory@%lx",
>          (long)memmap[SIFIVE_U_DRAM].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 7a1a4f3..debbf28 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -68,6 +68,8 @@ enum {
>
>  enum {
>      SIFIVE_U_CLOCK_FREQ = 1000000000,
> +    SIFIVE_U_HFCLK_FREQ = 33333333,
> +    SIFIVE_U_RTCCLK_FREQ = 1000000,
>      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
>  };
>
> --
> 2.7.4
>
>

