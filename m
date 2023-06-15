Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA030EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 15:01:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9oSe-0001Wa-Gn; Thu, 15 Jun 2023 11:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q9oSc-0001Vu-Hd
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 11:00:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q9oSa-00044O-GV
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 11:00:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f8d5262dc8so7229875e9.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Jun 2023 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686841227; x=1689433227; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=e9hoXFihqoav7uigoHf8z1pYQZosKQ81YbYvGxkixvs=;
 b=IO7Z9xYD5coCWV9fozndLQzo68AyRynu9WVYQyr9q5rpD3ONGuj+PQcSdfHkJOebYE
 KmODozhQZxWhqSfthxY6oRHLgViBkfmfMlf+9lOiU6JqoMleGK21Mavw3G6idkqEI4Fa
 F8tT+JXwN6KKplmRN7sV5mGwmL5z9MTruViMZuZ7EihxEHt3XkM3ad9BfoFrImYkzgLg
 4QL8OvYuQAh6d9G2tTAQrWEVptKHUdz2kSzXW22N03L7dmmYolIIATpVeDmri69pDaMw
 rKagNOKWSy+BVmhrSCTG8z+tuQrOCPOdGxbZUCYx23iSG4AtvWJoF9Tb3d7O8MstiMGN
 aNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686841227; x=1689433227;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e9hoXFihqoav7uigoHf8z1pYQZosKQ81YbYvGxkixvs=;
 b=IrGVDHWkNnR0Qs2JVF/Kv0a9GKOwoLKf3onuoNdNpn9OPQ4MsF0NpWsGvrEdqn2DhY
 gzrCtAMPW2nv0ZRIczK8DytbfJHew3qDkgUnzCGVyO0lH3wqmLKv1OiedRY+kP66ulky
 B5jumRERXwfJR7cAv/XhO2QNxitRfn1Nz2Uwcertmb69MUcwHt+t7z3eThCg3pRAwxI+
 0Zh+cdLs1S5ccM3SsqUwkLAEkBRZ8h4Jm723vAM93lCsKO/22XZZimCQ+9NTJkSAfueH
 wglx97qiLAye80ew42qWCmZncZ2vIP7ozrbfZf39TQx8yu4xTKD9y/r58u4Nwj035uCG
 UDOA==
X-Gm-Message-State: AC+VfDzMn//MD4vK4wZPpU0Avo88w1NOuLmxccYTva5DRZo3Dp9CSADF
 RiGl4JgTjJWou0WMHYEcC3P/TQ==
X-Google-Smtp-Source: ACHHUZ6PGFvaYdodPi0YdsCF3xWgPF89IUhWisrlKXbjgi8FcgOOyA2EgcCpmL1UGMLigj2S1Eg4Ow==
X-Received: by 2002:a1c:740b:0:b0:3f7:f4af:5fb3 with SMTP id
 p11-20020a1c740b000000b003f7f4af5fb3mr4217597wmc.9.1686841226761; 
 Thu, 15 Jun 2023 08:00:26 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21290372wru.97.2023.06.15.08.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:00:26 -0700 (PDT)
Message-ID: <51b6de6ac5a6b8b5de9dc40069d95a601f5b2055.camel@rivosinc.com>
Subject: Re: [PATCH v2 1/6] target/riscv: Add properties for BF16 extensions
From: Rob Bradford <rbradford@rivosinc.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Date: Thu, 15 Jun 2023 16:00:25 +0100
In-Reply-To: <e274be8a-a863-8c39-9806-349b37e94b50@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
 <20230615063302.102409-2-liweiwei@iscas.ac.cn>
 <4b6274c6741baf435b5579f5a089c65997a8e0e6.camel@rivosinc.com>
 <e274be8a-a863-8c39-9806-349b37e94b50@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.module_f38+16663+080ec715) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 2023-06-15 at 21:14 +0800, Weiwei Li wrote:
>=20
> On 2023/6/15 20:58, Rob Bradford wrote:
> > On Thu, 2023-06-15 at 14:32 +0800, Weiwei Li wrote:
> > > Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
> > > Add require check for BF16 extensions.
> > >=20
> > > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> > > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > > =C2=A0=C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +++++++++=
+++++++++++
> > > =C2=A0=C2=A0target/riscv/cpu_cfg.h |=C2=A0 3 +++
> > > =C2=A0=C2=A02 files changed, 23 insertions(+)
> > >=20
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 881bddf393..dc6b2f72f6 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -1059,6 +1059,11 @@ void
> > > riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=20
> > > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, R=
VF)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zfbfmin=
 extension depends on F
> > > extension");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (riscv_has_ext(env, RVD) && !riscv_=
has_ext(env, RVF)) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(err=
p, "D extension requires F extension");
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > @@ -1109,6 +1114,21 @@ void
> > > riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=20
> > > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zfbfmi=
n) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfmi=
n extension depends on Zfbfmin
> > > extension");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f=
) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfmi=
n extension depends on Zve32f
> > > extension");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > +=C2=A0=C2=A0=C2=A0 }
> > I don't think this is correct - from the spec:
> >=20
> > "This extension [Zvfbfmin] depends on the Zfbfmin extension and
> > either
> > the "V" extension or the Zve32f embedded vector extension."
> >=20
> > So this should be:
> >=20
> > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfmin && !(cpu->cfg.ext_zve32f =
|| cpu-
> > > cfg.ext_v) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfmin =
extension depends on Zve32f or
> > V
> > extension");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> Zve32f will be enabled when V is enabled. So we can simply check
> Zve32f=20
> here.

Great, thank you for the clarification - I missed that this this
enforced directly above.

Cheers,

Rob

>=20
> Regards,
>=20
> Weiwei Li
>=20
> > Cheers,
> >=20
> > Rob
> >=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfm=
in) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfwm=
a extension depends on Zvfbfmin
> > > extension");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set the ISA extensions, checks shou=
ld have happened
> > > above */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zhinx) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->cfg.ext_z=
hinxmin =3D true;
> > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > index c4a627d335..7d16f32720 100644
> > > --- a/target/riscv/cpu_cfg.h
> > > +++ b/target/riscv/cpu_cfg.h
> > > @@ -75,6 +75,7 @@ struct RISCVCPUConfig {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_svpbmt;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zdinx;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zawrs;
> > > +=C2=A0=C2=A0=C2=A0 bool ext_zfbfmin;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfh;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfhmin;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfinx;
> > > @@ -84,6 +85,8 @@ struct RISCVCPUConfig {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zve64f;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zve64d;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zmmul;
> > > +=C2=A0=C2=A0=C2=A0 bool ext_zvfbfmin;
> > > +=C2=A0=C2=A0=C2=A0 bool ext_zvfbfwma;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zvfh;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zvfhmin;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_smaia;
>=20


