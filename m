Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwrPe-0007wt-9g
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 13:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwrPb-0007tF-LT
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwrPa-0003uk-NT
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:13:43 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwrPY-0003qe-9D; Sun, 11 Aug 2019 13:13:40 -0400
Received: by mail-lj1-x242.google.com with SMTP id x4so4208725ljj.6;
 Sun, 11 Aug 2019 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBWtrYup+MYCddVF+3Z2NF1pqPKvat8HtGwCmsCKt8Y=;
 b=PSBt7pfD5Afyqz6udPMOj3/6VuXS0AL6Ab4nu1s/M6Zd31DdvQyVVVttJz/DxatVPx
 b4XN8zzNkuls0hObvtdvKCu2mV4kru/KNewY47/8pkgKopyR/6waWbUn0iH3uUINX/Rw
 hz7UIbYX8V9/2erA00fS56n0wuYEOvo4P8b4inCw8+19eGg4Hb9G2yBd9kknbuQS0UA5
 FRGBX/dXyJilqzEupHSEbKz7B10pYPoIiF+m0mrGHu4sQwrHIhzT0n9U8K4wYiG2GQ7h
 qPvoRNCd2ojfVIe4KTsn66lGhmRVWZX7dN+ZAa9/i0N4cZVdRoLdJnFvvP4LxMkm0DMB
 KXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBWtrYup+MYCddVF+3Z2NF1pqPKvat8HtGwCmsCKt8Y=;
 b=hDnfuiPPB30H1zY/J/i7AkJiwbDuMrHQk3yoVA3jrMbJVMkGCa32ihP37lF8Al42IR
 eoR3NL90mzP0kehyd+7d8ZTADZ0SF00F6f/9j4F/Kynl6w+SiPFVaFgjhxDLR5nmIHIP
 MrIpgcMWIj/vkUrJrFb4ZMzYndlJfZUQkECi7ozIISW5Mr8Ifo2Zc0wR3g/E2fNixpgP
 rkYtUY7JYJ4thSijXs89x4/jA0AkPKNMiCVhQeFFItRDdWYAsCn/kXIc7meLi7Lidrf6
 8m/7mvZ58u0IH/3uy9Oz3hObvh01jbkdcC5Y0R4njGRpnhR18rgWve2BwvzyAVJ2idDj
 eQWA==
X-Gm-Message-State: APjAAAUrn7JeVt+SeEOo7qZ2MKSOxz+cE37F89U5s7811A1IqvA5aPNS
 Mqi4nVNNAoFFQ+jgPDRteREn/qqHwi05THg3ync=
X-Google-Smtp-Source: APXvYqx11GTb9OnY5GLeCq2aNO5Uaku9c+56Oryc9mudrS9EcVL3JkOQTETqvsX7grxvI8bKYVEoEP9vetNx2ymB26g=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr16650792ljj.146.1565543619027; 
 Sun, 11 Aug 2019 10:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
 <1565510821-3927-20-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565510821-3927-20-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 11 Aug 2019 10:13:11 -0700
Message-ID: <CAKmqyKOi1HfQKVN1KyWf2j5kVurvMutikguwww2+ZFJd97HLNg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 19/28] riscv: sifive_u:
 Instantiate OTP memory with a serial number
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
X-List-Received-Date: Sun, 11 Aug 2019 17:13:44 -0000

On Sun, Aug 11, 2019 at 1:13 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This adds an OTP memory with a given serial number to the sifive_u
> machine. With such support, the upstream U-Boot for sifive_fu540
> boots out of the box on the sifive_u machine.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/sifive_u.c         | 5 +++++
>  include/hw/riscv/sifive_u.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 5022b8f..486b247 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -10,6 +10,7 @@
>   * 1) CLINT (Core Level Interruptor)
>   * 2) PLIC (Platform Level Interrupt Controller)
>   * 3) PRCI (Power, Reset, Clock, Interrupt)
> + * 4) OTP (One-Time Programmable) memory with stored serial number
>   *
>   * This board currently generates devicetree dynamically that indicates at least
>   * two harts and up to five harts.
> @@ -43,6 +44,7 @@
>  #include "hw/riscv/sifive_clint.h"
>  #include "hw/riscv/sifive_uart.h"
>  #include "hw/riscv/sifive_u.h"
> +#include "hw/riscv/sifive_u_otp.h"
>  #include "hw/riscv/sifive_u_prci.h"
>  #include "hw/riscv/boot.h"
>  #include "chardev/char.h"
> @@ -65,10 +67,12 @@ static const struct MemmapEntry {
>      [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
>      [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
>      [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
> +    [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
>      [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
>      [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
>  };
>
> +#define SIFIVE_OTP_SERIAL   1
>  #define GEM_REVISION        0x10070109
>
>  static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> @@ -441,6 +445,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>          memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
>      sifive_u_prci_create(memmap[SIFIVE_U_PRCI].base);
> +    sifive_u_otp_create(memmap[SIFIVE_U_OTP].base, SIFIVE_OTP_SERIAL);
>
>      for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
>          plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index e318ecb..3ae75b5 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -54,6 +54,7 @@ enum {
>      SIFIVE_U_PRCI,
>      SIFIVE_U_UART0,
>      SIFIVE_U_UART1,
> +    SIFIVE_U_OTP,
>      SIFIVE_U_DRAM,
>      SIFIVE_U_GEM
>  };
> --
> 2.7.4
>
>

