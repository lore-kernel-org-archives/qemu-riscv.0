Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTNWy-0003EM-Mo
	for mharc-qemu-riscv@gnu.org; Wed, 22 May 2019 05:27:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@hermes.cam.ac.uk>) id 1hTNWv-0003BQ-Jk
	for qemu-riscv@nongnu.org; Wed, 22 May 2019 05:27:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@hermes.cam.ac.uk>) id 1hTNWu-0005Wb-Ei
	for qemu-riscv@nongnu.org; Wed, 22 May 2019 05:27:25 -0400
Received: from ppsw-31.csi.cam.ac.uk ([131.111.8.131]:38628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hmka2@hermes.cam.ac.uk>)
	id 1hTNWt-0005Td-Tp; Wed, 22 May 2019 05:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
	s=20180806.ppsw;
	h=Sender:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xedp0Vwn/UyL2dfFMFqXMCDRMHrzC7DVA/dj5VHx9gM=;
	b=cgC/UEpJgNWIGQwu4eDDTMUpQz
	jRUg65ILAbLnYSF6eh7vvciiWNIhJH93W76zVhtMHe9VrmxrpAdGyc84NCRQj8qvQmfVtQrD+qRQw
	wqLK50fredemtdtuaMl4pGaTHq508tGFLCfVX/C/9fzrZ0S/pspzEeUSw+2Z2qhOE7I4=; 
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from mail-lf1-f47.google.com ([209.85.167.47]:44954)
	by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:587)
	with esmtpsa (PLAIN:hmka2) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	id 1hTNWr-001ap9-Lj (Exim 4.91)
	(return-path <hmka2@hermes.cam.ac.uk>); Wed, 22 May 2019 10:27:21 +0100
Received: by mail-lf1-f47.google.com with SMTP id n134so1126897lfn.11;
	Wed, 22 May 2019 02:27:21 -0700 (PDT)
X-Gm-Message-State: APjAAAUKKrhHyDLrBGlbjHuzmc1PKNqzHQ1ImlxPXgXxh/WjUr7PT36v
	ho9mioMaR/7Lz2aBM9LUwi2jlKPrOL35Ib7Se9s=
X-Google-Smtp-Source: APXvYqyaCFA82QZRHs/WEbQyj6WSs+shKp5NPl+tRY/53O260aIB986RHYi/A6Lhc6plNh1dqDnLQma21u/B7cpmp2Q=
X-Received: by 2002:ac2:5446:: with SMTP id d6mr6495411lfn.47.1558517241222;
	Wed, 22 May 2019 02:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190521104324.12835-1-Hesham.Almatary@cl.cam.ac.uk>
	<20190521104324.12835-3-Hesham.Almatary@cl.cam.ac.uk>
	<CAKmqyKOT_15kFNjHkUgk+bs6GwGrDrAOPoe+t0u3T6hg6TqiPQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOT_15kFNjHkUgk+bs6GwGrDrAOPoe+t0u3T6hg6TqiPQ@mail.gmail.com>
From: Hesham Almatary <hesham.almatary@cl.cam.ac.uk>
Date: Wed, 22 May 2019 10:26:44 +0100
X-Gmail-Original-Message-ID: <CA+wsVCDgogUXBDNiWm7R19fAyNw-3ybPiW4O8yA=Wt8oqyShFg@mail.gmail.com>
Message-ID: <CA+wsVCDgogUXBDNiWm7R19fAyNw-3ybPiW4O8yA=Wt8oqyShFg@mail.gmail.com>
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
X-Received-From: 131.111.8.131
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
X-List-Received-Date: Wed, 22 May 2019 09:27:26 -0000

On Tue, 21 May 2019 at 23:40, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, May 21, 2019 at 3:44 AM Hesham Almatary
> <Hesham.Almatary@cl.cam.ac.uk> wrote:
> >
> > The PMP should be checked when doing a page table walk, and report access
> > fault exception if the to-be-read PTE failed the PMP check.
> >
> > Suggested-by: Jonathan Behrens <fintelia@gmail.com>
> > Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
> > ---
> >  target/riscv/cpu.h        |  1 +
> >  target/riscv/cpu_helper.c | 10 +++++++++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index c17184f4e4..ab3ba3f15a 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -94,6 +94,7 @@ enum {
> >  #define PRIV_VERSION_1_09_1 0x00010901
> >  #define PRIV_VERSION_1_10_0 0x00011000
> >
> > +#define TRANSLATE_PMP_FAIL 2
> >  #define TRANSLATE_FAIL 1
> >  #define TRANSLATE_SUCCESS 0
> >  #define NB_MMU_MODES 4
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 7c7282c680..d0b0f9cf88 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -211,6 +211,12 @@ restart:
> >
> >          /* check that physical address of PTE is legal */
> >          target_ulong pte_addr = base + idx * ptesize;
> > +
> > +        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> > +            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
> > +            1 << MMU_DATA_LOAD)) {
>
> I see a problem here.
>
> pmp_hart_has_privs() checks permissions based on the current value of
> env->priv. This might not always be the correct permissions to check,
> we should instead use the current mode to check permissions.
>
That is not clear to me. Isn't env->priv the current privildge mode?
Could you please elaborate on what other cases this might not be the case?

> The best way to do this to me is to probably provide a privileged mode
> override to the function, can you add that?
>
> Alistair
>
> > +            return TRANSLATE_PMP_FAIL;
> > +        }
> >  #if defined(TARGET_RISCV32)
> >          target_ulong pte = ldl_phys(cs->as, pte_addr);
> >  #elif defined(TARGET_RISCV64)
> > @@ -405,8 +411,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> >          (ret == TRANSLATE_SUCCESS) &&
> >          !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
> > +        ret = TRANSLATE_PMP_FAIL;
> > +    }
> > +    if (ret == TRANSLATE_PMP_FAIL) {
> >          pmp_violation = true;
> > -        ret = TRANSLATE_FAIL;
> >      }
> >      if (ret == TRANSLATE_SUCCESS) {
> >          tlb_set_page(cs, address & TARGET_PAGE_MASK, pa & TARGET_PAGE_MASK,
> > --
> > 2.17.1
> >
> >

