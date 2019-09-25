Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iD5yd-0000c5-H7
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 08:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoren@kernel.org>) id 1iD5ya-0000bE-5a
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 08:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoren@kernel.org>) id 1iD5yY-0002P1-AJ
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 08:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36186)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoren@kernel.org>)
 id 1iD5yP-0002LP-IY; Wed, 25 Sep 2019 08:00:45 -0400
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BC3A21D80;
 Wed, 25 Sep 2019 12:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569412844;
 bh=CrIPP8jWVqmUE9qIbPtDWntJH0XmvvmNn57dcDhpEZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CX5LTResy9SpIpIKNbVuQpcdQN+VwbaYc12e0R/LjRsMU/QXYou5HXf17VT8vASua
 tiwd45dvIZTr/LCXAr0341hkPoPmACnI1isDxJHrEIXNasv/Vv14iXSDKoYEUTntyZ
 XAxIhpeVLg0G1l+ljNH943aCG4TohhzBM75JRkPE=
Received: by mail-wr1-f48.google.com with SMTP id i18so6530587wru.11;
 Wed, 25 Sep 2019 05:00:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXiPxqV5m/5MOK6wi2NrA1M6VzO9BAIWa1InK7vNMMAPICBfhIp
 fqYQvX/kZrkzRh3MtD6fCGbyLAORqijp4uw8av4=
X-Google-Smtp-Source: APXvYqxpUkiSFYYOrUEaYziySpYtC9UhtN20JKo6kOfGss/vLwuCcIU2rRR0Sb68xTGewKgh2st4tYrajgdgYwp/BuU=
X-Received: by 2002:adf:fac3:: with SMTP id a3mr8515979wrs.24.1569412842670;
 Wed, 25 Sep 2019 05:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <1569403262-23523-1-git-send-email-guoren@kernel.org>
 <CAEUhbmUb=KOBje_X_hnmHz9LFDLyE+eb7iJhGkns2WMAsBRCpQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUb=KOBje_X_hnmHz9LFDLyE+eb7iJhGkns2WMAsBRCpQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Sep 2019 20:00:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT3LdxR=oY5zEbAVMgGLVKRY6F=W7WBu4pA0TmWBtv=oA@mail.gmail.com>
Message-ID: <CAJF2gTT3LdxR=oY5zEbAVMgGLVKRY6F=W7WBu4pA0TmWBtv=oA@mail.gmail.com>
Subject: Re: [PATCH V4] target/riscv: Ignore reserved bits in PTE for RV64
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair23@gmail.com>, Guo Ren <ren_guo@c-sky.com>
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
X-List-Received-Date: Wed, 25 Sep 2019 12:00:58 -0000

Thx

On Wed, Sep 25, 2019 at 5:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Sep 25, 2019 at 5:21 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
> > need to ignore them. They cannot be a part of ppn.
> >
> > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > ---
> >  target/riscv/cpu_bits.h   | 7 +++++++
> >  target/riscv/cpu_helper.c | 2 +-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > Changelog V4:
> >  - Change title to Ignore not Bugfix
> >  - Use PTE_PPN_MASK for RV32 and RV64
> >
> > Changelog V3:
> >  - Use UUL define for PTE_RESERVED
> >  - Keep ppn >> PTE_PPN_SHIFT
> >
> > Changelog V2:
> >  - Bugfix pte destroyed cause boot fail
> >  - Change to AND with a mask instead of shifting both directions
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

