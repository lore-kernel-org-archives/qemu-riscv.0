Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nj8t8-0002rp-Q4
	for mharc-qemu-riscv@gnu.org; Mon, 25 Apr 2022 20:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nj8t7-0002rT-HA; Mon, 25 Apr 2022 20:17:05 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nj8t5-0004jw-Tu; Mon, 25 Apr 2022 20:17:05 -0400
Received: by mail-io1-xd32.google.com with SMTP id 79so17706802iou.7;
 Mon, 25 Apr 2022 17:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cikaNgVlG8c11lBdeTBEBtH889WKsw17u50lC5+0pS8=;
 b=AwMyFUt6udsvVhtiICFPfnQtW33ztsf0v21zxYEQijrM2O0dSvg/OTWlU+d5WlJjyO
 xHvU7PXAWdH5XUivovZPZM+L2xdZ90v9JEp028saraq2fUwRNmz3PboCwHaHoEj8jURf
 h+0ujGm/Wua6QMeTuQ50mNY6sAIp3tjDRW3NM11ioHrSD8FRF85RIfACPiu1z1UjcOd9
 eduMKUsBKstEfwBEEwhDwKWtqLgF67FHW5RDz0JwlGLdH2LW01BCP0YUmsT/d/WGNbaL
 DyQfX/G3MDPnUzh2GwRxG9q2Rwn5NZegHNY4oVk1JRyAE2qXds7MKMO/tlBOLn46uPfb
 0VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cikaNgVlG8c11lBdeTBEBtH889WKsw17u50lC5+0pS8=;
 b=xKCS3MNldQa54X21yjOlWwdZvvXJcBIH+0s7H5pYbbTf2NDwZI0RH4t/WtC/LoRQm3
 +/8liXqAyVAzRWKESLUsvQJNbIONUjOVwmUnkMDTPzxb+i9H8ZV7I2Uh/n1Gp0jVmGVW
 /qN5ne96tTnmGwuh44WB+ny4fHMjyRg0m+N9kfX1zNgtD4i8+Cki2uTVLpjgM57W1quq
 /+OqmSF/1/FB14DTVtVAYSxWGpn650bV5lmkuHC+iLsX0vhkQ7tpIG/1BZuSxICHvjQD
 q4sg5V4Syhc0rsZj5qLnJIL9K0YMzJcNmguCJDMqCyxRfE1z3s4JUQdVujDatsYC/Lv5
 AB2Q==
X-Gm-Message-State: AOAM5322p5MlC55tsYjM8CRlGHrz7aDa8llleh6mbpNZ4weAeEjQWejE
 W2HgvNLahEcxglQzXLdkUnI/iD9vKG8ToE1yPhc=
X-Google-Smtp-Source: ABdhPJyHi1fV02PK82yrkPNhadZbi1EovolSMcX8Nu2DCY8FMPgCSqY8BQRuKAVeWIaWlGm0x812Dl5PEt6Ltug2dV8=
X-Received: by 2002:a05:6638:1914:b0:32a:8804:da85 with SMTP id
 p20-20020a056638191400b0032a8804da85mr8312466jal.212.1650932221914; Mon, 25
 Apr 2022 17:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
 <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Apr 2022 10:16:36 +1000
Message-ID: <CAKmqyKMVeoFWOkeX7bTNNudZbRF7n3O1kub0ZUCxOz=kTTZh+A@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Fix incorrect PTE merge in walk_pte
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Apr 2022 00:17:05 -0000

On Sun, Apr 24, 2022 at 7:59 AM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
> case, walk_pte will erroneously merge them.
>
> Enforce the split up, by tracking the virtual base address.
>
> Let's say we have the mapping:
> 0x81200000 -> 0x89623000 (4K)
> 0x8120f000 -> 0x89624000 (4K)
>
> Before, walk_pte would have shown:
>
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
>
> as it only checks for subsequent paddrs. With this patch, it becomes:
>
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
> 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> [since v2: Adjust comment, rebased to latest master]
>
>  target/riscv/monitor.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 7efb4b62c1..17e63fab00 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>  {
>      hwaddr pte_addr;
>      hwaddr paddr;
> +    target_ulong last_start = -1;
>      target_ulong pgsize;
>      target_ulong pte;
>      int ptshift;
> @@ -111,12 +112,13 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>                   * A leaf PTE has been found
>                   *
>                   * If current PTE's permission bits differ from the last one,
> -                 * or current PTE's ppn does not make a contiguous physical
> -                 * address block together with the last one, print out the last
> -                 * contiguous mapped block details.
> +                 * or the current PTE breaks up a contiguous virtual or
> +                 * physical mapping, address block together with the last one,
> +                 * print out the last contiguous mapped block details.
>                   */
>                  if ((*last_attr != attr) ||
> -                    (*last_paddr + *last_size != paddr)) {
> +                    (*last_paddr + *last_size != paddr) ||
> +                    (last_start + *last_size != start)) {
>                      print_pte(mon, va_bits, *vbase, *pbase,
>                                *last_paddr + *last_size - *pbase, *last_attr);
>
> @@ -125,6 +127,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>                      *last_attr = attr;
>                  }
>
> +                last_start = start;
>                  *last_paddr = paddr;
>                  *last_size = pgsize;
>              } else {
> --
> 2.36.0
>

