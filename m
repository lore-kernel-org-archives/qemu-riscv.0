Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBBGn-0005q5-It
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 01:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBBGj-0005n5-Qy
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 01:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBBGi-0004iX-Hh
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 01:15:45 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:42892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iBBGf-0004gl-RA; Fri, 20 Sep 2019 01:15:41 -0400
Received: by mail-yb1-xb41.google.com with SMTP id z2so2196047ybp.9;
 Thu, 19 Sep 2019 22:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsbp4NU3OPkDf23QJtjMkRu27uS24B+ufEO6KQWA3fM=;
 b=C8raCSKEpeBcRp/0axSbyu1izeFRmU31w897BTQSmqCUNokuJaW1n9i67XqGLsjfCC
 5er7LRTkHlmzQLEreyEDJBWAcelZxzKA5PBHK+ZK1SvgjdTBmB6GKwlR+xDakbSHx3pb
 fm8xNNvlsUxbw3oDR4AJLHkSPPOstMNO7L447ShhEuq7oh2be9MbTzIcpfROXOBySyU8
 BP2hzzap6k3eGc+Q5byfHnyZHc3TR870cYWJUjRNpX84GQk+759nNIX47+xiEuSc7p/h
 42n1PCDq5ZJJjAobxE5wbkS7UEpZC55UNOBkoWA2O1k/R+89RliUIH3NzGYg3Tshhj52
 f15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsbp4NU3OPkDf23QJtjMkRu27uS24B+ufEO6KQWA3fM=;
 b=fTn+SfFvWEsbRaEOyKlcgINW9rkAbv+xe1qdW1hOgiFHic2RHHSJmTlQAB0LCDE38W
 lr6BikPWSSN9X/Eh5yWTlAdvWe+i3TtPgP9rR/mhxiwr1PtKXwz77a0MB/dDGu/bfSo3
 7ha/4IR6sUyaP70dkjoM4VgrYIfXsElnwcObEYY48+Nuod6IcnEMQabGCQ9qcsnNI8oz
 f9VB/wS7I5H/HTFP5UYH+Izrt/vWKZ5A2hSc8HIt6DYA2iU55aXK6pTB0+JPzmnC9qR/
 nzDQEExRWJ7S7n2nkC8pobbU0tcdXbM3gEm4qrlM7tAcB32A9dg/dFEpCt0nVzJO2z4n
 sRcA==
X-Gm-Message-State: APjAAAXvwMi1hhL6arLNvxZErKZj+LJn8qi2kiVr8FbiUOB8bg8zYfP5
 g2gX6hD5zVOqXZ4dRfTzoZD+yI9zcd7iZCOK8g8=
X-Google-Smtp-Source: APXvYqwM0Da6bVsrnCpG6Xg8n+M9dbeAvTczExvitsh1DYoGWwrArNOoNHqBsFshM+/ucp1hZvO+j4EbBMhraatzWPs=
X-Received: by 2002:a25:ced4:: with SMTP id x203mr2728749ybe.65.1568956541363; 
 Thu, 19 Sep 2019 22:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <f72e3c4ebbfa0f8fb08b7c8cb0bafd48ca41cad5.1568931866.git.alistair.francis@wdc.com>
In-Reply-To: <f72e3c4ebbfa0f8fb08b7c8cb0bafd48ca41cad5.1568931866.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 20 Sep 2019 13:15:28 +0800
Message-ID: <CAEUhbmXQzxgg5KvWj+847YfpRDzHAhuWd4p5E0hLYPKSH8M5qA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] riscv/sifive_u: Add QSPI memory region
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
X-List-Received-Date: Fri, 20 Sep 2019 05:15:47 -0000

On Fri, Sep 20, 2019 at 6:32 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> There doesn't seem to be details on what QSPI the HiFive Unleashed uses.

IMHO, this sentence should be removed as there are details available.
See the hifive-unleashed-a00.dts.

&qspi0 {
        status = "okay";
        flash@0 {
                compatible = "issi,is25wp256", "jedec,spi-nor";
..

> To allow boot firmware developers to use QEMU to target the Unleashed
> let's add a chunk of memory to represent the QSPI. This can be targeted

nits: to represent the QSPI0 memory-mapped flash

> using QEMU's -device loader command line option.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c         | 8 ++++++++
>  include/hw/riscv/sifive_u.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index de6e197882..9c5d791320 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -71,6 +71,7 @@ static const struct MemmapEntry {
>      [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
>      [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
>      [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
> +    [SIFIVE_U_FLASH0] =   { 0x20000000,  0x2000000 },

We should map 256MiB per the manual.

>      [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
>      [SIFIVE_U_GEM] =      { 0x10090000,     0x2000 },
>      [SIFIVE_U_GEM_MGMT] = { 0x100a0000,     0x1000 },
> @@ -313,6 +314,7 @@ static void riscv_sifive_u_init(MachineState *machine)
>      SiFiveUState *s = g_new0(SiFiveUState, 1);
>      MemoryRegion *system_memory = get_system_memory();
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +    MemoryRegion *flash0 = g_new(MemoryRegion, 1);
>      int i;
>
>      /* Initialize SoC */
> @@ -328,6 +330,12 @@ static void riscv_sifive_u_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DRAM].base,
>                                  main_mem);
>
> +    /* register QSPI0 Flash */
> +    memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
> +                           memmap[SIFIVE_U_FLASH0].size, &error_fatal);
> +    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_FLASH0].base,
> +                                flash0);
> +
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 50e3620c02..2a08e2a5db 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -64,6 +64,7 @@ enum {
>      SIFIVE_U_UART0,
>      SIFIVE_U_UART1,
>      SIFIVE_U_OTP,
> +    SIFIVE_U_FLASH0,
>      SIFIVE_U_DRAM,
>      SIFIVE_U_GEM,
>      SIFIVE_U_GEM_MGMT
> --

Regards,
Bin

