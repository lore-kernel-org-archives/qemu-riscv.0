Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9jwO-0004Ph-23
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9jwJ-0004Nf-G2; Tue, 18 Jan 2022 03:34:04 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:49966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9jwH-0006H1-7Z; Tue, 18 Jan 2022 03:34:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7C7E60AB6;
 Tue, 18 Jan 2022 08:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589B2C340E6;
 Tue, 18 Jan 2022 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642494828;
 bh=sCKL6LSN+t5gbMYxwDGzs2FfADys/CVkPenCtSBuwdg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OuXCVaiJFv5OB2M6nHLHKX6zgfr18BSqDQrwAkppjlzSi0rMXqbUlLAl1XWidoX+n
 71h+MYpMRDx9hPRt2pmPN6Bi7YI+U0Ww/ZfYHSYlRITolmWLBYUO9oLFfBFF8Iaehr
 KDPXbJYXYOGyFIRfTr0wM03H7//pUj2Xytwr4hOCCuP37pSBaZRyHHTXgq2keUc7J7
 XiOronbgsQCtNfqsVSvAzFLYzH9Jv7uw+EiZpJLmMHEG9meTGU+1hPteyc2zn2xQ/O
 vKQkGG32ffEKJsR3C4EW84YrYwLYcVerezKAEzxfz2UKV78kM/mIEwj5lMlfZUvjij
 1y3BU3mYnVdkw==
Received: by mail-ua1-f52.google.com with SMTP id p1so35067317uap.9;
 Tue, 18 Jan 2022 00:33:48 -0800 (PST)
X-Gm-Message-State: AOAM5322SYxXZ5RdKKOsphv/AyplEgsVEGYFgVmkpNlbzRkxRiSDMrx4
 uGACbb+L2/1b3/syyZUbSY8ReRsiDMRqKETc2pg=
X-Google-Smtp-Source: ABdhPJzSnET6CMGle4d0/7o1Xy5eKA36ruTsR/hqGmmVXD/XJahY6zP787nLcMaCNm98eGLysL/EpIfzTI9uTUJgOwA=
X-Received: by 2002:a05:6102:2d5:: with SMTP id
 h21mr8161378vsh.51.1642494827311; 
 Tue, 18 Jan 2022 00:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
In-Reply-To: <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 18 Jan 2022 16:33:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
Message-ID: <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Anup Patel <anup@brainfault.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>, 
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
X-List-Received-Date: Tue, 18 Jan 2022 08:34:05 -0000

On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > need to ignore them. They cannot be a part of ppn.
> >
> > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >
> > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu_bits.h   | 7 +++++++
> >  target/riscv/cpu_helper.c | 2 +-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 5a6d49aa64..282cd8eecd 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -490,6 +490,13 @@ typedef enum {
> >  /* Page table PPN shift amount */
> >  #define PTE_PPN_SHIFT       10
> >
> > +/* Page table PPN mask */
> > +#if defined(TARGET_RISCV32)
> > +#define PTE_PPN_MASK        0xffffffffUL
> > +#elif defined(TARGET_RISCV64)
> > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > +#endif
> > +
>
> Going forward we should avoid using target specific "#if"
> so that we can use the same qemu-system-riscv64 for both
> RV32 and RV64.
>
> >  /* Leaf page shift amount */
> >  #define PGSHIFT             12
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 434a83e66a..26608ddf1c 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -619,7 +619,7 @@ restart:
> >              return TRANSLATE_FAIL;
> >          }
> >
> > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>
> Rather than using "#if", please use "xlen" comparison to extract
> PPN correctly from PTE.
Do you mean?

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9fffaccffb..071b7ea4cf 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -619,7 +619,11 @@ restart:
             return TRANSLATE_FAIL;
         }

-        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
+       } else {
+               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
+       }

         RISCVCPU *cpu = env_archcpu(env);
         if (!(pte & PTE_V)) {

>
> Regards,
> Anup
>
> >
> >          if (!(pte & PTE_V)) {
> >              /* Invalid PTE */
> > --
> > 2.17.1
> >
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

