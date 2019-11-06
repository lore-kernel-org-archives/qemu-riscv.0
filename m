Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSJnJ-00050m-9G
	for mharc-qemu-riscv@gnu.org; Wed, 06 Nov 2019 06:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1iSJnD-0004tv-U5
 for qemu-riscv@nongnu.org; Wed, 06 Nov 2019 06:48:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1iSJnC-00009o-KF
 for qemu-riscv@nongnu.org; Wed, 06 Nov 2019 06:48:07 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1iSJnC-00009C-8p
 for qemu-riscv@nongnu.org; Wed, 06 Nov 2019 06:48:06 -0500
Received: by mail-wm1-x342.google.com with SMTP id b11so77423wmb.5
 for <qemu-riscv@nongnu.org>; Wed, 06 Nov 2019 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WoJWC5LTv9yoYodFK6TMZmiav5ViLBLLuzbTWdGWz14=;
 b=neFhVUZg0lm90fNhLzcALmxVSX0r4hTrLTLRDIdnYhAxw4h+u95vhI8H2C03nK5YLK
 LN7rbMHf/ZVtt81VkCUPvLEhmCsxliDtToNCCus1drjbMvtI6s1G+Ssk+YkVx2LqOY4B
 /JkbrUEbS6Mc2UIWBrxopHsKdXs5oixaiflERa1rcXDUHAPIl/XgUUjw1IvtJTNyvf+X
 6vFORa6UeKsqKGr2mB72WTN62yLBlinUKIWtat2mFOKG7/uK0pXBCXwitZXc4+ntbdYU
 cO2iNgq9Tg74076FMvOitD7sl3VlFKn+ouJYAXZyFLS6Po9pNLSpcX2HH1Mfww0BKdo/
 IxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WoJWC5LTv9yoYodFK6TMZmiav5ViLBLLuzbTWdGWz14=;
 b=mCGKPJfH2VIJ3rcr3PKYrAfNj9P35Xt/ZF9jSPZC0Xt521pM4TT0E9Fi17bT3JVZac
 wNSrAvokZ9UhadvIvENTKHELinOgQODAlugEW8LBUVKXfxuenQnlbVyLwSCTncWd2flw
 DYW0dki7BaG2+drc64mIbo0u9+wibi67OPo/CX7uOU8IjKppeutQd2pzWcbniGMtzziz
 fA9iW0JoiPYbnq6ZX+PHU54LYfEAkPqzu8C9ozUhCyg24IXDPqsh33UNwP1lPvP4filF
 j3+6mJG4oLYjGpiW2h34Y9jlIxr2a6HzDWQ6yKB+4FT8JkDTKd9dgCcmkrsYvzxBoIWp
 SooQ==
X-Gm-Message-State: APjAAAVa5qlQVISzMhtn1NYGQWyG5TwmKE/1QoGfiAgFsnifo7dz/C6L
 TzGFrMAThdDXVNB044U6PgLhUpLf2QdIeKxZvSfwBQ==
X-Google-Smtp-Source: APXvYqw48/rC1X6oaGN9eu92tgMTCocnVfcBth3Q+Fiw0DMPPPowjFMhO7jbZGURD95hzXwOOIMuwAdLYokMXS3aIHk=
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr2116983wme.103.1573040884665; 
 Wed, 06 Nov 2019 03:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20191106083444.41113-1-anup.patel@wdc.com>
 <20191106083444.41113-3-anup.patel@wdc.com>
In-Reply-To: <20191106083444.41113-3-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2019 17:17:53 +0530
Message-ID: <CAAhSdy1LG8t7mETn8dqqBURf5QwuEiD7expuU7p-bAcKrqUewg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] riscv: virt: Use Goldfish RTC device
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Wed, 06 Nov 2019 11:48:10 -0000

On Wed, Nov 6, 2019 at 2:05 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> We extend QEMU RISC-V virt machine by adding Goldfish RTC device
> to it. This will allow Guest Linux to sync it's local date/time
> with Host date/time via RTC device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Acked-by: Palmer Dabbelt <palmer@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 15 +++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  3 files changed, 18 insertions(+)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b12660b9f8..ff9fbe958a 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -34,6 +34,7 @@ config RISCV_VIRT
>      select PCI
>      select HART
>      select SERIAL
> +    select GOLDFISH_RTC
>      select VIRTIO_MMIO
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select PFLASH_CFI01
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index cc8f311e6b..818678a4b2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -58,6 +58,7 @@ static const struct MemmapEntry {
>      [VIRT_DEBUG] =       {        0x0,         0x100 },
>      [VIRT_MROM] =        {     0x1000,       0x11000 },
>      [VIRT_TEST] =        {   0x100000,        0x1000 },
> +    [VIRT_RTC] =         {   0x101000,        0x1000 },
>      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
>      [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
> @@ -376,6 +377,17 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", UART0_IRQ);
>
> +    nodename = g_strdup_printf("/rtc@%lx",
> +        (long)memmap[VIRT_RTC].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible",
> +        "google,goldfish-rtc");
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +        0x0, memmap[VIRT_RTC].base,
> +        0x0, memmap[VIRT_RTC].size);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", RTC_IRQ);
> +

We cannot create RTC node here because "nodename" is directly
used as "stdout-path" below. Due to this patch, U-Boot S-mode
stops working on QEMU because it see incorrect "stdout-path".

I will quickly send updated v8 series.

>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
>      if (cmdline) {
> @@ -579,6 +591,9 @@ static void riscv_virt_board_init(MachineState *machine)
>          0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
>          serial_hd(0), DEVICE_LITTLE_ENDIAN);
>
> +    sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
> +        qdev_get_gpio_in(DEVICE(s->plic), RTC_IRQ));
> +
>      virt_flash_create(s);
>
>      for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index b17048a93a..e69355efaf 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -44,6 +44,7 @@ enum {
>      VIRT_DEBUG,
>      VIRT_MROM,
>      VIRT_TEST,
> +    VIRT_RTC,
>      VIRT_CLINT,
>      VIRT_PLIC,
>      VIRT_UART0,
> @@ -57,6 +58,7 @@ enum {
>
>  enum {
>      UART0_IRQ = 10,
> +    RTC_IRQ = 11,
>      VIRTIO_IRQ = 1, /* 1 to 8 */
>      VIRTIO_COUNT = 8,
>      PCIE_IRQ = 0x20, /* 32 to 35 */
> --
> 2.17.1
>

Regards,
Anup

