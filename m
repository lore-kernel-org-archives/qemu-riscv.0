Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830A7E7B5E1
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:36:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnyIk-0003Fx-Gr; Wed, 04 Oct 2023 05:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnyIc-00035l-IS
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:36:11 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnyIU-0004R3-US
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:36:08 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso341638166b.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696412160; x=1697016960;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XwWQxAyxODDkhCTQpDWs5F3KR0Z3rGjvpdnR4kmJuDs=;
 b=aDQDUDt7ACkux5OUFCusV73G+9dUnex4MKwtUdbqDz1h3XQzE/9sVhVc1A1gQMA1Cl
 JYB4Rj//AjVfR3TNl27V7LKkpB/a6WHtqIsg/QfF4S2F4lOayItj6LGNx5zZtHklzO14
 bJnUrYnXNkTucfy4iHH6KLbnM0j3sRba9PxTRSqqwwmnUHtDD33BUQRBrmWGXkFwINeA
 XsJfjfrFmaD66n5tEtRj98hseoOFT3Hk1kD1qToT+WWhj8G5Np08Xgtvc/7Z4OqMyphL
 u7i6dSeDwBsX06HPtdfz+o8gxKH6YlBkUfd+Su4m6G3KtgK2Ymzsh/Mm2eC5Fqi45fS7
 umQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696412160; x=1697016960;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XwWQxAyxODDkhCTQpDWs5F3KR0Z3rGjvpdnR4kmJuDs=;
 b=YwyZH7b4+ow6JvYHo4wbz3+umKfjVUk/FRa7r0CvER+twjyjzjmuStxSji+DIqASwH
 oANSevspjydrTIk5aDZ0Z8n0wbwYRTGbTb+69B0J6/cBLaolNLPaKmjuiTs2nJW+Uoa8
 1Qpfw3GvDlPw1GAMFML/bDISPdvIfMS0DJLkzKpDKgQSHtOAlx1P8yrTpY9UHZvKnHmT
 OwTWPhXvNrmAsgHAVsEgAQ+1U2p1R9VOMYd61u4zlnA8K+68mV8LBmVmvE3jPkwCr5b3
 xHz0kIOGr/jAH6JTqthc+v7b+Bhz2nkBC8/rIpBnMStEezDXG64/iFtMzldnDeCUGfa0
 Eimw==
X-Gm-Message-State: AOJu0YxKfoylAelAmCBAVTTV00+tZw9GCnPC4rcdt84o+Q3zNHalGjTF
 0jovIPkv1d1piSLX8LUvYOOy1A==
X-Google-Smtp-Source: AGHT+IEPPY9J0VKOhewzM9j+8+q7eIRWWv+ipClM0JjoO8Rah7I2lf/pVRPBq3FkwJIua8AHtkkyRw==
X-Received: by 2002:a17:906:8a67:b0:9a1:f3a6:b906 with SMTP id
 hy7-20020a1709068a6700b009a1f3a6b906mr1629271ejc.36.1696412159424; 
 Wed, 04 Oct 2023 02:35:59 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a1cf716000000b003fefcbe7fa8sm1038757wmh.28.2023.10.04.02.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 02:35:58 -0700 (PDT)
Message-ID: <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
Subject: Re: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
From: Rob Bradford <rbradford@rivosinc.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Date: Wed, 04 Oct 2023 10:35:58 +0100
In-Reply-To: <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-3-rbradford@rivosinc.com>
 <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.module_f38+16987+774193ea) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=rbradford@rivosinc.com; helo=mail-ej1-x631.google.com
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

Hi Atish,

On Tue, 2023-10-03 at 13:25 -0700, Atish Kumar Patra wrote:
> On Tue, Oct 3, 2023 at 5:51=E2=80=AFAM Rob Bradford <rbradford@rivosinc.c=
om>
> wrote:
> >=20
> > There is no requirement that the enabled counters in the platform
> > are
> > continuously numbered. Add a "pmu-mask" property that, if
> > specified, can
> > be used to specify the enabled PMUs. In order to avoid ambiguity if
> > "pmu-mask" is specified then "pmu-num" must also match the number
> > of
> > bits set in the mask.
> >=20
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> > =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0target/riscv/cpu_cfg.h |=C2=A0 1 +
> > =C2=A0target/riscv/pmu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++--
> > =C2=A03 files changed, 15 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 9d79c20c1a..b89b006a76 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1817,6 +1817,7 @@ static void
> > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > =C2=A0static Property riscv_cpu_extensions[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* Defaults for standard extensions */
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu=
_num, 16),
> > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_ma=
sk, 0),
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext=
_sscofpmf,
> > false),
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext=
_ifencei, true),
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_ic=
sr, true),
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index 0e6a0f245c..40f7d970bc 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -124,6 +124,7 @@ struct RISCVCPUConfig {
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_XVentanaCondOps;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t pmu_num;
> > +=C2=A0=C2=A0=C2=A0 uint32_t pmu_mask;
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *priv_spec;
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *user_spec;
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *bext_spec;
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 13801ccb78..f97e25a1f6 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState *env,
> > uint64_t value, uint32_t ctr_idx)
> > =C2=A0void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > +=C2=A0=C2=A0=C2=A0 uint32_t pmu_mask =3D cpu->cfg.pmu_mask;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (pmu_mask && ctpop32(pmu_mask) !=3D pmu_num) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Mismatch =
between number of enabled
> > counters in "
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "\"pmu-mask\" and \"pmu-num\"");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> >=20
>=20
> Is that necessary for the default case? I am thinking of marking
> pmu-num as deprecated and pmu-mask
> as the preferred way of doing things as it is more flexible. There is
> no real benefit carrying both.
> The default pmu-mask value will change in that case.
> We can just overwrite pmu-num with ctpop32(pmu_mask) if pmu-mask is
> available. Thoughts ?
>=20

I agree it makes sense to me that there is only one way for the user to
adjust the PMU count. However i'm not sure how we can handle the
transition if we choose to deprecate "pmu-num".

If we change the default "pmu-mask" to MAKE_32BIT_MASK(3, 16) then that
value in the config will always be set - you propose that we overwrite
"pmu-num" with the popcount of that property. But that will break if
the user has an existing setup that changes the value of "pmu-num"
(either as a property at runtime or in the CPU init code).

One option would be to not make the mask configurable as property and
make choosing the layout of the counters something that the specialised
CPU init can choose to do.

Cheers,

Rob

> > =C2=A0=C2=A0=C2=A0=C2=A0 if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Numb=
er of counters exceeds maximum
> > available");
> > @@ -449,6 +456,10 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > -=C2=A0=C2=A0=C2=A0 /* Create a bitmask of available programmable count=
ers */
> > -=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num)=
;
> > +=C2=A0=C2=A0=C2=A0 /* Create a bitmask of available programmable count=
ers if none
> > supplied */
> > +=C2=A0=C2=A0=C2=A0 if (pmu_mask) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =3D pmu=
_mask;
> > +=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =3D MAK=
E_32BIT_MASK(3, pmu_num);
> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > --
> > 2.41.0
> >=20


