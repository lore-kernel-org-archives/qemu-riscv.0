Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FFDCCF9E3
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:54:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEZev-00015e-JP; Thu, 30 Oct 2025 16:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1vEZen-00013t-Rx
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 16:54:06 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1vEZed-0000Xq-68
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 16:54:05 -0400
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-940f8a73275so157671039f.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761857626; x=1762462426; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1Iirdb0qK+Fwr+hxotV4Ypp2XThrO4/Gg3qySCZHDkg=;
 b=klJxCmgvJZbpUa20J1CyyxW37j8m5yWZYFlbGKHsHlaajyUj6mpt6sThmsYlfsMm6Z
 MnD4WTenpzYbMfwmT3toYNOr6oVo0NBM3SwxSYzCngsZSU8OJCcazGKOLMqZhWJtbdHX
 Cm0VTLyRHf8KTKBySA2153Xo9MO32mFr7EKyAmYKOpPsNS0qZihiEj/V1iRXQMda2SQd
 bKN3O53hPunn35TA/kA9HdnRZXhwzORRL8hoHnCZkVCOIj5xsnz85UWo3/1lri2J7VRR
 mCfleQdPBC/JTjDlwY+Q0XFm/6YUQkdrAGXg1lj1Lqp4ANp+9/05YejupBHFn/ubBlvg
 +8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761857626; x=1762462426;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Iirdb0qK+Fwr+hxotV4Ypp2XThrO4/Gg3qySCZHDkg=;
 b=ud24LrPwBI39PovINP4Wq1r+wMQCljss4ZQPFWNWcmYoANPwESq6ywRkkHSAQXevgO
 IxjCYbd1WSJAeoyB02+baFMJFP4kS4/cg56QJCiiz5EE6HMOe2cPCdgoYhKwv8q2cj1i
 fbnZ4qzip/Aa5JikiDuwo4IQdNht/qGW6WI6lswnjrSflBpN36N/8HSAuaoT8rlhe35o
 UinEXoub76/eWjcvKxpBrhWf5sOEMY+7Ht3nd4+DL8NrVFlZXQaLk8QyDGjWgMY/2ENp
 f2Si0T6jcq7f0vlyK5+exEGOn++Vw2IFRhdvZ9218EvKduflE4erLmXQ9GdM/9QlgWIH
 pajg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnOcn0EdrPv+4y5WXlfrjGHDC1aOYU1g3NhPB/uXGD5gjaYM4PUgFY43UjZ4x01Aznz7bbMEzp1aGi@nongnu.org
X-Gm-Message-State: AOJu0YwywyeIAm/xplaL1fjl9t3QAHTVUgtStffc3PkANeNpY6gZmN1g
 3AVMqXKV+WTJ863nLr37d79JrJZNsS1ZDEYEjETsyJNSCr+PIcVw0qZvFnUyOd6wglg=
X-Gm-Gg: ASbGncvQmkjuxd7efX/99kZrhvvhNPuZwCH1MBdlJoztpMUqOgBIn0D+e438Q8uwIvX
 eXH9ni7aHzxoHW5xD4WALxQJRwrp7JZCEUijU9bjTC02rJdybFx24QI9fssdLl1o1yomOGPnBv2
 uDtuL0toMWU7uL/Fi7biA+FJff1qY+4Y9CtAJNgagLSGupAmMUFlUBBF3RFNIxJKoLN8uOxHx2T
 ul/9MG6EfEbw6yEEktk0HRewtYr6aDBvAHF4X4C1R5N/kVjTAQ2bRHx/c/9XcTvVqA8sJvkVN7t
 XTuAp9G5YuB6tcWQZK4o7HtlyqB8OLyUbr4l7/5sctCcgBPfbqH4ljus7Ozu9PjT/oqnTKlvIYD
 EsReD2vk7g+6/UgT6RE+cVQnn0kfrXbheJPdK8TSis1dkeb3ECrc0KX0j7nT/9D7M9jgYPfN1iC
 BVCD5oDFSJ9VBM
X-Google-Smtp-Source: AGHT+IHJREVon3xV5kp9Bv8zIk3k/jFcraTnuicvkRQmSV4PHUYNEUR7khroZ95yOMHwIEvuKYLv7w==
X-Received: by 2002:a05:6602:13ce:b0:887:638a:29b5 with SMTP id
 ca18e2360f4ac-948229edd48mr218665639f.9.1761857626238; 
 Thu, 30 Oct 2025 13:53:46 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-94359f316basm619788139f.19.2025.10.30.13.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 13:53:45 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:53:44 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Chao Liu <chao.liu.riscv@isrc.iscas.ac.cn>, alistair.francis@wdc.com, 
 liwei1518@gmail.com, palmer@dabbelt.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v3 0/4] hw/riscv: Add Server Platform Reference Board
Message-ID: <20251030-77ebee1942ff0f1e788e8bf6@orel>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
 <dbbdc597-9b4d-4dd3-8143-821ac5d82a3a@zevorn.cn>
 <18dc5a20-85c6-4e85-b76f-66dca6771bc1@ventanamicro.com>
 <74d8553b-f98b-4d5d-8b47-5fe21b1c7904@isrc.iscas.ac.cn>
 <a72eaf23-20b8-4877-9d50-0ee2a2b18fca@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a72eaf23-20b8-4877-9d50-0ee2a2b18fca@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ajones@ventanamicro.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Thu, Oct 30, 2025 at 12:37:00PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 10/30/25 12:23 PM, Chao Liu wrote:
> > On 10/30/2025 9:33 PM, Daniel Henrique Barboza wrote:
> > > 
> > > 
> > > On 10/30/25 8:48 AM, Chao Liu wrote:
> > > > On Wed, May 28, 2025 at 05:01:29PM -0300, Daniel Henrique Barboza wrote:
> > > > > Hi,
> > > > > 
> > > > > This is my attempt to ressurect the Server SoC Platform reference work
> > > > > that has been buried for an year. The last posting was made an year ago
> > > > > [1].
> > > > > Most of the changes were made due to upstream differences from one year
> > > > > ago. Patch 1 is an example of that.
> > > > > 
> > > > > In patch 2 (former 1), the main difference is the new CPU is rva23s64
> > > > > compliant. This wasn't possible in May 2024 because we didn't have this
> > > > > support back then.
> > > > > 
> > > > > Patch 3 consists mostly of code base changes rather than functional
> > > > > changes. There was a discussion about whether we should supply fdts in
> > > > > this machine back in the v2 review [2]. The answer is yes: machine mode
> > > > > requires fdt to work, and we want to be flexible enough to generate our
> > > > > own fdt instead of relying on EDK2 to supply them. Note that we can also
> > > > > supply an EDK2-generated fdt via command line, bypassing the fdt created
> > > > > by QEMU, if desired.
> > > > > 
> > > > > Patch 4 adds a riscv-iommu-sys device to the board. This wasn't possible
> > > > > back then because we didn't have the required upstream support for it.
> > > > > 
> > > > 
> > > > Hi, Daniel.
> > > > 
> > > > Do we have any plans to support virt-io on the rvsp-ref machine in the future?
> > > 
> > > Hmmm good question. In theory we're interested only in implementing the rvsp-ref
> > > spec but adding virt-io support doesn't hurt the spec implementation in any
> > > way ... I think. Drew, any comments?

Allowing virtio devices should be fine. I think other reference models
have shied away from supporting virtio devices since they want to strictly
represent real hardware. Of course there can be real hardware which
implements the virtio spec, though, so I don't see a problem of allowing
them even when being strict.

> > > 
> > > 
> > > > 
> > > > Recently, I have been using the RISC-V reference platform built on this set of
> > > > patches to support running the OpenEuler RISC-V operating system.
> > > > 
> > > > I will actively feed back any test results to the upstream.
> > > 
> > > 
> > > This series has been stale because, as you might've read in the thread, it turns
> > > out we're missing a mandatory extension (sdext).
> > > 
> > 
> > I have a basic version of the sdext extension ready. I’ll improve it later and
> > share it with the upstream community to discuss.
> 
> 
> That's awesome! Guess we'll be able to upstream a 100% compliant server platform
> emulation sooner than I've expected.

And I would prefer we wait until the reference model is complete before
merging it, unless it gets merged with a temporary "experimental" type
name.

Thanks,
drew

