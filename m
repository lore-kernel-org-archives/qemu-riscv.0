Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGeb-0008Mq-OW
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGea-0008MZ-80; Sun, 15 Jan 2023 22:59:24 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGeY-0001gV-Dp; Sun, 15 Jan 2023 22:59:23 -0500
Received: by mail-vs1-xe34.google.com with SMTP id k4so27845439vsc.4;
 Sun, 15 Jan 2023 19:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B23PUcYuSBn2pTz5X3It7LWM7r/dqGJ6/3fXVTJ4pHc=;
 b=OKj7fFKxhruFpZVqoKAaO148AKwgaAR1RPynYU9rITZJ51wU/C00G6tqKXM/WhbeyM
 iVTXUlsU4ZfMBd90N7iHmfCAWhHiFwIcFeRR0TJlT1l7i6GSfguAi8d0rfS0Hb5y2wU8
 UPkQ/MelNhNZlQI6xwbxImuiN6tGFKzZMl639Mmsvw2onHCijYnmYjo+xJuAyXZlMtRX
 wJ016seGui8ylFaQRbRnVY1T8U3I49Cvi/n/Awsp7PP+3VTt1nOOc3miL8wl6b8MHBFf
 m5uArEnwm45CxP+62YPeBWbSRous80dS7sz8brCAXh3aVDVQNdOw2kB51JOtMVBLgIN0
 Ljaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B23PUcYuSBn2pTz5X3It7LWM7r/dqGJ6/3fXVTJ4pHc=;
 b=v42zKd91YXyBCJTlEU9zGwEydWfWBP7bwQoIefevq+byHUVwyWzq59k8k2UM56snYc
 hGrL4BiRJGexu5FJiO009FtEVVkx5GWkm0IDQvddzKwyPL6oP2ucbzB9QbtCVc2uTccP
 VlX0GZvgId/Yl2dskfbSkol7xrfeZHYfeFw2/VDkMJXYuXMuDYmlmxR4nrQXmBImh0Lv
 1/dG0sJOP8IFcVzH5KDsbn2XjQNyPCp12j4EH1KAw/XG0s2WH5S34l4wyIPxsVddPJPw
 mEsjlWBmHVd2yLUEeMjo5KfbAdI4tH04+km7OMZ/5leUi7RKOrWYKyQCkZ8FbvzSDHZc
 GK8g==
X-Gm-Message-State: AFqh2kq/JYul+d4D+6pfsGH4uLc920RxyXh6f4mCHO2CWqHGmk91TiMn
 Md6P1mgqGD8ELku2AUSGlZFSEjF4TopOdyyeGqc=
X-Google-Smtp-Source: AMrXdXsHeNvWPFmhXl2DM9hTWvExde37ALLZGFcfre12/rUsrhwnMLH1mGmT7o3OppbzdjYtWthHlRiDBf8W4VmVw7Y=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr10389475vsv.73.1673841560995; Sun, 15
 Jan 2023 19:59:20 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:58:54 +1000
Message-ID: <CAKmqyKOZPfnRhMAkHS9pzQfOJNmjKNjUsFFHXHQ6xV4TdW_H7w@mail.gmail.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt.c: remove 'is_32_bit' param from
 create_fdt_socket_cpus()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 03:59:24 -0000

On Thu, Jan 12, 2023 at 3:22 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> create_fdt_socket_cpus() writes a different 'mmu-type' value if we're
> running in 32 or 64 bits. However, the flag is being calculated during
> virt_machine_init(), and is passed around in create_fdt(), then
> create_fdt_socket(), and then finally create_fdt_socket_cpus(). None of
> the intermediate functions are using the flag, which is a bit
> misleading.
>
> Remove 'is_32_bit' flag from create_fdt_socket_cpus() and calculate it
> using the already available RISCVVirtState pointer. This will also
> change the signature of create_fdt_socket() and create_fdt(), making it
> clear that these functions don't do anything special when we're running
> in 32 bit mode.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 89c99ec1af..99a0a43a73 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -223,12 +223,13 @@ static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
>
>  static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>                                     char *clust_name, uint32_t *phandle,
> -                                   bool is_32_bit, uint32_t *intc_phandles)
> +                                   uint32_t *intc_phandles)
>  {
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
>      char *name, *cpu_name, *core_name, *intc_name;
> +    bool is_32_bit = riscv_is_32bit(&s->soc[0]);
>
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -721,7 +722,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
>  }
>
>  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
> -                               bool is_32_bit, uint32_t *phandle,
> +                               uint32_t *phandle,
>                                 uint32_t *irq_mmio_phandle,
>                                 uint32_t *irq_pcie_phandle,
>                                 uint32_t *irq_virtio_phandle,
> @@ -750,7 +751,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>          qemu_fdt_add_subnode(mc->fdt, clust_name);
>
>          create_fdt_socket_cpus(s, socket, clust_name, phandle,
> -            is_32_bit, &intc_phandles[phandle_pos]);
> +                               &intc_phandles[phandle_pos]);
>
>          create_fdt_socket_memory(s, memmap, socket);
>
> @@ -998,8 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
>      g_free(nodename);
>  }
>
> -static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> -                       bool is_32_bit)
> +static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>  {
>      MachineState *mc = MACHINE(s);
>      uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
> @@ -1031,9 +1031,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
>      qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
>
> -    create_fdt_sockets(s, memmap, is_32_bit, &phandle,
> -        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
> -        &msi_pcie_phandle);
> +    create_fdt_sockets(s, memmap, &phandle, &irq_mmio_phandle,
> +                       &irq_pcie_phandle, &irq_virtio_phandle,
> +                       &msi_pcie_phandle);
>
>      create_fdt_virtio(s, memmap, irq_virtio_phandle);
>
> @@ -1499,7 +1499,7 @@ static void virt_machine_init(MachineState *machine)
>      virt_flash_map(s, system_memory);
>
>      /* create device tree */
> -    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
> +    create_fdt(s, memmap);
>
>      s->machine_done.notify = virt_machine_done;
>      qemu_add_machine_init_done_notifier(&s->machine_done);
> --
> 2.39.0
>
>

