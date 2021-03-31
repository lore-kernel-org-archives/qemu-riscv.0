Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd1v-0007je-CX
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd1m-0007gF-DR; Wed, 31 Mar 2021 11:45:09 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:39455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd1d-0001N0-DY; Wed, 31 Mar 2021 11:45:06 -0400
Received: by mail-io1-xd32.google.com with SMTP id k25so20598162iob.6;
 Wed, 31 Mar 2021 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OyrHze1P+2ZMQtMEUVhpifSh7p9BTAep22YucbfgiR4=;
 b=rOoYeb/Ragx1Iy+fkBAsB5JoixCLNebbrOu17Wh89HlgyrYySLTmg5Ed5LLoJs1H3N
 /BdDCcvHzsMxIftNgnF1w/BYXMUNHn4Q4AiMrVW4Z+5hl9StM+162E8hJnCv0ZIXq3WS
 9qvNjLewpx+7qBNOFFfORVJOacQjebYiVpfHG8S0xsyhwno4siqyzrlCenWrtvgM2v79
 khmqKS9/sTxRckQB49D5KyucP/u+IC0ZwDQSVex4IRG67iJN3lujgE4IfHEy4/8MnwYu
 pdpxN9r86AimfhM1QxRcOeTgnc9cnGHJVhSWw8r+WjO60fxOwnNCKiam+tXXDKX+/OuG
 L2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OyrHze1P+2ZMQtMEUVhpifSh7p9BTAep22YucbfgiR4=;
 b=ES+71YNQvTJ34DwyxAzM19/uhTEajjWPt+bX5Qf7FhctfAXFYYNTKS4kFtzwDLGfbQ
 lYdkj7CqtaX1DlzlcvPMVRTpb/cdBiK4mbt7kthE3FoJrqiwuRyrdnjAJEn7n7ghue4u
 lzCdNuKC4AtG/za/PHJU9HNpz15n/6rb2rBJeahg2U+Cw9gn8715TBIzED+wr9xTCVQB
 A4rwoNTpS/iPPJdWC0NovJ4Ym7dbUTTVp+TCk2ZqAXyvKLTEoPSnmGFN4oPHxIhMAV5n
 jx0cWILINzVDej5gY6mGad8xO24kDt19cH8eOjMyJll0TiyelNqTwumoHW0/iltirRP2
 77bw==
X-Gm-Message-State: AOAM532lQcFNl6NrAAcC+5YEsdk6iGk5e5/AXPYv6uKKdHfbSAiBCqYI
 GMhjeR2NDbvOM7hCCHhnXseNrxHVEsQ1hcZhhno=
X-Google-Smtp-Source: ABdhPJwme0QG8j5UayXCrx2kvH2GrGfPn7DmkiE8tfZ8ctS0RyE8VneEOzW4Noj/COnv5c74xIVCiYYcOwCI5PHHwgw=
X-Received: by 2002:a5d:9496:: with SMTP id v22mr2884157ioj.175.1617205493449; 
 Wed, 31 Mar 2021 08:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-3-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:42:44 -0400
Message-ID: <CAKmqyKN84XqjZMBvQJyqFHM433PNwo=AZ3aCpoAqiRkFBFdNWw@mail.gmail.com>
Subject: Re: [PATCH 3/8] hw/riscv: Support the official CLINT DT bindings
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:45:13 -0000

On Mon, Mar 29, 2021 at 1:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Linux kernel commit a2770b57d083 ("dt-bindings: timer: Add CLINT bindings")
> adds the official DT bindings for CLINT, which uses "sifive,clint0"
> as the compatible string. "riscv,clint0" is now legacy and has to
> be kept for backward compatibility of legacy systems.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 4 +++-
>  hw/riscv/spike.c    | 4 +++-
>  hw/riscv/virt.c     | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index f06b3b2e64..7f696ebc12 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -97,6 +97,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      uint32_t *cells;
>      char *nodename;
>      const char *ethclk_names[2] = { "pclk", "hclk" };
> +    const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>
> @@ -210,7 +211,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      nodename = g_strdup_printf("/soc/clint@%lx",
>          (long)memmap[SIFIVE_U_DEV_CLINT].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,clint0");
> +    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> +        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[SIFIVE_U_DEV_CLINT].base,
>          0x0, memmap[SIFIVE_U_DEV_CLINT].size);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index ec7cb2f707..cc33061f23 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -60,6 +60,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>      uint32_t cpu_phandle, intc_phandle, phandle = 1;
>      char *name, *mem_name, *clint_name, *clust_name;
>      char *core_name, *cpu_name, *intc_name;
> +    const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
>
>      fdt = s->fdt = create_device_tree(&s->fdt_size);
>      if (!fdt) {
> @@ -153,7 +154,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>              (memmap[SPIKE_CLINT].size * socket);
>          clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
>          qemu_fdt_add_subnode(fdt, clint_name);
> -        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
> +        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
> +            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
>          qemu_fdt_setprop_cells(fdt, clint_name, "reg",
>              0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
>          qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5d0c1e5903..5b4fac015d 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -193,6 +193,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
>      char *mem_name, *cpu_name, *core_name, *intc_name;
>      char *name, *clint_name, *plic_name, *clust_name;
> +    const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
>      hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
>      hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
>
> @@ -300,7 +301,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>              (memmap[VIRT_CLINT].size * socket);
>          clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
>          qemu_fdt_add_subnode(fdt, clint_name);
> -        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
> +        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
> +            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
>          qemu_fdt_setprop_cells(fdt, clint_name, "reg",
>              0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
>          qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> --
> 2.25.1
>
>

