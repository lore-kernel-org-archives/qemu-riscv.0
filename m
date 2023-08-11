Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100A2C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUSnU-0007mA-1R; Fri, 11 Aug 2023 10:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUSnJ-0007j4-7V
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 10:07:13 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUSnH-0006z6-Lj
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 10:07:12 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52364e9daceso2593164a12.2
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691762830; x=1692367630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r7bFbX07yuBBUa5uASnwWdoa6sYiAjx93TaQjSh4YIE=;
 b=IQKCVtmzNx6rQrukzGiTiIBfBH6QZCN7WSa6zPnV9SAVQA3MzJW/3KrkR3oIo9RRhK
 j/Y3Z5jQspsZhsRRw4nOqoMmJ2OuR3ZzHGSjWEjKEN3NMqr2domJn76LIE1ucmN7MMN6
 w07Y7lGvYJBzjvu9ct2DMPN/pR+ZY5xNIBzVmJ0kIL2OEXiNpG44xoror5/16t09mFA/
 zeraHCfxWcZJPK15LCGcHOKdb6sw9Cm+fm197gwiwBamriiqLiosXa7FdUlDbn8gUGx7
 RpuLsGv0KZ1nFes87/Bds8sXCJ2AL+WnQLSFproTWvnejYT/OrIfSkUvDXfff3Jtz5dd
 cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691762830; x=1692367630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7bFbX07yuBBUa5uASnwWdoa6sYiAjx93TaQjSh4YIE=;
 b=DycvzqnLkJEvEaNQ/V7nf7HLuqvge/ybGBSF1z1aLGfHyosQthj5Bz1eTa1PMFZGPm
 5nlNYzWPbCs3wGe2jTSloBvQr1GZgTQYy+rzTK7I912SmpkfG9gnx8r2wOK2ut/jYCwK
 MF7NlyTijqY1Okd/VYhaQ8uG+I5gYOET7+73rsG0byX3w6T32ek9Blx4rYhNgifBLZAI
 xM4uZcHdb4vBNkfUURjPrwGH2o0HIthURxsqZqcUMIrJk4AJrtB7KWjBJfBBTkBqq6bz
 FhvurA5Eh5kP0LRRnwk8Th/uOJBWj3Oeejz2eLWq4Y5ZXFou47OJLtt7A5pTYpJOmH6k
 2pAQ==
X-Gm-Message-State: AOJu0YyxC4V5nvU38ALO5Nw36XeNzwc0q6KX9N6ZQCM1NlaGck5VOhi2
 /bMCitG4wtoOyHRo2dejxElb/RGgsVKH/XVEI9sPwA==
X-Google-Smtp-Source: AGHT+IFiyeP/ZkgFTxAL4bkOACJPV96sNR7bmQDloXzjTkvcOtpyrPdYLzQJHlh/12YphOmC/gn213+jJVj2USfjQiQ=
X-Received: by 2002:aa7:d357:0:b0:51f:f1a4:edc6 with SMTP id
 m23-20020aa7d357000000b0051ff1a4edc6mr1858217edr.37.1691762829896; Fri, 11
 Aug 2023 07:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
 <20230810135050-mutt-send-email-mst@kernel.org>
 <CAFEAcA_B5W5CX7-C_a7iWTL87kpcLsGEjAsqs5t54sgjTKi3Eg@mail.gmail.com>
In-Reply-To: <CAFEAcA_B5W5CX7-C_a7iWTL87kpcLsGEjAsqs5t54sgjTKi3Eg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 15:06:58 +0100
Message-ID: <CAFEAcA8vr-Bk+tPvugTH4DwAk=S_RXiUhrqDytFGg-EyoC9Mmg@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Fri, 11 Aug 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 10 Aug 2023 at 18:51, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> > > In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> > > bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> > > the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> > > the root PCIe bus. Thus, the extended configuration space is not accessible
> > > on "dw-pcie". The issue can be resolved by adding the
> > > PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> > >
> > > Signed-off-by: Jason Chien <jason.chien@sifive.com>
> >
> >
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > I'm not planning another pull before release, hopefully
> > another maintainer can pick it up? Peter?
>
> At the moment I don't have anything intended for 8.1 either,
> so whoever of us does it it would be a 1-patch pullreq...

Also, at this stage in the release cycle it's always worth
asking: is this a regression, or was this bug also in 8.0?

thanks
-- PMM

