Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3B9U-00043N-NA
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3B9S-0003zp-8B; Mon, 20 Jun 2022 02:44:46 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3B9L-0003M2-Vg; Mon, 20 Jun 2022 02:44:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p3-20020a17090a428300b001ec865eb4a2so4734348pjg.3; 
 Sun, 19 Jun 2022 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSbuc3MlhpYhbLdO1kL58Uf9AA5TfmNGL5ykL2a4LlM=;
 b=nB2ST6TPlzNO0e7gvtFfIydTHKmfLwFQmcKMgYVBMGWU5BHNe1Yf7t4MVMqxhOezby
 f8u0EFW1ClxRwOsmJBBIB2r7fJgGt9p9k1ilcwRWAjyO/qC+I8A8XUclakXfccBzSn5e
 SPt2GzQMJtBEHCDWPmmsN7+/JspX9kBXBfqztCA5uUmUELYw4LN4WKVZnHuMp4w/iHTG
 J9nlKo6b3oueo0xVN9MSZtcBleQiPSvG/brt+TDqfW3v/xiV8NfdVlM7ybPnoPTt3SZ+
 dJgGHR7J3gLOOoPvuNmA78Rkp90s/fSD/08+evudoNUVYhSo8KGK/XjI62m4kkdOK3Re
 2HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSbuc3MlhpYhbLdO1kL58Uf9AA5TfmNGL5ykL2a4LlM=;
 b=2CtDkxe6jyrV55cVWMFnSePrjsojiKMKyXCDUS/UsxYR1QpKE1xIC3OGhW4dsEUS9B
 NySSIwqKpudWgYdLANLmHP1gIl1jT9pqv0UWGyY8A7K6W2/90LUcX20XswmJCiGynx1i
 lYEKU0SBwY9ieFgO70LbfcqNudBqu+bCNRvKikYDFuUct/2CpnYnQlM71Lv2xb2vI1zS
 RVEppmma9/ocuegmDp3NXpyrIDy9EByYq75uvj3kT5AgK1kKWW5k75msb/5f36AWkPkn
 8GGe1FMfzvrGl1xowzVlGGtF1lLoSSNOh6qLcXjmEqd6vawjHznKXhIGhm0qABiA5Q3O
 beiA==
X-Gm-Message-State: AJIora8NGxqp6RD4bI4Rj7EdLG9flyXRKEWxR2H+/Isr341wnYcVoeI+
 ts6bdFEdnl/jwnlZAjH197/hOQ7YGX6FeoHHHYY=
X-Google-Smtp-Source: AGRyM1sOD3n6igrkbHObqo4BcoZlxN9mzFSSDXG+BLYQYVvppk+zVDP51wFv9WYcHZm6gV5OW3e3NCsNPuYkmk3fFVM=
X-Received: by 2002:a17:903:216:b0:167:921c:6590 with SMTP id
 r22-20020a170903021600b00167921c6590mr22558502plh.83.1655707478276; Sun, 19
 Jun 2022 23:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-3-qemu@ben.fluff.org>
 <CAKmqyKPyyjNjSfwmKFGgvseFAGy7abW4o=5O8nLH9egp5ASApw@mail.gmail.com>
In-Reply-To: <CAKmqyKPyyjNjSfwmKFGgvseFAGy7abW4o=5O8nLH9egp5ASApw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Jun 2022 16:44:12 +1000
Message-ID: <CAKmqyKM=RGFuJrUDT3woVhh8FFybW-EQbkCpkfzwiMWLn9B69Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv: use qemu_fdt_setprop_reg64_map() in
 sifive_u.c
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Mon, 20 Jun 2022 06:44:46 -0000

On Mon, Jun 20, 2022 at 4:42 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sun, Jun 19, 2022 at 6:14 AM Ben Dooks <qemu@ben.fluff.org> wrote:
> >
> > Use the qemu_fdt_setprop_reg64_map() to replace the code
> > that sets the property manually.
> >
> > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > --
> > v2:
> > - changed to qemu_fdt_setprop_reg64_map() from previous
> > ---
> >  hw/riscv/sifive_u.c | 41 +++++++++++------------------------------
> >  1 file changed, 11 insertions(+), 30 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index e4c814a3ea..89d7aa2a52 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -223,9 +223,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >      qemu_fdt_add_subnode(fdt, nodename);
> >      qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> >          (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_CLINT].base,
> > -        0x0, memmap[SIFIVE_U_DEV_CLINT].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_CLINT]);

Do you mind doing this for the other RISC-V machines as well?
Hopefully making this whole FDT process a bit easier to read


Alistair

> >      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> >          cells, ms->smp.cpus * sizeof(uint32_t) * 4);
> >      g_free(cells);
> > @@ -235,9 +233,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >          (long)memmap[SIFIVE_U_DEV_OTP].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> >      qemu_fdt_setprop_cell(fdt, nodename, "fuse-count", SIFIVE_U_OTP_REG_SIZE);
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_OTP].base,
> > -        0x0, memmap[SIFIVE_U_DEV_OTP].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_OTP]);
> >      qemu_fdt_setprop_string(fdt, nodename, "compatible",
> >          "sifive,fu540-c000-otp");
> >      g_free(nodename);
> > @@ -250,9 +246,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >      qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x1);
> >      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
> >          hfclk_phandle, rtcclk_phandle);
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_PRCI].base,
> > -        0x0, memmap[SIFIVE_U_DEV_PRCI].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_PRCI]);
> >      qemu_fdt_setprop_string(fdt, nodename, "compatible",
> >          "sifive,fu540-c000-prci");
> >      g_free(nodename);
> > @@ -284,9 +278,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> >      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> >          cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_PLIC].base,
> > -        0x0, memmap[SIFIVE_U_DEV_PLIC].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_PLIC]);
> >      qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
> >      qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
> >      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
> > @@ -304,9 +296,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> >      qemu_fdt_setprop_cell(fdt, nodename, "#gpio-cells", 2);
> >      qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_GPIO].base,
> > -        0x0, memmap[SIFIVE_U_DEV_GPIO].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_GPIO]);
> >      qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GPIO_IRQ0,
> >          SIFIVE_U_GPIO_IRQ1, SIFIVE_U_GPIO_IRQ2, SIFIVE_U_GPIO_IRQ3,
> >          SIFIVE_U_GPIO_IRQ4, SIFIVE_U_GPIO_IRQ5, SIFIVE_U_GPIO_IRQ6,
> > @@ -342,9 +332,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >      nodename = g_strdup_printf("/soc/cache-controller@%lx",
> >          (long)memmap[SIFIVE_U_DEV_L2CC].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_L2CC].base,
> > -        0x0, memmap[SIFIVE_U_DEV_L2CC].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_L2CC]);
> >      qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
> >          SIFIVE_U_L2CC_IRQ0, SIFIVE_U_L2CC_IRQ1, SIFIVE_U_L2CC_IRQ2);
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> > @@ -366,9 +354,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >          prci_phandle, PRCI_CLK_TLCLK);
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI2_IRQ);
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_QSPI2].base,
> > -        0x0, memmap[SIFIVE_U_DEV_QSPI2].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_QSPI2]);
> >      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
> >      g_free(nodename);
> >
> > @@ -391,9 +377,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >          prci_phandle, PRCI_CLK_TLCLK);
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI0_IRQ);
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_QSPI0].base,
> > -        0x0, memmap[SIFIVE_U_DEV_QSPI0].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_QSPI0]);
> >      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
> >      g_free(nodename);
> >
> > @@ -449,9 +433,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >          (long)memmap[SIFIVE_U_DEV_PWM0].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> >      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_PWM0].base,
> > -        0x0, memmap[SIFIVE_U_DEV_PWM0].size);
> > +qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_PWM0]);
> > +
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> >      qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
> >                             SIFIVE_U_PWM0_IRQ0, SIFIVE_U_PWM0_IRQ1,
> > @@ -496,9 +479,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> >          (long)memmap[SIFIVE_U_DEV_UART0].base);
> >      qemu_fdt_add_subnode(fdt, nodename);
> >      qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
> > -    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> > -        0x0, memmap[SIFIVE_U_DEV_UART0].base,
> > -        0x0, memmap[SIFIVE_U_DEV_UART0].size);
> > +    qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_UART0]);
> >      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
> >          prci_phandle, PRCI_CLK_TLCLK);
> >      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> > --
> > 2.35.1
> >
> >

