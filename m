Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2oh2-0006Du-R5
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 01:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2ogw-0006Bh-9T
 for qemu-riscv@nongnu.org; Mon, 12 Jul 2021 01:41:20 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2ogr-0007Lz-HS
 for qemu-riscv@nongnu.org; Mon, 12 Jul 2021 01:41:17 -0400
Received: by mail-lj1-x22b.google.com with SMTP id r16so22173544ljk.9
 for <qemu-riscv@nongnu.org>; Sun, 11 Jul 2021 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5sqzKplh7cAmWOnAOZrEzBEUZ2P9J0Xqvexk4aYsCY=;
 b=IoHxjpddn9rYlxEkwrQTklP3vV9fAfcwWx1wcy2IqOxqjgsJrvOWAVRyhL35S1rP+k
 6+7YtTTa7ds7jHH3cutuTympJ+eDe4kznBKebR5Gb3mkqr7HRpNG1ak8kaKXUuUYrPlc
 n6CT500jsc8SA/inlfEMfDHx0jq2RZ7BG8No/Tdj8XBqEgZMdgZkYRLv09BVs5cDEaQ+
 Ouap53e6be/Qro8DjMo2FsU8dTG8pCzhg2FxjB+F2UT32IIgZggliQsbvW/KR9fh0Vw7
 9HaOWhe8yxHBVcyReog+zAL8ytUHZM8wREQode0NeYk+fcnPHlVVqWRCoTWeOrJDs0fs
 ayUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5sqzKplh7cAmWOnAOZrEzBEUZ2P9J0Xqvexk4aYsCY=;
 b=ezuRSYcFCLEfYRb1XakAW6BBVTCwx/4QNhV9KwUv63sFqE6Lq817a8mXtszzQzh+cY
 A0Vn2JbkzCcnP5gqeRS6oN8zmRQSrscEBJb+Sta3G+ulSFmdQsNWt+LPuOEr0qaURtKj
 sOmhY7gjv0CRAHKIATq9XbwDmZESbW1u3rqZijTI3eALpOZ6Cf3NW50jb1fcUDPD3/mK
 4Q2lFuqZ7GUASm2/k83Lt07J5ocTJv1ENiuHR+3yPYbTzv2028cY3jPMDg3y+S603KYX
 bQqAS3HLzTCanBHz0Zk86n8DfLWB5w29P+VnjEBTsPHR7i6hC0s2VP577rqWPH3cLysb
 4Xig==
X-Gm-Message-State: AOAM530HNDYH//zJX7kVbJR9+nyC5x+4cpZnBkvfJRKj+udmCc5Vgj3Y
 IOe4ELhNYuJsY8VEWqsgi2zOlOavFPl/noh8e1Gj+w==
X-Google-Smtp-Source: ABdhPJxZgRp+BnWslAqI4kv1+to6WN9n6rbOneguaus6AfHZz+rm6OVxprZoF29V43bff/nCMmGvw+ZEXhyAf3avjvw=
X-Received: by 2002:a2e:9c14:: with SMTP id s20mr39153557lji.393.1626068470193; 
 Sun, 11 Jul 2021 22:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-3-anup.patel@wdc.com>
 <CAEUhbmWmFuyLVd95-Jgwqr022N82iBKfXxqvczc8i0C2SWrBuQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWmFuyLVd95-Jgwqr022N82iBKfXxqvczc8i0C2SWrBuQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jul 2021 11:10:58 +0530
Message-ID: <CAAhSdy21hE_D2jWeAsk4nf8+tJ1fXKvbnAsx3BgQfFMNB1qbNA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] hw/riscv: virt: Re-factor FDT generation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::22b;
 envelope-from=anup@brainfault.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Jul 2021 05:41:20 -0000

On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jun 13, 2021 at 12:12 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We re-factor and break the FDT generation into smaller functions
> > so that it is easier to modify FDT generation for different
> > configurations of virt machine.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  hw/riscv/virt.c | 514 ++++++++++++++++++++++++++++++------------------
> >  1 file changed, 320 insertions(+), 194 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 5eb63f6efd..977d699753 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -178,206 +178,253 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
> >                             0x1800, 0, 0, 0x7);
> >  }
> >
> > -static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> > -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> > +static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> > +                                   char *clust_name, uint32_t *phandle,
> > +                                   bool is_32_bit, uint32_t *intc_phandles)
> >  {
> > -    void *fdt;
> > -    int i, cpu, socket;
> > +    int cpu;
> > +    uint32_t cpu_phandle;
> >      MachineState *mc = MACHINE(s);
> > +    char *name, *cpu_name, *core_name, *intc_name;
> > +
> > +    for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> > +        cpu_phandle = (*phandle)++;
> > +
> > +        cpu_name = g_strdup_printf("/cpus/cpu@%d",
> > +            s->soc[socket].hartid_base + cpu);
> > +        qemu_fdt_add_subnode(mc->fdt, cpu_name);
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> > +            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> > +        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
> > +        g_free(name);
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv");
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "status", "okay");
> > +        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
> > +            s->soc[socket].hartid_base + cpu);
> > +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
> > +        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
> > +        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
> > +
> > +        intc_phandles[cpu] = (*phandle)++;
> > +
> > +        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
> > +        qemu_fdt_add_subnode(mc->fdt, intc_name);
> > +        qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
> > +            intc_phandles[cpu]);
> > +        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> > +            "riscv,cpu-intc");
> > +        qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
> > +        qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
> > +
> > +        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
> > +        qemu_fdt_add_subnode(mc->fdt, core_name);
> > +        qemu_fdt_setprop_cell(mc->fdt, core_name, "cpu", cpu_phandle);
> > +
> > +        g_free(core_name);
> > +        g_free(intc_name);
> > +        g_free(cpu_name);
> > +    }
> > +}
> > +
> > +static void create_fdt_socket_memory(RISCVVirtState *s,
> > +                                     const MemMapEntry *memmap, int socket)
> > +{
> > +    char *mem_name;
> >      uint64_t addr, size;
> > -    uint32_t *clint_cells, *plic_cells;
> > -    unsigned long clint_addr, plic_addr;
> > -    uint32_t plic_phandle[MAX_NODES];
> > -    uint32_t cpu_phandle, intc_phandle, test_phandle;
> > -    uint32_t phandle = 1, plic_mmio_phandle = 1;
> > -    uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
> > -    char *mem_name, *cpu_name, *core_name, *intc_name;
> > -    char *name, *clint_name, *plic_name, *clust_name;
> > -    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> > -    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> > +    MachineState *mc = MACHINE(s);
> >
> > -    if (mc->dtb) {
> > -        fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
> > -        if (!fdt) {
> > -            error_report("load_device_tree() failed");
> > -            exit(1);
> > -        }
> > -        goto update_bootargs;
> > -    } else {
> > -        fdt = mc->fdt = create_device_tree(&s->fdt_size);
> > -        if (!fdt) {
> > -            error_report("create_device_tree() failed");
> > -            exit(1);
> > -        }
> > +    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
> > +    size = riscv_socket_mem_size(mc, socket);
> > +    mem_name = g_strdup_printf("/memory@%lx", (long)addr);
> > +    qemu_fdt_add_subnode(mc->fdt, mem_name);
> > +    qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
> > +        addr >> 32, addr, size >> 32, size);
> > +    qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
> > +    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
> > +    g_free(mem_name);
> > +}
> > +
> > +static void create_fdt_socket_clint(RISCVVirtState *s,
> > +                                    const MemMapEntry *memmap, int socket,
> > +                                    uint32_t *intc_phandles)
> > +{
> > +    int cpu;
> > +    char *clint_name;
> > +    uint32_t *clint_cells;
> > +    unsigned long clint_addr;
> > +    MachineState *mc = MACHINE(s);
> > +
> > +    clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
> > +
> > +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +        clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
> > +        clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
> > +        clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
> > +        clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
> >      }
> >
> > -    qemu_fdt_setprop_string(fdt, "/", "model", "riscv-virtio,qemu");
> > -    qemu_fdt_setprop_string(fdt, "/", "compatible", "riscv-virtio");
> > -    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> > -    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> > +    clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
> > +    clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
> > +    qemu_fdt_add_subnode(mc->fdt, clint_name);
> > +    qemu_fdt_setprop_string(mc->fdt, clint_name, "compatible",
> > +        "riscv,clint0");
>
> This patch seems to be based on some old commit, as the latest QEMU
> head has the following commit that supports the official clint
> compatible name via:
>
> commit b387236bff95 ("hw/riscv: Support the official CLINT DT bindings")

Yes, I will be rebasing on the most recent tree of Alistair.

Regards,
Anup

>
> > +    qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
> > +        0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
> > +    qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
> > +        clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> > +    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
> > +    g_free(clint_name);
> > +
> > +    g_free(clint_cells);
> > +}
> > +
> > +static void create_fdt_socket_plic(RISCVVirtState *s,
> > +                                   const MemMapEntry *memmap, int socket,
> > +                                   uint32_t *phandle, uint32_t *intc_phandles,
> > +                                   uint32_t *plic_phandles)
> > +{
> > +    int cpu;
> > +    char *plic_name;
> > +    uint32_t *plic_cells;
> > +    unsigned long plic_addr;
> > +    MachineState *mc = MACHINE(s);
> >
> > -    qemu_fdt_add_subnode(fdt, "/soc");
> > -    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> > -    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> > -    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
> > -    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
> > +    plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
> >
> > -    qemu_fdt_add_subnode(fdt, "/cpus");
> > -    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> > +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +        plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
> > +        plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
> > +        plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
> > +        plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
> > +    }
> > +
> > +    plic_phandles[socket] = (*phandle)++;
> > +    plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
> > +    plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
> > +    qemu_fdt_add_subnode(mc->fdt, plic_name);
> > +    qemu_fdt_setprop_cell(mc->fdt, plic_name,
> > +        "#address-cells", FDT_PLIC_ADDR_CELLS);
> > +    qemu_fdt_setprop_cell(mc->fdt, plic_name,
> > +        "#interrupt-cells", FDT_PLIC_INT_CELLS);
> > +    qemu_fdt_setprop_string(mc->fdt, plic_name, "compatible", "riscv,plic0");
> > +    qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0);
> > +    qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
> > +        plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> > +    qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
> > +        0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
> > +    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
> > +    riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
> > +    qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
> > +        plic_phandles[socket]);
> > +    g_free(plic_name);
> > +
> > +    g_free(plic_cells);
> > +}
> > +
> > +static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                               bool is_32_bit, uint32_t *phandle,
> > +                               uint32_t *irq_mmio_phandle,
> > +                               uint32_t *irq_pcie_phandle,
> > +                               uint32_t *irq_virtio_phandle)
> > +{
> > +    int socket;
> > +    char *clust_name;
> > +    uint32_t *intc_phandles;
> > +    MachineState *mc = MACHINE(s);
> > +    uint32_t xplic_phandles[MAX_NODES];
> > +
> > +    qemu_fdt_add_subnode(mc->fdt, "/cpus");
> > +    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
> >                            RISCV_ACLINT_TIMEBASE_FREQ);
> > -    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
> > -    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
> > -    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
> > +    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
> > +    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
> > +    qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
> >
> >      for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
> >          clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
> > -        qemu_fdt_add_subnode(fdt, clust_name);
> > +        qemu_fdt_add_subnode(mc->fdt, clust_name);
> >
> > -        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
> > -        clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
> > +        intc_phandles = g_new0(uint32_t, s->soc[socket].num_harts);
> >
> > -        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> > -            cpu_phandle = phandle++;
> > +        create_fdt_socket_cpus(s, socket, clust_name, phandle,
> > +            is_32_bit, intc_phandles);
> >
> > -            cpu_name = g_strdup_printf("/cpus/cpu@%d",
> > -                s->soc[socket].hartid_base + cpu);
> > -            qemu_fdt_add_subnode(fdt, cpu_name);
> > -            if (is_32_bit) {
> > -                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
> > -            } else {
> > -                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
> > -            }
> > -            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> > -            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
> > -            g_free(name);
> > -            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
> > -            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
> > -            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
> > -                s->soc[socket].hartid_base + cpu);
> > -            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
> > -            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
> > -            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
> > -
> > -            intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
> > -            qemu_fdt_add_subnode(fdt, intc_name);
> > -            intc_phandle = phandle++;
> > -            qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
> > -            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
> > -                "riscv,cpu-intc");
> > -            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
> > -            qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
> > -
> > -            clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> > -            clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
> > -            clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> > -            clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
> > -
> > -            plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
> > -            plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
> > -            plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
> > -            plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
> > -
> > -            core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
> > -            qemu_fdt_add_subnode(fdt, core_name);
> > -            qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
> > -
> > -            g_free(core_name);
> > -            g_free(intc_name);
> > -            g_free(cpu_name);
> > -        }
> > +        create_fdt_socket_memory(s, memmap, socket);
> >
> > -        addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
> > -        size = riscv_socket_mem_size(mc, socket);
> > -        mem_name = g_strdup_printf("/memory@%lx", (long)addr);
> > -        qemu_fdt_add_subnode(fdt, mem_name);
> > -        qemu_fdt_setprop_cells(fdt, mem_name, "reg",
> > -            addr >> 32, addr, size >> 32, size);
> > -        qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
> > -        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
> > -        g_free(mem_name);
> > -
> > -        clint_addr = memmap[VIRT_CLINT].base +
> > -            (memmap[VIRT_CLINT].size * socket);
> > -        clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
> > -        qemu_fdt_add_subnode(fdt, clint_name);
> > -        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
> > -        qemu_fdt_setprop_cells(fdt, clint_name, "reg",
> > -            0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
> > -        qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> > -            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> > -        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
> > -        g_free(clint_name);
> > -
> > -        plic_phandle[socket] = phandle++;
> > -        plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
> > -        plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
> > -        qemu_fdt_add_subnode(fdt, plic_name);
> > -        qemu_fdt_setprop_cell(fdt, plic_name,
> > -            "#address-cells", FDT_PLIC_ADDR_CELLS);
> > -        qemu_fdt_setprop_cell(fdt, plic_name,
> > -            "#interrupt-cells", FDT_PLIC_INT_CELLS);
> > -        qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
> > -        qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
> > -        qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
> > -            plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> > -        qemu_fdt_setprop_cells(fdt, plic_name, "reg",
> > -            0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
> > -        qemu_fdt_setprop_cell(fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
> > -        riscv_socket_fdt_write_id(mc, fdt, plic_name, socket);
> > -        qemu_fdt_setprop_cell(fdt, plic_name, "phandle", plic_phandle[socket]);
> > -        g_free(plic_name);
> > -
> > -        g_free(clint_cells);
> > -        g_free(plic_cells);
> > +        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
> > +
> > +        create_fdt_socket_plic(s, memmap, socket, phandle,
> > +            intc_phandles, xplic_phandles);
> > +
> > +        g_free(intc_phandles);
> >          g_free(clust_name);
> >      }
> >
> >      for (socket = 0; socket < riscv_socket_count(mc); socket++) {
> >          if (socket == 0) {
> > -            plic_mmio_phandle = plic_phandle[socket];
> > -            plic_virtio_phandle = plic_phandle[socket];
> > -            plic_pcie_phandle = plic_phandle[socket];
> > +            *irq_mmio_phandle = xplic_phandles[socket];
> > +            *irq_virtio_phandle = xplic_phandles[socket];
> > +            *irq_pcie_phandle = xplic_phandles[socket];
> >          }
> >          if (socket == 1) {
> > -            plic_virtio_phandle = plic_phandle[socket];
> > -            plic_pcie_phandle = plic_phandle[socket];
> > +            *irq_virtio_phandle = xplic_phandles[socket];
> > +            *irq_pcie_phandle = xplic_phandles[socket];
> >          }
> >          if (socket == 2) {
> > -            plic_pcie_phandle = plic_phandle[socket];
> > +            *irq_pcie_phandle = xplic_phandles[socket];
> >          }
> >      }
> >
> > -    riscv_socket_fdt_write_distance_matrix(mc, fdt);
> > +    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
> > +}
> > +
> > +static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                              uint32_t irq_virtio_phandle)
> > +{
> > +    int i;
> > +    char *name;
> > +    MachineState *mc = MACHINE(s);
> >
> >      for (i = 0; i < VIRTIO_COUNT; i++) {
> >          name = g_strdup_printf("/soc/virtio_mmio@%lx",
> >              (long)(memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size));
> > -        qemu_fdt_add_subnode(fdt, name);
> > -        qemu_fdt_setprop_string(fdt, name, "compatible", "virtio,mmio");
> > -        qemu_fdt_setprop_cells(fdt, name, "reg",
> > +        qemu_fdt_add_subnode(mc->fdt, name);
> > +        qemu_fdt_setprop_string(mc->fdt, name, "compatible", "virtio,mmio");
> > +        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> >              0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
> >              0x0, memmap[VIRT_VIRTIO].size);
> > -        qemu_fdt_setprop_cell(fdt, name, "interrupt-parent",
> > -            plic_virtio_phandle);
> > -        qemu_fdt_setprop_cell(fdt, name, "interrupts", VIRTIO_IRQ + i);
> > +        qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
> > +            irq_virtio_phandle);
> > +        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", VIRTIO_IRQ + i);
> >          g_free(name);
> >      }
> > +}
> > +
> > +static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                            uint32_t irq_pcie_phandle)
> > +{
> > +    char *name;
> > +    MachineState *mc = MACHINE(s);
> >
> >      name = g_strdup_printf("/soc/pci@%lx",
> >          (long) memmap[VIRT_PCIE_ECAM].base);
> > -    qemu_fdt_add_subnode(fdt, name);
> > -    qemu_fdt_setprop_cell(fdt, name, "#address-cells", FDT_PCI_ADDR_CELLS);
> > -    qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", FDT_PCI_INT_CELLS);
> > -    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0x2);
> > -    qemu_fdt_setprop_string(fdt, name, "compatible", "pci-host-ecam-generic");
> > -    qemu_fdt_setprop_string(fdt, name, "device_type", "pci");
> > -    qemu_fdt_setprop_cell(fdt, name, "linux,pci-domain", 0);
> > -    qemu_fdt_setprop_cells(fdt, name, "bus-range", 0,
> > +    qemu_fdt_add_subnode(mc->fdt, name);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells",
> > +        FDT_PCI_ADDR_CELLS);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells",
> > +        FDT_PCI_INT_CELLS);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
> > +    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
> > +        "pci-host-ecam-generic");
> > +    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
> > +    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
> >          memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
> > -    qemu_fdt_setprop(fdt, name, "dma-coherent", NULL, 0);
> > -    qemu_fdt_setprop_cells(fdt, name, "reg", 0,
> > +    qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
> > +    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
> >          memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
> > -    qemu_fdt_setprop_sized_cells(fdt, name, "ranges",
> > +    qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
> >          1, FDT_PCI_RANGE_IOPORT, 2, 0,
> >          2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
> >          1, FDT_PCI_RANGE_MMIO,
> > @@ -387,63 +434,93 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> >          2, virt_high_pcie_memmap.base,
> >          2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
> >
> > -    create_pcie_irq_map(fdt, name, plic_pcie_phandle);
> > +    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
> >      g_free(name);
> > +}
> > +
> > +static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                             uint32_t *phandle)
> > +{
> > +    char *name;
> > +    uint32_t test_phandle;
> > +    MachineState *mc = MACHINE(s);
> >
> > -    test_phandle = phandle++;
> > +    test_phandle = (*phandle)++;
> >      name = g_strdup_printf("/soc/test@%lx",
> >          (long)memmap[VIRT_TEST].base);
> > -    qemu_fdt_add_subnode(fdt, name);
> > +    qemu_fdt_add_subnode(mc->fdt, name);
> >      {
> >          const char compat[] = "sifive,test1\0sifive,test0\0syscon";
> > -        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
> > +        qemu_fdt_setprop(mc->fdt, name, "compatible", compat, sizeof(compat));
> >      }
> > -    qemu_fdt_setprop_cells(fdt, name, "reg",
> > -        0x0, memmap[VIRT_TEST].base,
> > -        0x0, memmap[VIRT_TEST].size);
> > -    qemu_fdt_setprop_cell(fdt, name, "phandle", test_phandle);
> > -    test_phandle = qemu_fdt_get_phandle(fdt, name);
> > +    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> > +        0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
> > +    test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
> >      g_free(name);
> >
> >      name = g_strdup_printf("/soc/reboot");
> > -    qemu_fdt_add_subnode(fdt, name);
> > -    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-reboot");
> > -    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
> > -    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
> > -    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_RESET);
> > +    qemu_fdt_add_subnode(mc->fdt, name);
> > +    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
> >      g_free(name);
> >
> >      name = g_strdup_printf("/soc/poweroff");
> > -    qemu_fdt_add_subnode(fdt, name);
> > -    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-poweroff");
> > -    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
> > -    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
> > -    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_PASS);
> > +    qemu_fdt_add_subnode(mc->fdt, name);
> > +    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_PASS);
> >      g_free(name);
> > +}
> > +
> > +static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                            uint32_t irq_mmio_phandle)
> > +{
> > +    char *name;
> > +    MachineState *mc = MACHINE(s);
> >
> >      name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
> > -    qemu_fdt_add_subnode(fdt, name);
> > -    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
> > -    qemu_fdt_setprop_cells(fdt, name, "reg",
> > +    qemu_fdt_add_subnode(mc->fdt, name);
> > +    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
> > +    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> >          0x0, memmap[VIRT_UART0].base,
> >          0x0, memmap[VIRT_UART0].size);
> > -    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
> > -    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phandle);
> > -    qemu_fdt_setprop_cell(fdt, name, "interrupts", UART0_IRQ);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_phandle);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
> >
> > -    qemu_fdt_add_subnode(fdt, "/chosen");
> > -    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
> > +    qemu_fdt_add_subnode(mc->fdt, "/chosen");
> > +    qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
> >      g_free(name);
> > +}
> > +
> > +static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                           uint32_t irq_mmio_phandle)
> > +{
> > +    char *name;
> > +    MachineState *mc = MACHINE(s);
> >
> >      name = g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base);
> > -    qemu_fdt_add_subnode(fdt, name);
> > -    qemu_fdt_setprop_string(fdt, name, "compatible", "google,goldfish-rtc");
> > -    qemu_fdt_setprop_cells(fdt, name, "reg",
> > -        0x0, memmap[VIRT_RTC].base,
> > -        0x0, memmap[VIRT_RTC].size);
> > -    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phandle);
> > -    qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
> > +    qemu_fdt_add_subnode(mc->fdt, name);
> > +    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
> > +        "google,goldfish-rtc");
> > +    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
> > +        0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
> > +        irq_mmio_phandle);
> > +    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
> >      g_free(name);
> > +}
> > +
> > +static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
> > +{
> > +    char *name;
> > +    MachineState *mc = MACHINE(s);
> > +    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> > +    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> >
> >      name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
> >      qemu_fdt_add_subnode(mc->fdt, name);
> > @@ -453,10 +530,59 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> >                                   2, flashbase + flashsize, 2, flashsize);
> >      qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
> >      g_free(name);
> > +}
> > +
> > +static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> > +                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> > +{
> > +    MachineState *mc = MACHINE(s);
> > +    uint32_t phandle = 1, irq_mmio_phandle = 1;
> > +    uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
> > +
> > +    if (mc->dtb) {
> > +        mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
> > +        if (!mc->fdt) {
> > +            error_report("load_device_tree() failed");
> > +            exit(1);
> > +        }
> > +        goto update_bootargs;
> > +    } else {
> > +        mc->fdt = create_device_tree(&s->fdt_size);
> > +        if (!mc->fdt) {
> > +            error_report("create_device_tree() failed");
> > +            exit(1);
> > +        }
> > +    }
> > +
> > +    qemu_fdt_setprop_string(mc->fdt, "/", "model", "riscv-virtio,qemu");
> > +    qemu_fdt_setprop_string(mc->fdt, "/", "compatible", "riscv-virtio");
> > +    qemu_fdt_setprop_cell(mc->fdt, "/", "#size-cells", 0x2);
> > +    qemu_fdt_setprop_cell(mc->fdt, "/", "#address-cells", 0x2);
> > +
> > +    qemu_fdt_add_subnode(mc->fdt, "/soc");
> > +    qemu_fdt_setprop(mc->fdt, "/soc", "ranges", NULL, 0);
> > +    qemu_fdt_setprop_string(mc->fdt, "/soc", "compatible", "simple-bus");
> > +    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
> > +    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
> > +
> > +    create_fdt_sockets(s, memmap, is_32_bit, &phandle,
> > +        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
> > +
> > +    create_fdt_virtio(s, memmap, irq_virtio_phandle);
> > +
> > +    create_fdt_pcie(s, memmap, irq_pcie_phandle);
> > +
> > +    create_fdt_reset(s, memmap, &phandle);
> > +
> > +    create_fdt_uart(s, memmap, irq_mmio_phandle);
> > +
> > +    create_fdt_rtc(s, memmap, irq_mmio_phandle);
> > +
> > +    create_fdt_flash(s, memmap);
> >
> >  update_bootargs:
> >      if (cmdline) {
> > -        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> > +        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
> >      }
> >  }
>
> Regards,
> Bin

