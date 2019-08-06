Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hunIm-0002f9-2P
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 20:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hunIi-0002Zm-VT
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hunIi-0006Ja-2O
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 20:26:04 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:36885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hunIf-0006Ig-Sn; Mon, 05 Aug 2019 20:26:02 -0400
Received: by mail-lf1-x143.google.com with SMTP id c9so59420543lfh.4;
 Mon, 05 Aug 2019 17:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTuGJ18z9ujmlfKCbaZ6SbiL8rm/4e/dR+fPA1EirD8=;
 b=ABegyfz611h/hlVGxkBtOMChBcOm6XJD3dQlVL+/1bkKkYi6VIU2cFa9rrt+i33SX/
 nkf5rEWiv8CzyKh9U0f/BCx/UQg3/s3AUFgc4xhzqMQt3XWyJuCToGzPJQxM4jfvJN5O
 XGhFquZyJLtagJKXfXFHJ4fQK5FSzkDlTLeQRvpI/XlHWPzKr0OI3KrdrJmu2+ju2OOJ
 uZme2vdUx3ii27q8wfgxXcDkkTtIH0ZRadw+bbmGZURLXmSD35XDQmzissWCRzvgbCSH
 Dsa2nR9aZKH1Xw+D2q0l+Hm17ArsE9zBGfhQE81bN8jsTiAm6TxKfGPWZ/gtznMeQKxA
 vQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTuGJ18z9ujmlfKCbaZ6SbiL8rm/4e/dR+fPA1EirD8=;
 b=OulG8wJNdYCICKR4aRu9n1jhqivm+VkZ1QOjVtjZeHSDXBQV1w/Y34YQHOTtO/Vbxl
 MeT+ayhbkox/GottqHLGr/Vi0lsGU5hy9GPROMSWu0M9ZRGaW43tcs6dyq9PW8y2441+
 I1XekeqleM/A+I1TPg4uhbNh0RwpJojwq68xaezPymI6W0uIW/GEzOlwmD8/LNyfmvET
 HRSvWa57tKkLnbMIjcmszR7hUxFhIGZbCF8SCdNJWIHWcvNYAXSPV1jHM/qzTZIfUoQX
 5KqizIU1pVUQ/hEsn/ZUJ/xlbUv9Zngbrpeb5Oy7uCPQbsuz2ThDrtVIEZ4FM9UeO7MV
 OGNA==
X-Gm-Message-State: APjAAAVW/QNZmZVzcsiOxS7/cMgCcwPbpWXyhHthSy6RFcxYxQM8vqzI
 s6eAKS2ZsIvghPT7YZs+dxuuU/jZIBZsR+kyYLk=
X-Google-Smtp-Source: APXvYqyiTUJ6ZZbNvp073NtBly+MwMAQ5Jtl3dOHY1OjJ1HXpR3POte9WgCPY/UWCxWBZp8YARO/gKHqwDW9mjwlSyU=
X-Received: by 2002:a19:6904:: with SMTP id e4mr261676lfc.156.1565051160837;
 Mon, 05 Aug 2019 17:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-29-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-29-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Aug 2019 17:22:21 -0700
Message-ID: <CAKmqyKNYSyxXaVdKJzH05W-s8nkf1T_QGwxxzXTP7B8xU=AoGw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 28/28] riscv: sifive_u: Update
 model and compatible strings in device tree
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
X-List-Received-Date: Tue, 06 Aug 2019 00:26:06 -0000

On Mon, Aug 5, 2019 at 9:13 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This updates model and compatible strings to use the same strings
> as used in the Linux kernel device tree (hifive-unleashed-a00.dts).
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  hw/riscv/sifive_u.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 5ded3a0..b7d4b4f 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -94,8 +94,9 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          exit(1);
>      }
>
> -    qemu_fdt_setprop_string(fdt, "/", "model", "ucbbar,spike-bare,qemu");
> -    qemu_fdt_setprop_string(fdt, "/", "compatible", "ucbbar,spike-bare-dev");
> +    qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
> +    qemu_fdt_setprop_string(fdt, "/", "compatible",
> +                            "sifive,hifive-unleashed-a00");
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>
> --
> 2.7.4
>
>

