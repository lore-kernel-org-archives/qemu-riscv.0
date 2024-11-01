Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF7E6F075
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 17:49:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6vlY-0006eL-UE; Fri, 01 Nov 2024 13:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6vlX-0006dv-Gk
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 13:48:55 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6vlU-0001sG-2N
 for qemu-riscv@nongnu.org; Fri, 01 Nov 2024 13:48:54 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539e690479cso2408741e87.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Nov 2024 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730483329; x=1731088129; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cyZYtZdRr6WSi1dLuZL+te6fdMGTgmxtl5LaM/xKyHs=;
 b=I/2mCBdcYXZazelJSRC7yzEexPImHgpHA5O3MS2mh4eiw6YzSfmieC0KXad47e/pHG
 R/21DyTDe1LqFS4WPZ6ZwmJnZ/EDWJquGV9mZFsUBym46wRLO7YKjpPw1WFWeJWFIbcI
 JdeiwILizOmFzy8xsjDMcqmkfHijejjxoxUdZGhi8+u+U8BOR2IyL+U5+hk4C+1WQAgk
 KwbJZSGFx+/LCOXlQYsXEEPd4OeKgVpOV8fLG1dytx8zTXffjxw1g9n93DGc7WF+jkYv
 QjoGTR8s79LVavTMj31mQMPXcESA9WI+AMef3rR/XFcyj1SQlr+1q1/+4W7sjspY7Bmx
 n/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730483329; x=1731088129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyZYtZdRr6WSi1dLuZL+te6fdMGTgmxtl5LaM/xKyHs=;
 b=TutdiD2dFUENrflsyMoxo+V6X+nSPJ+/NMkSEJTpuHVyqCUpQv30fSVR4ogAKdFg20
 +RANQNVw4pt6XkqqGQlK6ykOKVmniWkEbw858PNIglA549BVwYQTWY5nmiqbiEhwpc3k
 cSd7uYT0a7qLiji9h83nzbXzvBWC52va6aiXqkkBBxkYO+zA3Rrb4k/XvfGk5ZXk3j6q
 Ybdt+OVI8d2EqDxvjzW5JyPvLt+V3u1vK2akO4XJXCE34Pv4pp8rgioniAPh6w3JuAex
 nkVAxGR3FWRjJ49zwPZx/bQTfMlTKGbLpjdUaCTsLkqGRD+pmZMmMM11Cg3t92gGftdP
 vLUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW13mp6m6EV/0fgiLUE/wCvfD/0AcuNvO70M07qdJf+aw6uK7i/VClQQl+F+5JotCf1nSgdH62L4Gjl@nongnu.org
X-Gm-Message-State: AOJu0YysEwFrNEhcQSRjonN7tgQ0ppIHyNeomDAxJJtP44JpbCyfiJLr
 6pvvtxQLB9imb192a0gp6JrFqLgUIh32IzJQFps/mE6hSwqE7IZrUB5Dv3XEKPuZIRja9hxHy5m
 Sc6Q6oO8Ph84/rB8EZf6Z489Uq3l1nhcvVXDbQw==
X-Google-Smtp-Source: AGHT+IHkOHNoZbSfB15kUdpvKwbCaZh/Hx7n4iXGsq85StpdWI91Vo2dsXw2CKR7vlGDFP8gi9eavZ3ziet02SxtUG4=
X-Received: by 2002:a05:6512:4015:b0:536:a564:fd48 with SMTP id
 2adb3069b0e04-53d65dca86amr2515671e87.3.1730483328984; Fri, 01 Nov 2024
 10:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241101170833.1074954-1-pierrick.bouvier@linaro.org>
 <2e1af830-a90a-447f-ab47-1c3d49463134@ventanamicro.com>
In-Reply-To: <2e1af830-a90a-447f-ab47-1c3d49463134@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Nov 2024 17:48:37 +0000
Message-ID: <CAFEAcA92CuvGUJQk5LFE1X3a8dH21ksE_QXETjVPnU3v1bVSzw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: fix build error with clang
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
 Cleber Rosa <crosa@redhat.com>, qemu-riscv@nongnu.org, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, 1 Nov 2024 at 17:36, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 11/1/24 2:08 PM, Pierrick Bouvier wrote:
> > Introduced in 0c54ac, "hw/riscv: add RISC-V IOMMU base emulation"
> >
> > ../hw/riscv/riscv-iommu.c:187:17: error: redefinition of '_pext_u64'
> >
> >    187 | static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> >
> >        |                 ^
> >
> > D:/a/_temp/msys64/clang64/lib/clang/18/include/bmi2intrin.h:217:1: note: previous definition is here
> >
> >    217 | _pext_u64(unsigned long long __X, unsigned long long __Y)
> >
> >        | ^
> >
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   hw/riscv/riscv-iommu.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> > index feb650549ac..f738570bac2 100644
> > --- a/hw/riscv/riscv-iommu.c
> > +++ b/hw/riscv/riscv-iommu.c
> > @@ -184,7 +184,7 @@ static void riscv_iommu_pri(RISCVIOMMUState *s,
> >   }
> >
> >   /* Portable implementation of pext_u64, bit-mask extraction. */
> > -static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> > +static uint64_t pext_u64(uint64_t val, uint64_t ext)
>
> I suggest name it 'riscv_iommu_pext_u64' to be clear that this is a local scope function,
> not to be mistaken with anything available in clang or any other compiler.

More generally, we should avoid using leading '_' in QEMU function
names; those are reserved for the system.

Also, what does this function do? The comment assumes that
the reader knows what a "pext_u64" function does, but if you
don't then it's fairly inscrutable bit-twiddling.
"bit-mask extraction" suggests maybe we should be using
the bitops.h extract functions instead ?

thanks
-- PMM

