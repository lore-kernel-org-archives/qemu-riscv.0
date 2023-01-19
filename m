Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIKTA-0007Pn-B0
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 21:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKT8-0007PU-9e; Wed, 18 Jan 2023 21:15:58 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKT6-0000Ps-FM; Wed, 18 Jan 2023 21:15:58 -0500
Received: by mail-vs1-xe33.google.com with SMTP id 3so730961vsq.7;
 Wed, 18 Jan 2023 18:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLbk+QJA9M17skpED4ifao6PkMxj1f2OAmuQfExt4YU=;
 b=BttXvuig8l2reW3v66jRGyqANgGXXIn7VoxIcjFsYiVGsbkGggIBXk5OfsbdluUT94
 jLo/+dITT/YIwifD4df/Yt/9FjQYANR2ORPyxj1VFFNuSMUxH6vidjftxzMLtm/zMzC6
 28675QLhQCS38QYKPhmp5gCqZ7RVEc37Pis94kJae8O3ObTLNu9M7bn0lmBjpM3C/WB3
 PySdWWPWsFdiBo3iQflm4JSOfhIT61P2DMDOMlP3BE7vECFPEVDhG3jyhnBIuQclAq1Y
 TdH+MlGwD7QqKIj6EyilLIeOK2El7xKWUrSCmrjmpX/0BuS6SXp3RjmzJESxB3IhF+oW
 CQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLbk+QJA9M17skpED4ifao6PkMxj1f2OAmuQfExt4YU=;
 b=QJ1FsuCWuAb6sKG14Ocx9YQ64BW/eeacdHdTwkrPegD65E5+hI5IV9jcWs+OTP3PMl
 6CrdlI+l2w6npv1ULAIYlfx25S2gmsy0e/0CAEvYYzL0auRgYiVyqpFd/3fFNsraK4jq
 OsfsEfHVX0neAGmVcfiCByXlfQcHkQhfYhjHxdGXMtNQFCsyCQLc+ykdIWhDgFSk7Uar
 UZr63a1+mmDCpp6sF/YgRazvcte8sA2YxeFI7CuZIMzMuw9HFkGZB+ngqxlGDRcT63+J
 Np87tpiPw0+X6T/+3aF3XBrTKysOPLsgozqtg2P+IXx2IfjuMXoy5UuFulCJ6eXHXSq/
 4yAg==
X-Gm-Message-State: AFqh2kppXAFepXbxQ4lAJZPiexW5FEdKlZSHzsicnoK0r0iDHvzlDHZ/
 /4R20H0AYBOyTaYbGJVtHDN9ooqgMc7myJ5k5vkC/Rmpojo=
X-Google-Smtp-Source: AMrXdXuI5PNXW1XwccC4dfL3RTtc2bmal9OyNT8PQhicuXOs+4bwFMy+6v2CdZKa/D9B7gImhvyP73Ajb07FGIxeteA=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr1361182vso.73.1674094554909; Wed, 18
 Jan 2023 18:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230116173420.1146808-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 12:15:29 +1000
Message-ID: <CAKmqyKPCyyh30jHkabP=B9GYgMf3+jbTpqeBN3RQ6+nAdnifGw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] hw/riscv/virt.c: calculate socket count once in
 create_fdt_imsic()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 02:15:58 -0000

On Tue, Jan 17, 2023 at 3:36 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_socket_count() returns either ms->numa_state->num_nodes or 1
> depending on NUMA support. In any case the value can be retrieved only
> once and used in the rest of the function.
>
> This will also alleviate the rename we're going to do next by reducing
> the instances of MachineState 'mc' inside hw/riscv/virt.c.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index cbba0b8930..8ff89c217f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -505,13 +505,14 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>      int cpu, socket;
>      char *imsic_name;
>      MachineState *mc =3D MACHINE(s);
> +    int socket_count =3D riscv_socket_count(mc);
>      uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
>      uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
>
>      *msi_m_phandle =3D (*phandle)++;
>      *msi_s_phandle =3D (*phandle)++;
>      imsic_cells =3D g_new0(uint32_t, mc->smp.cpus * 2);
> -    imsic_regs =3D g_new0(uint32_t, riscv_socket_count(mc) * 4);
> +    imsic_regs =3D g_new0(uint32_t, socket_count * 4);
>
>      /* M-level IMSIC node */
>      for (cpu =3D 0; cpu < mc->smp.cpus; cpu++) {
> @@ -519,7 +520,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
>          imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
>      }
>      imsic_max_hart_per_socket =3D 0;
> -    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
> +    for (socket =3D 0; socket < socket_count; socket++) {
>          imsic_addr =3D memmap[VIRT_IMSIC_M].base +
>                       socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>          imsic_size =3D IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
> @@ -545,14 +546,14 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>      qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
>          imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
>      qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
> -        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
> +        socket_count * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
>          VIRT_IRQCHIP_NUM_MSIS);
> -    if (riscv_socket_count(mc) > 1) {
> +    if (socket_count > 1) {
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
>              imsic_num_bits(imsic_max_hart_per_socket));
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
> -            imsic_num_bits(riscv_socket_count(mc)));
> +            imsic_num_bits(socket_count));
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
>              IMSIC_MMIO_GROUP_MIN_SHIFT);
>      }
> @@ -567,7 +568,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
>      }
>      imsic_guest_bits =3D imsic_num_bits(s->aia_guests + 1);
>      imsic_max_hart_per_socket =3D 0;
> -    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
> +    for (socket =3D 0; socket < socket_count; socket++) {
>          imsic_addr =3D memmap[VIRT_IMSIC_S].base +
>                       socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>          imsic_size =3D IMSIC_HART_SIZE(imsic_guest_bits) *
> @@ -594,18 +595,18 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>      qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
>          imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
>      qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
> -        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
> +        socket_count * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
>          VIRT_IRQCHIP_NUM_MSIS);
>      if (imsic_guest_bits) {
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bi=
ts",
>              imsic_guest_bits);
>      }
> -    if (riscv_socket_count(mc) > 1) {
> +    if (socket_count > 1) {
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
>              imsic_num_bits(imsic_max_hart_per_socket));
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
> -            imsic_num_bits(riscv_socket_count(mc)));
> +            imsic_num_bits(socket_count));
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
>              IMSIC_MMIO_GROUP_MIN_SHIFT);
>      }
> @@ -733,6 +734,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>      MachineState *mc =3D MACHINE(s);
>      uint32_t msi_m_phandle =3D 0, msi_s_phandle =3D 0;
>      uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
> +    int socket_count =3D riscv_socket_count(mc);
>
>      qemu_fdt_add_subnode(mc->fdt, "/cpus");
>      qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
> @@ -744,7 +746,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>      intc_phandles =3D g_new0(uint32_t, mc->smp.cpus);
>
>      phandle_pos =3D mc->smp.cpus;
> -    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
> +    for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
>          phandle_pos -=3D s->soc[socket].num_harts;
>
>          clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
> @@ -775,7 +777,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>      }
>
>      phandle_pos =3D mc->smp.cpus;
> -    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
> +    for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
>          phandle_pos -=3D s->soc[socket].num_harts;
>
>          if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
> @@ -790,7 +792,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>
>      g_free(intc_phandles);
>
> -    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
> +    for (socket =3D 0; socket < socket_count; socket++) {
>          if (socket =3D=3D 0) {
>              *irq_mmio_phandle =3D xplic_phandles[socket];
>              *irq_virtio_phandle =3D xplic_phandles[socket];
> @@ -1051,7 +1053,8 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap)
>
>      /* Pass seed to RNG */
>      qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> -    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rn=
g_seed));
> +    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed",
> +                     rng_seed, sizeof(rng_seed));
>  }
>
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> @@ -1335,9 +1338,10 @@ static void virt_machine_init(MachineState *machin=
e)
>      char *soc_name;
>      DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>      int i, base_hartid, hart_count;
> +    int socket_count =3D riscv_socket_count(machine);
>
>      /* Check socket count limit */
> -    if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
> +    if (VIRT_SOCKETS_MAX < socket_count) {
>          error_report("number of sockets/nodes should be less than %d",
>              VIRT_SOCKETS_MAX);
>          exit(1);
> @@ -1345,7 +1349,7 @@ static void virt_machine_init(MachineState *machine=
)
>
>      /* Initialize sockets */
>      mmio_irqchip =3D virtio_irqchip =3D pcie_irqchip =3D NULL;
> -    for (i =3D 0; i < riscv_socket_count(machine); i++) {
> +    for (i =3D 0; i < socket_count; i++) {
>          if (!riscv_socket_check_hartids(machine, i)) {
>              error_report("discontinuous hartids in socket%d", i);
>              exit(1);
> --
> 2.39.0
>
>

