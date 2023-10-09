Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A46DCD6114
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 18:00:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpuYL-0003bm-Ku; Mon, 09 Oct 2023 14:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qpuYD-0003ac-Vq
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 14:00:18 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qpuYA-0001ow-Pz
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 14:00:17 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50567477b29so6204564e87.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696874412; x=1697479212;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ukjb7ovOix+Twpj8N4DFVSTEbuk9EJgFiLy9dZ5dPIE=;
 b=x4iKqTh5Xrhxa/sjNgy/TlK8xFdBObHB3ax/QwLu8N2Z0cyzZhWKVQwHw3PCgj9YOn
 WDvx1mM58Jl5fbavPQ6zJC7nNpq63RkvYYxEI3CVy6PnZHAplEwVar++SASo97UWBxVo
 Oy+vSJZUJoG8KGuf+/1udi4vPUX5YM9i8YCR07OKk6BDtaz6/1btfO+Jk3iglgcfLQgd
 czEWTPkASrd6LA+UO/COC+KSa7OUnfmvgCEItw4SJJCR3rud/EFVW/GeA4edI/kxpJbs
 cIoc1+MDVegg/utHB5nuDP3kkLQTDyCRWFfeQ45TvWglIvJoV6VVpVK63TtwqUs27srr
 Wmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696874412; x=1697479212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ukjb7ovOix+Twpj8N4DFVSTEbuk9EJgFiLy9dZ5dPIE=;
 b=AhVMWijmw4USSCZomxGSJNP1pAU/1omw6yB8vnpeBTBw8tU4+WDqtRDChj/qbhDVAi
 l8w/felsiZwpNVixGzh6F3LbqiQh79kleuiqVom/FPw2CU48ao7tcUboAOv+s3vr3uk0
 gAmZHh+7PNr02Yll3sAcTasNkUxhOpdYj05H8OBH+iJ5ugsaiz9JDQxsWpdP0AawN8sg
 fO0H17gdo5/UAzHivBzlE3NI7T6ZfSWZQmxze0fNJXz7pYFsEJdS4HBvUp43OSrv/gjq
 cWcPmusv4qARn1nn5170LWALVLctaoa7BJnvig7f2O3zvTg8+MV1pJJ8EveQ2t371RNK
 RDKA==
X-Gm-Message-State: AOJu0YxEmLG4D7FpcY/IF1X0YqiSUL9ZOGerfTMqMXLfDph1CgCeRZUo
 CqTx7JHOGQQIC2xzVpZj2O2iabNrqIkUFg0z3MUGQA==
X-Google-Smtp-Source: AGHT+IFpRs8m2i/5dHU78slvv79TWspPQ9Z+X08ZAVuLTiwgf2NNkEFE4w6xzktqZ1pebru2K2mxEOMMF/BOX0d88es=
X-Received: by 2002:a05:6512:ba6:b0:503:2877:67d3 with SMTP id
 b38-20020a0565120ba600b00503287767d3mr15801829lfv.67.1696874411499; Mon, 09
 Oct 2023 11:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-3-rbradford@rivosinc.com>
 <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
 <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
 <CAKmqyKNrmnUTHxx_wYe0V6sL0M10hkwOGYakGw1E6pu17YyMKQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNrmnUTHxx_wYe0V6sL0M10hkwOGYakGw1E6pu17YyMKQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Oct 2023 11:00:00 -0700
Message-ID: <CAHBxVyEO4bPLKM4d90mhM9k33hf2L2zdFk7qDtenv3-2d8YNfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
To: Alistair Francis <alistair23@gmail.com>
Cc: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Oct 8, 2023 at 5:58=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Wed, Oct 4, 2023 at 7:36=E2=80=AFPM Rob Bradford <rbradford@rivosinc.c=
om> wrote:
> >
> > Hi Atish,
> >
> > On Tue, 2023-10-03 at 13:25 -0700, Atish Kumar Patra wrote:
> > > On Tue, Oct 3, 2023 at 5:51=E2=80=AFAM Rob Bradford <rbradford@rivosi=
nc.com>
> > > wrote:
> > > >
> > > > There is no requirement that the enabled counters in the platform
> > > > are
> > > > continuously numbered. Add a "pmu-mask" property that, if
> > > > specified, can
> > > > be used to specify the enabled PMUs. In order to avoid ambiguity if
> > > > "pmu-mask" is specified then "pmu-num" must also match the number
> > > > of
> > > > bits set in the mask.
> > > >
> > > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > > ---
> > > >  target/riscv/cpu.c     |  1 +
> > > >  target/riscv/cpu_cfg.h |  1 +
> > > >  target/riscv/pmu.c     | 15 +++++++++++++--
> > > >  3 files changed, 15 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index 9d79c20c1a..b89b006a76 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -1817,6 +1817,7 @@ static void
> > > > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > > >  static Property riscv_cpu_extensions[] =3D {
> > > >      /* Defaults for standard extensions */
> > > >      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > > > +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, 0),
> > > >      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf,
> > > > false),
> > > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> > > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > > index 0e6a0f245c..40f7d970bc 100644
> > > > --- a/target/riscv/cpu_cfg.h
> > > > +++ b/target/riscv/cpu_cfg.h
> > > > @@ -124,6 +124,7 @@ struct RISCVCPUConfig {
> > > >      bool ext_XVentanaCondOps;
> > > >
> > > >      uint8_t pmu_num;
> > > > +    uint32_t pmu_mask;
> > > >      char *priv_spec;
> > > >      char *user_spec;
> > > >      char *bext_spec;
> > > > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > > > index 13801ccb78..f97e25a1f6 100644
> > > > --- a/target/riscv/pmu.c
> > > > +++ b/target/riscv/pmu.c
> > > > @@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState *env,
> > > > uint64_t value, uint32_t ctr_idx)
> > > >  void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
> > > >  {
> > > >      uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > > > +    uint32_t pmu_mask =3D cpu->cfg.pmu_mask;
> > > > +
> > > > +    if (pmu_mask && ctpop32(pmu_mask) !=3D pmu_num) {
> > > > +        error_setg(errp, "Mismatch between number of enabled
> > > > counters in "
> > > > +                         "\"pmu-mask\" and \"pmu-num\"");
> > > > +        return;
> > > > +    }
> > > >
> > >
> > > Is that necessary for the default case? I am thinking of marking
> > > pmu-num as deprecated and pmu-mask
> > > as the preferred way of doing things as it is more flexible. There is
> > > no real benefit carrying both.
> > > The default pmu-mask value will change in that case.
> > > We can just overwrite pmu-num with ctpop32(pmu_mask) if pmu-mask is
> > > available. Thoughts ?
> > >
> >
> > I agree it makes sense to me that there is only one way for the user to
> > adjust the PMU count. However i'm not sure how we can handle the
> > transition if we choose to deprecate "pmu-num".
> >
> > If we change the default "pmu-mask" to MAKE_32BIT_MASK(3, 16) then that
> > value in the config will always be set - you propose that we overwrite
> > "pmu-num" with the popcount of that property. But that will break if
>
> Couldn't we deprecate "pmu-num" and then throw an error if both are
> set? Then we can migrate away from "pmu-num"
>

Yeah. pmu-num should be only available as a command line property and
marked deprecated.
If only pmu-num is set, it gets converted to a mask and throws a warning
that this is a deprecated property.
If only the pmu-mask is set, nothing additional is needed. These
patches are sufficient.
If nothing is set, the pmu-mask will be set to MAKE_32BIT_MASK(3, 16).
If a CPU init code uses pmu-num, we should change it to mask. The upstream =
code
doesn't have any other usage. Any downstream user will have to move
away from pmu-num
once this series is merged.

> Alistair
>
> > the user has an existing setup that changes the value of "pmu-num"
> > (either as a property at runtime or in the CPU init code).
> >
> > One option would be to not make the mask configurable as property and
> > make choosing the layout of the counters something that the specialised
> > CPU init can choose to do.
> >
> > Cheers,
> >
> > Rob
> >
> > > >      if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> > > >          error_setg(errp, "Number of counters exceeds maximum
> > > > available");
> > > > @@ -449,6 +456,10 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > > > **errp)
> > > >          return;
> > > >      }
> > > >
> > > > -    /* Create a bitmask of available programmable counters */
> > > > -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > > > +    /* Create a bitmask of available programmable counters if none
> > > > supplied */
> > > > +    if (pmu_mask) {
> > > > +        cpu->pmu_avail_ctrs =3D pmu_mask;
> > > > +    } else {
> > > > +        cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > > > +    }
> > > >  }
> > > > --
> > > > 2.41.0
> > > >
> >
> >

