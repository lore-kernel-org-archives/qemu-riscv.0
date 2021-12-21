Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzYhj-0004jK-7S
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 01:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzYhh-0004hi-KR; Tue, 21 Dec 2021 01:32:53 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=40522
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzYhf-0007IP-W7; Tue, 21 Dec 2021 01:32:53 -0500
Received: by mail-io1-xd2d.google.com with SMTP id p23so16379047iod.7;
 Mon, 20 Dec 2021 22:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wW/V9Lug/QAgluXyZXSKnDCGcXcm5ALFI5ghPgvY1yA=;
 b=RG9xXY/INK2eINR4Rfk7YEKrRuPYPORLIucXOUh3ff2kkLYPLXKRK/G5f11oCvVxu4
 6cFoDJF6Kys8D36uRqIXEQMywNpuIvz/G0IVkF5zJbzs4M9N3GpmGwBlYGxkXaNdgcBT
 liUbmp6UNo42tDgBrsNhKCU5ePl4iVVvzP1ETP0xuXHXaR+19yGr81SMen7gUYEp+P8d
 dShL1mEpGfY2WBBgGHJmnjSxs4SoddQoA1/v0BU/7FPM7BkyFiRCB0G2xdmorphFrZH7
 CVkL4mHJeeGh2AbDIameTiicknAIIBuaFXuIykB7udP2eUNfbMzO8LxrJ6ZpDXHHGr9T
 OKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wW/V9Lug/QAgluXyZXSKnDCGcXcm5ALFI5ghPgvY1yA=;
 b=zxjkDuCzaHmxon9MJniSB9dqfVWLNDKO/HYGHmpDsesnyFMaEjL28b+YNx3EpKOMkf
 MHwpgepg0s+fD0qyOU3vBwijulo55wsf04h+Ws+pNjBLor8fdko+J6K7nNXCMN8hhIQ2
 BRvRAQxSE6taXpJ8aZLWPX3Km+zEDipKyk5kNkvrBh/Qwx8vuzvDF3pUyYfTTAEq01wP
 SDxQRBpiaquC7GjWF7UpkJhMieMnBYA+8Hhw3WgJeUj7QDeiHX4qnXJ4V+3+Vtd4Nk8U
 UuDlVOoJ/gGcbg5lCDa0knwBMfM2M6v7MDbNN24Md3PkizrvkgORNjSbI8uAhPYWTZ5e
 aMbw==
X-Gm-Message-State: AOAM531fsN7eyVeL5p14FTSx1e1LhPalyYQSgl/vjvNYdz/J9HNG/Clz
 JpDAy+/ABmuMTGoLzUgNCKm+mvZ4nfIGBJCaSlU=
X-Google-Smtp-Source: ABdhPJxuFmD57sIsW4JTrL3PO4BTY7Qpyh78vXAsB487cAW/R48Zw9Rci0vH3zTSkKr0AUq7uoRpDi69hBBTYSAdgEk=
X-Received: by 2002:a05:6638:12d3:: with SMTP id
 v19mr1045370jas.318.1640068370065; 
 Mon, 20 Dec 2021 22:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
 <CAEUhbmVpGwjqvhLN1LCY3EokL9_a_v9okL=ZwUb_JYMZcvv3zw@mail.gmail.com>
In-Reply-To: <CAEUhbmVpGwjqvhLN1LCY3EokL9_a_v9okL=ZwUb_JYMZcvv3zw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Dec 2021 16:32:23 +1000
Message-ID: <CAKmqyKNLZGD-81xnFp_NMXKRuK-0EgP4FqW4AeLeKuMD+TAQEw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 06:32:54 -0000

On Mon, Dec 20, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > As per the device tree specification let's set the clock-frequency for
> > the virt CPUs.
> >
> > QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
> > nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
>
> I tend to think this issue is not valid, as the comment in the issue
> says the value should reflect the running frequency.
>
> Note the "clock-frequency" was once in the codes but was intentionally
> removed before because it is not needed:
>
> See commit 7ae05377b85f (" riscv: hw: Drop "clock-frequency" property
> of cpu nodes")

Hmmm... Good point.

But if the device tree spec says it's required then I think we should
include it. Even if it isn't super relevant for us

Alistair

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 3af074148e..41a85cfc60 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -202,6 +202,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> >          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
> >              s->soc[socket].hartid_base + cpu);
> >          qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
> > +        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "clock-frequency", 1000000);
> >          riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
> >          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
>
> Regards,
> Bin

