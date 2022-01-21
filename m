Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAj4y-0005EM-4V
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 20:51:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nAj4v-0005Cv-GN; Thu, 20 Jan 2022 20:51:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nAj4s-0004EW-Dz; Thu, 20 Jan 2022 20:51:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F53BB81E31;
 Fri, 21 Jan 2022 01:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C257CC340E2;
 Fri, 21 Jan 2022 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642729854;
 bh=QVQQLxNi8jrf5Q/JSbUfAxgpy8O2tDOpA1fPOBJnuJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H1xF7UGLl6Yu4MSoae5OmqlFAsTXyC9aDDw7vIhApbI+YZ0ddNyOP75yx19a97hV6
 xybWuisGWvzQ1TsMXd5vPu5T0rpzjEYl0FsSyT2hoqffbfN9xplCgKdP0bkCLMpDaj
 AE756yu6gkSvct+PNJgwmhEf6bHhOL12gLEu79vqVkraBSVF5TCryxAu4l1at0d4a2
 3gGgSrh3uvyenf/tUwMRKWiWdHT6SYshBoxQx0rcLKlNUc/a9Mrik5P2H/KZxrAPx8
 ng5hBB/ukOM5/SbXaGeVi9aw9GlVs1y85Vr20XGZTV51/YHcL9l8di/KbJ90CiNa3Z
 VaJ050GVGHTrg==
Received: by mail-ua1-f47.google.com with SMTP id l1so12420944uap.8;
 Thu, 20 Jan 2022 17:50:54 -0800 (PST)
X-Gm-Message-State: AOAM531tIfQHPC7XprejCCvzpqQvp0E2ewN89e1hu8MTUtHG/NiAQ1Q8
 uHMI/GfoH56XEglJnDCKfHlpqyBvts4KpfduhaA=
X-Google-Smtp-Source: ABdhPJyZJ2nikwV5+3etmxIFTQRVKMtWAdexDK7qGBMwm8Xnl4qEGk9fKeNR7+pqnEEuFLUcjBdb5hPJlJL+jHs+lwo=
X-Received: by 2002:a9f:2c48:: with SMTP id s8mr953241uaj.58.1642729853804;
 Thu, 20 Jan 2022 17:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAKmqyKNajL8kJL4HExN8CDCYwrVcUx4dcnn77wY5zCZu9M6SGg@mail.gmail.com>
 <CAJF2gTRV55B+9AaFHDXW9R7cvEXO+R3dFs6RVRGnkKwZX5fCLg@mail.gmail.com>
 <4f22be6c-98ae-34fa-f334-8778ef703964@c-sky.com>
In-Reply-To: <4f22be6c-98ae-34fa-f334-8778ef703964@c-sky.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 09:50:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTthdmLhv0nafxFnfakAxwEAWMe7_sbmjtGPMSAZTiY_Q@mail.gmail.com>
Message-ID: <CAJF2gTTthdmLhv0nafxFnfakAxwEAWMe7_sbmjtGPMSAZTiY_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <alistair23@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75; envelope-from=guoren@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
X-List-Received-Date: Fri, 21 Jan 2022 01:51:02 -0000

On Fri, Jan 21, 2022 at 6:48 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2022/1/20 =E4=B8=8B=E5=8D=889:47, Guo Ren wrote:
> > Hi Alistair and Anup,
> >
> > On Tue, Jan 18, 2022 at 12:56 PM Alistair Francis <alistair23@gmail.com=
> wrote:
> >> On Tue, Jan 18, 2022 at 1:31 PM Anup Patel <anup@brainfault.org> wrote=
:
> >>> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrot=
e:
> >>>> From: Guo Ren <ren_guo@c-sky.com>
> >>>>
> >>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> >>>> need to ignore them. They cannot be a part of ppn.
> >>>>
> >>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architec=
ture
> >>>>     4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >>>>     4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >>>>
> >>>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbm=
t-diff.pdf
> >>>>
> >>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> >>>> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> >>>> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> >>>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> >>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>>> ---
> >>>>   target/riscv/cpu_bits.h   | 7 +++++++
> >>>>   target/riscv/cpu_helper.c | 2 +-
> >>>>   2 files changed, 8 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >>>> index 5a6d49aa64..282cd8eecd 100644
> >>>> --- a/target/riscv/cpu_bits.h
> >>>> +++ b/target/riscv/cpu_bits.h
> >>>> @@ -490,6 +490,13 @@ typedef enum {
> >>>>   /* Page table PPN shift amount */
> >>>>   #define PTE_PPN_SHIFT       10
> >>>>
> >>>> +/* Page table PPN mask */
> >>>> +#if defined(TARGET_RISCV32)
> >>>> +#define PTE_PPN_MASK        0xffffffffUL
> >>>> +#elif defined(TARGET_RISCV64)
> >>>> +#define PTE_PPN_MASK        0x3fffffffffffffULL
> >>>> +#endif
> >>>> +
> >>> Going forward we should avoid using target specific "#if"
> >>> so that we can use the same qemu-system-riscv64 for both
> >>> RV32 and RV64.
> >>>
> >>>>   /* Leaf page shift amount */
> >>>>   #define PGSHIFT             12
> >>>>
> >>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >>>> index 434a83e66a..26608ddf1c 100644
> >>>> --- a/target/riscv/cpu_helper.c
> >>>> +++ b/target/riscv/cpu_helper.c
> >>>> @@ -619,7 +619,7 @@ restart:
> >>>>               return TRANSLATE_FAIL;
> >>>>           }
> >>>>
> >>>> -        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
> >>>> +        hwaddr ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> >>> Rather than using "#if", please use "xlen" comparison to extract
> >>> PPN correctly from PTE.
> >> This will need to be dynamic based on get_xl()
> >>
> >> It does look like we should check the existence of the extensions thou=
gh:
> >>
> >> "Bit 63 is reserved for use by the Svnapot extension in Chapter 5. If
> >> Svnapot is not implemented, bit 63 remains reserved and must be zeroed
> >> by software for forward compatibility, or else a page-fault exception
> >> is raised. Bits 62=E2=80=9361 are reserved for use by the Svpbmt exten=
sion in
> >> Chapter 6. If Svpbmt is not implemented, bits 62=E2=80=9361 remain res=
erved
> >> and must be zeroed by software for forward compatibility, or else a
> >> page-fault exception is raised."
> > How about:
> >
> > +       RISCVCPU *cpu =3D env_archcpu(env);
> > +       hwaddr ppn;
> > +
> > +       if (get_field(env->mstatus, MSTATUS64_SXL) =3D=3D MXL_RV32) {
> Use riscv_cpu_mxl currently. Or define a new function riscv_cpu_sxl in cp=
u.h
I perfer riscv_cpu_sxl.

> > +               ppn =3D pte >> PTE_PPN_SHIFT;
> > +       } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> > +               ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > +       } else {
> > +               ppn =3D pte >> PTE_PPN_SHIFT;
> > +               if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT)
> Just if (pte & ~PTE_PPN_MASK)
Why? low bits in pte is correct. R W X A D
> > +                       return TRANSLATE_FAIL;
> > +       }
>
> Otherwise looks good to me.
>
> Thanks,
> Zhiwei
>
> >> Alistair
> >>
> >>> Regards,
> >>> Anup
> >>>
> >>>>           if (!(pte & PTE_V)) {
> >>>>               /* Invalid PTE */
> >>>> --
> >>>> 2.17.1
> >>>>
> >



--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

