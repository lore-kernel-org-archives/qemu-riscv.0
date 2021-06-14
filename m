Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lslcO-0002oq-F2
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jun 2021 08:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lslcH-0002lZ-1H; Mon, 14 Jun 2021 08:22:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lslcB-0000TL-Ja; Mon, 14 Jun 2021 08:22:56 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id q21so15124033ybg.8;
 Mon, 14 Jun 2021 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hKzwfFMiMQzVCbASGM11w9tItEGI3lLy+rUW5mWTcKU=;
 b=Ly+Z+v5y9fq8qsGrKSrzMb2nz47NnVFsvR8cMRotRPiTUrTJ4ZfZ/RRGd0kNkWqgyu
 dHU3nMtE35XYVV/0zaYUEb/LSLdKFC5AeNK+3OSVaVKsEcyZGhFekZmBxyAa5JLrBkWM
 wcd8mksahN8FjPfuVYTk5cY51TcbKmkMitWpeJQ+Q3BxKOfGG0yKa4E5lXutyNKUU9q0
 vmbsmwtmZEJoeQJ3UjLMRq5VlfjQD5E3wWmh259i7znX3h9f1sOI+PufJUMiKUMTXmh/
 VuNvw1Rd0VmYNhf3VULfjrLsKCgctdqrj65jfQKSZjrpPutwRThTQdNLuGqptjQefTLQ
 K3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hKzwfFMiMQzVCbASGM11w9tItEGI3lLy+rUW5mWTcKU=;
 b=dxyRM7p2IdHszgudszbHK8FshrqQc6+B1DJqjMfYyS9MBUn6Zaeb2eCnvUdkSLjpMa
 pms36/aMqiO1imCkhh1SDhJ7uxe6X/WdqbJJREREwhzV6j3CV/Fqocgx3XaMNnoRvudP
 6dT4z8EFT0ee3fBuQsqQ719aq8sZIWBHWilAc1p7C3oZ5+8yyRDP8QX85778t9TfCxyw
 JA+oN01O6xcaL6GSLc5xhw+12X6SeaXQC1YFQzhgAYGZC6Vg7/7m5mWuUvxIq+4IzrOJ
 GMKSZGInmzwyCd/05y6amPuA3qVYxlihjQThluWJQLLcXt95E0/DT7X2qCZqFIHBKUPJ
 vMFA==
X-Gm-Message-State: AOAM531Tg/1p+5YoUCcUcVUrL1bymPK/Mv/7V8CE1ddARCWyqxPUZeC0
 Fp3tFUzCiI+Q5sRzPeOim82bigLUMghvP9xRNo0=
X-Google-Smtp-Source: ABdhPJwru3t3Xxo4hEQ/xtF9ZODmm0erhNYYc5Dlr/f88YhjmyhDNQNNhdFMPQUkLRy9+rgb6+UB+pSvwsf+w9sHWAI=
X-Received: by 2002:a25:be09:: with SMTP id h9mr25176859ybk.239.1623673370085; 
 Mon, 14 Jun 2021 05:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-4-anup.patel@wdc.com>
In-Reply-To: <20210612160615.330768-4-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 20:22:38 +0800
Message-ID: <CAEUhbmV1L7sL+9=3=onkXZoR0FYpV93gKCVxFJ5O5-Jw36PQgA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 14 Jun 2021 12:23:00 -0000

On Sun, Jun 13, 2021 at 12:14 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We extend virt machine to emulate ACLINT devices only when "aclint=on"
> parameter is passed along with machine name in QEMU command-line.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/riscv/virt.h |   2 +
>  2 files changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 977d699753..a35f66af13 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
>      [VIRT_TEST] =        {   0x100000,        0x1000 },
>      [VIRT_RTC] =         {   0x101000,        0x1000 },
>      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },

How about we reuse the same register space to support both CLINT and
ACLINT? This saves some register space for future extension.

>      [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
>      [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
> @@ -279,6 +280,78 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>      g_free(clint_cells);
>  }
>
> +static void create_fdt_socket_aclint(RISCVVirtState *s,
> +                                     const MemMapEntry *memmap, int socket,
> +                                     uint32_t *intc_phandles)
> +{
> +    int cpu;
> +    char *name;
> +    unsigned long addr;
> +    uint32_t aclint_cells_size;
> +    uint32_t *aclint_mswi_cells;
> +    uint32_t *aclint_sswi_cells;
> +    uint32_t *aclint_mtimer_cells;
> +    MachineState *mc = MACHINE(s);
> +
> +    aclint_mswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +    aclint_mtimer_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +    aclint_sswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> +
> +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> +        aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +        aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
> +        aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +        aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
> +        aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> +        aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
> +    }
> +    aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
> +
> +    addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
> +    name = g_strdup_printf("/soc/mswi@%lx", addr);
> +    qemu_fdt_add_subnode(mc->fdt, name);
> +    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-mswi");
> +    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> +        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
> +    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
> +        aclint_mswi_cells, aclint_cells_size);
> +    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
> +    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +    g_free(name);
> +
> +    addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
> +        (memmap[VIRT_CLINT].size * socket);
> +    name = g_strdup_printf("/soc/mtimer@%lx", addr);
> +    qemu_fdt_add_subnode(mc->fdt, name);
> +    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
> +        "riscv,aclint-mtimer");
> +    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> +        0x0, addr, 0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE);
> +    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
> +        aclint_mtimer_cells, aclint_cells_size);
> +    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +    g_free(name);
> +
> +    addr = memmap[VIRT_ACLINT_SSWI].base +
> +        (memmap[VIRT_ACLINT_SSWI].size * socket);
> +    name = g_strdup_printf("/soc/sswi@%lx", addr);
> +    qemu_fdt_add_subnode(mc->fdt, name);
> +    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-sswi");
> +    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> +        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
> +    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
> +        aclint_sswi_cells, aclint_cells_size);
> +    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
> +    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +    g_free(name);
> +
> +    g_free(aclint_mswi_cells);
> +    g_free(aclint_mtimer_cells);
> +    g_free(aclint_sswi_cells);
> +}
> +
>  static void create_fdt_socket_plic(RISCVVirtState *s,
>                                     const MemMapEntry *memmap, int socket,
>                                     uint32_t *phandle, uint32_t *intc_phandles,
> @@ -352,7 +425,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>
>          create_fdt_socket_memory(s, memmap, socket);
>
> -        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
> +        if (s->have_aclint) {
> +            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
> +        } else {
> +            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
> +        }
>
>          create_fdt_socket_plic(s, memmap, socket, phandle,
>              intc_phandles, xplic_phandles);
> @@ -722,6 +799,15 @@ static void virt_machine_init(MachineState *machine)
>              RISCV_ACLINT_MTIMER_SIZE, base_hartid, hart_count,
>              RISCV_ACLINT_TIMEBASE_FREQ, true);
>
> +        /* Per-socket ACLINT SSWI */
> +        if (s->have_aclint) {
> +            riscv_aclint_swi_create(
> +                memmap[VIRT_ACLINT_SSWI].base +
> +                    i * memmap[VIRT_ACLINT_SSWI].size,
> +                memmap[VIRT_ACLINT_SSWI].size,
> +                base_hartid, hart_count, true);
> +        }
> +
>          /* Per-socket PLIC hart topology configuration string */
>          plic_hart_config_len =
>              (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
> @@ -898,6 +984,22 @@ static void virt_machine_instance_init(Object *obj)
>  {
>  }
>
> +static bool virt_get_aclint(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +
> +    return s->have_aclint;
> +}
> +
> +static void virt_set_aclint(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +
> +    s->have_aclint = value;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -913,6 +1015,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->numa_mem_supported = true;
>
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +
> +    object_class_property_add_bool(oc, "aclint", virt_get_aclint,
> +                                   virt_set_aclint);
> +    object_class_property_set_description(oc, "aclint",
> +                                          "Set on/off to enable/disable "
> +                                          "emulating ACLINT devices");
>  }
>
>  static const TypeInfo virt_machine_typeinfo = {
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 349fee1f89..d9105c1886 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -43,6 +43,7 @@ struct RISCVVirtState {
>      FWCfgState *fw_cfg;
>
>      int fdt_size;
> +    bool have_aclint;
>  };
>
>  enum {
> @@ -51,6 +52,7 @@ enum {
>      VIRT_TEST,
>      VIRT_RTC,
>      VIRT_CLINT,
> +    VIRT_ACLINT_SSWI,
>      VIRT_PLIC,
>      VIRT_UART0,
>      VIRT_VIRTIO,

Regards,
Bin

