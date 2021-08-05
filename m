Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBWa0-0004dj-UH
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 02:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWZz-0004dT-0f; Thu, 05 Aug 2021 02:10:07 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:45017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mBWZx-0002Rt-2v; Thu, 05 Aug 2021 02:10:06 -0400
Received: by mail-il1-x131.google.com with SMTP id i13so3988362ilm.11;
 Wed, 04 Aug 2021 23:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADBcMylQzVmYNb5pQhsRWlslTGSfcNXxvG5OGdflia8=;
 b=rrKt//JvVOauC9+R+YeDxJFEhGnqJ3Yrlvzp4UAWF1WwOuFGJbTdWH3KiH2tQfrcZE
 ObqchSgf07ZSA7slhum7QiIMJ8s6EJLRfJlwhsgVo09OAYxFHBftEaUhzimQSjUJsyiN
 3USPT/h66O7AZQNlQZNYcUtLZwArrd9avqxx3FdD9XNHiBd3/Qo1DEZJ1WC5iVofCF2f
 VPWQfNU2gGgMlruF78oSzm27sc0EJZuqHmRBe4J1ChPiTv2oeJzAN44UkDG9F3w2eU8B
 AvOVH9jjADV478yhdsFyW7Q9kmkpek1+Hf1hWKmRPs+HJZar8lXNTCFq5ufUVUDJO7ZV
 hIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADBcMylQzVmYNb5pQhsRWlslTGSfcNXxvG5OGdflia8=;
 b=itp6iZkLU7WVH7ruIiRzj+DZtL7O/qAueaeW4e0XglyxAn8ZEBrW/IbWkzzpJxaY06
 9gL1VQuLFEd4iRlkD0kAVv3jO3LJ2FNJkxFG/VqeMlSOASfTanWPo26Mck0PlIwjlaiN
 39CDRNGP4btpBtnmckPLEWjufTH5keKTJiW+bOWnGmRnnDn40dlu0eppSUJcdMWkbOUZ
 S4oZI2LYRT/0pihFffh8H5hYxs1KBRFIlvHTXN0G4iCDtq1IxTv9vDPXNOQOoLjK9kuR
 m3Vap+1Eq/Nh5/Ror1PiWGnT5hKAzxcKtJCZRPlQ2R0jt2S5G0L8mhLk1QSBZic7Wark
 pdsQ==
X-Gm-Message-State: AOAM533NuVlDtodsiPTwwXTGCsaS0rKwz68ExEbl1avRT16+yGM1U2Va
 yy9mSMQOtCW2+LX+Mh8v+1G5eZlegkrMyW/CjKs=
X-Google-Smtp-Source: ABdhPJzLGBlOIN5OQupoojBVvxF1bcUUuJ/uqSaKY4ahhc/zH0hYD66z/hwvYljOcG73Y80jCiJJ7OmekKZfMO9fpe4=
X-Received: by 2002:a92:c24d:: with SMTP id k13mr394094ilo.227.1628143803627; 
 Wed, 04 Aug 2021 23:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-5-anup.patel@wdc.com>
In-Reply-To: <20210724122407.2486558-5-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Aug 2021 16:09:37 +1000
Message-ID: <CAKmqyKN2J7_Sa69bxuzEpaQqDu42EYTQR48Rf7Lkb_EdLcKaRA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/riscv: virt: Add optional ACLINT support to
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Thu, 05 Aug 2021 06:10:07 -0000

On Sat, Jul 24, 2021 at 10:27 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We extend virt machine to emulate ACLINT devices only when "aclint=on"
> parameter is passed along with machine name in QEMU command-line.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/virt.c         | 113 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/riscv/virt.h |   2 +
>  2 files changed, 114 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 48c8b4aeb2..7259057a74 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -49,6 +49,7 @@ static const MemMapEntry virt_memmap[] = {
>      [VIRT_TEST] =        {   0x100000,        0x1000 },
>      [VIRT_RTC] =         {   0x101000,        0x1000 },
>      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },

Couldn't we use the same address as the current CLINT?

Alistair

>      [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
>      [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
> @@ -282,6 +283,82 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
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
> +        0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
> +        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
> +             RISCV_ACLINT_DEFAULT_MTIME,
> +        0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
> +        0x0, RISCV_ACLINT_DEFAULT_MTIME);
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
> @@ -360,7 +437,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
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
> @@ -734,6 +815,14 @@ static void virt_machine_init(MachineState *machine)
>              RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>              RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
>
> +        /* Per-socket ACLINT SSWI */
> +        if (s->have_aclint) {
> +            riscv_aclint_swi_create(
> +                memmap[VIRT_ACLINT_SSWI].base +
> +                    i * memmap[VIRT_ACLINT_SSWI].size,
> +                base_hartid, hart_count, true);
> +        }
> +
>          /* Per-socket PLIC hart topology configuration string */
>          plic_hart_config_len =
>              (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
> @@ -908,6 +997,22 @@ static void virt_machine_instance_init(Object *obj)
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
> @@ -923,6 +1028,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
> --
> 2.25.1
>
>

