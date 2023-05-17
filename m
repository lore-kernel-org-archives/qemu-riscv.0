Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E8C77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 05:09:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz9Pd-0008Hq-6f; Wed, 17 May 2023 01:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pz9PY-0008Fw-Sf
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 01:09:17 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pz9PX-0001uO-03
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 01:09:16 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-394440f483fso254454b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 16 May 2023 22:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684300153; x=1686892153;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0LGcXlH296J4+eFxjb/29PD902hho12arOh6Al/mKnE=;
 b=hYtKGH012tw5SwWPC8sHc6NJPJcOjshBUwPAVNS1Ynq2ch4qawDl7Sa19at0kavC4W
 N903pIyjDm4Oy1BOlDcfTRkBx5mCE2YalwM8KwmL0mNsdp8jkkL/G2Qnz91yVdJ4kEGQ
 kLzZYbilKD6pkj8/VUclJlJzSojTynA8ehTeRY6dUXEGY2AZWnzCBMRVmvTVv1Z/aMNY
 3M03XcLWOlzJObZSvaozVjH2z66gvg9bTZHemtekQP8s1mUebZlslx3mD7+YkcdbRMPt
 BH7tdk3yNsvzqygqMgsnwODlaCkpCuuFkq1p8RSLvG7bYElfSC6JTbeFPRzMxUHc07TI
 PiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684300153; x=1686892153;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LGcXlH296J4+eFxjb/29PD902hho12arOh6Al/mKnE=;
 b=WLGo9OKcrNW4MC9jQ/VJR64cKZbnNIVuTw3m79sIH4zPURrFeFIA4oBGpjkCIbBhtO
 i5y5C4PwUKkFRswCIHmlvx6S/nYad+j6eIZy/uk5X9S0/oXAY81/sIu33RAPGZI6Vuhi
 lzkJdoXLjSEMdlEA429FAYFI7HjNi5qmpOK7JNY50h5vtcFCvAJzUgIVfKAj7sHrAsrt
 p7JjUWCEhPStrOhFaIfvyimeUov6atEdydKgJwiJeStzvi5fjCinu8A8VV2ER+yohaF+
 T7V4S3VGxg0rF7Uv5SWDFFlPehAhbZhKEYoHDA0HucifM6pJsRYq3MDV9tYhaEjHcqYT
 Vcsw==
X-Gm-Message-State: AC+VfDxguG/ZTWT8ki2gp1xqOb46d4DPDgVGuAQPK+hu1tuPiMPSj0oQ
 GKBMYGhcEnMH08UjTnGnuF/TOg==
X-Google-Smtp-Source: ACHHUZ6pKllL7kBAc4W3GSq9Tvc9DCuWHBtj2wnNs0TymTEYx5mpWiiCiBc70kpm0kXMDbeAzmImQQ==
X-Received: by 2002:aca:a888:0:b0:395:f73c:ce64 with SMTP id
 r130-20020acaa888000000b00395f73cce64mr4890497oie.3.1684300153383; 
 Tue, 16 May 2023 22:09:13 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 bm23-20020a056820189700b005525a7dfb22sm4197648oob.13.2023.05.16.22.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 22:09:13 -0700 (PDT)
Date: Wed, 17 May 2023 10:39:05 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZGRhcYO/2GlA3lnh@sunil-laptop>
References: <20230425102545.162888-1-sunilvl@ventanamicro.com>
 <b520d913-27a9-dea5-53c8-af1cdd967ab2@canonical.com>
 <ZFiRr8d2zyAJlZJv@sunil-laptop>
 <CABJz62OTBEOMzcXLYc=DqRwH8N4DP=o0-kCfALwoREZVyOxLPg@mail.gmail.com>
 <ZFjbwh3CdljaHEZZ@sunil-laptop>
 <CABJz62P3u0d-ggQw-B_6AYTNu8Z9-TOs+UOn2vM8NNV0mQKR+Q@mail.gmail.com>
 <CAKmqyKMDf3F67=_Dq8oFOGG3Ft9hszfB6J2-U9DmSSvK0YKkMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKMDf3F67=_Dq8oFOGG3Ft9hszfB6J2-U9DmSSvK0YKkMg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 17, 2023 at 02:57:12PM +1000, Alistair Francis wrote:
> On Mon, May 8, 2023 at 9:45 PM Andrea Bolognani <abologna@redhat.com> wrote:
> >
> > On Mon, May 08, 2023 at 04:53:46PM +0530, Sunil V L wrote:
> > > On Mon, May 08, 2023 at 03:00:02AM -0700, Andrea Bolognani wrote:
> > > > I think that it's more important to align with other architectures.
> 
> That's true, ideally we want to match what people are already doing.
> 
> > > >
> > > > The number of people currently running edk2 on RISC-V is probably
> > > > vanishingly small, and in my opinion requiring them to tweak their
> > > > command lines a bit is a fair price to pay to avoid having to carry a
> > > > subtle difference between architectures for years to come.
> > >
> > > It is not just tweaking the command line. The current EDK2 will not work
> > > anymore if code is moved to plfash 0 since EDK2 assumed its entry point
> > > is in pflash1. I agree there may not be too many users but if we have
> > > to align with other archs, there will be combinations of qemu and
> > > edk2 versions which won't work.
> >
> > Right.
> >
> > > > With that in mind, my preference would be to go back to v1.
> > >
> > > Thanks!. If this is the preference,  we can request people to use proper
> > > versions of EDK2 with different qemu versions.
> >
> > Yeah, in the (not so) long run this will just not matter, as the
> > versions of edk2 and QEMU available to people will all implement the
> > new behavior. Better to optimize for the long future ahead of us
> > rather than causing ongoing pain for the sake of the few users of a
> > work-in-progress board.
> >
> > > > Taking a step back, what is even the use case for having M-mode code
> > > > in pflash0? If you want to use an M-mode firmware, can't you just use
> > > > -bios instead? In other words, can we change the behavior so that
> > > > pflash being present always mean loading S-mode firmware off it?
> 
> It was originally added to support Oreboot (the Rust version of
> Coreboot). The idea was that Oreboot (ROM) would be in flash and then
> go from there.
> 
> It also applies to other ROM code that a user might want to test that
> runs before OpenSBI.
> 
> > >
> > > TBH, I don't know. I am sure Alistair would know since it was added in
> > > https://github.com/qemu/qemu/commit/1c20d3ff6004b600336c52cbef9f134fad3ccd94
> > > I don't think opensbi can be launched from pflash. So, it may be some
> > > other use case which I am now aware of.
> > >
> > > I will be happy if this can be avoided by using -bios.
> >
> > The actual commit would be [1], from late 2019. Things might have
> > changed in the intervening ~3.5 years. Let's wait to hear from
> > Alistair :)
> 
> Overall for this patch I don't feel strongly about following what ARM
> does or continuing with what we already have. I would prefer to match
> other archs if we can though.
> 
> Also, either way we should update the documentation in
> docs/system/riscv/virt.rst to describe what happens.
> 
Thanks! Alistair. My reminder mail was sent just before seeing this
response. Sorry about that.

Let me go back to v1 and also update the virt.rst and send v3.

Thanks!
Sunil

