Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhjQu-0006XK-DF
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 22:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhjQs-0006X9-PO; Thu, 21 Apr 2022 22:54:06 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhjQr-0006q5-9i; Thu, 21 Apr 2022 22:54:06 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e30so5288281eda.0;
 Thu, 21 Apr 2022 19:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=58bVPIchb9GnwlvpO7uiVi8laO6UOzi/xkzrYmMDSWI=;
 b=HrFIxYeL4oaSaAH5z7SYrZB9DrN+APXifDPqoPSA466+x4q9SLtS9NhZW0nzCbG4Sp
 FFM1bo3/Efui8CpBiNHXmMCwwXZpAMGN7WSh6DcmgQ06mjc9ustJChueeiQnBx3XKoWX
 K+MKw+66gzCpjxfVLvtyOLwqF+59bjw0+OIc7MKlf05vYuFbj+osip6tDKw7a+zKxaqW
 njbhhyG9Y3h4TSvqo4fVSGyNwQ6q8tnjQ44YlM5DRkk/ZwBmaFiyKhh3J//FI+VYG1wp
 Ich3/FV5rFG/uHdwwB8habEMaQpoon28uY97DTnzwBeMMCjWN+Ibua8HWYLp0zeqqQKZ
 6Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58bVPIchb9GnwlvpO7uiVi8laO6UOzi/xkzrYmMDSWI=;
 b=HywEYZrdpyXovLRVhbigNzETlKjYL1UNtkicMlzxtQFVBo5GqM3SUM4LTNpR5I73Cc
 TdFKx9eM4qY54OA1RKfdQs0GR9hQ05aUWM4hG+khztE4Bz6dClYroZtaXX5TrLYDJgd3
 qD4d9T5i16Na4xZlWof1DDy9nxQlnhDhQd+KRhOnI/PgQwdLAMkiDMKptLYpQ+feDe15
 qVVuLNBmh+cMIV0j1xBdg58h8tTbE0CrcARxQ6vq3o4gCVVyVwSwPPCspEEH5Li8FcCh
 e3uDsW2W4e3gEE8mlkIOf77VeYkd9X7yaGRVGkZoLXX3DQr+EDF7qP/S1uiuGYhMZUgD
 Ee8A==
X-Gm-Message-State: AOAM533Z15tcPO1ei74jKogV9H/Fbhwfecv7ficB/MvcFu+EDSpBp04p
 jt7DFHYyGuQzRN7YaG2kJUxHATYLfODIuPAZhnM=
X-Google-Smtp-Source: ABdhPJxONbzPN0BrKfNpS3lmFxV0DnT7FMluLZZLnZ3SDd76lB5E66Mt7Z9BhdHYW03L1tfK5NjF7MhZKtNf5u7fCAM=
X-Received: by 2002:a05:6402:442:b0:416:14b7:4d55 with SMTP id
 p2-20020a056402044200b0041614b74d55mr2583047edw.183.1650596042622; Thu, 21
 Apr 2022 19:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
 <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:53:50 +0800
Message-ID: <CAEUhbmXZo=RSGSOoJQRTfsRF8z3gEntgKZDNmptLsvja-z6u+w@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 02:54:07 -0000

On Tue, Apr 5, 2022 at 1:34 AM Ralf Ramsauer
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

Please also update the comments above to mention the new case you added here.

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

Regards,
Bin

