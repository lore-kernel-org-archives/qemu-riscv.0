Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3323CD98D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNgK-00073j-Qg; Tue, 10 Oct 2023 21:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNgJ-00073E-F2; Tue, 10 Oct 2023 21:06:35 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNgH-0007DC-GD; Tue, 10 Oct 2023 21:06:35 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-49d39f07066so2086188e0c.0; 
 Tue, 10 Oct 2023 18:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986392; x=1697591192; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBjij6sJWlx3sLQgLWYHVmF+0OHgcs2jngrrysGLBhw=;
 b=U+VMLUQhzD7df2KXE7QjLAgDIbgvpTkFe6mp9Md74hR8K4Chm6mhS9wtI+F0f95gYa
 16U+FYi9VPoJS9fhRzymP4DT0YH2iXuWtf+sm2qlHZUo0dElZgPtTMUp6MyUCuH3Vl3d
 F7f+Y3NCGq7VAzCVeMS7JgsflIXDTnKhF0rQlYPGLSFXyUcTC44j3rTkryDDUHxVcxs2
 d87ir0RQoEfsQ52hZIeDZvJe7vHiHQeRfiAsegPncYGWZ3R4BZWCtUJ3SsyElOc2TZP3
 IvDsUhDQmdy05pbSq/8/PD1qCmnH1Jt6C69YJeFTyZv6lZLJHzOgX85yCsOx2vTJQcj6
 NYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986392; x=1697591192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBjij6sJWlx3sLQgLWYHVmF+0OHgcs2jngrrysGLBhw=;
 b=j+tAE74Onnnx1dLWYFo2NpWipiPwFBnIc78i5ddE6gma+zZurLtRhiUjFiGb9/isvQ
 EIKqpSOgyohcCrRam5+4FPqF4Hu0KoFQGRVUbN8NhxHOiKXb7NHaZbmpQWjZEfVtdvCA
 bdG3e+2SSs4MX+C+Fu4+b3AEKfkxMeiOD6n0eCi43of2BLrxzz1GqBykFXPsDQyV9ZAc
 vl0ldrzcsUDL6aEgCIsOROTxL1RHt1jlFyIXAgDEiA/6KLsuJ7fpERw9mvU6ss9Hw4DW
 mo6s7Aom8SkmO5uHNjXb/1BNXkNV1smWqSIk+bF94++5L6nvLAyQiT1UhWj5dj+lk/9t
 z5Ig==
X-Gm-Message-State: AOJu0YzKK2jqe5LRbIdWrvWd2fuGLuCsnHJc0PIP9BcKbcLu1yCHEu5E
 jikH3JL1JRxLUHdkg3D9stVIiDPkgvjUxWvg0Ek=
X-Google-Smtp-Source: AGHT+IHEPWw3sFKU/1tfi08UjALoFIWUa5m9thnVxy8ZcSfelUxq62TGhvHb90qZsa2oYQ08FPKdjJyr+J4RN8pZNbM=
X-Received: by 2002:a1f:4b85:0:b0:49d:d73e:5d07 with SMTP id
 y127-20020a1f4b85000000b0049dd73e5d07mr11962833vka.16.1696986391675; Tue, 10
 Oct 2023 18:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-3-rbradford@rivosinc.com>
 <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
 <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
 <CAKmqyKNrmnUTHxx_wYe0V6sL0M10hkwOGYakGw1E6pu17YyMKQ@mail.gmail.com>
 <CAHBxVyEO4bPLKM4d90mhM9k33hf2L2zdFk7qDtenv3-2d8YNfg@mail.gmail.com>
In-Reply-To: <CAHBxVyEO4bPLKM4d90mhM9k33hf2L2zdFk7qDtenv3-2d8YNfg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:06:05 +1000
Message-ID: <CAKmqyKP1BqTjd0S1g7Zj9SitvuaS_LHy_0GWC--txrWdRjRCaQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Tue, Oct 10, 2023 at 4:00=E2=80=AFAM Atish Kumar Patra <atishp@rivosinc.=
com> wrote:
>
> On Sun, Oct 8, 2023 at 5:58=E2=80=AFPM Alistair Francis <alistair23@gmail=
.com> wrote:
> >
> > On Wed, Oct 4, 2023 at 7:36=E2=80=AFPM Rob Bradford <rbradford@rivosinc=
.com> wrote:
> > >
> > > Hi Atish,
> > >
> > > On Tue, 2023-10-03 at 13:25 -0700, Atish Kumar Patra wrote:
> > > > On Tue, Oct 3, 2023 at 5:51=E2=80=AFAM Rob Bradford <rbradford@rivo=
sinc.com>
> > > > wrote:
> > > > >
> > > > > There is no requirement that the enabled counters in the platform
> > > > > are
> > > > > continuously numbered. Add a "pmu-mask" property that, if
> > > > > specified, can
> > > > > be used to specify the enabled PMUs. In order to avoid ambiguity =
if
> > > > > "pmu-mask" is specified then "pmu-num" must also match the number
> > > > > of
> > > > > bits set in the mask.
> > > > >
> > > > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > > > ---
> > > > >  target/riscv/cpu.c     |  1 +
> > > > >  target/riscv/cpu_cfg.h |  1 +
> > > > >  target/riscv/pmu.c     | 15 +++++++++++++--
> > > > >  3 files changed, 15 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > index 9d79c20c1a..b89b006a76 100644
> > > > > --- a/target/riscv/cpu.c
> > > > > +++ b/target/riscv/cpu.c
> > > > > @@ -1817,6 +1817,7 @@ static void
> > > > > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > > > >  static Property riscv_cpu_extensions[] =3D {
> > > > >      /* Defaults for standard extensions */
> > > > >      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > > > > +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, 0),
> > > > >      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf,
> > > > > false),
> > > > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true=
),
> > > > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > > > index 0e6a0f245c..40f7d970bc 100644
> > > > > --- a/target/riscv/cpu_cfg.h
> > > > > +++ b/target/riscv/cpu_cfg.h
> > > > > @@ -124,6 +124,7 @@ struct RISCVCPUConfig {
> > > > >      bool ext_XVentanaCondOps;
> > > > >
> > > > >      uint8_t pmu_num;
> > > > > +    uint32_t pmu_mask;
> > > > >      char *priv_spec;
> > > > >      char *user_spec;
> > > > >      char *bext_spec;
> > > > > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > > > > index 13801ccb78..f97e25a1f6 100644
> > > > > --- a/target/riscv/pmu.c
> > > > > +++ b/target/riscv/pmu.c
> > > > > @@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState *env=
,
> > > > > uint64_t value, uint32_t ctr_idx)
> > > > >  void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
> > > > >  {
> > > > >      uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > > > > +    uint32_t pmu_mask =3D cpu->cfg.pmu_mask;
> > > > > +
> > > > > +    if (pmu_mask && ctpop32(pmu_mask) !=3D pmu_num) {
> > > > > +        error_setg(errp, "Mismatch between number of enabled
> > > > > counters in "
> > > > > +                         "\"pmu-mask\" and \"pmu-num\"");
> > > > > +        return;
> > > > > +    }
> > > > >
> > > >
> > > > Is that necessary for the default case? I am thinking of marking
> > > > pmu-num as deprecated and pmu-mask
> > > > as the preferred way of doing things as it is more flexible. There =
is
> > > > no real benefit carrying both.
> > > > The default pmu-mask value will change in that case.
> > > > We can just overwrite pmu-num with ctpop32(pmu_mask) if pmu-mask is
> > > > available. Thoughts ?
> > > >
> > >
> > > I agree it makes sense to me that there is only one way for the user =
to
> > > adjust the PMU count. However i'm not sure how we can handle the
> > > transition if we choose to deprecate "pmu-num".
> > >
> > > If we change the default "pmu-mask" to MAKE_32BIT_MASK(3, 16) then th=
at
> > > value in the config will always be set - you propose that we overwrit=
e
> > > "pmu-num" with the popcount of that property. But that will break if
> >
> > Couldn't we deprecate "pmu-num" and then throw an error if both are
> > set? Then we can migrate away from "pmu-num"
> >
>
> Yeah. pmu-num should be only available as a command line property and
> marked deprecated.
> If only pmu-num is set, it gets converted to a mask and throws a warning
> that this is a deprecated property.
> If only the pmu-mask is set, nothing additional is needed. These
> patches are sufficient.
> If nothing is set, the pmu-mask will be set to MAKE_32BIT_MASK(3, 16).

That all sounds good to me, and if both are set we can throw an error.

Alistair

> If a CPU init code uses pmu-num, we should change it to mask. The upstrea=
m code
> doesn't have any other usage. Any downstream user will have to move
> away from pmu-num
> once this series is merged.
>
> > Alistair
> >
> > > the user has an existing setup that changes the value of "pmu-num"
> > > (either as a property at runtime or in the CPU init code).
> > >
> > > One option would be to not make the mask configurable as property and
> > > make choosing the layout of the counters something that the specialis=
ed
> > > CPU init can choose to do.
> > >
> > > Cheers,
> > >
> > > Rob
> > >
> > > > >      if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> > > > >          error_setg(errp, "Number of counters exceeds maximum
> > > > > available");
> > > > > @@ -449,6 +456,10 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > > > > **errp)
> > > > >          return;
> > > > >      }
> > > > >
> > > > > -    /* Create a bitmask of available programmable counters */
> > > > > -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > > > > +    /* Create a bitmask of available programmable counters if no=
ne
> > > > > supplied */
> > > > > +    if (pmu_mask) {
> > > > > +        cpu->pmu_avail_ctrs =3D pmu_mask;
> > > > > +    } else {
> > > > > +        cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > > > > +    }
> > > > >  }
> > > > > --
> > > > > 2.41.0
> > > > >
> > >
> > >

