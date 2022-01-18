Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9n7Q-0002Lh-Kl
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 06:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9n7O-0002JH-Pi; Tue, 18 Jan 2022 06:57:42 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9n7N-0004wx-0t; Tue, 18 Jan 2022 06:57:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD9D161325;
 Tue, 18 Jan 2022 11:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55653C340E1;
 Tue, 18 Jan 2022 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642507059;
 bh=E7p6+6voRm7gJCMKh2lZDMshVFHd6gOW7ajgfgZL8wk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WFaj66a4Q3DVUBu2EY6c+rI5lKcKpV84AufkCkCXEyGsLSzwa+BHfvDtNaDRk0xPJ
 Dz+zbr6Sqq5uPPeChtRSnSefw3A/q62Oq46NE1Hi/HA8avZL4ogWMIMNwu5gSlB+Zx
 v+LVAJqHK/i4WNnn0csbvdxNbKR0WsDyS09RV5jv3Yay233AmhdhqZYHvA3t+rCIHu
 briwmgACTrAy9YA4Q95pVlqZY2kbhPU4PNhKaaEBDctqHDUeK71nL7JCmVHRaGiWGh
 hPjOmSd5pkYhel9s2XURvnHK1wD0DMNVl2io20rCpcaQmbArEZXGK3gC8fjlm7+Ooa
 P0DuWzcCGiV1g==
Received: by mail-ua1-f53.google.com with SMTP id m90so36063444uam.2;
 Tue, 18 Jan 2022 03:57:39 -0800 (PST)
X-Gm-Message-State: AOAM530PZLhPqvcv8rIkNte1GjYFQDZszWAPUXW9iIeFVMceT5C5qnPx
 nuYmFuPznVdPg/qlMxG5TnzMbm3tjmuginPJ4H4=
X-Google-Smtp-Source: ABdhPJx8Y7WD0DL9vQWSThTRHJ2wJ9PPVdRRtXJ18mukW2lg2wIscgxcw61hnDePFZM3drNC1SbumUpi3GQxRun0oXM=
X-Received: by 2002:ab0:3a8f:: with SMTP id r15mr9062613uaw.66.1642507058366; 
 Tue, 18 Jan 2022 03:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
 <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
 <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
 <CAAhSdy2Pvo5AFk-FJEcwYOKBuOxcS8P-T0W=BtLm4fzR+K8_OQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2Pvo5AFk-FJEcwYOKBuOxcS8P-T0W=BtLm4fzR+K8_OQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 18 Jan 2022 19:57:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS3UyrwQoFENkc3N6LtXnU673NnuScJQ_=8m7Dy31UDaA@mail.gmail.com>
Message-ID: <CAJF2gTS3UyrwQoFENkc3N6LtXnU673NnuScJQ_=8m7Dy31UDaA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=guoren@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 18 Jan 2022 11:57:43 -0000

On Tue, Jan 18, 2022 at 7:28 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jan 18, 2022 at 4:45 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 4:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > > > > >
> > > > > > From: Guo Ren <ren_guo@c-sky.com>
> > > > > >
> > > > > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > > > > need to ignore them. They cannot be a part of ppn.
> > > > > >
> > > > > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> > > > > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > > > > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > > > > >
> > > > > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> > > > > >
> > > > > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > > > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > ---
> > > > > >  target/riscv/cpu_bits.h   | 7 +++++++
> > > > > >  target/riscv/cpu_helper.c | 2 +-
> > > > > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > > > index 5a6d49aa64..282cd8eecd 100644
> > > > > > --- a/target/riscv/cpu_bits.h
> > > > > > +++ b/target/riscv/cpu_bits.h
> > > > > > @@ -490,6 +490,13 @@ typedef enum {
> > > > > >  /* Page table PPN shift amount */
> > > > > >  #define PTE_PPN_SHIFT       10
> > > > > >
> > > > > > +/* Page table PPN mask */
> > > > > > +#if defined(TARGET_RISCV32)
> > > > > > +#define PTE_PPN_MASK        0xffffffffUL
> > > > > > +#elif defined(TARGET_RISCV64)
> > > > > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > > > > +#endif
> > > > > > +
> > > > >
> > > > > Going forward we should avoid using target specific "#if"
> > > > > so that we can use the same qemu-system-riscv64 for both
> > > > > RV32 and RV64.
> > > > >
> > > > > >  /* Leaf page shift amount */
> > > > > >  #define PGSHIFT             12
> > > > > >
> > > > > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > > > index 434a83e66a..26608ddf1c 100644
> > > > > > --- a/target/riscv/cpu_helper.c
> > > > > > +++ b/target/riscv/cpu_helper.c
> > > > > > @@ -619,7 +619,7 @@ restart:
> > > > > >              return TRANSLATE_FAIL;
> > > > > >          }
> > > > > >
> > > > > > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > > > > > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > > > >
> > > > > Rather than using "#if", please use "xlen" comparison to extract
> > > > > PPN correctly from PTE.
> > > > Do you mean?
> > > >
> > > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > index 9fffaccffb..071b7ea4cf 100644
> > > > --- a/target/riscv/cpu_helper.c
> > > > +++ b/target/riscv/cpu_helper.c
> > > > @@ -619,7 +619,11 @@ restart:
> > > >              return TRANSLATE_FAIL;
> > > >          }
> > > >
> > > > -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > > > +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> > > > +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
> > > > +       } else {
> > > > +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
> > > > +       }
> > >
> > > Yes, something like this but use a define for 0x3fffffffffffffULL
> > Just as Alistair said: This will need to be dynamic based on get_xl()
> >
> >  I still prefer:
> > +#if defined(TARGET_RISCV32)
> > +#define PTE_PPN_MASK        0xffffffffUL
> > +#elif defined(TARGET_RISCV64)
> > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > +#endif
> >
> > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>
> Actually, using cpu_get_xl() is even better because it allows
> having lower privilege mode running at different XLEN.
Good point. You have convinced me.

>
> Regards,
> Anup
>
> >
> > >
> > > Regards,
> > > Anup
> > >
> > > >
> > > >          RISCVCPU *cpu = env_archcpu(env);
> > > >          if (!(pte & PTE_V)) {
> > > >
> > > > >
> > > > > Regards,
> > > > > Anup
> > > > >
> > > > > >
> > > > > >          if (!(pte & PTE_V)) {
> > > > > >              /* Invalid PTE */
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Best Regards
> > > >  Guo Ren
> > > >
> > > > ML: https://lore.kernel.org/linux-csky/
> > > >
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

