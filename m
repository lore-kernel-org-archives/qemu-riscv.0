Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd2I-0007uF-Dt
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd2G-0007ox-5Z; Wed, 31 Mar 2021 11:45:36 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:44868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd2D-0001mb-GE; Wed, 31 Mar 2021 11:45:35 -0400
Received: by mail-io1-xd2e.google.com with SMTP id v26so20583042iox.11;
 Wed, 31 Mar 2021 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DG+0TCnIm5UAbmq5kofXH2/7Z2mnhFYgxPzy4xcKokw=;
 b=pRv62GVoa5zYz94ldrBvn7Na6UafXeSceItbNncRIjTuECXz8ihvo8Po22o57FhbxZ
 vPHljFyMgxKvCENSIfhPih1keqbiBFHkN+n0Szn/WuIJyOb0qtrABhkdO4mi5lxjb582
 BeKFcALEd97JZE1UFP2Ff3EBGAPY9HmJ8nsnr/P5r/0xWLfYSQU/brV5HR/KMWEPR7UL
 1ow8i1OWEYQOfw8HWhrs1zSbhYE+5QgGeKPRngL3DZtOZYXKHf21TihMCVn7TIDTY6Di
 soqt3PepMCTzMXX1bRB+qAqFqyGAVREOg0DqGiRuVtCM8+0k28XZK6NYmwmi3VV9GRQQ
 5Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DG+0TCnIm5UAbmq5kofXH2/7Z2mnhFYgxPzy4xcKokw=;
 b=Zzk0zbnF965RZ4/8J8w5+/QkH07bIl63dhB2WMKcG8ffW7ZjeT7lagffuQCfx2eyQS
 8+BR4zscrx+rgII9EUSvOnKRQY9No0PEfXo1nL6Ghm5CEWgZHNMfEBfrqo07jdudAdM6
 bhWXIwB8B1J+G5wbi1suS3S8wmc49K+R94ZF9OXkBy3SI/rrVtG4Z1fkjjIdu8Xi49/G
 7VF69vY/uxKvlPq3TXw9CyJlr/nOjDIEApuc3/lbie5ph4w/xmakNgcuTWwvHHbSOx0k
 o+c/eEUc4llH3a1a1ZwDJEBGHqw08IIAmyymKEt4H1qFFhKwfEz8/NRog4kI/224HJ/H
 r6XQ==
X-Gm-Message-State: AOAM532d1BtbDpZgIwWoQPgwKIOF37YU8/xhMyZCpn7A0So0HwAR8mk8
 v1rFGteJJqEUYxbhmBwwi7+ycgyVJO2S6KbubFw=
X-Google-Smtp-Source: ABdhPJzZvsbTf9TqooVixyUG9y5kJDrJXJdI+6yyqglHnH9B6QgZjLfagy3z/jVgj7ejZlCmrmvw0g69ZzvuFqLmywM=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr3576376jap.26.1617205530757; 
 Wed, 31 Mar 2021 08:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-4-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-4-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:43:17 -0400
Message-ID: <CAKmqyKNZ3gGA1Zj2dTyemFvX52Sk_rjPviX+h5nd1ouVKjRrXw@mail.gmail.com>
Subject: Re: [PATCH 4/8] hw/riscv: Support the official PLIC DT bindings
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:45:36 -0000

On Mon, Mar 29, 2021 at 1:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The official DT bindings of PLIC uses "sifive,plic-1.0.0" as the
> compatible string in the upstream Linux kernel. "riscv,plic0" is
> now legacy and has to be kept for backward compatibility of legacy
> systems.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 4 +++-
>  hw/riscv/virt.c     | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7f696ebc12..651a439528 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -98,6 +98,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      char *nodename;
>      const char *ethclk_names[2] = { "pclk", "hclk" };
>      const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
> +    const char *plic_compat[2] = { "sifive,plic-1.0.0", "riscv,plic0" };
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>
> @@ -269,7 +270,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> -    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
> +    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> +        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5b4fac015d..d04733d97c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -194,6 +194,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      char *mem_name, *cpu_name, *core_name, *intc_name;
>      char *name, *clint_name, *plic_name, *clust_name;
>      const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
> +    const char *plic_compat[2] = { "sifive,plic-1.0.0", "riscv,plic0" };
>      hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
>      hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
>
> @@ -318,7 +319,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>              "#address-cells", FDT_PLIC_ADDR_CELLS);
>          qemu_fdt_setprop_cell(fdt, plic_name,
>              "#interrupt-cells", FDT_PLIC_INT_CELLS);
> -        qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
> +        qemu_fdt_setprop_string_array(fdt, plic_name, "compatible",
> +            (char **)&plic_compat, ARRAY_SIZE(plic_compat));
>          qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
>              plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> --
> 2.25.1
>
>

