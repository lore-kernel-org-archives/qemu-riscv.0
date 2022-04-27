Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrSg-0000tB-Am
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrSe-0000rI-Ri; Wed, 27 Apr 2022 19:52:44 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrSd-0006D7-7t; Wed, 27 Apr 2022 19:52:44 -0400
Received: by mail-io1-xd32.google.com with SMTP id f2so4646410ioh.7;
 Wed, 27 Apr 2022 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njf4CNexuFqRr/KFKYQl1l2mMYC+UJ473atNUwxkbo4=;
 b=LCFlACeRmPt7xUqHWp03bRRkciJk5gCDJj0pZUx+rEEGBQwNqDKa/VVO6KQ+vQc0Sa
 d1Iu47J6MPfD8MKVSKq6SOBG8k2dO8quLfL94yA2l87lMGHOlPWnn9mednoKF41Yv226
 E/TbNjNspXWuSLEBAUX3rHV/MrLvqVej5r4/cyO1G9SNomalLaR7NF22F8pkXY6auVF1
 6qAECNvhmmI98/J9hnGQNoBA1wW6l4JhlYULLppKE7lqFNvOe+iVathYHFE4XTnjkjAF
 /LS9UnmV8RSdQYkXRxdidqMIuUo4b0TAxG3iVRHeqT/en3jf57Ti+KPE7zvt2dRGF5/1
 7kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njf4CNexuFqRr/KFKYQl1l2mMYC+UJ473atNUwxkbo4=;
 b=4o2mDriGsCrMyw30yAPk7dNTkTKkOrKY6T9ozEiQji09yMw162JeveJgAEYHiiw0kC
 57nlhbpPZ0ef28Iv1u6EDlbToS66qcAiIir1xJUNv/6yGafFbvDPxLrKpj2kunahJNV8
 6Dit9p5R8zFenm9USvAwVrLxK89nNkcZOrPFrS/gY33xN7jPb5TaW/sPHUJWGyXSVpxH
 jFoDVtQuG3wsq7wpVvRgk0PVvmqQ7UgFWdpcygmVt6QSviRDdAfcpz+QkMI96Ev/oT/V
 eZj21dulh2UbHko6jUTHEdsy8tuU+31ehLUCcx1tUy27zJ+Z9zb7Bog3KVOI7mpZH2b1
 qi+Q==
X-Gm-Message-State: AOAM530ArhASgKgXQ07IWXpAK+FHH+JZ4HH2P8cDXHmVHR/gBYeWJiWJ
 4aMhPGgVH1Bfbtr/QbQYRgTMT9TQN5/Iu96xr9I=
X-Google-Smtp-Source: ABdhPJzjFi4x1vZCCbIis0+1c7rbzWwyaDObcPBZBSOPi1msnGPzbowaGwD0XlESO/GGRXvU3Zxxe5O3/GG7r/pwGe8=
X-Received: by 2002:a02:6f56:0:b0:32a:ff25:1fe3 with SMTP id
 b22-20020a026f56000000b0032aff251fe3mr6197860jae.21.1651103561766; Wed, 27
 Apr 2022 16:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
 <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 09:52:15 +1000
Message-ID: <CAKmqyKM-2UFdz5NfMQff9Ye=+VwX+cQkfu6d9xx8FyCxWaYbnQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Apr 2022 23:52:45 -0000

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

Thanks for the patch. It doesn't seem to have made it to the QEMU
mailing list though. Do you mind re-sending it and checking to make
sure it is sent to the mailing list?

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

