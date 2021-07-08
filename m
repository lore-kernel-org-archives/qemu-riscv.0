Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1LxY-0002ed-UV
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 00:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1LxX-0002dm-Ba; Thu, 08 Jul 2021 00:48:23 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1LxV-0002Ou-Pl; Thu, 08 Jul 2021 00:48:23 -0400
Received: by mail-il1-x12a.google.com with SMTP id k6so5383846ilo.3;
 Wed, 07 Jul 2021 21:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZx3TgEBIyt2rxFLD7Q0HENossK/yJi9JRJ2bs27SWA=;
 b=tm3e8uqMbKP4OAbzzeyv3XtSJsElg8qZhj5bJJGgjszLjjAi50Qyw8idGfo6Jr/9G2
 obrPWPGlMPcJOJ3bDs0t7N/HgVwAtb4KBg62+0WAf6KJ0UiAUFTi7NnR7h2GybLEptbk
 xxkh4FGpOPEJ07ODXb5B/kT+mB4fBJvwT4RM4+1YyLr7Do/MLoKmdpfbDA6Gxg5/JV1H
 2abIn4opDCJJpMH0V0pz8qchI81h3LIlEngKglV2ViXInSlH3RB9ML1SCMXO7EETq2hb
 VlQDrcJPPIUtx9gKvUqviCRHJVQGp50AhjAsBMER7ZLZscLYi0O7t2G1fJQW3hv16ZkF
 MPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZx3TgEBIyt2rxFLD7Q0HENossK/yJi9JRJ2bs27SWA=;
 b=dAjyq70WH7sdDq3KosymI3ndj2RUW2+EsgA5DIzLwzGzYSjtWQJQx8wgppNYO8NkxZ
 7o4ruUi8TMFdgFngDNYSZrOAJpPppf0A+QNnuZEXd3C/CGwjNA3ynFTN2VQyu1sWvuVF
 suiE9NjgHFpcTjoh0MtvvDWE9zvc2zc8aM/OFH8shd319QYcdiqeNDArY0Yy7LpQXCew
 Sx/+BTiAYgNY0uT/IYnfEJFOzZTNDG0C+yePmEsyvlpiCniz/oL8Vfhga0pkrcos0uw8
 LUCwesKk37yJvV9n7in3w2qORD1tazRpbvtIvUe81+QG9Euhe2Czb8fh5Mod/ZjLB0Oi
 DYQA==
X-Gm-Message-State: AOAM533AECKZGu7w71Vd0MkAGdHMbaAh3cVJVuhRF4HGaHcgU16MLGG/
 626Oz0g++rWFwH64J6Wff70KulEe0uMRTQ1rdJ4=
X-Google-Smtp-Source: ABdhPJyzbN4BUBiCtLh8i/yLhNgcINw0s0DZ/Xw2SmRu1Hag/94tGWuK4nKWvuHPjx3NsLRfs3PT8RIyjpJZpWskjCo=
X-Received: by 2002:a92:8707:: with SMTP id m7mr7135803ild.177.1625719700393; 
 Wed, 07 Jul 2021 21:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210706102616.1922469-1-bmeng.cn@gmail.com>
In-Reply-To: <20210706102616.1922469-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Jul 2021 14:47:54 +1000
Message-ID: <CAKmqyKNo=s0ipFjz1W6GKkDOhu3zJHVdJUnh_PY2jga0bNKA+g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Correct the CLINT timebase frequency
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Thu, 08 Jul 2021 04:48:23 -0000

On Tue, Jul 6, 2021 at 8:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the CLINT timebase frequency is set to 10MHz on sifive_u,
> but on the real hardware the timebase frequency is 1Mhz.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 273c86418c..e75ca38783 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -62,6 +62,9 @@
>
>  #include <libfdt.h>
>
> +/* CLINT timebase frequency */
> +#define CLINT_TIMEBASE_FREQ 1000000
> +
>  static const MemMapEntry sifive_u_memmap[] = {
>      [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
>      [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
> @@ -165,7 +168,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        SIFIVE_CLINT_TIMEBASE_FREQ);
> +        CLINT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> @@ -847,7 +850,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
>          memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -        SIFIVE_CLINT_TIMEBASE_FREQ, false);
> +        CLINT_TIMEBASE_FREQ, false);
>
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
>          return;
> --
> 2.25.1
>
>

