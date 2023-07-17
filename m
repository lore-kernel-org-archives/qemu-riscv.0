Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461E2EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 15:13:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLPun-0003ab-Hh; Mon, 17 Jul 2023 11:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qLPue-0003XW-E5
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 11:13:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qLPuN-0007Xs-QF
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 11:13:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742eso48601555e9.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jul 2023 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689606785; x=1692198785; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h3o+V93CFEyVod0W339jSGHcaYLMMNPwhfES1kUGhic=;
 b=WyjZU6Ip6K9dXu8vb057CckEppqaAx7iI8S/XNlcY2VheHp/+OlWsPE8kusswNZU/M
 X3X4brwrH29qZYHmXtkZzkDLaBu6Z520FKGa7E1dXL55k9UpLj/kL7EoOkYkWbdFJBwL
 O5KMi9+ZdEtKEDI7dAt95tmh0muLrcbge146pHGTMh9FA3Mm/vZr/ZR1rAxTf6zYjvLn
 molTrx8GiF+SmyXWB3IOHmIms/HZRGwc8oBxajezNrLoToP47hRU3LJbz4KucfdL6Zng
 hJyC6zI9FEPrbmB0jbJSIGvhjElQsSuOrqTyKuu5KuNl+UvPNiL7Qje2MBnTkaSY7aLn
 IofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689606785; x=1692198785;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h3o+V93CFEyVod0W339jSGHcaYLMMNPwhfES1kUGhic=;
 b=GMlEQZIY8ioeX3Kd6DB7wujvwMk58SWzWAckw1KwDVmZZ+FEZTYyaVDY71zIdyQZaX
 fyxwjidfxtyN+D1OTurxqSlLWBUfCAuhLMkIGrcyNGJmLVWBwMp8psxr+buCIAcwJl7Z
 XjRfCi92STRYNrmjUheH/hiTdy4fbfYhIT1mpUj3dgScu+AT3qIboKeJLlO5ZAyCUAbB
 WvUQa5dCLTjN6MVin0IABnu+kl68kyClUr9fvvLDBEbDuCNeS01ykii1FzTQUc0Itwdw
 b2ifAFcBKbL/M6S7FrDhdTjLm9MvC+ya30pUSthv4pWmxgKGfznfIKpVcLk5hjWj+Hii
 Dk4w==
X-Gm-Message-State: ABy/qLZCj1llkTeSVsxjJhnwF7twrSwGkP/ByS0hEXlEDgfxFYkMUVzH
 d2z/gpUFV+rnZG10seBMp+THjQ==
X-Google-Smtp-Source: APBJJlF7PjVOtLpUI8BZsSHVAOUYbtwBkbrxrTjudEQneQI4qmilc8G5CC01Pwu4NbhCFmUEJZ6CTA==
X-Received: by 2002:a05:600c:213:b0:3f7:cb42:fa28 with SMTP id
 19-20020a05600c021300b003f7cb42fa28mr10770140wmi.28.1689606785324; 
 Mon, 17 Jul 2023 08:13:05 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a5d558a000000b0030fb828511csm19389140wrv.100.2023.07.17.08.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 08:13:04 -0700 (PDT)
Message-ID: <7a102598badfaa01b0e0c04e4f59e81eac5a2b81.camel@rivosinc.com>
Subject: Re: [PATCH] target/riscv: Fix LMUL check to use minimum SEW
From: Rob Bradford <rbradford@rivosinc.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>
Date: Mon, 17 Jul 2023 16:13:04 +0100
In-Reply-To: <dfc75d1f-f28d-7d2c-26f9-72086ffb54ca@iscas.ac.cn>
References: <20230706104433.16264-1-rbradford@rivosinc.com>
 <dfc75d1f-f28d-7d2c-26f9-72086ffb54ca@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.module_f38+16987+774193ea) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 2023-07-06 at 21:22 +0800, Weiwei Li wrote:
>=20
> On 2023/7/6 18:44, Rob Bradford wrote:
> > The previous check was failing with:
> >=20
> > ELEN =3D 64 SEW =3D 16 and LMUL =3D 1/8 (encoded as 5) which is a valid
> > combination.
> >=20
> > Fix the check to correctly match the specification by using minimum
> > SEW
> > rather than the active SEW.
> >=20
> > =C2=A0From the specification:
> >=20
> > "In general, the requirement is to support LMUL =E2=89=A5 SEWMIN/ELEN,
> > where
> > SEWMIN is the narrowest supported SEW value and ELEN is the widest
> > supported SEW value. In the standard extensions, SEWMIN=3D8. For
> > standard
> > vector extensions with ELEN=3D32, fractional LMULs of 1/2 and 1/4
> > must be
> > supported. For standard vector extensions with ELEN=3D64, fractional
> > LMULs
> > of 1/2, 1/4, and 1/8 must be supported."
> >=20
> > =C2=A0From inspection this new check allows:
> >=20
> > ELEN=3D64 1/2, 1/4, 1/8 (encoded as 7, 6, 5 respectfully)
> > ELEN=3D32 1/2, 1/4 (encoded as 7 and 6 respectfully)
>=20

Hi Weiwei Li,

Thanks for your reply. Sorry for delay in replying i've been away.

> This is a little confusing.=C2=A0 there is=C2=A0 note in spec to explain =
why=C2=A0
> LMUL=20
> =E2=89=A5 SEW MIN /ELEN:
>=20
> "When LMUL < SEW MIN /ELEN, there is no guarantee an implementation=20
> would have enough bits in the fractional vector register to store
>=20
> Note at least one element, as VLEN=3DELEN is a valid implementation=20
> choice. For example, with VLEN=3DELEN=3D32, and SEW MIN =3D8, an LMUL of
>=20
> 1/8 would only provide four bits of storage in a vector register."
>=20
> In this way, when VLEN=3DELEN=3D64,=C2=A0 an LMUL of 1/8 would only provi=
de 8=20
> bits of storage in a vector register, so it's also not suitable for
> sew=20
> =3D 16.
>=20
> Maybe we can explain the above description of the spec in another
> way:=20
> we must support lmul=3D1/8 when ELEN=3D64, but it's only available when
> sew =3D 8.
>=20

I'm afraid i'm not sure I agree with this comment.

VLEN=3D128 ELEN=3D64 SEW=3D16 LMUL=3D1/8 is a perfectly reasonable
configuration and contradicts your statement.

The goal of my patch was to ensure that we permit a valid configuration
not to also reject other invalid configurations.

An extra check that takes into consideration VLEN would also make sense
to me:

e.g. VLEN=3D64 LMUL=3D1/8 SEW=3D16 should be rejected

Cheers,

Rob

> Regards,
>=20
> Weiwei Li
>=20
> `
>=20
> Regards,
>=20
> Weiwei Li
>=20
> >=20
> > Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure
> > instructions")
> >=20
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> > =C2=A0 target/riscv/vector_helper.c | 4 ++--
> > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/riscv/vector_helper.c
> > b/target/riscv/vector_helper.c
> > index 1e06e7447c..8dfd8fe484 100644
> > --- a/target/riscv/vector_helper.c
> > +++ b/target/riscv/vector_helper.c
> > @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env,
> > target_ulong s1,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xlen - 1 -
> > R_VTYPE_RESERVED_SHIFT);
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lmul & 4) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Fractional LMUL. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Fractional LMUL - check =
LMUL >=3D ELEN/SEW_MIN (8) */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lmul =3D=3D =
4 ||
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
->cfg.elen >> (8 - lmul) < sew) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
->cfg.elen >> (8 - lmul) < 8) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 vill =3D true;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20


