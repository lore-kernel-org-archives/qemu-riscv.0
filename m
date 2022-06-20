Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BCu-0006vs-IA
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3BCr-0006rh-If; Mon, 20 Jun 2022 02:48:17 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3BCm-0003wL-K5; Mon, 20 Jun 2022 02:48:17 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s185so3731322pgs.3;
 Sun, 19 Jun 2022 23:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtbtOtWAFmuyK90Ynvhgj7Xise4nXYxwLd+lSniPumk=;
 b=Oj43rljy17CHoREWU85gnpFdZDoUraJd6shNnVJ1O4bOzyshhqtuRCRFRPZLBIOIOm
 DP/U58wClzi/qyxyupwN/6janYovSpCGzMvyfNmQePCWvdoBAGlt6PM1Q6Dx/nJXP1Jw
 1PYm0u+UxRagSrxswiIH0lNuUW0ahX+/4VnPu3dgoOOukvVL0EWFTc0JNpgAoaNrrJiB
 VrHe15Ba3YRQB219zavOPtYOoTGUELPfIu4OhOnr3TVot6vLARm23cU12he56kn+u9bs
 fBCuGHYaCypCFb/qgCTUemKMRAz96CH2rBTiElbS/J4dTUE5QeYNX9xqBw/687+f0tmT
 +zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtbtOtWAFmuyK90Ynvhgj7Xise4nXYxwLd+lSniPumk=;
 b=AYKynTKL2E5rdzxl+7PiCA2C7b4/gQZoT6GIcC6e34kB5WdUeUgZF4L0dFMYEtbVZv
 yPJyhQPVVetAV3BArxIq+4XU+CWMWjJ6gXUZYKxa2bjasFYIE4pC7lcgK7Rpn+GyQRMM
 gJJbru6uzs3ZLsQngv3OA3KEVZ1MvHUj9tqnEDHCXGdMr24hJmjJnGRu5fGZkHFKsG6e
 i5PDtatkaCH4DRX/PsdloqO8VOH8Ajj0BCmHdoLvAyA0QeO+lKdMeGS8I4olXefYZsyI
 raZaD081or6C+5rP9rlfAWh8Ig53kS6oulag24/c3Q/X8+/o2buOCfDrtxtIggtPgHXt
 Eavw==
X-Gm-Message-State: AJIora/ZDupQhT7wUCUog6S9W+Qnm5zpMkffWIdwvVW9xVofNpdvOZlw
 H8dMjQFdH9zjabLaa3GxrVcWUlM5gmljNgrTFzI=
X-Google-Smtp-Source: AGRyM1uqZd5rx33q0tCy6EXKYHvOj00cpNI8lT6ymyvsc864HG7D4vPmmG6Tk628AIBx6ODYCO2p5UwklFlKd2Fl2qc=
X-Received: by 2002:a63:385c:0:b0:40c:bd3a:1506 with SMTP id
 h28-20020a63385c000000b0040cbd3a1506mr3352101pgn.366.1655707690825; Sun, 19
 Jun 2022 23:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-5-qemu@ben.fluff.org>
In-Reply-To: <20220618201433.240973-5-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Jun 2022 16:47:44 +1000
Message-ID: <CAKmqyKMWz7qgYXjHJLTHbMMkW=Amv0CZqTBg72iHW2Ntx0+HYg@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Mon, 20 Jun 2022 06:48:19 -0000

On Sun, Jun 19, 2022 at 6:14 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
> the code.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>

Do you mind updating the other machines as well?

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 89d7aa2a52..16b18d90bd 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -103,13 +103,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      char *nodename;
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
> -    static const char * const ethclk_names[2] = { "pclk", "hclk" };
> -    static const char * const clint_compat[2] = {
> -        "sifive,clint0", "riscv,clint0"
> -    };
> -    static const char * const plic_compat[2] = {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
>
>      if (ms->dtb) {
>          fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
> @@ -221,8 +214,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      nodename = g_strdup_printf("/soc/clint@%lx",
>          (long)memmap[SIFIVE_U_DEV_CLINT].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> +    qemu_fdt_setprop_strings(fdt, nodename, "compatible",
> +                             "sifive,clint0", "riscv,clint0");
>      qemu_fdt_setprop_reg64_map(fdt, nodename, &memmap[SIFIVE_U_DEV_CLINT]);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, ms->smp.cpus * sizeof(uint32_t) * 4);
> @@ -273,8 +266,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> +    qemu_fdt_setprop_strings(fdt, nodename, "compatbile",
> +                             "sifive,plic-1.0.0", "riscv,plic0");
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> @@ -410,8 +403,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
> -        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
> +    qemu_fdt_setprop_strings(fdt, nodename, "clock-names", "pclk", "hclk");
>      qemu_fdt_setprop(fdt, nodename, "local-mac-address",
>          s->soc.gem.conf.macaddr.a, ETH_ALEN);
>      qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
> --
> 2.35.1
>
>

