Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcCne-0003Xg-Hf
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 16:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mcCnd-0003XI-8v; Sun, 17 Oct 2021 16:30:29 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mcCnZ-0004io-Bl; Sun, 17 Oct 2021 16:30:29 -0400
Received: by mail-ed1-x52a.google.com with SMTP id 5so32059957edw.7;
 Sun, 17 Oct 2021 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X4kP7s6mdy/FzNJ0AJ2FN8zvt28aiFrAbDIRTf7KVdU=;
 b=O3KW/GSxIsfF42KuWh9ngweQ2Do06iyxUIBqYldq7HUNJob4j640t2reESw4zvouqH
 GdD+pQ/jswQBcqwAZnu0x+MXUH5Wh5/Ft8ptT7cybrsFlWOgrcgu5ks/hniXi54pNX6P
 rEPtqBu9aa3ehuFBPXtOFiOtHFqAe2s+jiM6EoeDwVejc0NOFaeW4A9gACMZFEuqVwAd
 WuCN9/ziMqT7PtzVQ/BQWU3iuVoGap2VenZdP8cK96MKrQL5Y35wDPdh04lBGnyDTBrm
 IDkZZp21nGWKLM50jUDXnSlLLflKFjeFttiLRxTBFshmBeiQZH1VRysDJHqSbcs6hrTK
 wJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X4kP7s6mdy/FzNJ0AJ2FN8zvt28aiFrAbDIRTf7KVdU=;
 b=jaeRSF1z16eLeXAZezbwByx82WfzmXdnrM87q55QfetMccqLZQcD9RYShL0/l5bDxU
 fkLzU+5s3ymYB9zREgCcfHDMBvmg45i0ZAarC/axB0eaUGXBxAJdwlBsNDhNfR9GG4+Y
 IAnj77NtrONe1EdI6F1JbbnBZB76tYkfwltE7YgCMWs+WzpXrV3RKkHFS9YKVFyzPoss
 JC2Hq3oNJXRvbcj+2Ounm8+/9X853Mi80ClB5Dn05QEBpHGEnnGEgrERruniyYZCAdXV
 Xz6EOtu/59SQcDC2HAIakK3XkOqiz4xd3GIRaFLhGwhDryp5pSNOCg/Md9FYr/yYRb/i
 6u7Q==
X-Gm-Message-State: AOAM53130i32nNUq+KmS2pbkUCNpe267nUNf0hz2tS1eY5pIkzT531n6
 tDDy55PnmwIHohSyY8yR0mWyYRPxh6bZd0oHw/U=
X-Google-Smtp-Source: ABdhPJxeTtOhTCQU/Wf34mTmfo3w9cnNboR9/pnkDoy5H4lLbmQyINfTLH8hRNsEKdFxG8iml0K57hRGv43EHNB6P4s=
X-Received: by 2002:a50:e041:: with SMTP id g1mr38519775edl.4.1634502618308;
 Sun, 17 Oct 2021 13:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210522154429.361235-1-josemartins90@gmail.com>
 <CAKmqyKNSG4ACk-QQ9_0XzAXWr_NPE3sijxbs+6Kz3J=N_k+LMw@mail.gmail.com>
 <2e3c4d2f-475f-4d02-6be5-a89628cd6815@c-sky.com>
 <CAC41xo1ftM_WcjNOio2ii-BtqtDh6RTEvsmwO69GU6taOCzYRA@mail.gmail.com>
In-Reply-To: <CAC41xo1ftM_WcjNOio2ii-BtqtDh6RTEvsmwO69GU6taOCzYRA@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Sun, 17 Oct 2021 21:30:07 +0100
Message-ID: <CAC41xo12s+uHEyLkc6vO07iBAC84o6aHBFFdqxDm3NQjBYjuAw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 17 Oct 2021 20:30:29 -0000

Hello Zhiwei and Alistair,

I noticed this patch did not make it upstream, contrarily to a couple
other patches I submitted around the same time. Is there something
else needed from my side to push this forward?

Best,
Jos=C3=A9

On Wed, 2 Jun 2021 at 20:14, Jose Martins <josemartins90@gmail.com> wrote:
>
> Hello Zhiwei and Alistair,
>
> I went for a middle-ground solution. I divided the patch into two: one
> fixes the vs interrupt forwarding to the hypervisor, the other removes
> the unnecessary force exception stuff. I just submitted the patch
> series. I hope it's ok with you.
>
> Jos=C3=A9
>
> On Fri, 28 May 2021 at 01:36, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >
> >
> > On 5/28/21 6:34 AM, Alistair Francis wrote:
> > > On Sun, May 23, 2021 at 1:45 AM Jose Martins <josemartins90@gmail.com=
> wrote:
> > >> VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode whe=
n
> > >> not delegated in hideleg (which was not being taken into account). T=
his
> > >> was mainly because hs level sie was not always considered enabled wh=
en
> > >> it should. The spec states that "Interrupts for higher-privilege mod=
es,
> > >> y>x, are always globally enabled regardless of the setting of the gl=
obal
> > >> yIE bit for the higher-privilege mode." and also "For purposes of
> > >> interrupt global enables, HS-mode is considered more privileged than
> > >> VS-mode, and VS-mode is considered more privileged than VU-mode".
> > >>
> > >> These interrupts should be treated the same as any other kind of
> > >> exception. Therefore, there is no need to "force an hs exception" as=
 the
> > >> current privilege level, the state of the global ie and of the
> > >> delegation registers should be enough to route the interrupt to the
> > >> appropriate privilege level in riscv_cpu_do_interrupt. Also, these
> > >> interrupts never target m-mode, which is  guaranteed by the hardwiri=
ng
> > >> of the corresponding bits in mideleg. The same is true for synchrono=
us
> > >> exceptions, specifically, guest page faults which must be hardwired =
in
> > >> to zero hedeleg. As such the hs_force_except mechanism can be remove=
d.
> > >>
> > >> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> > > This looks right to me, but this was one of the most confusing parts
> > > of the implementation. I also don't think the patch is too long as
> > > it's mostly just deleting stuff.
> > >
> > > I don't fully understand your concerns Zhiwei, do you mind stating th=
em again?
> >
> > Hi Alistair,
> >
> > My main concern is the commit message is to complex.
> >
> > I also have a question why force hs exception in current code.
> > Then we can give a brief commit message.
> >
> > Best Regards,
> > Zhiwei
> >
> > >
> > > Alistair
> > >
> > >> ---
> > >> This version of the patch also removes the uneeded hs_force_except
> > >> functions, variables and macro.
> > >>
> > >>   target/riscv/cpu.h        |  2 --
> > >>   target/riscv/cpu_bits.h   |  6 -----
> > >>   target/riscv/cpu_helper.c | 54 +++++++----------------------------=
----
> > >>   3 files changed, 9 insertions(+), 53 deletions(-)
> > >>
> > >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > >> index 0a33d387ba..a30a64241a 100644
> > >> --- a/target/riscv/cpu.h
> > >> +++ b/target/riscv/cpu.h
> > >> @@ -337,8 +337,6 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int =
interrupt_request);
> > >>   bool riscv_cpu_fp_enabled(CPURISCVState *env);
> > >>   bool riscv_cpu_virt_enabled(CPURISCVState *env);
> > >>   void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> > >> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
> > >> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
> > >>   bool riscv_cpu_two_stage_lookup(int mmu_idx);
> > >>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
> > >>   hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> > >> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > >> index caf4599207..7322f54157 100644
> > >> --- a/target/riscv/cpu_bits.h
> > >> +++ b/target/riscv/cpu_bits.h
> > >> @@ -462,12 +462,6 @@
> > >>
> > >>   /* Virtulisation Register Fields */
> > >>   #define VIRT_ONOFF          1
> > >> -/* This is used to save state for when we take an exception. If thi=
s is set
> > >> - * that means that we want to force a HS level exception (no matter=
 what the
> > >> - * delegation is set to). This will occur for things such as a seco=
nd level
> > >> - * page table fault.
> > >> - */
> > >> -#define FORCE_HS_EXCEP      2
> > >>
> > >>   /* RV32 satp CSR field masks */
> > >>   #define SATP32_MODE         0x80000000
> > >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > >> index 21c54ef561..babe3d844b 100644
> > >> --- a/target/riscv/cpu_helper.c
> > >> +++ b/target/riscv/cpu_helper.c
> > >> @@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool=
 ifetch)
> > >>   #ifndef CONFIG_USER_ONLY
> > >>   static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> > >>   {
> > >> -    target_ulong irqs;
> > >> +    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
> > >>
> > >>       target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_M=
IE);
> > >>       target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_S=
IE);
> > >> -    target_ulong hs_mstatus_sie =3D get_field(env->mstatus_hs, MSTA=
TUS_SIE);
> > >>
> > >> -    target_ulong pending =3D env->mip & env->mie &
> > >> -                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)=
;
> > >> -    target_ulong vspending =3D (env->mip & env->mie &
> > >> -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
> > >> +    target_ulong pending =3D env->mip & env->mie;
> > >>
> > >>       target_ulong mie    =3D env->priv < PRV_M ||
> > >>                             (env->priv =3D=3D PRV_M && mstatus_mie);
> > >>       target_ulong sie    =3D env->priv < PRV_S ||
> > >>                             (env->priv =3D=3D PRV_S && mstatus_sie);
> > >> -    target_ulong hs_sie =3D env->priv < PRV_S ||
> > >> -                          (env->priv =3D=3D PRV_S && hs_mstatus_sie=
);
> > >> +    target_ulong hsie   =3D virt_enabled || sie;
> > >> +    target_ulong vsie   =3D virt_enabled && sie;
> > >>
> > >> -    if (riscv_cpu_virt_enabled(env)) {
> > >> -        target_ulong pending_hs_irq =3D pending & -hs_sie;
> > >> -
> > >> -        if (pending_hs_irq) {
> > >> -            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> > >> -            return ctz64(pending_hs_irq);
> > >> -        }
> > >> -
> > >> -        pending =3D vspending;
> > >> -    }
> > >> -
> > >> -    irqs =3D (pending & ~env->mideleg & -mie) | (pending &  env->mi=
deleg & -sie);
> > >> +    target_ulong irqs =3D
> > >> +            (pending & ~env->mideleg & -mie) |
> > >> +            (pending &  env->mideleg & ~env->hideleg & -hsie) |
> > >> +            (pending &  env->mideleg &  env->hideleg & -vsie);
> > >>
> > >>       if (irqs) {
> > >>           return ctz64(irqs); /* since non-zero */
> > >> @@ -190,24 +178,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *=
env, bool enable)
> > >>       env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
> > >>   }
> > >>
> > >> -bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
> > >> -{
> > >> -    if (!riscv_has_ext(env, RVH)) {
> > >> -        return false;
> > >> -    }
> > >> -
> > >> -    return get_field(env->virt, FORCE_HS_EXCEP);
> > >> -}
> > >> -
> > >> -void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
> > >> -{
> > >> -    if (!riscv_has_ext(env, RVH)) {
> > >> -        return;
> > >> -    }
> > >> -
> > >> -    env->virt =3D set_field(env->virt, FORCE_HS_EXCEP, enable);
> > >> -}
> > >> -
> > >>   bool riscv_cpu_two_stage_lookup(int mmu_idx)
> > >>   {
> > >>       return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> > >> @@ -896,7 +866,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >>
> > >>       RISCVCPU *cpu =3D RISCV_CPU(cs);
> > >>       CPURISCVState *env =3D &cpu->env;
> > >> -    bool force_hs_execp =3D riscv_cpu_force_hs_excep_enabled(env);
> > >>       uint64_t s;
> > >>
> > >>       /* cs->exception is 32-bits wide unlike mcause which is XLEN-b=
its wide
> > >> @@ -925,8 +894,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >>           case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> > >>           case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
> > >>           case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> > >> -            force_hs_execp =3D true;
> > >> -            /* fallthrough */
> > >>           case RISCV_EXCP_INST_ADDR_MIS:
> > >>           case RISCV_EXCP_INST_ACCESS_FAULT:
> > >>           case RISCV_EXCP_LOAD_ADDR_MIS:
> > >> @@ -985,8 +952,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >>                   env->hstatus =3D set_field(env->hstatus, HSTATUS_G=
VA, 0);
> > >>               }
> > >>
> > >> -            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) &=
 1) &&
> > >> -                !force_hs_execp) {
> > >> +            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) &=
 1)) {
> > >>                   /* Trap to VS mode */
> > >>                   /*
> > >>                    * See if we need to adjust cause. Yes if its VS m=
ode interrupt
> > >> @@ -1008,7 +974,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >>                   htval =3D env->guest_phys_fault_addr;
> > >>
> > >>                   riscv_cpu_set_virt_enabled(env, 0);
> > >> -                riscv_cpu_set_force_hs_excep(env, 0);
> > >>               } else {
> > >>                   /* Trap into HS mode */
> > >>                   env->hstatus =3D set_field(env->hstatus, HSTATUS_S=
PV, false);
> > >> @@ -1044,7 +1009,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >>
> > >>               /* Trapping to M mode, virt is disabled */
> > >>               riscv_cpu_set_virt_enabled(env, 0);
> > >> -            riscv_cpu_set_force_hs_excep(env, 0);
> > >>           }
> > >>
> > >>           s =3D env->mstatus;
> > >> --
> > >> 2.30.2
> > >>
> > >>

