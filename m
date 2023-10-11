Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33AFCD6E56
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 09:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqVsE-0000bE-He; Wed, 11 Oct 2023 05:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqVsB-0000aC-2I
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 05:51:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqVs8-0003f5-Gc
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 05:51:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4064867903cso67468355e9.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 02:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697017878; x=1697622678;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b2KKs+jSlnmwWwTfy0LySKnnMZ1pyaMOXJ+gY3HJGtk=;
 b=13UVwDA3LyuSYYOSiIWYrAmm0oWr/RvnhJO7ymxcRirTA8q2OzlKS+LjHItfS2GGeg
 0pa+XJj41fHpqwJHBdzhxWXc3GJVg+lijmgyDJSCb+Ds3G9NuJHTE3cHfkXbz7uW+Btm
 Z0TJeX6+NyLLPmHDGUqYz2n9vVCCZrjedm7p3lXYwz+S1FsiG2WUExtfs25nzkje9A6E
 RGcrJzXwCWBxbO4NVDVpf4yYKR0LEsgoiJVYcpydZFLCq0l1k8OR4aUV2UUkhFMqFQ8s
 J+n/QLyfRIzb3Tr0rlcv8uEDkzzDDdE5BGqDuRMJXWnICx0JYPxfU/9gERClGxVI3A+g
 Gp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697017878; x=1697622678;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b2KKs+jSlnmwWwTfy0LySKnnMZ1pyaMOXJ+gY3HJGtk=;
 b=O1U65j7iZ73Tdw2XKQ7JPmOhrfL+lIjWQWrfuzPdYTQvtlCpLGYkCtfT2gUylIDkXN
 JVPy7ne2q1sGGYGBsuk0jvaCXP9t1eKawp+CpNIlbvTWikA8nsK8FOl+TdAQG5R87X4y
 woxjx+hef44yY9pQ725+wHqT7C5DX9ytkePD8LQnvE3+JIJMY57O9XvSDYsgwUku5gRO
 shExefe/fOTbVtX85+bDSkadKBeloz98o50yvkuLGwciCt3l8y3xEWWioN0Yo+Yeuh5a
 GTDTpEQMfsMBCSDLLZ8YB5MNJ66cwtyw1fuYF1iVlpgM8K99P4zNwrNTNXEKHtEWDxvK
 GgPQ==
X-Gm-Message-State: AOJu0Ywt9SqThRB9MA9EZzlz6J256baxvoyvi/SPJyxRkA7tfUKWSND8
 /kprJO8HLiXITnR4qsWCgN5oaA==
X-Google-Smtp-Source: AGHT+IGdXxX0A3I4S/UjHiloPz+A2kbdPw7nb+MkJv8RUmrRngfI74U2UoidBH3fVCzW5VfhLSzWRg==
X-Received: by 2002:a05:600c:1c0a:b0:407:5b54:bb0c with SMTP id
 j10-20020a05600c1c0a00b004075b54bb0cmr2651100wms.19.1697017878202; 
 Wed, 11 Oct 2023 02:51:18 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00406847c988asm18572733wmb.12.2023.10.11.02.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 02:51:17 -0700 (PDT)
Message-ID: <c242e5e8f32c3b1aa64456deb181a8f02cb66674.camel@rivosinc.com>
Subject: Re: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
From: Rob Bradford <rbradford@rivosinc.com>
To: Atish Kumar Patra <atishp@rivosinc.com>, Alistair Francis
 <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Date: Wed, 11 Oct 2023 10:51:17 +0100
In-Reply-To: <CAHBxVyEO4bPLKM4d90mhM9k33hf2L2zdFk7qDtenv3-2d8YNfg@mail.gmail.com>
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-3-rbradford@rivosinc.com>
 <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
 <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
 <CAKmqyKNrmnUTHxx_wYe0V6sL0M10hkwOGYakGw1E6pu17YyMKQ@mail.gmail.com>
 <CAHBxVyEO4bPLKM4d90mhM9k33hf2L2zdFk7qDtenv3-2d8YNfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.module_f38+16987+774193ea) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 2023-10-09 at 11:00 -0700, Atish Kumar Patra wrote:
> On Sun, Oct 8, 2023 at 5:58=E2=80=AFPM Alistair Francis
> <alistair23@gmail.com> wrote:
> >=20
> > On Wed, Oct 4, 2023 at 7:36=E2=80=AFPM Rob Bradford
> > <rbradford@rivosinc.com> wrote:
> > >=20
> > > Hi Atish,
> > >=20
> > > On Tue, 2023-10-03 at 13:25 -0700, Atish Kumar Patra wrote:
> > > > On Tue, Oct 3, 2023 at 5:51=E2=80=AFAM Rob Bradford
> > > > <rbradford@rivosinc.com>
> > > > wrote:
> > > > >=20
> > > > > There is no requirement that the enabled counters in the
> > > > > platform
> > > > > are
> > > > > continuously numbered. Add a "pmu-mask" property that, if
> > > > > specified, can
> > > > > be used to specify the enabled PMUs. In order to avoid
> > > > > ambiguity if
> > > > > "pmu-mask" is specified then "pmu-num" must also match the
> > > > > number
> > > > > of
> > > > > bits set in the mask.
> > > > >=20
> > > > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > > > ---
> > > > > =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > > > =C2=A0target/riscv/cpu_cfg.h |=C2=A0 1 +
> > > > > =C2=A0target/riscv/pmu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++=
++--
> > > > > =C2=A03 files changed, 15 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > index 9d79c20c1a..b89b006a76 100644
> > > > > --- a/target/riscv/cpu.c
> > > > > +++ b/target/riscv/cpu.c
> > > > > @@ -1817,6 +1817,7 @@ static void
> > > > > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > > > > =C2=A0static Property riscv_cpu_extensions[] =3D {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* Defaults for standard extensions */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pmu-num", RISCVCPU, c=
fg.pmu_num, 16),
> > > > > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.=
pmu_mask,
> > > > > 0),
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, c=
fg.ext_sscofpmf,
> > > > > false),
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("Zifencei", RISCVCPU, c=
fg.ext_ifencei,
> > > > > true),
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.=
ext_icsr, true),
> > > > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > > > index 0e6a0f245c..40f7d970bc 100644
> > > > > --- a/target/riscv/cpu_cfg.h
> > > > > +++ b/target/riscv/cpu_cfg.h
> > > > > @@ -124,6 +124,7 @@ struct RISCVCPUConfig {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_XVentanaCondOps;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t pmu_num;
> > > > > +=C2=A0=C2=A0=C2=A0 uint32_t pmu_mask;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 char *priv_spec;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 char *user_spec;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 char *bext_spec;
> > > > > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > > > > index 13801ccb78..f97e25a1f6 100644
> > > > > --- a/target/riscv/pmu.c
> > > > > +++ b/target/riscv/pmu.c
> > > > > @@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState
> > > > > *env,
> > > > > uint64_t value, uint32_t ctr_idx)
> > > > > =C2=A0void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
> > > > > =C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > > > > +=C2=A0=C2=A0=C2=A0 uint32_t pmu_mask =3D cpu->cfg.pmu_mask;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if (pmu_mask && ctpop32(pmu_mask) !=3D pmu_nu=
m) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Mis=
match between number of enabled
> > > > > counters in "
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "\"pmu-mask\" and \"pmu-num\"");
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > >=20
> > > > Is that necessary for the default case? I am thinking of
> > > > marking
> > > > pmu-num as deprecated and pmu-mask
> > > > as the preferred way of doing things as it is more flexible.
> > > > There is
> > > > no real benefit carrying both.
> > > > The default pmu-mask value will change in that case.
> > > > We can just overwrite pmu-num with ctpop32(pmu_mask) if pmu-
> > > > mask is
> > > > available. Thoughts ?
> > > >=20
> > >=20
> > > I agree it makes sense to me that there is only one way for the
> > > user to
> > > adjust the PMU count. However i'm not sure how we can handle the
> > > transition if we choose to deprecate "pmu-num".
> > >=20
> > > If we change the default "pmu-mask" to MAKE_32BIT_MASK(3, 16)
> > > then that
> > > value in the config will always be set - you propose that we
> > > overwrite
> > > "pmu-num" with the popcount of that property. But that will break
> > > if
> >=20
> > Couldn't we deprecate "pmu-num" and then throw an error if both are
> > set? Then we can migrate away from "pmu-num"
> >=20
>=20
> Yeah. pmu-num should be only available as a command line property and
> marked deprecated.
> If only pmu-num is set, it gets converted to a mask and throws a
> warning
> that this is a deprecated property.

Is there a way to know the property has been set by the user? I
couldn't see anything in the API - do we just have to assume that if
the value is not the default then it has been changed by the user?

Cheers,

Rob

> If only the pmu-mask is set, nothing additional is needed. These
> patches are sufficient.
> If nothing is set, the pmu-mask will be set to MAKE_32BIT_MASK(3,
> 16).
> If a CPU init code uses pmu-num, we should change it to mask. The
> upstream code
> doesn't have any other usage. Any downstream user will have to move
> away from pmu-num
> once this series is merged.
>=20
> > Alistair
> >=20
> > > the user has an existing setup that changes the value of "pmu-
> > > num"
> > > (either as a property at runtime or in the CPU init code).
> > >=20
> > > One option would be to not make the mask configurable as property
> > > and
> > > make choosing the layout of the counters something that the
> > > specialised
> > > CPU init can choose to do.
> > >=20
> > > Cheers,
> > >=20
> > > Rob
> > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3))=
 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp,=
 "Number of counters exceeds maximum
> > > > > available");
> > > > > @@ -449,6 +456,10 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > > > > **errp)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > -=C2=A0=C2=A0=C2=A0 /* Create a bitmask of available programmable=
 counters
> > > > > */
> > > > > -=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pm=
u_num);
> > > > > +=C2=A0=C2=A0=C2=A0 /* Create a bitmask of available programmable=
 counters
> > > > > if none
> > > > > supplied */
> > > > > +=C2=A0=C2=A0=C2=A0 if (pmu_mask) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =
=3D pmu_mask;
> > > > > +=C2=A0=C2=A0=C2=A0 } else {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =
=3D MAKE_32BIT_MASK(3, pmu_num);
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0}
> > > > > --
> > > > > 2.41.0
> > > > >=20
> > >=20
> > >=20


