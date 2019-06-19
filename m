Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdcK1-0004Nv-O9
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 11:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdcJz-0004Gz-3R
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hdcJy-0005BM-4X
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 11:16:23 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:41945)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hdcJv-00059I-OF; Wed, 19 Jun 2019 11:16:19 -0400
Received: by mail-ed1-x541.google.com with SMTP id p15so27730609eds.8;
 Wed, 19 Jun 2019 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcAVW8RvHY708GJZR0jyCkvccLOyE7MY09g3wfBlBOg=;
 b=oG5drzgiBTTGRUMUzZnHQ19aknhzODBGzge+GUqnDJvG2B8BrIvMnT1D12ptmkZA0+
 5gDn55BNeojzAOGWKIylgJ4LbBaF9WSRh2zYoRDsrI21hhJs1IlfnKSgxRYCHlnGbPcI
 I5wGWRADLfEzrGabvIN1axsPOvD4GMoNTlmtnUz9QVC5RQ7M2aZYBqMH0ZSwshA3L+EX
 2KmjOw6BGyJzLHMlZX498qOwPXniEv3ROPvMXczUTx3fp1b0YbFGHFiLWxDVcj6QUhBn
 9QMEPGNhde74toCyYlOUR+ccXyW7znnvQSKULX9sTaKXjoExjbh4ColFCzfcrk2A37tw
 UHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcAVW8RvHY708GJZR0jyCkvccLOyE7MY09g3wfBlBOg=;
 b=bndru0KPeFdTO+0EomG3k2/pYgYr0rSMRjaRJxqUrS8tYhxrRU3eEXKx8zPQZUFFHH
 EDS+P+PhYHC9fsdlG7QLP17JlqaAFBsAI1HBR/N9SeKzgpzBy9zS0wz5upPQ35O+eNz2
 p3CWgWU6usWS2T3GL3lLT8R6Z3jG+d/4uplDET76dCa2ff68x2dtUrR7zJOZVrn/ArXP
 WyzTwC+2JVwgXP3nZ2WUp7yk7UplDsQC6E6RVBJrKWRBAZjUW6xZznGD9zDdRpV0Dwy2
 A7IXY1ynBcHBh3g6bIq1lIVBzaVXkVmHZ/0Ly5pQlV4aWguQN65VAP0PsUNNaJQoblL6
 yy6g==
X-Gm-Message-State: APjAAAUjCV3VXtY1Rj7nko56Ib0I/GZNxkvBOecnl+KrdysLEAPEAHXq
 os6obm29HdpSSWyAlSifP8yznsAnxjKjWFtNq1o=
X-Google-Smtp-Source: APXvYqy/+NcBnTTFrDVuHG9LzZjYAbceKlCpwA91H2f7JuBWLj1fgBR9+9DPO6r3NkVfANibmVRaLaJ/ucn4/BtCZgU=
X-Received: by 2002:a17:906:8048:: with SMTP id
 x8mr14554464ejw.87.1560957378667; 
 Wed, 19 Jun 2019 08:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <e718da8df07915765217dece609255b6ad196955.1560904640.git.alistair.francis@wdc.com>
In-Reply-To: <e718da8df07915765217dece609255b6ad196955.1560904640.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jun 2019 23:16:07 +0800
Message-ID: <CAEUhbmUz5xHqhuEvDWHBTpKN+k3uuNPQxNCGFWOfR21hMhWtPw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 2/5] hw/riscv: Add support
 for loading a firmware
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
X-List-Received-Date: Wed, 19 Jun 2019 15:16:24 -0000

On Wed, Jun 19, 2019 at 8:53 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add support for loading a firmware file for the virt machine and the
> SiFive U. This can be run with the following command:
>
>     qemu-system-riscv64 -machine virt -bios fw_jump.elf -kernel vmlinux
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c         | 41 +++++++++++++++++++++++++++++++++++++++--
>  hw/riscv/sifive_e.c     |  2 +-
>  hw/riscv/sifive_u.c     |  6 +++++-
>  hw/riscv/spike.c        |  6 +++---
>  hw/riscv/virt.c         |  7 ++++++-
>  include/hw/riscv/boot.h |  4 +++-
>  6 files changed, 57 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 62f94aaf8a..392ca0cb2e 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -23,13 +23,50 @@
>  #include "exec/cpu-defs.h"
>  #include "hw/loader.h"
>  #include "hw/riscv/boot.h"
> +#include "hw/boards.h"
>  #include "elf.h"
>
> -target_ulong riscv_load_kernel(const char *kernel_filename)
> +#if defined(TARGET_RISCV32)
> +# define KERNEL_BOOT_ADDRESS 0x80400000
> +#else
> +# define KERNEL_BOOT_ADDRESS 0x80200000
> +#endif
> +
> +static uint64_t kernel_translate(void *opaque, uint64_t addr)
> +{
> +    MachineState *machine = opaque;
> +
> +    /*
> +     * If the user specified a firmware move the kernel to the offset
> +     * start address.
> +     */

Why?

> +    if (machine->firmware) {
> +        return (addr & 0x7fffffff) + KERNEL_BOOT_ADDRESS;

So with both "-bios" and "-kernel", the kernel address will be moved
to another address other than 0x80200000 (for 64-bit). This does not
look good to me.

> +    } else {
> +        return addr;
> +    }
> +}
> +

[snip]

Regards,
Bin

