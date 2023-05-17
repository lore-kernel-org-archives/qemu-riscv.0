Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6275C77B7D
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 04:49:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz96Y-00035J-NQ; Wed, 17 May 2023 00:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz96W-00031O-5k; Wed, 17 May 2023 00:49:36 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz96U-0006Ov-CN; Wed, 17 May 2023 00:49:35 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-783ef1c0cfdso3791896241.0; 
 Tue, 16 May 2023 21:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684298972; x=1686890972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9w+5UpHickO/IgD61fRuRVnjYWzz9r4ejsNiKq/z/4=;
 b=D1e7FdW2TAq98mGdHGeu8qKtPt8aTaP1HV2pkZrCVawfSTzQqEi8SWLfH9OjxM4TcO
 H0G9JQnBL6vIbHBXucAjBHnq+D+HBxxeX5n04EXP4T9tadhmo5bONvH6tQTq+4D2ja7r
 4uTgjmv8cio28P+8IDuOcEV5DGaywqDMeGiPe60XuzGu1GoiJhLbnzOX+PvSpGplC1kc
 gvd3s8PEKoy+zfJZ6U1/kW/1occp1XAdqNE6xpuvbC6HO2eYZOV5JP3EEocxdnvt6Siw
 NYoOBO2icpUue6nXTTOrKdt8Qm4ZUW24bNyNWk/PuiX5kaYWLAQdNDQDS2AmA4ayTlIj
 FK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684298972; x=1686890972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9w+5UpHickO/IgD61fRuRVnjYWzz9r4ejsNiKq/z/4=;
 b=bPdzmfc4AP3UVNhWML8uYImnDuPixBdX4PN9v2RMaLGK11ZlTVmCff8cQIkQvtiT2m
 zqQNT8Ar65sHCWFYrz6wpXgXt5JNzkTI306cnYxxlYF1lOCjjMWqdffNaArSYTm82XZp
 u66cxYWxQfiR7kZ0ZdfYAeTNGLvXpobZJo+GYUJxA3qLqVQWifqtg7u8hvp1JE2xhvpW
 u8EAAVKiaX8w65MaTTOPumc+KiYhGk/mWWf7CmmvKuEkwzpBZPMzh3kHJNMivZ/ksXPJ
 3ldt+fZlEI6BNHEhH0R+tcaF8caRGB3a/TQWeb9a/ni2v0i0dmFMGmXb5la+9UoV91g5
 nVzw==
X-Gm-Message-State: AC+VfDy5HhTUtpSQ3sbHMJYonet2RWJZsKPf3umBZ2+UEyoVuXOzAttd
 NOQVVjl++UAggjwK3hKccy2T2A+Pz52VTyeDRhg=
X-Google-Smtp-Source: ACHHUZ5r+p8odath+2XpXSOvu7LB41qLDj8PFN0KcdCKslkxy6Gz9muLsioenWeEakP0YoYIzvepI3DzO3JtfLtKrII=
X-Received: by 2002:a05:6102:f97:b0:434:3068:8314 with SMTP id
 e23-20020a0561020f9700b0043430688314mr328025vsv.5.1684298972603; Tue, 16 May
 2023 21:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
 <20230421132727.121462-12-dbarboza@ventanamicro.com>
 <f892567b-521c-5cbb-14df-e04f4e6415a5@ventanamicro.com>
In-Reply-To: <f892567b-521c-5cbb-14df-e04f4e6415a5@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 14:49:06 +1000
Message-ID: <CAKmqyKNt6qANXLLv2c_a6w-FS9pyqHhShbcDWO_vW8jvuqL_8Q@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] target/riscv: rework write_misa()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Fri, May 12, 2023 at 10:42=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Alistair,
>
>
> Since this is the only patch that is being contested is it possible to ap=
ply all
> the other ones to riscv-to-apply.next?
>
> I'm asking because I'm going to send more code that will affect cpu_init(=
) and
> riscv_cpu_realize() functions, and it would be easier if the cleanups wer=
e already
> in 'next'. Otherwise I'll either have to base the new code on top of this=
 pending
> series or I'll base them under riscv-to-apply.next and we'll have to deal=
 with
> conflicts.

Urgh, that's fair.

I just replied to your other thread. Let's throw a guest error print
in here and then we can merge it

Alistair

>
>
> Thanks,
>
> Daniel
>
> On 4/21/23 10:27, Daniel Henrique Barboza wrote:
> > write_misa() must use as much common logic as possible. We want to open
> > code just the bits that are exclusive to the CSR write operation and TC=
G
> > internals.
> >
> > Our validation is done with riscv_cpu_validate_set_extensions(), but we
> > need a small tweak first. When enabling RVG we're doing:
> >
> >          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> >          env->misa_ext_mask =3D env->misa_ext;
> >
> > This works fine for realize() time but this can potentially overwrite
> > env->misa_ext_mask if we reutilize the function for write_misa().
> >
> > Instead of doing misa_ext_mask =3D misa_ext, sum up the RVG extensions =
in
> > misa_ext_mask as well. This won't change realize() time behavior
> > (misa_ext_mask will be =3D=3D misa_ext) and will ensure that write_misa=
()
> > won't change misa_ext_mask by accident.
> >
> > After that, rewrite write_misa() to work as follows:
> >
> > - mask the write using misa_ext_mask to avoid enabling unsupported
> >    extensions;
> >
> > - suppress RVC if the next insn isn't aligned;
> >
> > - disable RVG if any of RVG dependencies are being disabled by the user=
;
> >
> > - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
> >    error, rollback env->misa_ext to its original value;
> >
> > - handle RVF and MSTATUS_FS and continue as usual.
> >
> > Let's keep write_misa() as experimental for now until this logic gains
> > enough mileage.
> >
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > ---
> >   target/riscv/cpu.c |  4 ++--
> >   target/riscv/cpu.h |  1 +
> >   target/riscv/csr.c | 47 ++++++++++++++++++++-------------------------=
-
> >   3 files changed, 23 insertions(+), 29 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7d407321aa..4fa720a39d 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *c=
pu, Error **errp)
> >    * Check consistency between chosen extensions while setting
> >    * cpu->cfg accordingly.
> >    */
> > -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **e=
rrp)
> > +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> >   {
> >       CPURISCVState *env =3D &cpu->env;
> >       Error *local_err =3D NULL;
> > @@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
> >           cpu->cfg.ext_ifencei =3D true;
> >
> >           env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> > -        env->misa_ext_mask =3D env->misa_ext;
> > +        env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
> >       }
> >
> >       if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 15423585d0..1f39edc687 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
> >                           bool probe, uintptr_t retaddr);
> >   char *riscv_isa_string(RISCVCPU *cpu);
> >   void riscv_cpu_list(void);
> > +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
> >
> >   #define cpu_list riscv_cpu_list
> >   #define cpu_mmu_index riscv_cpu_mmu_index
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 4451bd1263..4a3c57ea6f 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *=
env, int csrno,
> >   static RISCVException write_misa(CPURISCVState *env, int csrno,
> >                                    target_ulong val)
> >   {
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    uint32_t orig_misa_ext =3D env->misa_ext;
> > +    Error *local_err =3D NULL;
> > +
> >       if (!riscv_cpu_cfg(env)->misa_w) {
> >           /* drop write to misa */
> >           return RISCV_EXCP_NONE;
> >       }
> >
> > -    /* 'I' or 'E' must be present */
> > -    if (!(val & (RVI | RVE))) {
> > -        /* It is not, drop write to misa */
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -
> > -    /* 'E' excludes all other extensions */
> > -    if (val & RVE) {
> > -        /*
> > -         * when we support 'E' we can do "val =3D RVE;" however
> > -         * for now we just drop writes if 'E' is present.
> > -         */
> > -        return RISCV_EXCP_NONE;
> > -    }
> > -
> > -    /*
> > -     * misa.MXL writes are not supported by QEMU.
> > -     * Drop writes to those bits.
> > -     */
> > -
> >       /* Mask extensions that are not supported by this hart */
> >       val &=3D env->misa_ext_mask;
> >
> > -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> > -    if ((val & RVD) && !(val & RVF)) {
> > -        val &=3D ~RVD;
> > -    }
> > -
> >       /*
> >        * Suppress 'C' if next instruction is not aligned
> >        * TODO: this should check next_pc
> > @@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState =
*env, int csrno,
> >           val &=3D ~RVC;
> >       }
> >
> > +    /* Disable RVG if any of its dependencies are disabled */
> > +    if (!(val & RVI && val & RVM && val & RVA &&
> > +          val & RVF && val & RVD)) {
> > +        val &=3D ~RVG;
> > +    }
> > +
> >       /* If nothing changed, do nothing. */
> >       if (val =3D=3D env->misa_ext) {
> >           return RISCV_EXCP_NONE;
> >       }
> >
> > -    if (!(val & RVF)) {
> > +    env->misa_ext =3D val;
> > +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> > +    if (local_err !=3D NULL) {
> > +        /* Rollback on validation error */
> > +        env->misa_ext =3D orig_misa_ext;
> > +
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (!(env->misa_ext & RVF)) {
> >           env->mstatus &=3D ~MSTATUS_FS;
> >       }
> >
> >       /* flush translation cache */
> >       tb_flush(env_cpu(env));
> > -    env->misa_ext =3D val;
> >       env->xl =3D riscv_cpu_mxl(env);
> >       return RISCV_EXCP_NONE;
> >   }
>

