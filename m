Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu0HF-0003VX-Dw
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 15:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aurelien@aurel32.net>) id 1iu0HC-0003UF-FX
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 15:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aurelien@aurel32.net>) id 1iu0HB-0005tG-8W
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 15:37:30 -0500
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:49478)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aurelien@aurel32.net>)
 id 1iu0H8-0005li-Jz; Tue, 21 Jan 2020 15:37:26 -0500
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1iu0Gs-00054t-FS; Tue, 21 Jan 2020 21:37:10 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
 (envelope-from <aurelien@aurel32.net>)
 id 1iu0Gs-00CqYw-20; Tue, 21 Jan 2020 21:37:10 +0100
Date: Tue, 21 Jan 2020 21:37:10 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4 3/7] target/riscv: Create function to
 test if FP is enabled
Message-ID: <20200121203710.GA3061510@aurel32.net>
References: <cover.1566573576.git.alistair.francis@wdc.com>
 <5cc26abb98a9534720f09674b4b9caafb8f2cf0a.1566573576.git.alistair.francis@wdc.com>
 <20200105163640.GA1752551@aurel32.net>
 <20200105165916.GA1834646@aurel32.net>
 <CAKmqyKNd8ihSXTcdS9da_pGkinFVnJKAAsg4fR4LzBEUH8NZ2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNd8ihSXTcdS9da_pGkinFVnJKAAsg4fR4LzBEUH8NZ2A@mail.gmail.com>
User-Agent: Mutt/1.13.2 (2019-12-18)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:bc8:30d7:100::1
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
X-List-Received-Date: Tue, 21 Jan 2020 20:37:31 -0000

Hi,

On 2020-01-20 10:31, Alistair Francis wrote:
> On Mon, Jan 6, 2020 at 2:59 AM Aurelien Jarno <aurelien@aurel32.net> wrote:
> >
> > On 2020-01-05 17:36, Aurelien Jarno wrote:
> > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > index e0d4586760..2789215b5e 100644
> > > > --- a/target/riscv/csr.c
> > > > +++ b/target/riscv/csr.c
> > >
> > > [ snip ]
> > >
> > > > @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> > > >  {
> > > >      target_ulong mstatus = env->mstatus;
> > > >      target_ulong mask = 0;
> > > > +    int dirty;
> > > >
> > > >      /* flush tlb on mstatus fields that affect VM */
> > > >      if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> > > > @@ -340,8 +341,9 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> > > >
> > > >      mstatus = (mstatus & ~mask) | (val & mask);
> > > >
> > > > -    int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> > > > -                ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> > > > +    dirty = (riscv_cpu_fp_enabled(env) &&
> > > > +             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
> > > > +            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> > > >      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
> > > >      env->mstatus = mstatus;
> > >
> > > This patch, and more precisely the above two hunks broke
> > > qemu-system-riscv64. More precisely, when running a Debian sid system
> > > inside QEMU, sshd hangs during key exchange.
> >
> > The problem is that at this stage, mstatus != env->status. Prior to that
> > patch, dirty was computed exclusively on the new mstatus status, after
> > the update by val. With this patch, riscv_cpu_fp_enabled() refers to the
> > old value of mstatus. Therefore when FS is changed from "Off" (FS = 00)
> > to "Dirty" (FS == 11), the SD bit is not set.
> 
> Thanks for reporting this!
> 
> Can you try this branch (it should be a PR to mainline QEMU soon) and
> let me know if that fixes the issue?
> 
> https://github.com/palmer-dabbelt/qemu/commits/for-master

Thanks for the patchset. I confirm this fixes the issue.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

