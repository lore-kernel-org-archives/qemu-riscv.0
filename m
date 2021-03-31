Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRczu-0005fD-RZ
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRczs-0005bH-G4; Wed, 31 Mar 2021 11:43:08 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRczm-0000A8-Pi; Wed, 31 Mar 2021 11:43:08 -0400
Received: by mail-il1-x12a.google.com with SMTP id w2so17054129ilj.12;
 Wed, 31 Mar 2021 08:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWIVwCnAGFqpC3q07Mg0ZtO1MHC7H5J/XLff5b5IoQk=;
 b=gKtUKj9PN+7rgwI0uPrdl/SCkN4oPV3YYBo/EoT4o40VPQ0FD7LGESUpYmTsL8wUuB
 iPzESMzF/ZyWDP8ayy/4hnqoOBJUqioVq2gDrnyGhzupO7bMaHyKB9MBm3gwcZ7OSGB6
 0kGUCKZbGoNvU01D0diOFSkK5toIuTe72DA5pvEvBlzUe+zU3DKtrKeL2nRRB1lBWuMn
 MMvnFWb6RANZuMsO4p3PP0jKK1rKRmQTb8qSlpLc3EHBineKEJCcSKIIAWms5qzhoPUy
 34VNq6q05Kf3BV/0ArTOr0/J1Ef1363l+SY9SU6dkDxCh3gz9L+oohUxEht5zRXAOEUF
 7p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWIVwCnAGFqpC3q07Mg0ZtO1MHC7H5J/XLff5b5IoQk=;
 b=FhrCoM5lYkNZEHr52HSaKoMMA8dOTY/gA4XPIFAISl45aJsx4rnDOhev370BWfGjbN
 ZqZPe61USAmRHizIFL18Qjg7iPymouJtNuHsvG1xr4eeaA+DfcxAmiCv9BTaXN017R5S
 2L6Q4GfXwrAPu5rTou7bqcJoRRH6gchDqdTCXbs9JVCFSKa5ffu/IZinSDAwnBXemueS
 fkeyl7rPn6U9OuQdt0wiZm8rQKOH4Yh2mMGlMlpt6JSSrNFEpQ1yIG2tjRp03eu9rJUv
 s7+YNP+wh6712YUjippOL83QVu2W2NeMdmIYcIMwvT7ZMXRmqrQTMeK/j0JWc98AKkjJ
 6QZw==
X-Gm-Message-State: AOAM531NdFLMDOwMjCB1HwDc/RQeD6a8Phas8X3CcszcR/hbcusGq49O
 il9ozqWGwooAvRg0vJOgIRA/QMirW6lAfdb8Fks=
X-Google-Smtp-Source: ABdhPJwucfj2sGszusN+0gYrXsb/KO/VfU9Lg0qe6yI939jfTIXuNt/Hjn+/8vpLiqEJpUxzFEUMw+y5JOwc5ZCASt8=
X-Received: by 2002:a92:c706:: with SMTP id a6mr3070056ilp.177.1617205381122; 
 Wed, 31 Mar 2021 08:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:40:51 -0400
Message-ID: <CAKmqyKNG5KKMXmyuz5dYdkQ0mLqzWTLF1eacBoYzYHRA8T4tMw@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:43:08 -0000

On Mon, Mar 29, 2021 at 1:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
> we can use the new helper to set the clock name for the ethernet
> controller node.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7b59942369..f06b3b2e64 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -96,7 +96,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      int cpu;
>      uint32_t *cells;
>      char *nodename;
> -    char ethclk_names[] = "pclk\0hclk";
> +    const char *ethclk_names[2] = { "pclk", "hclk" };
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>
> @@ -413,8 +413,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
> -    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
> -        sizeof(ethclk_names));
> +    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
> +        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
>      qemu_fdt_setprop(fdt, nodename, "local-mac-address",
>          s->soc.gem.conf.macaddr.a, ETH_ALEN);
>      qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
> --
> 2.25.1
>
>

