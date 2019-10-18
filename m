Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLXMv-00029v-7n
	for mharc-qemu-riscv@gnu.org; Fri, 18 Oct 2019 14:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iLXMp-00026y-IE
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iLXMn-0004h6-PS
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:52:51 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iLXMn-0004ge-Jj
 for qemu-riscv@nongnu.org; Fri, 18 Oct 2019 14:52:49 -0400
Received: by mail-pl1-x644.google.com with SMTP id q15so3260132pll.11
 for <qemu-riscv@nongnu.org>; Fri, 18 Oct 2019 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=W4Q0p1F6snvYjb87ZNe382tMj7ucDM+3QvJeNbsWbhw=;
 b=N7Z6REbQX44f8ZWrrVsgVVI7LqCYO0wcf6LSfWN8j0okpr9uP5R1vA81F09n0zzS4H
 bCG4Nxl5EHzfrufWR6UB1Rtcv7DY90lHbbyxwKnaCdnczP2LRieW0KJn9uNjGs3Cn/IL
 C7TdEc+t44PF03xe2SSVr9EMM7CCmSwI3lKjAPpGwpvUg14DrpSVZVQd4ruEFOzrqzFt
 43goQsUc+ikKwt3d1fS337y0+t+zqQcZVtoxSh19wsL15xEjFgJetbVRNVQPcgGHb35G
 pQ7z3PZlkFR2wfBrZx/ze5hSpnEsUKIdqt3zTSL2U3qmRA3E6cEbX2v4t+/lgiJYfkOl
 tR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W4Q0p1F6snvYjb87ZNe382tMj7ucDM+3QvJeNbsWbhw=;
 b=MKCqflIi6HBRWzzHIRkbIMUUziCB/aNc4ctRUzzj5ZJG7wmWgKisF+sZ/2Q8LWza1k
 3Tccea1Ad7bSFLZgZve5flfvTJKfAshqKu2fhSwDYaDw1ZJicps1Zn5FL8+nQN3bO+cu
 9/CVSWE+rtJQ0FHilnjTv5l8nC7Gbju4jfOwuUISfKrlnHVvzBD1p79Q39nZylN3SACh
 txoq5qqeNo9zrkMFBMM9iLvfjI7YlfUSZ+tjCTX4MOuquOjTf8f+SpbOq+isaxFBFmr4
 SfNNcYlYmrrqvAs/F8bWilGgUXfeZemnj+o7K5S7QCboSCfsYLraQTEFeHTMIKIpHGZe
 pdAg==
X-Gm-Message-State: APjAAAVdem2tV9M1Y44ckAmCTEPX+9mXaBd4NtfL5SjPdbbpxErwLGoP
 Z7Bomvk4SSNwxwCT90HyKHH0pAjgSpNa3w==
X-Google-Smtp-Source: APXvYqx3ZIKFccun5sB0Si0er8w0Os/S5tIyjXyDxb/gT2jYElJpvhQsPpTaZPoKRSoAZKRn2zt8+w==
X-Received: by 2002:a17:902:8d84:: with SMTP id
 v4mr11645507plo.220.1571424768583; 
 Fri, 18 Oct 2019 11:52:48 -0700 (PDT)
Received: from localhost ([152.179.112.46])
 by smtp.gmail.com with ESMTPSA id v9sm6893015pfe.109.2019.10.18.11.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 11:52:47 -0700 (PDT)
Date: Fri, 18 Oct 2019 11:52:47 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2019 11:51:08 PDT (-0700)
Subject: Re: [PATCH v3 2/2] riscv: virt: Use Goldfish RTC device
In-Reply-To: <20191015083459.76959-3-anup.patel@wdc.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Atish Patra <Atish.Patra@wdc.com>, anup@brainfault.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-b8dad426-0e7a-4e79-9a2f-b0e6eaf42cdb@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Fri, 18 Oct 2019 18:52:54 -0000

On Tue, 15 Oct 2019 01:35:42 PDT (-0700), Anup Patel wrote:
> We extend QEMU RISC-V virt machine by adding Goldfish RTC device
> to it. This will allow Guest Linux to sync it's local date/time
> with Host date/time via RTC device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 15 +++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  3 files changed, 18 insertions(+)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index fb19b2df3a..b33753c780 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -34,6 +34,7 @@ config RISCV_VIRT
>      select PCI
>      select HART
>      select SERIAL
> +    select GOLDFISH_RTC
>      select VIRTIO_MMIO
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select SIFIVE
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d36f5625ec..95c42ab993 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -57,6 +57,7 @@ static const struct MemmapEntry {
>      [VIRT_DEBUG] =       {        0x0,         0x100 },
>      [VIRT_MROM] =        {     0x1000,       0x11000 },
>      [VIRT_TEST] =        {   0x100000,        0x1000 },
> +    [VIRT_RTC] =         {   0x101000,        0x1000 },
>      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
>      [VIRT_PLIC] =        {  0xc000000,     0x4000000 },
>      [VIRT_UART0] =       { 0x10000000,         0x100 },
> @@ -310,6 +311,17 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
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
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
>      if (cmdline) {
> @@ -496,6 +508,9 @@ static void riscv_virt_board_init(MachineState *machine)
>          0, qdev_get_gpio_in(DEVICE(s->plic), UART0_IRQ), 399193,
>          serial_hd(0), DEVICE_LITTLE_ENDIAN);
>  
> +    sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
> +        qdev_get_gpio_in(DEVICE(s->plic), RTC_IRQ));
> +
>      g_free(plic_hart_config);
>  }
>  
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 6e5fbe5d3b..e6423258d3 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -37,6 +37,7 @@ enum {
>      VIRT_DEBUG,
>      VIRT_MROM,
>      VIRT_TEST,
> +    VIRT_RTC,
>      VIRT_CLINT,
>      VIRT_PLIC,
>      VIRT_UART0,
> @@ -49,6 +50,7 @@ enum {
>  
>  enum {
>      UART0_IRQ = 10,
> +    RTC_IRQ = 11,
>      VIRTIO_IRQ = 1, /* 1 to 8 */
>      VIRTIO_COUNT = 8,
>      PCIE_IRQ = 0x20, /* 32 to 35 */

This is a wacky enum, but it's already there.  I'm going to assume this patch 
will get merged and then fix it later.

> -- 
> 2.17.1

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Acked-by: Palmer Dabbelt <palmer@sifive.com>

I think it's easier to just keep this with the goldfish implementation.  I'm 
assuming that will go in through a different tree, as per my comments on that 
patch.

