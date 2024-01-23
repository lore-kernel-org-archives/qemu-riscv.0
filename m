Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A756C47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 05:50:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS9gH-0000VL-1l; Tue, 23 Jan 2024 00:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rS9gF-0000SN-Sq; Tue, 23 Jan 2024 00:50:39 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rS9gE-0000O8-9x; Tue, 23 Jan 2024 00:50:39 -0500
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4670af5bd56so1055245137.2; 
 Mon, 22 Jan 2024 21:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705989037; x=1706593837; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUcrnRCIp0Br/nrkMzLr3eEgSwkJV1baABwfXLYDFys=;
 b=SFxnHey339MkkVWuknFz9h1EJiJv7oPraGp3i3iOAVikMvgJO3TxAFlQIQFuPzXad/
 AzmAtCuXGmJS6yWWs6nlpmEEHEySEh7nItsTAf0yBzHhTQ25G/+MxREp8kjpeqF+Bonf
 MPZAdat97zJMgid6QJtyeVt2eqkFkm6w29cI7ZwMB7uhIZ0L0acX5WHWH5Wrx/6UAwX7
 WlkTwWhEozxf/rsuGue7Z1J/5eu+v4ltaLAQyNrQTYW8j1HbPSMZ4EYD3xq80Rijb3W7
 ikZW1K3IHjJEI1IeaYu5vGJPgShwzt/8nO3547Cm1M1MEX1xY8h3NepkGTHjTCPMEmNb
 dMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705989037; x=1706593837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUcrnRCIp0Br/nrkMzLr3eEgSwkJV1baABwfXLYDFys=;
 b=bCZbX83l4PZI/+wzNnKbtf0Gd5Jyz+JeVcFxxbjTe1IZegMH0koqHEoN7hQ2CDJRXa
 3oVzc5I2chCVDziMC9kYY9XM0kPtLQb6GYbrJaGGF4WSkhcy+11yfIUEmqb8kx8g+TUy
 Dcwzh4LeGTGcf6mnruHZp6V0jPkDw11pk+Auap/+6QM1OWZu3RNhhY+HH21oeWVO1jC/
 4lRrDzAE93PpqMgavi5+Auo67Ul4vx6wLg5UmDQVOMwSLVkNMkzD3Zx0A1ImGD02Qn3u
 zoci7EtBHb8Jp4wPgGq++g/qaMP8OMo5iANtpTxqgsoOj+CADj3+xVMq0t0LnQ7jnoqF
 8N5A==
X-Gm-Message-State: AOJu0YxZjd/7d2shMcUzWT7MVQBJNBseLig+bjF2FnE2y9uPDYuhGHUn
 351ONDZp9wLIxhLnX5n5bDR1K2CyjyVyP5bywVhjt6lqeZ80A/KOzujDtMbAwoYiANq+kvqdIgL
 Up1rPtCxQ2ryzMwKim1lXOoPNceQ=
X-Google-Smtp-Source: AGHT+IHdWEbaLuFeBYNhBk5Tb7U63EZpsd9QU9H5DcYMEyXroxL+xf6fCpM6T5pBNgGBM6BPjtOrqfD0Ye3BUGYqaN8=
X-Received: by 2002:a05:6102:1354:b0:468:df5:2e47 with SMTP id
 j20-20020a056102135400b004680df52e47mr3095876vsl.11.1705989036948; Mon, 22
 Jan 2024 21:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20240110-mold-renovate-256db1b5c70e@spud>
 <CAKmqyKOy19Vy5zm8=9WZmUs3H=aL8Tn49-iXu9LfEHtHJMpadA@mail.gmail.com>
 <20240122-reflex-tinsmith-209b2e56145f@spud>
In-Reply-To: <20240122-reflex-tinsmith-209b2e56145f@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jan 2024 15:50:11 +1000
Message-ID: <CAKmqyKOsUirGVtT_U4ThkZHcbHuphpmF1z0eH841KGNwk6i8pw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] riscv: support new isa extension detection
 devicetree properties
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Mon, Jan 22, 2024 at 10:25=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Jan 22, 2024 at 03:24:19PM +1000, Alistair Francis wrote:
> > On Wed, Jan 10, 2024 at 8:27=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Making it a series to keep the standalone change to riscv_isa_string(=
)
> > > that Drew reported separate.
> > >
> > > Changes in v3:
> > > - g_free() isa_extensions too
> > > - use misa_mxl_max rather than the compile target for the base isa
> > > - add a new patch changing riscv_isa_string() to do the same
> > > - drop a null check that cannot be null
> > > - rebased on top of Alistair's next branch
> >
> > Do you mind rebasing on
> > https://github.com/alistair23/qemu/tree/riscv-to-apply.next again?
> > There was a big re-org recently so lots of rebasing is required
>
> I can, sure. Do you want me to introduce the macro that I mentioned in
> the first patch as a helper for misa_mxl_max -> width conversions when I
> do?

Yes please!

Alistair

>
> Thanks,
> Conor.

