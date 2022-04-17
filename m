Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngFLD-00025c-4l
	for mharc-qemu-riscv@gnu.org; Sun, 17 Apr 2022 20:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1ngCb4-0004Lk-D9; Sun, 17 Apr 2022 17:38:18 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:48712
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1ngCb1-00052P-HL; Sun, 17 Apr 2022 17:38:17 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1ngCam-0005ud-BV; Sun, 17 Apr 2022 22:38:00 +0100
Date: Sun, 17 Apr 2022 22:38:00 +0100
From: Ben Dooks <ben@fluff.org>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
Message-ID: <20220417213800.w74xbqeancspa255@hetzy.fluff.org>
References: <20220416193034.538161-1-qemu@ben.fluff.org>
 <20220416193034.538161-5-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220416193034.538161-5-qemu@ben.fluff.org>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 17 Apr 2022 20:34:04 -0400
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
X-List-Received-Date: Sun, 17 Apr 2022 21:38:18 -0000

On Sat, Apr 16, 2022 at 08:30:34PM +0100, Ben Dooks wrote:
> Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
> the code.
> 
> Signed-off-by; Ben Dooks <qemu@ben.fluff.org>
> ---
>  hw/riscv/sifive_u.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 1fe364cbb0..b00086d86e 100644
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
>      qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_CLINT]);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, ms->smp.cpus * sizeof(uint32_t) * 4);
> @@ -273,8 +266,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> +    //qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> +    //    (char **)&plic_compat, ARRAY_SIZE(plic_compat));

Whoops, will fix this conversion, should have removed the original
instead of commenting it out.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


