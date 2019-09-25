Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iD3Kv-0002e9-At
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 05:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoren@kernel.org>) id 1iD3Ks-0002bU-Ur
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 05:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoren@kernel.org>) id 1iD3Kr-0003no-PV
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 05:11:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60118)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoren@kernel.org>)
 id 1iD3Ko-0003me-VO; Wed, 25 Sep 2019 05:11:43 -0400
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF85220673;
 Wed, 25 Sep 2019 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569402701;
 bh=1fBfR4XDrl6VjHYFULK8TPjcSSpvzjSfMe4vTT4fa9g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jh2PsT7QR3+SCskeUJRBg+XUINSBZ7RQnmd0ZxaAW7RQs/VfSEgfZLYDNbBZyJdDN
 4Nfmee3cteAetoEVAiuOB8bXkEjhnHxbgfhqjdvqo1STWHBt+r75Ohp71tTyB/lLYv
 TPmCpme1gV655WfRXrNdN5HGfIqJsA7hHw6WZ89c=
Received: by mail-wm1-f54.google.com with SMTP id p7so4251469wmp.4;
 Wed, 25 Sep 2019 02:11:40 -0700 (PDT)
X-Gm-Message-State: APjAAAUIYzVrf6baUZiKdw6HC+sUKlaWoQTPLp4TkfZlnYG1P6vXOb8i
 BphA8DrtGWuwVLsmbO9zvfv8Q9URZeU5KNWLm+U=
X-Google-Smtp-Source: APXvYqzGcs4wa/UcGxZJNgAp2utqncHyip3Zd8Lh28lURp/zUFwk7TzW5ny3Ly75SiPZroXa6FdwXjnxR6j4OoNH5UM=
X-Received: by 2002:a05:600c:1103:: with SMTP id
 b3mr6570969wma.3.1569402699205; 
 Wed, 25 Sep 2019 02:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <1569386895-8726-1-git-send-email-guoren@kernel.org>
 <CAEUhbmW2SB9xak88XQ2LdKL6jtHoLWTQY+j-WFGvgO2tExh4pg@mail.gmail.com>
In-Reply-To: <CAEUhbmW2SB9xak88XQ2LdKL6jtHoLWTQY+j-WFGvgO2tExh4pg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Sep 2019 17:11:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRve8qdWpjs1pWdqAtGigCb5V3wkQa4Dk4=k+8tnxKkSg@mail.gmail.com>
Message-ID: <CAJF2gTRve8qdWpjs1pWdqAtGigCb5V3wkQa4Dk4=k+8tnxKkSg@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Bugfix reserved bits in PTE for RV64
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 198.145.29.99
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
X-List-Received-Date: Wed, 25 Sep 2019 09:11:48 -0000

On Wed, Sep 25, 2019 at 1:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Sep 25, 2019 at 12:49 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <ren_guo@c-sky.com>
> >
>
> nits: the title is probably better to be rephrased to: Ignore reserved
> bits when calculating PPN for RV64
Yes, I forgot change the title.

>
> > Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
> > need to ignore them. They can not be a part of ppn.
>
> nits: cannot
Thx

>
> >
> > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > ---
> >  target/riscv/cpu_bits.h   | 3 +++
> >  target/riscv/cpu_helper.c | 4 +++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > ---
> > Changelog V3:
>
> nits: normally we put changelog before the changed file summary above,
> and there is no need to put another ---
OK, just remove ---

>
> >  - Use UUL define for PTE_RESERVED.
> >  - Keep ppn >> PTE_PPN_SHIFT
> >
> > Changelog V2:
> >  - Bugfix pte destroyed cause boot fail
> >  - Change to AND with a mask instead of shifting both directions
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index e998348..cdc62a8 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -470,6 +470,9 @@
> >  #define PTE_D               0x080 /* Dirty */
> >  #define PTE_SOFT            0x300 /* Reserved for Software */
> >
> > +/* Reserved highest 10 bits in PTE */
> > +#define PTE_RESERVED        0xFFC0000000000000ULL
>
> Can we define the macro for RV32 too, so that (see below)
OK

>
> > +
> >  /* Page table PPN shift amount */
> >  #define PTE_PPN_SHIFT       10
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 87dd6a6..7e04ff5 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -258,10 +258,12 @@ restart:
> >          }
> >  #if defined(TARGET_RISCV32)
> >          target_ulong pte = ldl_phys(cs->as, pte_addr);
> > +        hwaddr ppn = pte;
> >  #elif defined(TARGET_RISCV64)
> >          target_ulong pte = ldq_phys(cs->as, pte_addr);
> > +        hwaddr ppn = pte & ~PTE_RESERVED;
> >  #endif
> > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > +        ppn = ppn >> PTE_PPN_SHIFT;
>
> we can just do this in this single line?
Yes

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

