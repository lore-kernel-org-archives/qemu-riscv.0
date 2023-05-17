Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F69C77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 04:49:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz965-0002yB-NQ; Wed, 17 May 2023 00:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz95k-0002wV-MP; Wed, 17 May 2023 00:48:49 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz95i-0006Ii-Io; Wed, 17 May 2023 00:48:48 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-434834245c3so66959137.0; 
 Tue, 16 May 2023 21:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684298925; x=1686890925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTedCb9GN0ilIDSg1SE7RFP0WVwa0UL8k4wla1Yqkis=;
 b=C/zFnXgc6wmcpr150mJJNyu6k00qIAylwYOaDiCZ6MYUf08Jx3d96x4/93rN09dgfb
 e4zsF6rETgKfHWeQpDu1NHne/jQJYp0zXFf6hL7GG0o6t6sU4CmAOeNXTwElzjupbQnm
 vP/y5YzXMpO15i1XEj9DgSQGHP/Y1Jd1cvVUtfuul5n0vRKFBT/Oa0GoRuXBOegZCUJP
 CtFaqVUceTvE3/BCbTt+gvzOtAgSPbssfgzP4ZkseQ2C4IzkOp5yBg0RQ82mF/JJgoM5
 4n4ioiPl+eFFH4lZxuKWOT31CwSR7UQi7MzmaFLxwkoy59sxmJYiDj2AbR5toNew2s/s
 UBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684298925; x=1686890925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTedCb9GN0ilIDSg1SE7RFP0WVwa0UL8k4wla1Yqkis=;
 b=GQPT5Ww/MyTMOOwymY6bLzxD3ccEKv4jVOuZ+mlh+J6Sc4Isc65qwVp5BbWgq8/e7c
 vQoc2eOxV6v9nY2Gwbv0rBw44q/gwU7BfQOaV8BERBxZp53GSYULO2S7d+JNnN0ciOIk
 NMbGCYltIyP/ClakhMMFUEASBdCHTBiA8Unm/uYXmPhtQgGJDXLuhZP81TxI0jP8jJVu
 JErfUaaDy31ynosi31DKXlv0SAsHvSHtGMXKsvfhFBA1z6SbCB9MqEUO1ATIonery5Uy
 aK0/7BX0U4FSBq6esyW7psKRW7fLLOSMgjjQMtVBRqyI4EtUSRDhzsws5TiXmKKkMKV+
 c1fA==
X-Gm-Message-State: AC+VfDzMSXVrHdauLj790Stk1bPOGqXY4n9+Fv6Z6BG7ft7eUdxC8T24
 HDX+YiGWeYhv9u5qE90ysx3m82qNP8CNNk0juVw=
X-Google-Smtp-Source: ACHHUZ7d75WYUlaL1NWjQDaRiaxB8LXc9SEq4TBR2uCmzZRWFtHFVySMky/1tQPngnDyqt7jQBKQ0t7u5y8TlRZVb4I=
X-Received: by 2002:a67:e3c3:0:b0:42c:9282:ada2 with SMTP id
 k3-20020a67e3c3000000b0042c9282ada2mr15559916vsm.17.1684298924893; Tue, 16
 May 2023 21:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
 <20230421132727.121462-12-dbarboza@ventanamicro.com>
 <CAKmqyKPcEvWXb7m4uRxBJoVzNmjoX-Oo=H+GNO_c4PY0HOJNpQ@mail.gmail.com>
 <0fb9fc04-49a4-fa32-3bf4-3a2cb7a96c4b@ventanamicro.com>
In-Reply-To: <0fb9fc04-49a4-fa32-3bf4-3a2cb7a96c4b@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 14:48:18 +1000
Message-ID: <CAKmqyKOaz8dUt5+LBgr_ewO+s3x2XrtVGvGMM5WwyLVzMMzBQA@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] target/riscv: rework write_misa()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, May 8, 2023 at 8:29=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 5/7/23 20:25, Alistair Francis wrote:
> > On Fri, Apr 21, 2023 at 11:29=E2=80=AFPM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> write_misa() must use as much common logic as possible. We want to ope=
n
> >> code just the bits that are exclusive to the CSR write operation and T=
CG
> >> internals.
> >>
> >> Our validation is done with riscv_cpu_validate_set_extensions(), but w=
e
> >> need a small tweak first. When enabling RVG we're doing:
> >>
> >>          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> >>          env->misa_ext_mask =3D env->misa_ext;
> >>
> >> This works fine for realize() time but this can potentially overwrite
> >> env->misa_ext_mask if we reutilize the function for write_misa().
> >>
> >> Instead of doing misa_ext_mask =3D misa_ext, sum up the RVG extensions=
 in
> >> misa_ext_mask as well. This won't change realize() time behavior
> >> (misa_ext_mask will be =3D=3D misa_ext) and will ensure that write_mis=
a()
> >> won't change misa_ext_mask by accident.
> >>
> >> After that, rewrite write_misa() to work as follows:
> >>
> >> - mask the write using misa_ext_mask to avoid enabling unsupported
> >>    extensions;
> >>
> >> - suppress RVC if the next insn isn't aligned;
> >>
> >> - disable RVG if any of RVG dependencies are being disabled by the use=
r;
> >>
> >> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
> >>    error, rollback env->misa_ext to its original value;
> >>
> >> - handle RVF and MSTATUS_FS and continue as usual.
> >>
> >> Let's keep write_misa() as experimental for now until this logic gains
> >> enough mileage.
> >>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> ---
> >>   target/riscv/cpu.c |  4 ++--
> >>   target/riscv/cpu.h |  1 +
> >>   target/riscv/csr.c | 47 ++++++++++++++++++++------------------------=
--
> >>   3 files changed, 23 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 7d407321aa..4fa720a39d 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *=
cpu, Error **errp)
> >>    * Check consistency between chosen extensions while setting
> >>    * cpu->cfg accordingly.
> >>    */
> >> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **=
errp)
> >> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> >>   {
> >>       CPURISCVState *env =3D &cpu->env;
> >>       Error *local_err =3D NULL;
> >> @@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISC=
VCPU *cpu, Error **errp)
> >>           cpu->cfg.ext_ifencei =3D true;
> >>
> >>           env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> >> -        env->misa_ext_mask =3D env->misa_ext;
> >> +        env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
> >>       }
> >>
> >>       if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 15423585d0..1f39edc687 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr addres=
s, int size,
> >>                           bool probe, uintptr_t retaddr);
> >>   char *riscv_isa_string(RISCVCPU *cpu);
> >>   void riscv_cpu_list(void);
> >> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
> >>
> >>   #define cpu_list riscv_cpu_list
> >>   #define cpu_mmu_index riscv_cpu_mmu_index
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 4451bd1263..4a3c57ea6f 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState =
*env, int csrno,
> >>   static RISCVException write_misa(CPURISCVState *env, int csrno,
> >>                                    target_ulong val)
> >>   {
> >> +    RISCVCPU *cpu =3D env_archcpu(env);
> >> +    uint32_t orig_misa_ext =3D env->misa_ext;
> >> +    Error *local_err =3D NULL;
> >> +
> >>       if (!riscv_cpu_cfg(env)->misa_w) {
> >>           /* drop write to misa */
> >>           return RISCV_EXCP_NONE;
> >>       }
> >>
> >> -    /* 'I' or 'E' must be present */
> >> -    if (!(val & (RVI | RVE))) {
> >> -        /* It is not, drop write to misa */
> >> -        return RISCV_EXCP_NONE;
> >> -    }
> >> -
> >> -    /* 'E' excludes all other extensions */
> >> -    if (val & RVE) {
> >> -        /*
> >> -         * when we support 'E' we can do "val =3D RVE;" however
> >> -         * for now we just drop writes if 'E' is present.
> >> -         */
> >> -        return RISCV_EXCP_NONE;
> >> -    }
> >> -
> >> -    /*
> >> -     * misa.MXL writes are not supported by QEMU.
> >> -     * Drop writes to those bits.
> >> -     */
> >> -
> >>       /* Mask extensions that are not supported by this hart */
> >>       val &=3D env->misa_ext_mask;
> >>
> >> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> >> -    if ((val & RVD) && !(val & RVF)) {
> >> -        val &=3D ~RVD;
> >> -    }
> >> -
> >>       /*
> >>        * Suppress 'C' if next instruction is not aligned
> >>        * TODO: this should check next_pc
> >> @@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState=
 *env, int csrno,
> >>           val &=3D ~RVC;
> >>       }
> >>
> >> +    /* Disable RVG if any of its dependencies are disabled */
> >> +    if (!(val & RVI && val & RVM && val & RVA &&
> >> +          val & RVF && val & RVD)) {
> >> +        val &=3D ~RVG;
> >> +    }
> >> +
> >>       /* If nothing changed, do nothing. */
> >>       if (val =3D=3D env->misa_ext) {
> >>           return RISCV_EXCP_NONE;
> >>       }
> >>
> >> -    if (!(val & RVF)) {
> >> +    env->misa_ext =3D val;
> >> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> >> +    if (local_err !=3D NULL) {
> >> +        /* Rollback on validation error */
> >> +        env->misa_ext =3D orig_misa_ext;
> >
> > I don't think this is right though. The spec even states:
> >
> > " An attempt to write an unsupported combination causes those bits to
> > be set to some supported combination."
>
> Rolling back to the previous state (which means do nothing) is a supporte=
d
> combination. I don't think the spec forbids what we're doing here.

It doesn't forbid it, but it also doesn't really encourage it.

>
>
> >
> > So we should try to follow what the guest requested as closely as we
> > can, instead of just rolling back.
>
> Let's say we have this:
>
> RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVV
>
> And the userspace wants to write this (clear RVF):
>
> RVI | RVM | RVA | RVD | RVC | RVU | RVV
>
>
> What should we do in this case? Removing RVF would imply removing RVD and=
 RVV, so
> that's one alternative. Another alternative is consider that the user sho=
uld
> clear all bits of RVV explicitly, so we ignore the RVF clear and keep it =
as it
> is (which we're already doing in this patch).

In this case we should keep RVF enabled, I agree.

What I'm thinking of, is what happens if we have:

RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVV

and the user writes (clears RVF and RVV)

RVI | RVM | RVA | RVD | RVC | RVU

We can't disable RVF, because RVD requires it, but we can disable RVV.
So we should end up with just RVV disabled

RVI | RVM | RVA | RVF | RVD | RVC | RVU

From my interpretation of the spec, that's what we should be supporting.

>
> Note that both are right depending on the user intention. And this is why=
 I don't
> believe that follow what the user attempted to do, or "follow what the gu=
est as
> closely as we can" is viable.
>
> An alternative, instead of keeping the original misa_ext value, is to do
> misa_ext =3D misa_ext_mask. This would mean "in case of a failed validati=
on,
> since we don't know what the user tried to do, re-enable everything".

I think that's even worse :)

>
> Anything other than keeping the existing misa_ext, like this patch is alr=
eady
> doing, or setting misa_ext to misa_ext_mask, will demand more code and as=
sumptions
> based on what we can't control (user intentions).

Hmm... That's fair. It does make the process more complex, although we
are already checking if the combination is valid.

Ok, how about we at least report a guest error if the combination is
invalid and we roll back. Then we can go ahead with the patch.

Alistair

>
>
> Thanks,
>
>
> Daniel
>
>
> >
> > Alistair
> >
> >> +
> >> +        return RISCV_EXCP_NONE;
> >> +    }
> >> +
> >> +    if (!(env->misa_ext & RVF)) {
> >>           env->mstatus &=3D ~MSTATUS_FS;
> >>       }
> >>
> >>       /* flush translation cache */
> >>       tb_flush(env_cpu(env));
> >> -    env->misa_ext =3D val;
> >>       env->xl =3D riscv_cpu_mxl(env);
> >>       return RISCV_EXCP_NONE;
> >>   }
> >> --
> >> 2.40.0
> >>
> >>

