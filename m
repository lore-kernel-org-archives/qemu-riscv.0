Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3B7l-0002Nb-JR
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3B7i-0002Jt-TY; Mon, 20 Jun 2022 02:42:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3B7g-0003GD-4Y; Mon, 20 Jun 2022 02:42:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso9342818pjh.4; 
 Sun, 19 Jun 2022 23:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCQgGmMWmQp3NatUxWDGg/m5rfGF9n2EBMAjBc0JdE4=;
 b=aDA3WoA6dNHTtCSyoIHBhXHaQcYEZc0DicaUbxMNv8i1zACPCeUPJDo960ifQtNLqk
 CBxktSeHZGYqTYDTbdLpGKoyAs9UnAVLRbdC+lCynR+LUdxUMKZQKbs/LFcIzNEcuHfg
 Ptn1DemipS4kgyWQ0e16w8Al/2jLRTDov4NgH1hwNKXLb2j6OssJ0ixR7iHRK9xPiJaN
 dVMMRVo5ot+G6krV9m1dbqGJVra32m1RL+52E89x33viK4bTzzpdBUmqzuGOJBkKRN4h
 BjFQylff8lR8evmt83Uvxdnswgqxs0mJlZxWY6AhVV94jBhpavUypoYWrPVBVSPkjS4/
 wulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCQgGmMWmQp3NatUxWDGg/m5rfGF9n2EBMAjBc0JdE4=;
 b=WoF+rIfYqbDJC5YU6nngtaRy2yYu2KlsWPF4VM/3GTo1jPgP7UdsCGCk8ARN2jgY3E
 llRlbvlx8w6U/dIz0Y9piKcS74PTwpwz3hZ9aXowcTyhB8hX7kpfvDtzSKQkMacCUJbt
 7xXxQ5/5trIExOOJDw7WpCyiWBJdUaHI15AhQlb4GsNFwrcu7gyq7QN2TXYiwtfyxEqC
 b2BWhpWANZidRBGMmyC+PE6BymbJiR48WG548d6HecJ1ruc4SQMJZH4PeqAQwmsRHt3B
 hG69i4ZQKasb2S0sI7GdBpFnYb+IceUmSa5n02I8A8p/Z4blzEOacbHtwyAAHCx0u2Cd
 A24g==
X-Gm-Message-State: AJIora+aN/zSMAJCyXVXANN69xCiUh0ndq18pBUBf8xcFfYJUbhuOXpC
 4/FyQc/wv8UvFngJ+jox8nj6ubBOKaaER+vS7J6LXeCM0u0=
X-Google-Smtp-Source: AGRyM1vwM9gvEbR0fQQHP5joyt0EdfGckZFHbqVZkUJtpp4RnItQ2MMQ71SJKDSBqnBoj3jB7ROcPiw0ABx0lGItaeQ=
X-Received: by 2002:a17:903:2291:b0:167:59ad:52e8 with SMTP id
 b17-20020a170903229100b0016759ad52e8mr22640520plh.121.1655707374292; Sun, 19
 Jun 2022 23:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-3-qemu@ben.fluff.org>
In-Reply-To: <20220618201433.240973-3-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Jun 2022 16:42:28 +1000
Message-ID: <CAKmqyKPyyjNjSfwmKFGgvseFAGy7abW4o=5O8nLH9egp5ASApw@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv: use qemu_fdt_setprop_reg64_map() in
 sifive_u.c
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 20 Jun 2022 06:42:59 -0000

On Sun, Jun 19, 2022 at 6:14 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Use the qemu_fdt_setprop_reg64_map() to replace the code
> that sets the property manually.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> --
> v2:
> - changed to qemu_fdt_setprop_reg64_map() from previous
> ---
>  hw/riscv/sifive_u.c | 41 +++++++++++------------------------------
>  1 file changed, 11 insertions(+), 30 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e4c814a3ea..89d7aa2a52 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -223,9 +223,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
>          (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_CLINT].base,
> -        0x0, memmap[SIFIVE_U_DEV_CLINT].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_CLINT]);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, ms->smp.cpus * sizeof(uint32_t) * 4);
>      g_free(cells);
> @@ -235,9 +233,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_OTP].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_cell(fdt, nodename, "fuse-count", SIFIVE_U_OTP_REG_SIZE);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_OTP].base,
> -        0x0, memmap[SIFIVE_U_DEV_OTP].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_OTP]);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible",
>          "sifive,fu540-c000-otp");
>      g_free(nodename);
> @@ -250,9 +246,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x1);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          hfclk_phandle, rtcclk_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_PRCI].base,
> -        0x0, memmap[SIFIVE_U_DEV_PRCI].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_PRCI]);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible",
>          "sifive,fu540-c000-prci");
>      g_free(nodename);
> @@ -284,9 +278,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_PLIC].base,
> -        0x0, memmap[SIFIVE_U_DEV_PLIC].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_PLIC]);
>      qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
>      qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
>      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
> @@ -304,9 +296,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop_cell(fdt, nodename, "#gpio-cells", 2);
>      qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_GPIO].base,
> -        0x0, memmap[SIFIVE_U_DEV_GPIO].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_GPIO]);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GPIO_IRQ0,
>          SIFIVE_U_GPIO_IRQ1, SIFIVE_U_GPIO_IRQ2, SIFIVE_U_GPIO_IRQ3,
>          SIFIVE_U_GPIO_IRQ4, SIFIVE_U_GPIO_IRQ5, SIFIVE_U_GPIO_IRQ6,
> @@ -342,9 +332,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      nodename = g_strdup_printf("/soc/cache-controller@%lx",
>          (long)memmap[SIFIVE_U_DEV_L2CC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_L2CC].base,
> -        0x0, memmap[SIFIVE_U_DEV_L2CC].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_L2CC]);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
>          SIFIVE_U_L2CC_IRQ0, SIFIVE_U_L2CC_IRQ1, SIFIVE_U_L2CC_IRQ2);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> @@ -366,9 +354,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          prci_phandle, PRCI_CLK_TLCLK);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI2_IRQ);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_QSPI2].base,
> -        0x0, memmap[SIFIVE_U_DEV_QSPI2].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_QSPI2]);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
>      g_free(nodename);
>
> @@ -391,9 +377,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          prci_phandle, PRCI_CLK_TLCLK);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI0_IRQ);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_QSPI0].base,
> -        0x0, memmap[SIFIVE_U_DEV_QSPI0].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_QSPI0]);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
>      g_free(nodename);
>
> @@ -449,9 +433,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_PWM0].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_PWM0].base,
> -        0x0, memmap[SIFIVE_U_DEV_PWM0].size);
> +qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_PWM0]);
> +
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
>      qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
>                             SIFIVE_U_PWM0_IRQ0, SIFIVE_U_PWM0_IRQ1,
> @@ -496,9 +479,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_UART0].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
> -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> -        0x0, memmap[SIFIVE_U_DEV_UART0].base,
> -        0x0, memmap[SIFIVE_U_DEV_UART0].size);
> +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_UART0]);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          prci_phandle, PRCI_CLK_TLCLK);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> --
> 2.35.1
>
>

