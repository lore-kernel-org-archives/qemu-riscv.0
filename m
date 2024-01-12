Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F77C4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 16:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOKnO-0005Qi-EF; Fri, 12 Jan 2024 11:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rOKnN-0005Q4-IS
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 11:54:13 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rOKnL-0005kQ-EZ
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 11:54:13 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3376555b756so3846208f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705078449; x=1705683249;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Wa5lcaVnSMCaKjFP8eBbZ/pS/ZZdaoRW9vHVCkmxAkM=;
 b=0cMd2BBkSGdEuNd+DdPgbP3LWjQoHns/4mRUvYGLAgrqNjq/65t6VTuqIdd8HgW+9B
 JnnMbYM03lvbcGwgpw9xd0Opk+F2L42t+mruwGMGjULPnYg8pRekSmGgnp5z4Yu9eoWO
 7AI23ofFvaXscHppjsMFJqO+6kg8zf/uOUacxHnEODB2FnWy2ltKVLSRKeglS3cYj5QE
 a6HeSrTIy/fTukoU+GgewHTEz4GyXk1ZiFoFyu8GPW/o41J9so3TmhduG6LjIUHcD200
 RNNCUU262DvcVhlYq4ZdBNttji1QZHNSL6WHSUmut4FKX/tzHSdmoNmW/3ElAXkcxV+D
 JxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705078449; x=1705683249;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wa5lcaVnSMCaKjFP8eBbZ/pS/ZZdaoRW9vHVCkmxAkM=;
 b=FyG5fiLGl/mXZlDl7yArFDoZOiXpnc+ULRQdqlzW5md26butgUp7gPqFGusY3WS2T7
 KjMKsaBdIjYfrVDs2J+XET2GSW4WKqYBGipwTe6hdx5h5VFDEjEa9aH8ZyJTPwk/GYkG
 D1j6Kqu9cHI1m6sTbVrbjJXdnny0ZG/aHP3kPdQrJb7Bmv04NySNTeHF9ebZRHZ66v9L
 1BjnPARWp/E40I6+AhDKQ7OBlM+5h3p9VYR3hY17ET7KPvsk3wiCYuWCaDISe48Ev/TM
 CmFwI0vozxZtMs8Im4wwC/Wr+YwBlfWaMM4EA9zwPBtAhzFeZsDxph9X8NTaLjRmWmRA
 vnjA==
X-Gm-Message-State: AOJu0YzO0CO9TI8fN1zFgjxaMA1gWJYux1KsWDtguRWKgcs8CLMlGoC2
 bBPjpBnLcOCFf2W3A0HqbfiydbmOrUb0Zg==
X-Google-Smtp-Source: AGHT+IEKK3jDFutqLa/46AnP5Pk+3WHjHLbaZ0oNySs93zRtUKWXScrwek4WOCfYEVz/CxTRBeD8Hw==
X-Received: by 2002:a05:6000:1186:b0:337:4758:43fc with SMTP id
 g6-20020a056000118600b00337475843fcmr894052wrx.60.1705078449176; 
 Fri, 12 Jan 2024 08:54:09 -0800 (PST)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d4c85000000b003367ff4aadasm4362376wrs.31.2024.01.12.08.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 08:54:08 -0800 (PST)
Message-ID: <7461190fbece351f916eccd258bf62b86227927d.camel@rivosinc.com>
Subject: Re: Re: Re: [PATCH 1/3] target/riscv: Add infrastructure for 'B'
 MISA extension
From: Rob Bradford <rbradford@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,  ved@rivosinc.com
Date: Fri, 12 Jan 2024 16:54:08 +0000
In-Reply-To: <20240112-d9e3cc215a7a68c5189908bf@orel>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-2-rbradford@rivosinc.com>
 <20240111-585fe1291fcaa1e0432674e3@orel>
 <20240111-df7a6acf3109b630469591a1@orel>
 <3dbd3fa1cbad80948175f98dcc0c76b886e2376e.camel@rivosinc.com>
 <20240112-d9e3cc215a7a68c5189908bf@orel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 2024-01-12 at 17:08 +0100, Andrew Jones wrote:
> On Thu, Jan 11, 2024 at 03:17:25PM +0000, Rob Bradford wrote:
> > + Ved
> >=20
> > On Thu, 2024-01-11 at 14:14 +0100, Andrew Jones wrote:
> > > On Thu, Jan 11, 2024 at 02:07:34PM +0100, Andrew Jones wrote:
> > > > On Tue, Jan 09, 2024 at 05:07:35PM +0000, Rob Bradford wrote:
> > > > > Add the infrastructure for the 'B' extension which is the
> > > > > union
> > > > > of the
> > > > > Zba, Zbb and Zbs instructions.
> > > > >=20
> > > > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > > > ---
> > > > > =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 5 +++--
> > > > > =C2=A0target/riscv/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 +
> > > > > =C2=A0target/riscv/tcg/tcg-cpu.c | 1 +
> > > > > =C2=A03 files changed, 5 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > > index b07a76ef6b..22f8e527ff 100644
> > > > > --- a/target/riscv/cpu.c
> > > > > +++ b/target/riscv/cpu.c
> > > > > @@ -38,9 +38,9 @@
> > > > > =C2=A0#include "tcg/tcg.h"
> > > > > =C2=A0
> > > > > =C2=A0/* RISC-V CPU definitions */
> > > > > -static const char riscv_single_letter_exts[] =3D
> > > > > "IEMAFDQCPVH";
> > > > > +static const char riscv_single_letter_exts[] =3D
> > > > > "IEMAFDQCBPVH";
> > > >=20
> > > > Is there a corresponding proposed change to table 29.1 of the
> > > > nonpriv spec
> > > > which states B comes after C and before P? If so, can you
> > > > provide a
> > > > link
> > > > to it? Otherwise, how do we know that?
> > >=20
> > > Oh, I see. The unpriv spec B chapter comes after the C chapter
> > > (and
> > > before
> > > J, P, ...). I still wonder if we'll have a 29.1 table update with
> > > the
> > > ratification of this extension though.
> > >=20
> > >=20
> >=20
> > I agree it's a bit confusing - but the order is established by the
> > table in the unprivileged spec and the table explanation also makes
> > this clear.
> >=20
> > """
> > Table 27.1: Standard ISA extension names. The table also defines
> > the
> > canonical order in which
> > extension names must appear in the name string, with top-to-bottom
> > in
> > table indicating first-to-last
> > in the name string, e.g., RV32IMACV is legal, whereas RV32IMAVC is
> > not.
> > """
>=20
> Yes, this is the table I was referring to when I referenced "table
> 29.1 of
> the nonpriv spec". Since there's a chance I was looking at too old a
> spec
> I've now gone straight to the source,
>=20
> https://github.com/riscv/riscv-isa-manual/blob/main/src/naming.adoc
>=20
> but I still don't see B there. Do you see B in the table you're
> looking
> at?
>=20
> >=20
> > The proposed B specification does not make any remarks about the
> > ordering in the ISA definition string. [1] I would worry there
> > would be
> > a lot of software churn if this ordering were to be changed.
>=20
> The ordering shouldn't change, but I can't see where it's documented
> (beyond the B chapter coming after the C chapter).

I'm using table 27.1 in the published PDF which is the PDF in this
release:=20
https://github.com/riscv/riscv-isa-manual/releases/tag/Ratified-IMAFDQC
It looks like it was removed in this commit (which is a set of
backports):

https://github.com/riscv/riscv-isa-manual/commit/6ecd735338241583d53396b706=
5eab7c9ace68aa

Cheers,

Rob
>=20
> Thanks,
> drew



