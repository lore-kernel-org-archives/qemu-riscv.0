Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A623CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFTL-0000tW-29; Mon, 16 Oct 2023 00:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFTJ-0000s2-9v; Mon, 16 Oct 2023 00:44:53 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFTH-0005fN-Bs; Mon, 16 Oct 2023 00:44:52 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49dc95be8c3so1795773e0c.0; 
 Sun, 15 Oct 2023 21:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697431490; x=1698036290; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cY7FFEFX5YMKmq8ovXiH+mDgrcvyEa7zSCcLgBJ3NCQ=;
 b=I5POfepM5ORzlWfy4YdrAWyp1eZuJvtqVoxjgJd8qswIQMzKug2JG6YIUCp0/x0SLb
 lEoHoiZ1T+2P/pa+owS2BgwR+9/rBK3kUc0Nf5x34VpIE8S95aQXkL8IqJTBH5ElBB2A
 McCc6R8RbJhAKS4kr/9CnvHKDCOG7VOUltibOHBSO1Au5vmPaLxGjyAIWGrDfO652x1P
 hDdwpvljAHdSemvZ/DMJjBCN3nmL2jR3rgBrkgfMSvZCCi/nMHXNqGva5ox5s6OCCGrF
 b8T6MSV1h3Hmig8sDR8bh+Ur5JxL6oycOpXz+eX7GKnpcvsUf9LKozA5RYY1yNoD06h4
 nIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697431490; x=1698036290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cY7FFEFX5YMKmq8ovXiH+mDgrcvyEa7zSCcLgBJ3NCQ=;
 b=p3PezIV62nhsUdusP3wVP9AZ3tyvyExcs2jO2deV8DIJSBTbt+kYXL3Pp4VqlNGFjI
 VyBK4e74HSo/DYm6l1MwN5gfw+i6+uEXjwoiYmn/KguLrjppiPznzLfC11Kqc07E+2LF
 SkZA8Iq+F3kYGMha3/dZHXLEp8vvJe2ENOHV1Al2fwiMhtoZ0Gid5I2fj5fAWm8zF0UY
 BU7gYSDVbbEy54wfhLT67nz96VHiIqJ8/QLYex2CPKcWjJPmrj896MW3ddgeDAFC94rc
 oo+HJMBfaUXwXHhI/VBd6PZnLkC4hu9Ny5nY+241P/NGHJQEuLikKanokKaw+m7/EnwZ
 SpMg==
X-Gm-Message-State: AOJu0YyKskFad0V7gzPNVixTkHQ9zUCKZo/dAjIieONYScNCgi2j6Xxu
 9r5UVcxx8bokLxHTM5LM3ZFyGqI2nhK6W3GPqww=
X-Google-Smtp-Source: AGHT+IEFmO9HG4u4/mgMKia6IrXo77SfwBsahpLdAsUw8/dtgLU4VyeeykphEpedSa+NZr7IPFaUfQ/7q5i5sqcbUCE=
X-Received: by 2002:a1f:c803:0:b0:49a:b0ff:eeaf with SMTP id
 y3-20020a1fc803000000b0049ab0ffeeafmr23333815vkf.1.1697431489768; Sun, 15 Oct
 2023 21:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-3-rbradford@rivosinc.com>
 <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
 <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
 <CAKmqyKNrmnUTHxx_wYe0V6sL0M10hkwOGYakGw1E6pu17YyMKQ@mail.gmail.com>
 <CAHBxVyEO4bPLKM4d90mhM9k33hf2L2zdFk7qDtenv3-2d8YNfg@mail.gmail.com>
 <c242e5e8f32c3b1aa64456deb181a8f02cb66674.camel@rivosinc.com>
In-Reply-To: <c242e5e8f32c3b1aa64456deb181a8f02cb66674.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:44:23 +1000
Message-ID: <CAKmqyKPnFOeypmkUbLcx9SgXQYcQr4Sr9Zi5n_TEiagZHWcM-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
To: Rob Bradford <rbradford@rivosinc.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Wed, Oct 11, 2023 at 7:51=E2=80=AFPM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> On Mon, 2023-10-09 at 11:00 -0700, Atish Kumar Patra wrote:
> > On Sun, Oct 8, 2023 at 5:58=E2=80=AFPM Alistair Francis
> > <alistair23@gmail.com> wrote:
> > >
> > > On Wed, Oct 4, 2023 at 7:36=E2=80=AFPM Rob Bradford
> > > <rbradford@rivosinc.com> wrote:
> > > >
> > > > Hi Atish,
> > > >
> > > > On Tue, 2023-10-03 at 13:25 -0700, Atish Kumar Patra wrote:
> > > > > On Tue, Oct 3, 2023 at 5:51=E2=80=AFAM Rob Bradford
> > > > > <rbradford@rivosinc.com>
> > > > > wrote:
> > > > > >
> > > > > > There is no requirement that the enabled counters in the
> > > > > > platform
> > > > > > are
> > > > > > continuously numbered. Add a "pmu-mask" property that, if
> > > > > > specified, can
> > > > > > be used to specify the enabled PMUs. In order to avoid
> > > > > > ambiguity if
> > > > > > "pmu-mask" is specified then "pmu-num" must also match the
> > > > > > number
> > > > > > of
> > > > > > bits set in the mask.
> > > > > >
> > > > > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > > > > ---
> > > > > >  target/riscv/cpu.c     |  1 +
> > > > > >  target/riscv/cpu_cfg.h |  1 +
> > > > > >  target/riscv/pmu.c     | 15 +++++++++++++--
> > > > > >  3 files changed, 15 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > > index 9d79c20c1a..b89b006a76 100644
> > > > > > --- a/target/riscv/cpu.c
> > > > > > +++ b/target/riscv/cpu.c
> > > > > > @@ -1817,6 +1817,7 @@ static void
> > > > > > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > > > > >  static Property riscv_cpu_extensions[] =3D {
> > > > > >      /* Defaults for standard extensions */
> > > > > >      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > > > > > +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask,
> > > > > > 0),
> > > > > >      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf,
> > > > > > false),
> > > > > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei,
> > > > > > true),
> > > > > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > > > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > > > > index 0e6a0f245c..40f7d970bc 100644
> > > > > > --- a/target/riscv/cpu_cfg.h
> > > > > > +++ b/target/riscv/cpu_cfg.h
> > > > > > @@ -124,6 +124,7 @@ struct RISCVCPUConfig {
> > > > > >      bool ext_XVentanaCondOps;
> > > > > >
> > > > > >      uint8_t pmu_num;
> > > > > > +    uint32_t pmu_mask;
> > > > > >      char *priv_spec;
> > > > > >      char *user_spec;
> > > > > >      char *bext_spec;
> > > > > > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > > > > > index 13801ccb78..f97e25a1f6 100644
> > > > > > --- a/target/riscv/pmu.c
> > > > > > +++ b/target/riscv/pmu.c
> > > > > > @@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState
> > > > > > *env,
> > > > > > uint64_t value, uint32_t ctr_idx)
> > > > > >  void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
> > > > > >  {
> > > > > >      uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > > > > > +    uint32_t pmu_mask =3D cpu->cfg.pmu_mask;
> > > > > > +
> > > > > > +    if (pmu_mask && ctpop32(pmu_mask) !=3D pmu_num) {
> > > > > > +        error_setg(errp, "Mismatch between number of enabled
> > > > > > counters in "
> > > > > > +                         "\"pmu-mask\" and \"pmu-num\"");
> > > > > > +        return;
> > > > > > +    }
> > > > > >
> > > > >
> > > > > Is that necessary for the default case? I am thinking of
> > > > > marking
> > > > > pmu-num as deprecated and pmu-mask
> > > > > as the preferred way of doing things as it is more flexible.
> > > > > There is
> > > > > no real benefit carrying both.
> > > > > The default pmu-mask value will change in that case.
> > > > > We can just overwrite pmu-num with ctpop32(pmu_mask) if pmu-
> > > > > mask is
> > > > > available. Thoughts ?
> > > > >
> > > >
> > > > I agree it makes sense to me that there is only one way for the
> > > > user to
> > > > adjust the PMU count. However i'm not sure how we can handle the
> > > > transition if we choose to deprecate "pmu-num".
> > > >
> > > > If we change the default "pmu-mask" to MAKE_32BIT_MASK(3, 16)
> > > > then that
> > > > value in the config will always be set - you propose that we
> > > > overwrite
> > > > "pmu-num" with the popcount of that property. But that will break
> > > > if
> > >
> > > Couldn't we deprecate "pmu-num" and then throw an error if both are
> > > set? Then we can migrate away from "pmu-num"
> > >
> >
> > Yeah. pmu-num should be only available as a command line property and
> > marked deprecated.
> > If only pmu-num is set, it gets converted to a mask and throws a
> > warning
> > that this is a deprecated property.
>
> Is there a way to know the property has been set by the user? I
> couldn't see anything in the API - do we just have to assume that if
> the value is not the default then it has been changed by the user?

You should be able to use riscv_cpu_deprecated_exts as a starting point

Alistair

