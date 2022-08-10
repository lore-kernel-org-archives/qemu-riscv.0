Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLtnF-0008Mz-2e
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 18:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtnD-0008Jh-92; Wed, 10 Aug 2022 18:03:11 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtnB-0003Xh-AY; Wed, 10 Aug 2022 18:03:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id f28so14922312pfk.1;
 Wed, 10 Aug 2022 15:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=pAItA24cGn5njCvLy4RqHVxTj0RMwJKQAyccAsUwZyw=;
 b=pUFsC7x5pVBNnxC0fZVrCWQUSpFnQAyTy99K3NZDthO2pNNSByjcM8iRJDoY5/5+uT
 icaQxIJztYe0tbwAxbZYmdeBIROVSUwoTh4biByifi50K60NY2r+ZD0pXMvwLLG4OWjW
 SI6HNIjEOXDhmyRlPwwUr9fJDTMbfGpvOWydae5DVqtxYGr8duSRUKLStSNA3VydOuK/
 GbrCg1VjWqbqHTbPrQAiXICfIzmEdKOWEaAL/jtp8DbmT0Vd1OFuQacmtAUwdKWTHp+d
 8bvU1wgbmNxufhuyqPdxbuNBWHHTAB1Gam1wmd70l0jfsF0zKirW5JURtH5kO+p66JUx
 HAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=pAItA24cGn5njCvLy4RqHVxTj0RMwJKQAyccAsUwZyw=;
 b=oE2XblOmmsE/Ro+GvpksCMzt1N28nAF4aAxgC9s5gL85D68/p6fNP9WF5zfvLG1tnx
 hb+D2VDhVa5ORToe5rG3NLE8kJGQ1jWnqdwBkMvrpXmdduwlVpSCAEKu1OitC4CEZKW9
 rFSwIcXmekXK9SuH3Ayc/aM3x6jEox/raRVobDIqtX/tbp0SW24rPPEyKOCj2KOSYYqZ
 w1B0otYZu0kutDZM72EA4JDjXHWAY2FAW28u2UR3HGPBa/XxI5TJ0p2NIMHJg9lfcSyS
 Sy1cl1rHk3zee0N36eNrGban5swwnJNXT5wUxATDNfM1vKTwwOGknU8yGaS5bujqQ1lE
 TDjg==
X-Gm-Message-State: ACgBeo0VRd+HbwNem7Dwk1efBJhTEi0cMfuJ0Ov7Oc9rvrVGkBVsjESQ
 fzdREh4Mj9Xl5EeadwkVI8HdpH/7LzttGRKK86o=
X-Google-Smtp-Source: AA6agR5cxmbnkEBJdy0NWTby7jKBjfLD3YIvkJG9qiY57p9g60R0LnpuryKsXIhRekxJa+lQ7T2KS7xtlEWgArJRtY0=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr28531273pfj.83.1660168986964; Wed, 10
 Aug 2022 15:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-4-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-4-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Aug 2022 08:02:40 +1000
Message-ID: <CAKmqyKNBr3M0RuXhOW_hrfWz7GOHpE+HKp9m6HaityV7a_qJ9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] hw/riscv: use qemu_fdt_setprop_strings() for
 string arrays
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Wed, 10 Aug 2022 22:03:11 -0000

On Wed, Aug 10, 2022 at 4:58 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify the code.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 18 +++++-------------
>  hw/riscv/spike.c    |  7 ++-----
>  hw/riscv/virt.c     | 32 ++++++++------------------------
>  3 files changed, 15 insertions(+), 42 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e4c814a3ea..dc112a253a 100644
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
> @@ -221,11 +214,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      nodename = g_strdup_printf("/soc/clint@%lx",
>          (long)memmap[SIFIVE_U_DEV_CLINT].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[SIFIVE_U_DEV_CLINT].base,
>          0x0, memmap[SIFIVE_U_DEV_CLINT].size);
> +    qemu_fdt_setprop_strings(fdt, nodename, "compatible",
> +                             "sifive,clint0", "riscv,clint0");
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, ms->smp.cpus * sizeof(uint32_t) * 4);
>      g_free(cells);
> @@ -279,8 +272,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
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
> @@ -426,8 +419,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
> -        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
> +    qemu_fdt_setprop_strings(fdt, nodename, "clock-names", "pclk", "hclk");
>      qemu_fdt_setprop(fdt, nodename, "local-mac-address",
>          s->soc.gem.conf.macaddr.a, ETH_ALEN);
>      qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index e41b6aa9f0..aa895779cd 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -59,9 +59,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>      uint32_t cpu_phandle, intc_phandle, phandle = 1;
>      char *name, *mem_name, *clint_name, *clust_name;
>      char *core_name, *cpu_name, *intc_name;
> -    static const char * const clint_compat[2] = {
> -        "sifive,clint0", "riscv,clint0"
> -    };
>
>      fdt = s->fdt = create_device_tree(&s->fdt_size);
>      if (!fdt) {
> @@ -159,8 +156,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>              (memmap[SPIKE_CLINT].size * socket);
>          clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
>          qemu_fdt_add_subnode(fdt, clint_name);
> -        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
> -            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> +        qemu_fdt_setprop_strings(fdt, clint_name, "compatible",
> +                                 "sifive,clint0", "riscv,clint0");
>          qemu_fdt_setprop_cells(fdt, clint_name, "reg",
>              0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
>          qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..c6aaa611a6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -261,11 +261,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>              intc_phandles[cpu]);
>          if (riscv_feature(&s->soc[socket].harts[cpu].env,
>                            RISCV_FEATURE_AIA)) {
> -            static const char * const compat[2] = {
> -                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> -            };
> -            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
> -                                      (char **)&compat, ARRAY_SIZE(compat));
> +            qemu_fdt_setprop_strings(mc->fdt, intc_name, "compatible",
> +                                     "riscv,cpu-intc-aia", "riscv,cpu-intc");
>          } else {
>              qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
>                  "riscv,cpu-intc");
> @@ -310,9 +307,6 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>      uint32_t *clint_cells;
>      unsigned long clint_addr;
>      MachineState *mc = MACHINE(s);
> -    static const char * const clint_compat[2] = {
> -        "sifive,clint0", "riscv,clint0"
> -    };
>
>      clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
>
> @@ -326,9 +320,8 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>      clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
>      clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
>      qemu_fdt_add_subnode(mc->fdt, clint_name);
> -    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
> -                                  (char **)&clint_compat,
> -                                  ARRAY_SIZE(clint_compat));
> +    qemu_fdt_setprop_strings(mc->fdt, clint_name, "compatible",
> +                             "sifive,clint0", "riscv,clint0");
>      qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
>          0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
>      qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
> @@ -437,9 +430,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      uint32_t *plic_cells;
>      unsigned long plic_addr;
>      MachineState *mc = MACHINE(s);
> -    static const char * const plic_compat[2] = {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
>
>      if (kvm_enabled()) {
>          plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> @@ -465,9 +455,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      qemu_fdt_add_subnode(mc->fdt, plic_name);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name,
>          "#interrupt-cells", FDT_PLIC_INT_CELLS);
> -    qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
> -                                  (char **)&plic_compat,
> -                                  ARRAY_SIZE(plic_compat));
> +    qemu_fdt_setprop_strings(mc->fdt, plic_name, "compatible",
> +                             "sifive,plic-1.0.0", "riscv,plic0");
>      qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
>          plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> @@ -881,13 +870,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      name = g_strdup_printf("/soc/test@%lx",
>          (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
> -    {
> -        static const char * const compat[3] = {
> -            "sifive,test1", "sifive,test0", "syscon"
> -        };
> -        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
> -                                      (char **)&compat, ARRAY_SIZE(compat));
> -    }
> +    qemu_fdt_setprop_strings(mc->fdt, name, "compatible",
> +                             "sifive,test1", "sifive,test0", "syscon");
>      qemu_fdt_setprop_cells(mc->fdt, name, "reg",
>          0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
>      qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
> --
> 2.35.1
>
>

