Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLkvF-00019P-Bs
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 08:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkvC-00016f-1U
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:34:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkv8-00041j-DD
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:34:49 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so921030wmb.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=vpjl9aCCcCCX+043N06DoI9KR9rnwsJ2Evt+s8uuSaw=;
 b=ZbiTM9YH5lLF7yeeXUTx71pVsknmQ/QEimkTFUicoC4fLSiGyRwjS+i9TXKGShJQcH
 3VCt20s6SIlU+Gj2fIeKxCn4T1qBjmNBJWfbpyNljBrZCv9Ui75k/SPtT5nQLFpHAcio
 JYYcM4Zh9Vz1wnnoMnNQGeSSN5dm+3bmz+gqW8YompTsXD89GvC8/DaTE9XYCSBKdrRf
 IwF5F3MM9vPa3a2+Y3Y5xeJuf/B9ev6YzCJx9NlEVM5DyU72SeEhZnipz8fOJ9/eOhoc
 olUG4ew0euMzbcHT0bsWF+ypSu3dVjZCjo3myB356N40stbHg78jQM+/oXW0OY5MN5ol
 pXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=vpjl9aCCcCCX+043N06DoI9KR9rnwsJ2Evt+s8uuSaw=;
 b=33ViZnu9QdZTV3JX/dzP84BhGEflUOOpTcAfFnMVL/l0yradUW/YYImhz5Yl/bBaDd
 ZrDWxCP4sThE+Sc+atFTvFyPZ/lu0Enq+ZxiZPHcnb6Y7bpCP/yf/fBiO3K5sehs3TNu
 tJ9/Zl2LTDxYpJtmJTxw78tPbsTkDHrjQ5kJqhm7Y3/WPg6mC1TtMtlMXgEfb5fkETjN
 cj6iLxI329F179Ic8aHp90NJvO93DnaikVfkP8+slB27w6hsBSnNoeD2f1id62CK4OaZ
 8Gl1rI7aUAXN0UumVJcAyn5OmVR1zNoo65m5xXXhsuh0XYvH4CysPE+JvSggfL26wiIt
 d9fQ==
X-Gm-Message-State: ACgBeo3Tbx3Xt8tIS8GQagD+0y6jtwfT7AXYZ/e1ZDtyBCmET7FJ0apl
 5xUvWoiTZBFKhkNlfZAkYTruWQ==
X-Google-Smtp-Source: AA6agR6QfQAVp4YbHCWDMb2JxuQQKhM2h3gREynV1GEVnnSiKU0upIvyVYHLQMuMoVdjDdOU1N0sxA==
X-Received: by 2002:a1c:2981:0:b0:3a2:ffe9:945c with SMTP id
 p123-20020a1c2981000000b003a2ffe9945cmr2352785wmp.38.1660134884804; 
 Wed, 10 Aug 2022 05:34:44 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5a5069107sm2187526wma.24.2022.08.10.05.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:34:44 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:34:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 3/6] hw/riscv: use qemu_fdt_setprop_strings() for
 string arrays
Message-ID: <20220810123443.tmt4ddkz7pdnvxz5@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-4-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-4-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 12:34:50 -0000

On Tue, Aug 09, 2022 at 07:56:37PM +0100, Ben Dooks wrote:
> Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify the code.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
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

Why move this down?

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

Other than the unnecessary line move

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

