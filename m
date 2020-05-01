Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUUyo-0001fV-B0
	for mharc-qemu-riscv@gnu.org; Fri, 01 May 2020 08:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jUUym-0001eS-0u
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 08:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jUUyl-0000fz-3Z
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 08:41:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jUUyk-0000ff-OH
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 08:41:18 -0400
Received: by mail-wr1-x441.google.com with SMTP id x18so11418045wrq.2
 for <qemu-riscv@nongnu.org>; Fri, 01 May 2020 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PK2iNFhfwANQTlrmQYIg27in7DXM4adVWh0GkmGvUkw=;
 b=a+zV0LPmmU/IzxvyybEVB88qyU+OqUliSEwZFMm9EjIGrFqnCvEYdeLX/PTYVaB/ZS
 Hoe+kb2RkdhZYwvxKsvAou2Bo+VKSCCXHE5GLVfCq052MvZVCd+2gUMAH7yYZwhpduFk
 8/h7SYVsLVVYdlD917/qhirCnzK2EtnTWQ1NQnKxxeFP5elfq1bdnCBJTzj7iqi+x+lO
 g1B9SHCZEK4hdDYXXG+qkpnov9DIE22ETWdNQFg151Pl7Zlwec6MaXn7zS3XHY9PMHro
 E5asXA0J66eleOgy7kvQrBPK4KoS8l7+ceDxDCirnUJvXtATXGcOYVF+57qnowD+xaIj
 dacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PK2iNFhfwANQTlrmQYIg27in7DXM4adVWh0GkmGvUkw=;
 b=ryv0wtystn2aBfWhX6rYVTK6E5i0A7JQO0JSz+MqHmvrcYS1lS20rrBToD4WDBkFRQ
 SJcRjgGOhqE+XilLurwICLqDJOUY2hqzwOMraGhLcnXeY3+bW9frRZomjz3zq2BgQ8lN
 cuLpJDwR4kp77GZgg57teLzdhJMmp2jy4FqrqsTwRhAnSVZ7c//1r8uFUM+y4s6XF7im
 mc5JPrVoqfmsWpcVXMbDIQqe0IETP47CIGQu4WxLbbiAbqYUcWTawELl+zR6XLd9mpnd
 gXLjg4n8vUjEELf1qzTiY8FNMw5JWaDG61fObk1I2zr9Npu+4myVceM34gmFuPet50u/
 NACQ==
X-Gm-Message-State: AGi0Puag1zp5g2krTjJvnTuQiUIS2LfDT4fbgtJLbqrdG0aC/AlhSY7W
 H2XTHb5TRiZORuU5pMEqT8Rixei70rdH78KX0l0d3g==
X-Google-Smtp-Source: APiQypLVXGrzLPGMXDkZANDmWWAZcXcGEE05PynWb1ZKETB/7bF0muVJYO215yigh3IuwOvaH4vO466aFyFx6k57ezg=
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr4281412wrq.358.1588336876514; 
 Fri, 01 May 2020 05:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <1588336185-1051-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588336185-1051-1-git-send-email-bmeng.cn@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 May 2020 18:11:05 +0530
Message-ID: <CAAhSdy23Xrjfp4NxbwETsd6gG7mbhT5NOjFza6gpd-Rd=RbHEw@mail.gmail.com>
Subject: Re: [PATCH] riscv/spike: Change the default bios to use plain binary
 image
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::441;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Fri, 01 May 2020 12:41:20 -0000

On Fri, May 1, 2020 at 6:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> To keep sync with other RISC-V machines, change the default bios
> to use .bin instead of the .elf images.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/riscv/spike.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index d0c4843..611a741 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -46,9 +46,9 @@
>  #include <libfdt.h>
>
>  #if defined(TARGET_RISCV32)
> -# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
> +# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.bin"
>  #else
> -# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.elf"
> +# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.bin"
>  #endif

This change breaks the console on the spike machine because
HTIF emulation depends on ELF parsing.

Keeping here ELF files was intentional because BIN files dont
work for Spike the machine.

Also, now that OpenSBI generic platform is available. We can
use same OpenSBI firmware binaries/elfs on virt, sifive_u, and
spike machines of QEMU. I think:
1. The QEMU build/makefile scripts for OpenSBI should be
updated to only build OpenSBI generic platform firmwares
2. The default BIOS_FILENAME in for virt, sifive_u, and
spike machines should be changed to use OpenSBI generic
platform firmwares.

It would be great if you can drop this patch and instead do
above two changes. Agree ??

Regards,
Anup

