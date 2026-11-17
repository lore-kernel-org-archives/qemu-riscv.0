Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A6606A334
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mcqWfRoU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTGWB-0001oO-FG; Tue, 17 Nov 2026 05:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xTGW8-0001nJ-UA
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 05:34:25 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xTGW7-0004z4-16
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 05:34:24 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-67da69e7c31so3080424d50.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 02:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794911661; cv=none;
 d=google.com; s=arc-20260327;
 b=iAqjkpJsD0DpkatoZdZ5QVjKzj2s9EtsWYBTzM7y5HiqW7YaMftxR40axfyfKXbDdc
 SPbtyVjB9Xhsc63TcW6pFmLtsKGf5rqAK/u/4pQjnJy45bl12Fo/vdf1YKo+CIz7fkbQ
 frEKUv/t6ToV8bTt5ib4nZBOB4F6UITa+1l6vTtFMWpQ9P9mgP+aCwcoUBd+PBe/qOoh
 YHgS4rd7sn5/OB/yDkRljQDIIcBWXb54OmIeUkn6tQWmgzK+14HIAqAWQO8ZQQzVtLGF
 vJwCn9e1BC7/oqdFHJYZjU51jAkP8Qe5BJcTFbE2Lac8VtD9W88TF4OrFI6gYRwYYFNM
 SZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UuKlSkoymTDPg9TRp8wP0q3mBdMsqIqP7u05crQ915I=;
 fh=jWSvO6LpSuk932FZAcekahP+4xI2olnK6d/NeHLYep0=;
 b=hOUTMnLFIrg6WxKDULEWT1N+TgbOGdMwxnjRid0dTR3GmdUFCtyzNAoFvRTIygc/PP
 qm2oLs1GIN/Hh1hZ7UYXB0/c+etpQUlgflfYh1cXjo9M1YBos60n6cA1b760DOFERnv8
 SvhotEybVw9yC1ca5v8Hzy99WdAXgT2GA5kqBm+ku1uHErETxZbChZXLxEYzmkAik3A5
 nZWq4K+HMhzChzL2/lfzJrzw3CjQUL1ynkcJZb72fiLb0sbQ0klDy2XDNd+19ojLiiSa
 oH07QjfeVAw+PGnOhniAOqEauHkmjMfODfg2Ke1bC8jV6tk1LL4VTizLyOjsp/PR5B0t
 quUg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794911661; x=1795516461; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UuKlSkoymTDPg9TRp8wP0q3mBdMsqIqP7u05crQ915I=;
 b=mcqWfRoU9ri7ZLF0Frxzzul3wnWT5S7ff8iY7n8CHIvRKC3hXoLu0mXxWfOcH724kG
 cDZi7yBqX/2t/GCYqRqA54GXgM1HzLaB4m9cd6oYUGDd7ABpHCWQNbsXyCxSEEkkpLSL
 5unl8/WHYj/JBO9lyu8wZ43eXbghrKiax6CqepsffNW2Rc7RiD7TDdV3UtpyuFKZX4bP
 rVYJ8OYabGkxzCVukPABfngMJWHnirE+9YUPmEHmY3VR/ORpvAf9VK+H5PO+0igOwQYD
 wV4TWLaRW4xD0rYvgLnI3GIoqsIbgjbrMqvN8VJa0+Zh8Mb5iMPu3PyW1x5m0cJFRz4O
 7NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794911661; x=1795516461;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UuKlSkoymTDPg9TRp8wP0q3mBdMsqIqP7u05crQ915I=;
 b=0S6o8crydWt7kWC+kUBYCPF1Oew//e7webGLp2oVoJrGWTg8mMr21p7ci0vgayMvZ3
 wPldeptks9vXONDtcE6UFv780vexsbE9iZiNfcpyZLdfklSyO/yj5z7oT4O6aKPa0pdx
 lRLmqUfZcST08oaSkEOcZyMz4bscYgX5IM1Vfo8qeOhFGKBKkiwW7++yu92DkKrVx/TR
 pi53KgSIEQzIpmadiav1LbZbsXgG0mO1YHilU+mtf25zFtVJqiVx4dzZzDfxCgUpzYNL
 RgQh0ndG4MDqMeru2Z+/c3J5bb0DtzLFXX9Y3FTeHOjckcTGRHVW0MHUbYqLrJPgUrNa
 cojw==
X-Forwarded-Encrypted: i=1;
 AL+hErGwNmfdREyLhqaGtb9nMGMhw/ivTfDFVk3YutxM404z36p8izfnUWCFHN0wdLWQ2d7zQd7+zQq83Vs7@nongnu.org
X-Gm-Message-State: APuU4Z+M9FnjbhsrwpN4VlylouegtX9QOp6wuL4V+9QLfMj48NO3Ncyo
 D8v0ed5+ebMXDCy0Ef/BWCTPjX3dJTMw/4yUvDUru4JyQ9i+fiCeENwE2kLK7rcG2kMC6DpTEQ6
 gnKaZ5aaEsHaohbJad7vQGFhJgnxW7CWtLB+BkaIsvw==
X-Gm-Gg: AZFdTZdizSBxsT1zn+4Ca/B+Dxn5OCVg6FtBtHyP/Hk6l20VDhLosQssAH2W0CabUjF
 r/fc7Bdt6IlRd9KJtuxwnYPtUMX1qPQSU5Og7fhWOPv2+cKFOHcH0rOypg8zp21GrTf9WJ8qYx8
 lPjzKWIqM1R9AENWNxLA36Mt2Am0aWw+IBNSeetP+TIZLACNkU1FHF4ZDT15Ib94sczxU9CVJ2a
 blpINZMie5slwDOh7xymvZoBzGgFljJq/JmSZ3T2m+WFMkgsMmGlmtmeij8SBZwHFaOyFj2j6Ot
 N8ewerOi5eYhY1nfeoWWEG5Bwdxcn+DLczK77SfmHNu1Fji7V6QKRIelxK2NR29gYKKp4L5cOAY
 kAkE2rfrezdNnz1Uq20PY/UihWpKHjkMc4KBFFmhAEWvc3g1AA/hTjF3viAi6C/oS+82ISzpTkd
 NBdd5/JvZ72cC6XlXoWdDr
X-Received: by 2002:a05:690e:1904:b0:67d:b5fe:1ce1 with SMTP id
 956f58d0204a3-67db5fe1f42mr3789388d50.20.1794911661516; Tue, 17 Nov 2026
 02:34:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
 <CAFEAcA8Nmt_Nsvfm77en_oaE4orcQ3BdCBQWNAXmi0iqLgV7fw@mail.gmail.com>
 <c1df4a9e33b9e6a5e76cafa75a00d3c4a901fcbb.camel@wdc.com>
In-Reply-To: <c1df4a9e33b9e6a5e76cafa75a00d3c4a901fcbb.camel@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2026 10:34:09 +0000
X-Gm-Features: AclHuK_uJUGhQbi8NOa4sDvJDIUTEXw1Pydh21dI-uBn-5Y6sriDNzWNC__EksQ
Message-ID: <CAFEAcA-Pj_kfRyM97s-_z=uZDSuTAEsMuBBBCqezN7FWycUjNQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix RCsc store->load ordering of release stores
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 at 02:31, Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> On Mon, 2026-11-16 at 19:31 +0000, Peter Maydell wrote:
> > On Fri, 21 Aug 2026 at 07:40, LIU Zhiwei
> > <zhiwei_liu@linux.alibaba.com> wrote:
> > >
> > > Several guest architectures give their store-release instructions
> > > RCsc
> > > semantics, which requires the store to be ordered not only after
> > > the
> > > memory operations that precede it, but also before any subsequent
> > > load-acquire with RCsc semantics.  The TCG translators, however,
> > > only
> > > emit the leading barrier before the store, so under MTTCG nothing
> > > prevents the host CPU from executing the load-acquire that follows
> > > a
> > > store-release before the store has left its store buffer.  On an
> > > x86
> > > host (TSO), store-load is the only reordering the hardware may
> > > perform, and it is exactly the ordering that is missing, so the
> > > architecturally forbidden [0,0] outcome of the Store Buffering
> > > litmus
> > > test is easy to observe:
> > >
> > >     CPU 0                      CPU 1
> > >     store-release X = 1        store-release Y = 1
> > >     load-acquire  r0 = Y       load-acquire  r1 = X
> > >
> > > The affected instructions are the RISC-V Zalasr store-release
> > > instructions and the Arm STLR, STLPUR and A32/T32 STL store-release
> > > instructions.  Neither architecture defines an RCpc store, so every
> > > store-release is RCsc (RVWMO preserved program order Rule 7; Arm
> > > Architecture Reference Manual DDI 0487, section B2.3.8 "Acquire and
> > > release semantics").
> > >
> > > Patch 1 fixes the RISC-V side and patch 2 the Arm side by emitting
> > > a
> > > full barrier after the store as well.  Patch 3 fixes an inverted
> > > barrier polarity found in the A32 LDA load-acquire translator while
> > > auditing the load-acquire side.
> >
> > > LIU Zhiwei (3):
> > >   target/riscv: Fix RCsc ordering of Zalasr store-release
> > >   target/arm: Fix RCsc ordering of store-release instructions
> > >   target/arm: Fix barrier polarity of A32 LDA load-acquire
> >
> > This series seems to have been accidentally missed, possibly
> > because it included both arm and riscv patches in the same
> > patchset. RTH tells me that the Arm patches are correct, and
> > Daniel has reviewed the riscv one.
> >
> > riscv maintainers: are you OK with me queuing the whole set
> > including the riscv patch in target-arm.next, or would you
> > prefer to take the riscv patch yourself through your queue?
>
> Thanks for checking, this is fine to go via target-arm.next

OK, I've queued it there. I added a cc:stable tag on all the
patches since they look like bug fixes that deserve backporting.

-- PMM

