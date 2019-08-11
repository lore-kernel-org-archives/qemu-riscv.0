Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwrTd-0001xg-Ai
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 13:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59751)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwrTa-0001sz-Li
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwrTY-0008Th-La
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:17:50 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:32883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwrTU-0008Nk-2P; Sun, 11 Aug 2019 13:17:44 -0400
Received: by mail-lf1-x144.google.com with SMTP id x3so72883543lfc.0;
 Sun, 11 Aug 2019 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WKLnY++cMwTMNN2jhkRqbHxy6lmT1CHCtl7LRSVdKg4=;
 b=dTA+23PsFzVdkFG7J0iiryGnAJtk+5SFMU/pv+/mGt54bYwEhl7xO65AN1yzBADPqf
 O57znu9LsGeWQgfRkfCYlaO9fy5Q0lRXYJSlluf3C7ySLc0GIH4yvlmq6zt+0lm8rEwF
 cQUDqx1nlHX81mZavbj+hAKOhwxJz+BKGHgB9x2TnjisWpXAQ3Z0+rLev4t5ALS9Gqqv
 XVQTwfiSUUnH7/2TMswqHcbTSgLjMXRSs2nCqsIn2XAQl1bXtwMEkE1NCFR8fd6T1Mpv
 DLNHO5hUSJ71CUCTfp2uhjNngX/QGxYSBNebRZuo1BJ++mZPa3YIn2KuGqEvNIsJnzUI
 Pg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WKLnY++cMwTMNN2jhkRqbHxy6lmT1CHCtl7LRSVdKg4=;
 b=GUyePwoSPaymrPjStcvipaqiceA6izpgJKOOPgmCaT3awEJDGvwXFhr/dQPuhoEyxs
 o2nTRkd5WJMogRE06eFQkWXjJKftFfs37T6f4TH0N8mCWs1Meqk4jAGLalLiuEYdUPH3
 rRPrW5+0BnFFG2gEljA3I7nDu9yu1nakLqPuMiuu4VjJJBOtJx4eRpy3Oz8Ef2YM1TJU
 FQyvNNA+IRL/ywhV8L39FflaN798jgPb/jbSIy+gI1WXcOWOhURZJTeZnAOd2k6Lj59c
 hWBUoU6nUP0j/gkT7/287tyG8egfO5f3JL8mjlXLbQVGwkQsaDGGwyESk+/v+o+Z76Hx
 VXZw==
X-Gm-Message-State: APjAAAVEO/vv8UlgY+sG9xAI98ARIyfCLzVax/C+Xs+QGuDWWkFNl9nZ
 8uGyVKwEyC36uedxMq7CBN+SbVArkY6DlV1BBVY=
X-Google-Smtp-Source: APXvYqxWEM2TF6O8gmW3G2rVelbdwU5831Q+hJfp+x1NGcW7pTKl/Ko+xPu0wMkCniwabMFsHxzUlBXWbeIRAEOUBvU=
X-Received: by 2002:ac2:563c:: with SMTP id b28mr17504191lff.93.1565543862689; 
 Sun, 11 Aug 2019 10:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
 <1565510821-3927-25-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565510821-3927-25-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 11 Aug 2019 10:17:14 -0700
Message-ID: <CAKmqyKMaPcnrOihbr7wppEZKGGN8_OCMfn0b0o3az7JTftuSYA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 24/28] riscv: sifive_u:
 Support loading initramfs
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
X-List-Received-Date: Sun, 11 Aug 2019 17:17:51 -0000

On Sun, Aug 11, 2019 at 1:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The loading of initramfs is currently not supported on 'sifive_u'.
> Add the support to make '-initrd' command line parameter useful.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/sifive_u.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e8bef44..b0026aa 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -328,7 +328,18 @@ static void riscv_sifive_u_init(MachineState *machine)
>                                   memmap[SIFIVE_U_DRAM].base);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename);
> +        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
>      }
>
>      /* reset vector */
> --
> 2.7.4
>
>

