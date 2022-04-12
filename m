Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ne8Wz-00021X-J5
	for mharc-qemu-riscv@gnu.org; Tue, 12 Apr 2022 00:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne8Wy-00021K-NQ; Tue, 12 Apr 2022 00:53:32 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne8Wx-0001RL-2p; Tue, 12 Apr 2022 00:53:32 -0400
Received: by mail-io1-xd33.google.com with SMTP id z6so21163364iot.0;
 Mon, 11 Apr 2022 21:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pG/EzRRl4KqPSA9pb5VKFrwVtNqgaAW7tQp3tQO7SUU=;
 b=bpTzIjpIUo5d243LOqWaVWbq/ZRx9kNg3UGsPLFd5H5YannE55RF8KFHzbW8WoePAe
 uZ4yc/gyYQZ/24Y5pP62GieXdsJQjVN/74IH/ZDe+N2BAjXfhlIiQSra5HKlVy1aweo6
 9XWcKij4Rp2UVbNd6Pr6KQtMcvJpBZ+oFEo797pPR9aYyaVN1UthsLi5y2SgPH2mrCkT
 tDGqi+FyNo/tuobO4ny6foZvnX9jbMHyGfr+ntNY6SRMAdLu9tvu5JvWbrUDBi0lN2MD
 TzfpdSpLiPjb7zLSy7GMq2InVwshkEZnqh6GGV9rFuhzFQDb5Yw+yO0hOlYf/f6JdkYX
 AzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pG/EzRRl4KqPSA9pb5VKFrwVtNqgaAW7tQp3tQO7SUU=;
 b=uDRwFf6E4FfzJzl+tue0sCJrKT7Kp1MTm+HUgXjA16sAFKYZFxtHYHfQOTgAI14GUx
 vy+mWjjndv5CfBqsNP4HlUn016mw3uhAPD2nNjnePqNCNStrGOhmmUoJcSxumpogf3GJ
 stJf5zu+ky3sRyeXGzztVJfy11zaq1gGGRpkfeea4z5dHqpp4oe7I7F0x/TvWU6om3FJ
 GsKq55382QguN8Eftz78TsaoJ9qBB716yd0VjCnR8qPQOd78l27VYPzJpQV+j5m3izLm
 mKrE0ARWqyQCc+e8WNkxpCIGzm6nfI4rfcbNi+MQM1aKTQlXo5RYLneQPCFA+YusbBVy
 8blw==
X-Gm-Message-State: AOAM531W4dSkyMDJkG9z81yAXeaXTHSy+XHYgiye/625gBmBY1H983Yl
 Hd+oe+b4lQ6skNIyVkxRLHSt4bTqYBYQahNBz68=
X-Google-Smtp-Source: ABdhPJyc5FqRxXx5fMCXzJ8ylQaJjgvDImUVOAXaQWzk1hx1AR/d3xhBDhjad8FnRH8097zGG9QWvP+0HqeI9nifCg8=
X-Received: by 2002:a05:6638:3720:b0:324:2e9b:1851 with SMTP id
 k32-20020a056638372000b003242e9b1851mr10689564jav.267.1649739209228; Mon, 11
 Apr 2022 21:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
 <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Apr 2022 14:53:03 +1000
Message-ID: <CAKmqyKMp=o2L618vUUZNUpfWEw3VsFFteAAYAK9N=1pgrsL3+A@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix incorrect PTE merge in walk_pte
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 12 Apr 2022 04:53:32 -0000

On Tue, Apr 5, 2022 at 3:34 AM Ralf Ramsauer
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
>  target/riscv/monitor.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 7efb4b62c1..9dc4cb1156 100644
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
> @@ -116,7 +117,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
>                   * contiguous mapped block details.
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
> 2.35.1
>
>

