Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F5C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 06:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRnNP-0002LH-7B; Mon, 22 Jan 2024 01:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRnNN-0002KY-IY; Mon, 22 Jan 2024 01:01:41 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRnNM-00082J-0z; Mon, 22 Jan 2024 01:01:41 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-467010c1c72so1728764137.0; 
 Sun, 21 Jan 2024 22:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705903298; x=1706508098; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omvBBLY6VyD2J5FDeIIr7uHDzzWC1Lf8wzbt0zFmFYI=;
 b=iWqAnF7mFAMqY+ogShNMZiC6FGRUrj2y4EysuJnu7iZd6RVcCCbOuvcfOq328iKgsL
 v8Kg34A2ue1Wr67TS8fihGFzmxB6RGldVuFUBKX+yD/x1yjdYofx8t/GWAToMNlQoRwN
 cEqJQSnlly0Ye55q1/DV7J/c/MIL1i6eamrA/sh2ie2rg0QN0AkfKe8XSJDRaBJdduoX
 V5bD6w7QAS1JjXIPnGY3isWQDM40dLky83uittjkjdwhh7fhZSRYwlJrIC+rSYmMn8mg
 dY2B2OvfNwZSkMhm5Uxi28jxOBp+FxQ0DNKub6xtzMz1Khl5iwHbC7L7y2AStT3unIs6
 p7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705903298; x=1706508098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omvBBLY6VyD2J5FDeIIr7uHDzzWC1Lf8wzbt0zFmFYI=;
 b=lZWlWblDZoFDrZ30s5JXGwdRFlft3szGggBPiPyhetZ1colSYz4NPifVre8SpYzrcb
 iHXbXBvaG1J6C8mwhirfWy9AlNQ1eqWVPzdGG9Qs6VXJIcCbYL7sN5WD8RmQfNjdUplZ
 4b89+9i+k6r9bun0vXq2wllrb44+QkA1Rn7GYn9nu0Ei67ZWWPGuLmNivYCJgh5Kk6JH
 I7R8lTvuT4D8zjG5DQrXZCbuVz97vxNFazhIbd4ehxQ54azdbSheZbIekTqtmLYS1V0b
 TMXzMCnrVzO0TUc6YAuppjxhhrwvuBO9l71e3fLMEcnlfgWPpgpB+5xvKG/EOsO0tTEt
 GCBg==
X-Gm-Message-State: AOJu0YzsyhB4CbU1++Fo+lvRutdNECHLQjHCjqOgkxccJzpwofpGDBDN
 b7vg2KMJXmj+RMY8wVGRgfE+aXNHF7g3OEFtEjXUcGzqAmBvA4+QxuDF/9v9ba3JkTdf+GebDZR
 YvF0BRh0K7jPOeVqTYkZ3Dchpd4c=
X-Google-Smtp-Source: AGHT+IEXuN9WgTiBlNyHBL7pH7ntgNwMsDcQwJMPPuI/2966hO5IVe2YVEsp7a8UgA+LHMh0yMv32G7/f2lp6Jt71J4=
X-Received: by 2002:a05:6102:759:b0:469:9473:66dd with SMTP id
 v25-20020a056102075900b00469947366ddmr2788741vsg.16.1705903298471; Sun, 21
 Jan 2024 22:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20231122053251.440723-1-ethan84@andestech.com>
 <CAKmqyKO9nGLo2b0TamakNh4qRr+Bi8NQ973bQ=ch8=CKoH-etg@mail.gmail.com>
 <ZYPdY38SqIE7/eoz@ethan84-VirtualBox>
In-Reply-To: <ZYPdY38SqIE7/eoz@ethan84-VirtualBox>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 16:01:12 +1000
Message-ID: <CAKmqyKN2NAmmWiH1eUy8Hf+V0-5ENTjews5o0VzPDfySt_nqgw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Support RISC-V IOPMP
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Thu, Dec 21, 2023 at 4:38=E2=80=AFPM Ethan Chen <ethan84@andestech.com> =
wrote:
>
> On Mon, Dec 18, 2023 at 02:18:58PM +1000, Alistair Francis wrote:
> > On Wed, Nov 22, 2023 at 3:36=E2=80=AFPM Ethan Chen via <qemu-devel@nong=
nu.org> wrote:
> > >
> > > This series implements IOPMP specification v1.0.0-draft4 rapid-k mode=
l.
> > > The specification url:
> > > https://github.com/riscv-non-isa/iopmp-spec/blob/main/riscv_iopmp_spe=
cification.pdf
> > >
> > > When IOPMP is enabled, a DMA device ATCDMAC300 is added to RISC-V vir=
t
> > > platform. This DMA device is connected to the IOPMP and has the funct=
ionalities
> >
> > I don't think we want to add an Andes DMA device to the virt machine.
> >
> > I can't even find the spec for the ATCDMAC300, which isn't great
> >
> > Alistair
>
> Since the IOPMP does not take effect when there is no other device connec=
ts to
> IOPMP, I think it is necessary to have a DMA device for IOPMP demonstrati=
on.

That is true, but that device shouldn't be a vendor specific device
for the virt machine.

>
> Do you have any suggestions for supporting IOPMP on RISC-V virt machine?

A RVI device would be fine. Otherwise something that has become a
defacto standard by being commonly used (the SiFive PLIC for example).

I really don't think it should be some vendor IP, especially one that
doesn't have a public datasheet.

You could add an Andes machine that can use your vendor IP. Otherwise
we can look at adding IOPMP and not connecting it, but that is a pain.

What is the IOPMP spec group doing for testing?

Alistair

