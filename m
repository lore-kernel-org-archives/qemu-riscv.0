Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9mds-00045h-V1
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 06:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9mdp-00040l-87
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 06:27:09 -0500
Received: from [2a00:1450:4864:20::32e] (port=35739
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9mcn-0008PF-38
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 06:26:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso5037213wmj.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Jan 2022 03:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jt04BQHrNI+Iv2fQFB0Lbhcq5ROcKpE09Ft7v8m6BLs=;
 b=zKEjVqglDtXjpyF0GlSHW5JRGA8F4+xffNJdp6BFPYdubn9c4pOvLMrUVWd32/iUZu
 Pw7KSAUQwduMA5ei9SdcGBTZNvdWAAqAft11N9JgbBJcsliBeuNNkjxf0m9kQrBnv6k4
 WoNh9Yk3N5ZRTVbMsme1875aEOfqGa1/77pDir/riN6JLbQqv0g6ME83W28dNBhTln/v
 NsR8NQm3zEnCjLRNNNCPuTNi3JGcJxhIPQp1aUVw7uzsFAqM2WLvgMc/MxHbUOZ+mNCf
 V8xt3JUG/xbOsXgo7hATCk4qwGB5OlWM9tieYqefK5a4WZHSljAJfYM12+Zz7lpFlg/s
 3oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jt04BQHrNI+Iv2fQFB0Lbhcq5ROcKpE09Ft7v8m6BLs=;
 b=GvJh4XEsKbIgqa6q9sZA+p8yzlQR+IMprAraNRpv8NwZxPKuKPDo1fA1wMps3X0toq
 lDhkNZrIyBc3GWeOpFq8jQ6HPnYx+kyHtKSzfLAqgN04ARU3WNeYJCTVbEz9WCJS0Aqs
 dxUBuSGqHSvbq4c0GSqm+hY6nhz1RX6zOK9j+Fv+5MrzaZcUFC5QQqhXxtUZWBsif9pt
 6z+gQUGmNzyaxugmJr0zQMZlKDwyUA015VCsdNUVw/e6Twta3xVLxw4AQojMNDXcx10p
 xLgN+Pv+en4TT05bo1VOgia7wt++i4tCGDB7uCiI+3QHtSpChmY0HNS1KTe1rPCd86wl
 oAzg==
X-Gm-Message-State: AOAM532rj91+MgJavhl6QQmHgNWmrDKHd5SC1Zgq8z1H5N4YsZ6oUHjE
 Vmgv+vOkqAOXEDsHGh1MiPyGpRWE8mMIDDcDBR+few==
X-Google-Smtp-Source: ABdhPJyI44U0Xiz72WeNushcxTcazlDRTKq2cO9m0Hn5hZBmnfrN/BbLQCGAhrA5mwLDqHzd/yR5i3R+nKD65WiAIaI=
X-Received: by 2002:a5d:584e:: with SMTP id i14mr9211085wrf.690.1642505148359; 
 Tue, 18 Jan 2022 03:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
 <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
 <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
In-Reply-To: <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 16:55:35 +0530
Message-ID: <CAAhSdy03q3FSmoK790aE0KycPis97h7O5Sv0qt-8QsBYSc1SyA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 11:27:09 -0000

On Tue, Jan 18, 2022 at 4:45 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Jan 18, 2022 at 4:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > > > >
> > > > > From: Guo Ren <ren_guo@c-sky.com>
> > > > >
> > > > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > > > need to ignore them. They cannot be a part of ppn.
> > > > >
> > > > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> > > > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > > > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > > > >
> > > > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> > > > >
> > > > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  target/riscv/cpu_bits.h   | 7 +++++++
> > > > >  target/riscv/cpu_helper.c | 2 +-
> > > > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > > index 5a6d49aa64..282cd8eecd 100644
> > > > > --- a/target/riscv/cpu_bits.h
> > > > > +++ b/target/riscv/cpu_bits.h
> > > > > @@ -490,6 +490,13 @@ typedef enum {
> > > > >  /* Page table PPN shift amount */
> > > > >  #define PTE_PPN_SHIFT       10
> > > > >
> > > > > +/* Page table PPN mask */
> > > > > +#if defined(TARGET_RISCV32)
> > > > > +#define PTE_PPN_MASK        0xffffffffUL
> > > > > +#elif defined(TARGET_RISCV64)
> > > > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > > > +#endif
> > > > > +
> > > >
> > > > Going forward we should avoid using target specific "#if"
> > > > so that we can use the same qemu-system-riscv64 for both
> > > > RV32 and RV64.
> > > >
> > > > >  /* Leaf page shift amount */
> > > > >  #define PGSHIFT             12
> > > > >
> > > > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > > index 434a83e66a..26608ddf1c 100644
> > > > > --- a/target/riscv/cpu_helper.c
> > > > > +++ b/target/riscv/cpu_helper.c
> > > > > @@ -619,7 +619,7 @@ restart:
> > > > >              return TRANSLATE_FAIL;
> > > > >          }
> > > > >
> > > > > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > > > > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > > >
> > > > Rather than using "#if", please use "xlen" comparison to extract
> > > > PPN correctly from PTE.
> > > Do you mean?
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 9fffaccffb..071b7ea4cf 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -619,7 +619,11 @@ restart:
> > >              return TRANSLATE_FAIL;
> > >          }
> > >
> > > -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > > +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> > > +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
> > > +       } else {
> > > +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
> > > +       }
> >
> > Yes, something like this but use a define for 0x3fffffffffffffULL
> Just as Alistair said: This will need to be dynamic based on get_xl()

By get_xl() Alistair meant riscv_cpu_mxl()

>
>  I still prefer:
> +#if defined(TARGET_RISCV32)
> +#define PTE_PPN_MASK        0xffffffffUL
> +#elif defined(TARGET_RISCV64)
> +#define PTE_PPN_MASK        0x3fffffffffffffULL
> +#endif
>
> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

This approach does not allow us to use same
qemu-system-riscv64 for RV32 emulation.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > >
> > >          RISCVCPU *cpu = env_archcpu(env);
> > >          if (!(pte & PTE_V)) {
> > >
> > > >
> > > > Regards,
> > > > Anup
> > > >
> > > > >
> > > > >          if (!(pte & PTE_V)) {
> > > > >              /* Invalid PTE */
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > >
> > >
> > > --
> > > Best Regards
> > >  Guo Ren
> > >
> > > ML: https://lore.kernel.org/linux-csky/
> > >
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

