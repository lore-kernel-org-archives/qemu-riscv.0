Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCtiL-0000vO-9W
	for mharc-qemu-riscv@gnu.org; Sun, 08 Aug 2021 21:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCtiJ-0000ue-8g; Sun, 08 Aug 2021 21:04:23 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:47020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCtiH-0006B4-Mr; Sun, 08 Aug 2021 21:04:23 -0400
Received: by mail-io1-xd2d.google.com with SMTP id x10so14560814iop.13;
 Sun, 08 Aug 2021 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vyXpBfLKYmEel/4yI8QTznzGTwOwMm1jVN7pG67MAEY=;
 b=R176N1bE3KTVhL6HWcHMaC4l2wqgEr3vICi1lsyO19Ja3Va3gk1Kr3D7mAxMiWMdbM
 VqdleCHfPFigc1U+Y16BpsRLcsyAaN+ojcwKuEOQuqNiL8ZVEIBlQIRSoF/F7nJ906Hz
 8YA9z3n4i/zvFRWlLjdQ8F+tD7LcoVNObw1kAbl/Vo6ahJDmxOFdmiZ4BasV4Zid3iRq
 GwXyMm4eCsFyBpZNunYFwNdsbwdD0gQCkYZ9iO9m1VTR4no/SnjZboB3CmnaQxrRwQPI
 5Y2ODdJKL8WNrUdniEoOO353Q9TIX63pxWpqayboOhjpMXka42iXa5BvqkA60J3zG16M
 2yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vyXpBfLKYmEel/4yI8QTznzGTwOwMm1jVN7pG67MAEY=;
 b=BEuBa7O2bcT0mh/uJEKHPy7H3UQij6OXM0p41RFHkrLCZcOzCfwLm0sfd0jKio4vLX
 cWin4HtDc4ppSIKw3TX7NEP98NlR25Yxdq6N+AxAdT3SyCd4tWkK+zxdTyJz1tHARbIo
 YaYurAJSLN52uH4UJ8EvAHIm+oQlsVtiyrqe4juYYhdXGa2LiLV0yMDHoIWyWcjjng7q
 zT7ocj/6RO9A9DHOppNijTAsaO9k8q9LMl017k0HVEtJ1UsMeNAm1V0AHwLrCuuikNav
 G9Q7nsoHDpQk1Bviw1p9SYISUxYzwN4S0gy6Lj2zue1jdrnxltO0jRDk27agpkDHkCP4
 y23A==
X-Gm-Message-State: AOAM530oXTjs5QH5cjQWK0H4+Mut8H/GZV14QkluPmpPEziHmRgLxF4x
 /+jIZD4/i+Z/0OVV3ZUGAS0fLmyFmwvzWL2gMdw=
X-Google-Smtp-Source: ABdhPJyhTWWOdENc6YAuiMM5mIIbgI8ZrlPSdwpTrTQIn7fRLYmAMw5ZEgO4TdXh5MPmk6MNogx8OTViJEbLWAAHvsY=
X-Received: by 2002:a05:6638:240d:: with SMTP id
 z13mr6440300jat.8.1628471059664; 
 Sun, 08 Aug 2021 18:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210807035641.22449-1-bmeng.cn@gmail.com>
In-Reply-To: <20210807035641.22449-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Aug 2021 11:03:53 +1000
Message-ID: <CAKmqyKPTX6_OuEzwZqBy5NqNWTudSvrbhUhdkAjxFy8gXCeScg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Move flash node to root
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 09 Aug 2021 01:04:23 -0000

On Sat, Aug 7, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The flash is not inside the SoC, so it's inappropriate to put it
> under the /soc node. Move it to root instead.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a..89fb607c47 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -455,7 +455,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
> +    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
>      qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
> --
> 2.25.1
>
>

