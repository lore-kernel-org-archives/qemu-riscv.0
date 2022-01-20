Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAXo5-0006Ab-A6
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 08:48:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nAXo1-00067P-Qq; Thu, 20 Jan 2022 08:48:50 -0500
Received: from [2604:1380:4601:e00::1] (port=47634 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nAXnT-0005fI-AG; Thu, 20 Jan 2022 08:48:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A3C7B81CEC;
 Thu, 20 Jan 2022 13:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF7FC340E9;
 Thu, 20 Jan 2022 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642686481;
 bh=oK0CYQZnYcHey/+ETgqMPTGSVAOfiMBVqluGWfjrz7o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hWEf+8AlvChjyP9LLxFIkpeK8O8rzFMxbDo/DAjWQbKKnCeFEpyvuHgj8msf6Qnxz
 0QFz76ePiLqa5Xk0O7jFeM5RXJIxSUXq16zgBZ1Am7VFKWHsLSFugBQ9o6Rf3MlmNm
 G/J3Ph9cmAHsYF7aHw3UH4uYSmTDC1PUDvsik9zeHodro+80aWo5aIIWzFXfm+nxTx
 hAcHPKTewA1FmgtzP/oU66i6vdruOVkN+vNIq8j6XMqL/Ria4hWVkp+XwOrfrkm/XF
 TwSBeTT/X2owO3CYWi0G+6m+hVlQ7meE8i0SG24mbH9npl0g5x3TxWd1K4sJBm9y0a
 5nLzdcQScn2qQ==
Received: by mail-ua1-f50.google.com with SMTP id c36so10851835uae.13;
 Thu, 20 Jan 2022 05:48:01 -0800 (PST)
X-Gm-Message-State: AOAM531Bqd0pEK6N6icSzbudhRvm3hmlKhqaRkEIMWsZHI5FoGqWx7KZ
 marYKirfZwxuMhvc8SU4RTLYKPGajdUyrDXFqrY=
X-Google-Smtp-Source: ABdhPJzYW6wciMIIpevCJuZQfn/tPCFpbVY9GmzzMdt15N15zOTbqxBJk9BigM5jdUDuNuYCGheK2WINOH9nRMThxQg=
X-Received: by 2002:ab0:728c:: with SMTP id w12mr13901543uao.108.1642686480296; 
 Thu, 20 Jan 2022 05:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAKmqyKNajL8kJL4HExN8CDCYwrVcUx4dcnn77wY5zCZu9M6SGg@mail.gmail.com>
In-Reply-To: <CAKmqyKNajL8kJL4HExN8CDCYwrVcUx4dcnn77wY5zCZu9M6SGg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:47:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRV55B+9AaFHDXW9R7cvEXO+R3dFs6RVRGnkKwZX5fCLg@mail.gmail.com>
Message-ID: <CAJF2gTRV55B+9AaFHDXW9R7cvEXO+R3dFs6RVRGnkKwZX5fCLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Alistair Francis <alistair23@gmail.com>, Anup Patel <anup@brainfault.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=guoren@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
X-List-Received-Date: Thu, 20 Jan 2022 13:48:51 -0000

Hi Alistair and Anup,

On Tue, Jan 18, 2022 at 12:56 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> On Tue, Jan 18, 2022 at 1:31 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > >
> > > From: Guo Ren <ren_guo@c-sky.com>
> > >
> > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > need to ignore them. They cannot be a part of ppn.
> > >
> > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architect=
ure
> > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > >
> > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt=
-diff.pdf
> > >
> > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu_bits.h   | 7 +++++++
> > >  target/riscv/cpu_helper.c | 2 +-
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 5a6d49aa64..282cd8eecd 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -490,6 +490,13 @@ typedef enum {
> > >  /* Page table PPN shift amount */
> > >  #define PTE_PPN_SHIFT       10
> > >
> > > +/* Page table PPN mask */
> > > +#if defined(TARGET_RISCV32)
> > > +#define PTE_PPN_MASK        0xffffffffUL
> > > +#elif defined(TARGET_RISCV64)
> > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > +#endif
> > > +
> >
> > Going forward we should avoid using target specific "#if"
> > so that we can use the same qemu-system-riscv64 for both
> > RV32 and RV64.
> >
> > >  /* Leaf page shift amount */
> > >  #define PGSHIFT             12
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 434a83e66a..26608ddf1c 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -619,7 +619,7 @@ restart:
> > >              return TRANSLATE_FAIL;
> > >          }
> > >
> > > -        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
> > > +        hwaddr ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> >
> > Rather than using "#if", please use "xlen" comparison to extract
> > PPN correctly from PTE.
>
> This will need to be dynamic based on get_xl()
>
> It does look like we should check the existence of the extensions though:
>
> "Bit 63 is reserved for use by the Svnapot extension in Chapter 5. If
> Svnapot is not implemented, bit 63 remains reserved and must be zeroed
> by software for forward compatibility, or else a page-fault exception
> is raised. Bits 62=E2=80=9361 are reserved for use by the Svpbmt extensio=
n in
> Chapter 6. If Svpbmt is not implemented, bits 62=E2=80=9361 remain reserv=
ed
> and must be zeroed by software for forward compatibility, or else a
> page-fault exception is raised."
How about:

+       RISCVCPU *cpu =3D env_archcpu(env);
+       hwaddr ppn;
+
+       if (get_field(env->mstatus, MSTATUS64_SXL) =3D=3D MXL_RV32) {
+               ppn =3D pte >> PTE_PPN_SHIFT;
+       } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
+               ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
+       } else {
+               ppn =3D pte >> PTE_PPN_SHIFT;
+               if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT)
+                       return TRANSLATE_FAIL;
+       }

>
> Alistair
>
> >
> > Regards,
> > Anup
> >
> > >
> > >          if (!(pte & PTE_V)) {
> > >              /* Invalid PTE */
> > > --
> > > 2.17.1
> > >
> >
>


--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

