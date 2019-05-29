Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hW3Ha-0006JW-87
	for mharc-qemu-riscv@gnu.org; Wed, 29 May 2019 14:26:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@hermes.cam.ac.uk>) id 1hW3HW-0006In-7L
	for qemu-riscv@nongnu.org; Wed, 29 May 2019 14:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@hermes.cam.ac.uk>) id 1hW3HR-0001Yb-2J
	for qemu-riscv@nongnu.org; Wed, 29 May 2019 14:26:30 -0400
Received: from ppsw-30.csi.cam.ac.uk ([131.111.8.130]:40882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hmka2@hermes.cam.ac.uk>)
	id 1hW3HN-0001V3-5W; Wed, 29 May 2019 14:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
	s=20180806.ppsw;
	h=Sender:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WMyOssXvw2r/eBAuwxd1V1u0p/Jnx0wbisZ0nP5sgMw=;
	b=h55OvHhOICZFmUpWlDogFWpigl
	2bO69lX7bmbMJJN72ngbWhFgBjQWxZWl/ZLII6zh0sBdeXTC42XfD20g0MVVUo6eO0sIZyx3OjBGo
	4t8uzc9l401oUPg3f45niqiMikq/DEdMl2YQTjuH1pO7u6aghF4d15sIGifPEmqtSXH4=; 
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from mail-lj1-f180.google.com ([209.85.208.180]:46617)
	by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:587)
	with esmtpsa (PLAIN:hmka2) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	id 1hW3HH-000NaS-dC (Exim 4.91)
	(return-path <hmka2@hermes.cam.ac.uk>); Wed, 29 May 2019 19:26:19 +0100
Received: by mail-lj1-f180.google.com with SMTP id m15so3440573ljg.13;
	Wed, 29 May 2019 11:26:19 -0700 (PDT)
X-Gm-Message-State: APjAAAXtwwWsdQvoDBBqukXga23ZjixmwvzKDyFV1GG4Z3FejOfjWExn
	zpLjRKa93fiMzOFY3N7XVGoL4IMey8dnQ4Y+0D0=
X-Google-Smtp-Source: APXvYqwPV7NMcJjgCiffZgPKTervynRghqz+CmIJ42LzFWQxVsQvRqE9ySchTy2q8Vxi9W4/fflKInQpkh2QsukcSZo=
X-Received: by 2002:a2e:964a:: with SMTP id z10mr9138516ljh.22.1559154378648; 
	Wed, 29 May 2019 11:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
	<20190521104324.12835-3-Hesham.Almatary@cl.cam.ac.uk>
	<CAKmqyKOT_15kFNjHkUgk+bs6GwGrDrAOPoe+t0u3T6hg6TqiPQ@mail.gmail.com>
	<CA+wsVCDgogUXBDNiWm7R19fAyNw-3ybPiW4O8yA=Wt8oqyShFg@mail.gmail.com>
In-Reply-To: <CA+wsVCDgogUXBDNiWm7R19fAyNw-3ybPiW4O8yA=Wt8oqyShFg@mail.gmail.com>
From: Hesham Almatary <hesham.almatary@cl.cam.ac.uk>
Date: Wed, 29 May 2019 20:25:42 +0200
X-Gmail-Original-Message-ID: <CA+wsVCD==3g=jH8_0AZyrycz=C-7dw4CNAzYqou6wjXA+qqcZQ@mail.gmail.com>
Message-ID: <CA+wsVCD==3g=jH8_0AZyrycz=C-7dw4CNAzYqou6wjXA+qqcZQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: "H.M.K. Almatary" <hmka2@hermes.cam.ac.uk>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.111.8.130
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCHv3 3/5] RISC-V: Check PMP
 during Page Table Walks
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2019 18:26:35 -0000

ping

On Wed, 22 May 2019 at 11:26, Hesham Almatary
<hesham.almatary@cl.cam.ac.uk> wrote:
>
> On Tue, 21 May 2019 at 23:40, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, May 21, 2019 at 3:44 AM Hesham Almatary
> > <Hesham.Almatary@cl.cam.ac.uk> wrote:
> > >
> > > The PMP should be checked when doing a page table walk, and report access
> > > fault exception if the to-be-read PTE failed the PMP check.
> > >
> > > Suggested-by: Jonathan Behrens <fintelia@gmail.com>
> > > Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
> > > ---
> > >  target/riscv/cpu.h        |  1 +
> > >  target/riscv/cpu_helper.c | 10 +++++++++-
> > >  2 files changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index c17184f4e4..ab3ba3f15a 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -94,6 +94,7 @@ enum {
> > >  #define PRIV_VERSION_1_09_1 0x00010901
> > >  #define PRIV_VERSION_1_10_0 0x00011000
> > >
> > > +#define TRANSLATE_PMP_FAIL 2
> > >  #define TRANSLATE_FAIL 1
> > >  #define TRANSLATE_SUCCESS 0
> > >  #define NB_MMU_MODES 4
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 7c7282c680..d0b0f9cf88 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -211,6 +211,12 @@ restart:
> > >
> > >          /* check that physical address of PTE is legal */
> > >          target_ulong pte_addr = base + idx * ptesize;
> > > +
> > > +        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> > > +            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
> > > +            1 << MMU_DATA_LOAD)) {
> >
> > I see a problem here.
> >
> > pmp_hart_has_privs() checks permissions based on the current value of
> > env->priv. This might not always be the correct permissions to check,
> > we should instead use the current mode to check permissions.
> >
> That is not clear to me. Isn't env->priv the current privildge mode?
> Could you please elaborate on what other cases this might not be the case?
>
> > The best way to do this to me is to probably provide a privileged mode
> > override to the function, can you add that?
> >
> > Alistair
> >
> > > +            return TRANSLATE_PMP_FAIL;
> > > +        }
> > >  #if defined(TARGET_RISCV32)
> > >          target_ulong pte = ldl_phys(cs->as, pte_addr);
> > >  #elif defined(TARGET_RISCV64)
> > > @@ -405,8 +411,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > >      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> > >          (ret == TRANSLATE_SUCCESS) &&
> > >          !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
> > > +        ret = TRANSLATE_PMP_FAIL;
> > > +    }
> > > +    if (ret == TRANSLATE_PMP_FAIL) {
> > >          pmp_violation = true;
> > > -        ret = TRANSLATE_FAIL;
> > >      }
> > >      if (ret == TRANSLATE_SUCCESS) {
> > >          tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> > > --
> > > 2.17.1
> > >
> > >

