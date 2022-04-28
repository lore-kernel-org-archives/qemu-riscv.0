Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrn7-0000cp-A8
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 20:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrn5-0000cQ-Dv; Wed, 27 Apr 2022 20:13:51 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrn3-0000U9-Sv; Wed, 27 Apr 2022 20:13:51 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e15so4971736iob.3;
 Wed, 27 Apr 2022 17:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=68DDtoa/0q6Jdf498/kBPwa0iGTsJJZspm/CqNVXWs4=;
 b=T0ly+zSju1HNY83hM8v2AG9RiiVKc5NCu+JWZSQFEidfUpw+g5KNqZUZEkvTMTnf9K
 YJmv1AOzXkkJNv703zJ1iz02l6E30XnHAFQg1c0+D/bXkMoDjd6XVs1nF1As/1Lrmpn4
 /VAP+Dax35AFcU+/fHT2F6WrPIYWmSDObsolIGFu+z3coSpo5bgqke73pl2t7fTY7NWn
 NzvDr4uqMvBHMOVssOsaD3PxHgRXKfQAZt4hxzvp2j4EihNJ87z69lxRCjItV5rm+9Sx
 1ed0N5R8jrOWzmMiVAVt5VYfZblVKyTzrryQaPFxBQ8vqpRbHFeot0C+MPRuFYgAnN1L
 cgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=68DDtoa/0q6Jdf498/kBPwa0iGTsJJZspm/CqNVXWs4=;
 b=ybAM8/pkC1aaEs1wbnqL3ATPJLbhUDc0xO/TQ3CmZ4h0vjmcdtgLRaUT/fynYsSRr6
 f8cBe7EDji4VJgap34Gjtq3nSVWhmhiFImULhQAtrstoUJH6ih8it4TqHx3Nb8uBMe9O
 zkr2POGDuJJpfw6HWvBVa7w64ZxXtPW3SkHlsjXsuNzSU80Qo4l1QxQmPtX0Drh4T1Zo
 W8h4XKpq0sUnolGQWKSEmv+yFcAgGqiQy4MQEPzVne5vqFP5GQmbJRwCJuq3MU2QRddm
 elUF+YCZ0wvCeeoWCEdU0+IIXoc1Fg4eg1mxNlJ18dt+Ws53ABmCpk0a+wt2qSQPKo+T
 9NOQ==
X-Gm-Message-State: AOAM531+DeVpJO93o/P2hcNXG9dQ8CfSe8QlJay6xlP68ta6ZbDYWB8E
 4owxlw7f3f4I7hYGtnKG66CjUy91GYQ0DwD47XE=
X-Google-Smtp-Source: ABdhPJxybGzUJZ0mE1BTtlfA69YNArivBoUTozieXTDiEYj1081E5mIA3Q84UF5TFQ0rvscL4T33qTar5pLgRW3p9FY=
X-Received: by 2002:a05:6638:14c1:b0:32a:aa03:93e1 with SMTP id
 l1-20020a05663814c100b0032aaa0393e1mr13838672jak.66.1651104828325; Wed, 27
 Apr 2022 17:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
 <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 10:13:21 +1000
Message-ID: <CAKmqyKOtMF0OcXZ+PiP2g71opf8j76CgZjxSrTLU6nRO5OpM=g@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Fix incorrect PTE merge in walk_pte
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 28 Apr 2022 00:13:51 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

