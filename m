Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79244C4828F
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 16:07:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rVZat-0005jM-0N; Thu, 01 Feb 2024 11:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZap-0005bM-5b
 for qemu-riscv@nongnu.org; Thu, 01 Feb 2024 11:07:11 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZam-0008I8-DB
 for qemu-riscv@nongnu.org; Thu, 01 Feb 2024 11:07:10 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf588c4dbcso14435541fa.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Feb 2024 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706803626; x=1707408426; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7m4biepq+wdTrTMcPIx64LKzglwVFghTFI7I3P3BXkA=;
 b=iCnzWQJMgNuhQm26xq9BWNeWTAT4mv4YzOXe8VQeOnaVY0TtovA6KdPTfA6lnNoFQN
 QC9ESTyx04SkquGgEs2lqW5JuTCBdRYfoOwMfYqVd3bSuB5bFdbMJa/cfJe4PM/G5f1N
 yGUXvJLHTTxmyVSGSiBNBUGIM1iospPxlKBjKHt+sM+HTgYpwQMIXoTB3lRDvXIRazrl
 BgUh/pZvvcd7bceXzzV4E9VbXmXX7BLMaXgXIAFco5Ww9sirhn/W1SLCYto61fZk2G70
 tHXmZ3xLtJysHUvq61AMIBTDx9+wtn3OKLswTJXIQjUaQBWNRgRb/O22Q67o5FvDrChj
 dtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706803626; x=1707408426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7m4biepq+wdTrTMcPIx64LKzglwVFghTFI7I3P3BXkA=;
 b=oFipZuIDknFHG/JhZKdnqQblNgMiZSOALAAav6ht5ZAATWT+XSg6rcvAHEZW0355GO
 sm5ekOBFnL3EEzhzaQg5FwOs+IZdeqmqvwhQ2tn7aqPtn/sYl7QWDdh1DKt5TCg/4Y6x
 6JhTd8eMjvZ5tZe1xOSqGrfCsO7UHyIzuE428gw0SjGBpnYlDEOkQ1MbN+ZCXcHpsRxA
 5xQGSEEVUw62ech8X+1zRysXFSXOsP+uSW2mVrqAKybAOfuGzAzqxSsSTZyfGfs2jrHT
 TMDEUkcXlR6vDAWbqfoTuyxthOBfNaYL1nbHGQJKvg+mVxfBizsBlacvJAubQa3ZqtNp
 OeRw==
X-Gm-Message-State: AOJu0YwzXs7adYHFAZFMn53S0PGCu/zzDCYzceH9Z942L1H+E8SsBWbu
 FkCAD8y+gyo5ULfEQv6Xm3LvO9YT7RxMJi5AfCQfH16HOF36HKsMD89pINDAsYMWyP4Ke5mFu0V
 XT12wJYCjg1yEQJwnB4PRAfAnCWvbOSE8CZtlMw==
X-Google-Smtp-Source: AGHT+IEGvGgyabcAJqCoVxDTBnOT9GNfh18I7+ZgjDJeqSuRhNZ2cVy9hBI+UknBuLkoXyzkfo1EmyoWvyqvZ7albUU=
X-Received: by 2002:a2e:994c:0:b0:2d0:6a10:e57e with SMTP id
 r12-20020a2e994c000000b002d06a10e57emr4091165ljj.18.1706803626278; Thu, 01
 Feb 2024 08:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20240129081423.116615-1-jeeheng.sia@starfivetech.com>
 <20240129081423.116615-4-jeeheng.sia@starfivetech.com>
 <20240129110823.000076df@Huawei.com>
In-Reply-To: <20240129110823.000076df@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 16:06:55 +0000
Message-ID: <CAFEAcA80VjwM=uKEXfwtg9SVzX947of1Go2c0ph-r0DeyKbpMA@mail.gmail.com>
Subject: Re: [RFC v1 3/3] hw/arm/virt-acpi-build.c: Enable CPU cache topology
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, anisinha@redhat.com, shannon.zhaosl@gmail.com, 
 sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
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

On Mon, 29 Jan 2024 at 11:08, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 29 Jan 2024 00:14:23 -0800
> Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
>
> > Introduced a 3-layer cache for the ARM virtual machine.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>
> There are a bunch of CPU registers that also need updating to reflect the
> described cache.
> https://lore.kernel.org/qemu-devel/20230808115713.2613-3-Jonathan.Cameron@huawei.com/
> It's called HACK for a reason ;)
> But there is some discussion about this issue in the thread.
>
> The l1 etc also needs to reflect the CPU model.  This stuff needs to match.
> Wrong information being passed to a VM is probably worse than no information.

Yes. The ACPI table information, if we provide it, should be
being generated from the CPU cache ID registers.

But I'm a bit confused about why the ACPI table has the cache
topology in it -- can't the guest read the cache ID registers
and figure it out for itself?

thanks
-- PMM

