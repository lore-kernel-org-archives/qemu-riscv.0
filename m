Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE70DC25B75
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 May 2024 09:23:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6oN8-0006VH-KD; Tue, 14 May 2024 05:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s6oN5-0006Q5-Lv
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 05:22:55 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s6oN3-0005Zg-Kl
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 05:22:55 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59e4136010so1375798166b.3
 for <qemu-riscv@nongnu.org>; Tue, 14 May 2024 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715678572; x=1716283372; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQqtgD0BAbOpn3bhvamG0qImrAv7heRdXbr5/huWwMA=;
 b=k4jNm+W/tEMmRFfJ4jgDomcD0a/P/bd5Brt5KicZiI2WkQqTWgHtNDynW5hQIXj1bE
 ceIW1iH0Id+Rpatou0VesxLacBUIl37A/CJYbsLPF8urh4ewtGCx0fjT4K9JIO0WUWlA
 eksDt+dysl5V9hH9x5SnddirdjJVPR3G3gw4BdTeXhtzSMQwcW+OvwPPRqpBJji8KYun
 BohKde2a0jvg6fDVjQ1GmitH3q4upvfCQccXRrbXa+bcYJoQ0nhowD6o4Qm/xK0E5fP+
 NH1v+Tp12MxEgqOfBOp0iVY0ERBcqUm1MVZE1SNawV1jwNxUlu7lN7H/nWu/rUErdzbj
 LORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715678572; x=1716283372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQqtgD0BAbOpn3bhvamG0qImrAv7heRdXbr5/huWwMA=;
 b=WSpWzmpaZujJ6ToUnXMrkIfh9Fq++HfZX/MASUIVEAqRQiP7ze6MjyjYciKGFBseoI
 e20CvGV6jAspjNeZf7lNgesAT69vnDSGX0gDXJfSBGb7la1d9mrCUGxDojNaWoIMiSWA
 +h3ZGEmOJRwuBXPZ9rV2Cjpbqq4FROu0bJ+mqGSAZxf2NkCaYUmBqpUVxtDSLZOmnPqP
 0M7bVx2zad+jR2ZNY8K5S45bbwZqcl++aMS8OhB4zDNvbXiDZJeU16RH/x5XGnF6hfFi
 nz6W73IIa8QdByzLFflGnTZ5DS8GnR9Hz91Qq/sp8UMUOraKk2wqPnPZoEZVNHc5fMyV
 zXKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLKsyAFCylGzYh1rPhz6WS8jR7zspr1Wxi9SIPc1PrGKWftsQuFTXIOn+siiSFCuD4SMVATM+Tph8h1kjFSTRVT8GueOw=
X-Gm-Message-State: AOJu0YzqCPSV6qEEtwhX+bAcBxcM+irWGePUA6RZp0x7mwphwTQpWehx
 FVFHzGf5h5UG6b+6daidguwdjx371noTf65rN0ifzcZFF/SFEks1fgZ4MMwvEqk+eVMBOyjcmXC
 8wALY9c6Enlr8+Hr6L7G3hD4z6ePQhaJyzTGJlg==
X-Google-Smtp-Source: AGHT+IEzaz0xIgkU+cMY+UYAZ8vU19SWKEFKsG/YhSczKL3pU62vvZ6VioSCQniszBpNYcXB5h1qLuegmj+5EwHomPg=
X-Received: by 2002:a05:6402:1746:b0:573:50a6:d3b0 with SMTP id
 4fb4d7f45d1cf-57350a6d402mr7933301a12.3.1715678571755; Tue, 14 May 2024
 02:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
 <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
 <20240513023110-mutt-send-email-mst@kernel.org>
 <CAKmqyKP1fmvyNsY0uXasK7jdHK9C_cizJdiqivK=Nxtfo37OxA@mail.gmail.com>
In-Reply-To: <CAKmqyKP1fmvyNsY0uXasK7jdHK9C_cizJdiqivK=Nxtfo37OxA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2024 10:22:39 +0100
Message-ID: <CAFEAcA-cF7EXRd1VZAJ=ApuBuU8=zkjhLAKkcbms9wqJy_WObA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] qtest: allow SPCR acpi table changes
To: Alistair Francis <alistair23@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, imammedo@redhat.com, 
 anisinha@redhat.com, shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 13 May 2024 at 11:36, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Mon, May 13, 2024 at 4:32=E2=80=AFPM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Mon, May 13, 2024 at 01:55:50PM +1000, Alistair Francis wrote:
> > > On Tue, May 7, 2024 at 3:24=E2=80=AFPM Sia Jee Heng
> > > <jeeheng.sia@starfivetech.com> wrote:
> > >
> > > Can you describe why you are doing this and that it will be reverted
> > > in the commit message?
> > >
> > > Alistair
> >
> > What motivation are you asking? This follows the normal acpi test updat=
e
> > procedure.
>
> I find it clearer to have commits describe that they are disabling
> tests for a specific reason. That way it's easier to track what's
> going on.
>
> If ACPI test updates don't usually do that then that's fine with me

The only reason for the existence of this ignore-these-blobs file
is for the purpose of the commit sequence:
 * add the blobs to the whitelist
 * make a change that alters what the expected blobs are
 * regenerate the golden-reference blobs and remove the items
   from the whitelist

So we don't usually say much in the commit that is adding a blob
to the whitelist.

thanks
-- PMM

