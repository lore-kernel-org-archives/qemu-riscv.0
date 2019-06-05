Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYesa-0008V4-JN
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jun 2019 18:59:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hmka2@hermes.cam.ac.uk>) id 1hYesX-0008UM-QS
	for qemu-riscv@nongnu.org; Wed, 05 Jun 2019 18:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hmka2@hermes.cam.ac.uk>) id 1hYesW-00008i-4u
	for qemu-riscv@nongnu.org; Wed, 05 Jun 2019 18:59:33 -0400
Received: from ppsw-30.csi.cam.ac.uk ([131.111.8.130]:54092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hmka2@hermes.cam.ac.uk>)
	id 1hYesV-000059-KV; Wed, 05 Jun 2019 18:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
	s=20180806.ppsw;
	h=Sender:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rPqKVGqEkhf6Hz3PDm3Y8K3Dk6GsOLVDdx76QapZdkc=;
	b=C5S7E/k4sNDUpg7kIkqiHBv8EH
	uBY/ztciW5/yYH11Hapil52oxzeRZOh10BbT96uTK8mEy9JWezdIQVs5ZAFn6ZsZMPkPV3GRx9LXT
	kBroaIvn+yksGTX1L2MGkMfYWBPxh57LnL6zSZM6Ez3PswZiK25vfYtDyjXoxZRHxclk=; 
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from mail-lf1-f53.google.com ([209.85.167.53]:36713)
	by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:587)
	with esmtpsa (PLAIN:hmka2) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	id 1hYesR-000xMF-fu (Exim 4.92)
	(return-path <hmka2@hermes.cam.ac.uk>); Wed, 05 Jun 2019 23:59:28 +0100
Received: by mail-lf1-f53.google.com with SMTP id q26so103506lfc.3;
	Wed, 05 Jun 2019 15:59:27 -0700 (PDT)
X-Gm-Message-State: APjAAAVvYOIcuWUT9CFwE3f50O4iUDhS8IOWBL98++RncDsUAJlOvnO3
	MtFZkDXJvQrev68wvOx6r03/5oCdNvGAbjdPB88=
X-Google-Smtp-Source: APXvYqx5ZNY+rsCDtQxGQnlvDk6KNKij1JtOx54IMNemym3AfuNR9Lhqwhs4s2QNvc65ZVw6n6AkXg2U2A4UF+/ccOI=
X-Received: by 2002:a19:3f4b:: with SMTP id m72mr21167848lfa.91.1559775567487; 
	Wed, 05 Jun 2019 15:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190530135135.19715-1-Hesham.Almatary@cl.cam.ac.uk>
	<20190530135135.19715-4-Hesham.Almatary@cl.cam.ac.uk>
	<CAKmqyKNwec3HaNZ_=vsA1eYa3yjRWe8Q9ZaNcQ9AXZcGvbsQdw@mail.gmail.com>
In-Reply-To: <CAKmqyKNwec3HaNZ_=vsA1eYa3yjRWe8Q9ZaNcQ9AXZcGvbsQdw@mail.gmail.com>
From: Hesham Almatary <hesham.almatary@cl.cam.ac.uk>
Date: Thu, 6 Jun 2019 00:58:53 +0200
X-Gmail-Original-Message-ID: <CA+wsVCDMHpM0BCvoWVz1mFPGpjMRSGZ8boGhBF5p2VTAAJaGNw@mail.gmail.com>
Message-ID: <CA+wsVCDMHpM0BCvoWVz1mFPGpjMRSGZ8boGhBF5p2VTAAJaGNw@mail.gmail.com>
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
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCHv4 4/6] RISC-V: Check PMP
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
X-List-Received-Date: Wed, 05 Jun 2019 22:59:35 -0000

On Wed, 5 Jun 2019 at 23:07, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 30, 2019 at 6:52 AM Hesham Almatary
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
> > index 5a1cd7cf96..00bc4f1712 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -211,6 +211,12 @@ restart:
> >
> >          /* check that physical address of PTE is legal */
> >          target_ulong pte_addr = base + idx * ptesize;
> > +
> > +        if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> > +            !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
> > +            1 << MMU_DATA_LOAD, PRV_S)) {
>
> Shouldn't we be passing mode in here?
>
I actually thought this way at the start. But then I made it PRV_S for
intentionality; as in PTW (in the current master, without hypervisor
extensions) always goes under PMP protection in S-Mode.
This also aligns with Spike implementation here [1].

[1] https://github.com/riscv/riscv-isa-sim/blob/8ac902f6ff877e976af434bfe8fa8445930174a1/riscv/mmu.cc#L288


> Alistair
>
> > +            return TRANSLATE_PMP_FAIL;
> > +        }
> >  #if defined(TARGET_RISCV32)
> >          target_ulong pte = ldl_phys(cs->as, pte_addr);
> >  #elif defined(TARGET_RISCV64)
> > @@ -413,8 +419,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >          (ret == TRANSLATE_SUCCESS) &&
> >          !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
> >          mode)) {
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

