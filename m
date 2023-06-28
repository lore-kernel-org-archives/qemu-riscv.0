Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6250EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 08:10:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEQFr-00080Y-Eb; Wed, 28 Jun 2023 04:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEQFn-0007xy-IN
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 04:10:19 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEQFk-0001XR-Tj
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 04:10:18 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d9124e1baso4866160a12.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687939815; x=1690531815;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bdUKDs3NrDlvDu85I0ujJlz1kTwuhWYb6Cmaa8BIkaY=;
 b=CjGjXq6Jc93wTIICQIcCm9NBlfzGGwhCRz0R5XExWN+XWCNblPHozfFhVClsitXdtv
 1LcJN3mYWd56elr/7oacwGr1xNxYu/EImhaiX0y/H/4btkFjo6VYxyAZStl6tVehXAfj
 WstZDS7KdzkW9ZmU/vPG3piwmTLJY4+kJyWJyEkcD14336UB53EnOaPHx6yUwKco7hFm
 vAwxdN8sOPr/ONZvkb/6Qsa90wf5hZ0H3t/QXw1Y4/9bdTkww6NkYxQt434uwziavM84
 wSSVAi8gg637xbXih9d/PW4hvVjSw1GK/m2Mmr0n1u7UC7QdEE2+APhM1fZsZ05ZbH3Q
 /chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687939815; x=1690531815;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bdUKDs3NrDlvDu85I0ujJlz1kTwuhWYb6Cmaa8BIkaY=;
 b=JX+xM68N0HCfhicjllCdKI5wdQ4eNMTkBz6UxqmuewlEDB1sU6EIvNQrB2Tk/sfEKI
 99LqNM+9jLDt9fvCxRawOuNUCgJaQgFi5VxeblaCX8asudaE4ZYUZIrdVBAk+ekT7Wfp
 GeaRUztp6L/fiHJCYUPgJvnvDevVgVp2y6DI0TwtATwzpUQ6USmhmDd1qpNSfnwI2/oe
 lfwf+SXLf1/BYOqp8SReKfyfUVkKEhCeYsWrK96ddmz+8zmLJDLXX3ffWdGr/th2eG7f
 FIFXY1sFHdxq2mAanxQ0dKT4Nz0JJqHGXHQhSC6xFM9od+BfZOJGet1NC7coRmUnF0h/
 7kUg==
X-Gm-Message-State: AC+VfDxqsWxZQlyy0TE33CP/WQsfWLXQSSziRy9buZE2wEAyJOCmg5iL
 xwILyaBWusTWGYH2Ed1aP0lUrQ==
X-Google-Smtp-Source: ACHHUZ48EmF53XhzkT83Ed7iyWW7n0y6bUnJj67KxpK36YZSgwuoWqvvTe1bQxFjQbRvQ27whf8A9Q==
X-Received: by 2002:aa7:d782:0:b0:51d:b963:4bd3 with SMTP id
 s2-20020aa7d782000000b0051db9634bd3mr911059edq.31.1687939814723; 
 Wed, 28 Jun 2023 01:10:14 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 w25-20020aa7cb59000000b0051bc7483bc7sm4574816edt.78.2023.06.28.01.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 01:10:13 -0700 (PDT)
Date: Wed, 28 Jun 2023 10:10:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v5 11/19] target/riscv/cpu: add misa_ext_info_arr[]
Message-ID: <20230628-d58458b465a317028b742501@orel>
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
 <20230627163203.49422-12-dbarboza@ventanamicro.com>
 <e217dfb9-a4c2-12e3-6053-ef2167f30a05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e217dfb9-a4c2-12e3-6053-ef2167f30a05@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x534.google.com
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

On Tue, Jun 27, 2023 at 11:29:54PM +0200, Philippe Mathieu-Daudé wrote:
> On 27/6/23 18:31, Daniel Henrique Barboza wrote:
> > Next patch will add KVM specific user properties for both MISA and
> > multi-letter extensions. For MISA extensions we want to make use of what
> > is already available in misa_ext_cfgs[] to avoid code repetition.
> > 
> > misa_ext_info_arr[] array will hold name and description for each MISA
> > extension that misa_ext_cfgs[] is declaring. We'll then use this new
> > array in KVM code to avoid duplicating strings.
> > 
> > There's nothing holding us back from doing the same with multi-letter
> > extensions. For now doing just with MISA extensions is enough.
> > 
> > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   target/riscv/cpu.c | 60 ++++++++++++++++++++++++++--------------------
> >   target/riscv/cpu.h | 11 ++++++++-
> >   2 files changed, 44 insertions(+), 27 deletions(-)
> 
> 
> > +const MISAExtInfo misa_ext_info_arr[] = {
> > +    [RVA] = {"a", "Atomic instructions"},
> > +    [RVC] = {"c", "Compressed instructions"},
> > +    [RVD] = {"d", "Double-precision float point"},
> > +    [RVF] = {"f", "Single-precision float point"},
> > +    [RVI] = {"i", "Base integer instruction set"},
> > +    [RVE] = {"e", "Base integer instruction set (embedded)"},
> > +    [RVM] = {"m", "Integer multiplication and division"},
> > +    [RVS] = {"s", "Supervisor-level instructions"},
> > +    [RVU] = {"u", "User-level instructions"},
> > +    [RVH] = {"h", "Hypervisor"},
> > +    [RVJ] = {"x-j", "Dynamic translated languages"},
> > +    [RVV] = {"v", "Vector operations"},
> > +    [RVG] = {"g", "General purpose (IMAFD_Zicsr_Zifencei)"},
> > +};
> 
> Personally I prefer using a getter() helper because we can check in
> a single place for empty entries in the array.
> 
> IIUC this 13-entries array takes 4MiB (RVV is '1<<21' = 2MiB).

Oh, ouch. I never looked close enough to see that these indices
where the _shifted_ bitnums. I assumed they were _the_ bitnums,
i.e. RVV == 21, not RVV == 2097152!

Thanks,
drew

