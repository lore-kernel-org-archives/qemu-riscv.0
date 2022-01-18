Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9mSr-0000ZE-K9
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 06:15:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9mSo-0000YD-8r; Tue, 18 Jan 2022 06:15:46 -0500
Received: from [2604:1380:4641:c500::1] (port=59918 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9mSl-0006y8-J7; Tue, 18 Jan 2022 06:15:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12ABC612BA;
 Tue, 18 Jan 2022 11:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79569C340E1;
 Tue, 18 Jan 2022 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642504540;
 bh=CwamJ4JhNKW8W3dwltChxy6z8jCNz8yyJVoM/8g8Ylw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DaJHU/ZLMV3UKkxsCSOgFE49CwupTtvyP4KQBS4BgUvY32A9E7F+oQx47KRZE0mR9
 onaJLYxfja54bqjJPS3nKah0aD3gWwO2arS4Nb9bIsLfeFUWhEz9Ti6c1tgstPzFis
 IxjBmBPVN4XKSrRxQW4fOnC1Y59gBVUF8VcT2jT8psuL418YUIXZxrVNS6MJDCJb2B
 QlIlGlztcGrOf2dnN/7xGoSKdgmCT/4OXq3ppUZRv9Oqq4tV/eUbwMh1pVK1dTWBHI
 31h9H8EckLQWT8DUeW5W0GNGXPXO7ETfHOu1GA7iTyiAwGDbnwRfGZrx/kZM5tK7tl
 dy1NsQv2679SQ==
Received: by mail-ua1-f53.google.com with SMTP id p1so35747087uap.9;
 Tue, 18 Jan 2022 03:15:40 -0800 (PST)
X-Gm-Message-State: AOAM53017ML11yp2zV2BAO1Y6ifgvv++yUjyhiFs2FvNrmgQcCOQRP59
 CrMIQPbTHpAr0kXsdX3iNGLaWvduiA4tcGDlzm0=
X-Google-Smtp-Source: ABdhPJxW3Or/iZiKxZAu23ZMC7+10DIcq4Su8NzxbZd6yuEadKF4zBvYfQgycIQx3KGRgCvt3+UmCNaJ65A1RLSlg1Q=
X-Received: by 2002:a67:fd64:: with SMTP id h4mr9177575vsa.8.1642504539505;
 Tue, 18 Jan 2022 03:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
 <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
In-Reply-To: <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 18 Jan 2022 19:15:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
Message-ID: <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=guoren@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 11:15:47 -0000

On Tue, Jan 18, 2022 at 4:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > > >
> > > > From: Guo Ren <ren_guo@c-sky.com>
> > > >
> > > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > > need to ignore them. They cannot be a part of ppn.
> > > >
> > > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> > > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > > >
> > > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> > > >
> > > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  target/riscv/cpu_bits.h   | 7 +++++++
> > > >  target/riscv/cpu_helper.c | 2 +-
> > > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > index 5a6d49aa64..282cd8eecd 100644
> > > > --- a/target/riscv/cpu_bits.h
> > > > +++ b/target/riscv/cpu_bits.h
> > > > @@ -490,6 +490,13 @@ typedef enum {
> > > >  /* Page table PPN shift amount */
> > > >  #define PTE_PPN_SHIFT       10
> > > >
> > > > +/* Page table PPN mask */
> > > > +#if defined(TARGET_RISCV32)
> > > > +#define PTE_PPN_MASK        0xffffffffUL
> > > > +#elif defined(TARGET_RISCV64)
> > > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > > +#endif
> > > > +
> > >
> > > Going forward we should avoid using target specific "#if"
> > > so that we can use the same qemu-system-riscv64 for both
> > > RV32 and RV64.
> > >
> > > >  /* Leaf page shift amount */
> > > >  #define PGSHIFT             12
> > > >
> > > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > index 434a83e66a..26608ddf1c 100644
> > > > --- a/target/riscv/cpu_helper.c
> > > > +++ b/target/riscv/cpu_helper.c
> > > > @@ -619,7 +619,7 @@ restart:
> > > >              return TRANSLATE_FAIL;
> > > >          }
> > > >
> > > > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > > > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > >
> > > Rather than using "#if", please use "xlen" comparison to extract
> > > PPN correctly from PTE.
> > Do you mean?
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 9fffaccffb..071b7ea4cf 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -619,7 +619,11 @@ restart:
> >              return TRANSLATE_FAIL;
> >          }
> >
> > -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> > +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
> > +       } else {
> > +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
> > +       }
>
> Yes, something like this but use a define for 0x3fffffffffffffULL
Just as Alistair said: This will need to be dynamic based on get_xl()

 I still prefer:
+#if defined(TARGET_RISCV32)
+#define PTE_PPN_MASK        0xffffffffUL
+#elif defined(TARGET_RISCV64)
+#define PTE_PPN_MASK        0x3fffffffffffffULL
+#endif

+        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

>
> Regards,
> Anup
>
> >
> >          RISCVCPU *cpu = env_archcpu(env);
> >          if (!(pte & PTE_V)) {
> >
> > >
> > > Regards,
> > > Anup
> > >
> > > >
> > > >          if (!(pte & PTE_V)) {
> > > >              /* Invalid PTE */
> > > > --
> > > > 2.17.1
> > > >
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

