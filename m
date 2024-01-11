Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E117C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 15:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNwoG-0003jc-I7; Thu, 11 Jan 2024 10:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNwoE-0003ih-M2
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 10:17:30 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNwoC-0003XA-Qk
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 10:17:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337874b8164so560701f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 07:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704986246; x=1705591046;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8QYhKldxNt1TMQmAu9UVIDbUbhZ82SeG1htSGPK80fY=;
 b=jSpMa4Dk4F1yIxcHPbyG3mnEqBCs9T72ZNqIkf0fsPekNxuZW9Oi6J264weqUPf3/+
 o3IIZZ5/NSiFCh1oNuOjuYTKbJAYYdRyLgtFlbC1WP4uIDzi2lwCofrlnC97lBkJXjk4
 Kpd69Z4/sR1UEX7cYW8fZOh4yOM3dQv5P2Zc5GYtNEyc00zXaSUGI3oYAbVGymAgkNq4
 7oIqiMrF/IJmgdTMQwYJ464J8LC2wi16swrq27XH+cwgaMb/p4cP5yLSVTMUdN2inN1+
 BCJFXnFwYIBUXrVN4g1Ly0jwvTeDdSjhz4vXZxVX9H7XNr30mcxQSR2e0W/9QLeJK2yZ
 v9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704986246; x=1705591046;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8QYhKldxNt1TMQmAu9UVIDbUbhZ82SeG1htSGPK80fY=;
 b=Y23zP20BMNmObgx80RnZk5BxDxDq/neC+zz8nfFxZ2LWEXTQukSzp0fg1x5IFfWV+k
 pcKTJFu93F1k68L/9q2sSytTkRp84MrVuF7s0+2ma3MDvdnJXsmWBjaIQj5cqb2Q8LBJ
 PiQT789+6Q1wv9yqdB10JCI0DimYkaNdky3FIZX1Gs7z8gFc7hH3Ce49s63YmkxiwTYV
 y2KSWL4Tn7h8MIj81cqbpFNnztBx+SlH4H1/2fAY+oDb8XQFJ9vJr0V05CbXTMH9gKJ3
 H86ybM6XlFVB+NveQDpK52FatSVBq2Va7wEx6HVU7FoyH6+eTNwlgBtUgwIAwfoG457f
 3TGg==
X-Gm-Message-State: AOJu0YzcONGiV8vEBEp2Vo5ZpY3ezJQm39p8i7dTFsRcgEVWfMn6MFJY
 hzJNxgSUU6v7PNsQLdYVJjfXtjL4cR8CGA==
X-Google-Smtp-Source: AGHT+IEjFBwMiIciK6FHvVN7rBxQJS6Ez0FpLs2duRGDTsn2QDdq9qJe5PumdCinbi57B9IsWv+djA==
X-Received: by 2002:adf:ef12:0:b0:336:ec3f:fcf5 with SMTP id
 e18-20020adfef12000000b00336ec3ffcf5mr762005wro.49.1704986246418; 
 Thu, 11 Jan 2024 07:17:26 -0800 (PST)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d6603000000b00333404e9935sm1427192wru.54.2024.01.11.07.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 07:17:26 -0800 (PST)
Message-ID: <3dbd3fa1cbad80948175f98dcc0c76b886e2376e.camel@rivosinc.com>
Subject: Re: Re: [PATCH 1/3] target/riscv: Add infrastructure for 'B' MISA
 extension
From: Rob Bradford <rbradford@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,  ved@rivosinc.com
Date: Thu, 11 Jan 2024 15:17:25 +0000
In-Reply-To: <20240111-df7a6acf3109b630469591a1@orel>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-2-rbradford@rivosinc.com>
 <20240111-585fe1291fcaa1e0432674e3@orel>
 <20240111-df7a6acf3109b630469591a1@orel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x42a.google.com
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

+ Ved

On Thu, 2024-01-11 at 14:14 +0100, Andrew Jones wrote:
> On Thu, Jan 11, 2024 at 02:07:34PM +0100, Andrew Jones wrote:
> > On Tue, Jan 09, 2024 at 05:07:35PM +0000, Rob Bradford wrote:
> > > Add the infrastructure for the 'B' extension which is the union
> > > of the
> > > Zba, Zbb and Zbs instructions.
> > >=20
> > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > ---
> > > =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 5 +++--
> > > =C2=A0target/riscv/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 1 +
> > > =C2=A0target/riscv/tcg/tcg-cpu.c | 1 +
> > > =C2=A03 files changed, 5 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index b07a76ef6b..22f8e527ff 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -38,9 +38,9 @@
> > > =C2=A0#include "tcg/tcg.h"
> > > =C2=A0
> > > =C2=A0/* RISC-V CPU definitions */
> > > -static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
> > > +static const char riscv_single_letter_exts[] =3D "IEMAFDQCBPVH";
> >=20
> > Is there a corresponding proposed change to table 29.1 of the
> > nonpriv spec
> > which states B comes after C and before P? If so, can you provide a
> > link
> > to it? Otherwise, how do we know that?
>=20
> Oh, I see. The unpriv spec B chapter comes after the C chapter (and
> before
> J, P, ...). I still wonder if we'll have a 29.1 table update with the
> ratification of this extension though.
>=20
>=20

I agree it's a bit confusing - but the order is established by the
table in the unprivileged spec and the table explanation also makes
this clear.

"""
Table 27.1: Standard ISA extension names. The table also defines the
canonical order in which
extension names must appear in the name string, with top-to-bottom in
table indicating first-to-last
in the name string, e.g., RV32IMACV is legal, whereas RV32IMAVC is not.
"""

The proposed B specification does not make any remarks about the
ordering in the ISA definition string. [1] I would worry there would be
a lot of software churn if this ordering were to be changed.

Cheers,

Rob

> Thanks,
> drew

[1] - https://github.com/riscv/riscv-b

