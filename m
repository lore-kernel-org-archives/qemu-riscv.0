Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388A9CF8577
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 10:34:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swIFQ-0000TJ-RB; Thu, 03 Oct 2024 05:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1swIEm-0000Qo-IB
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 05:35:11 -0400
Received: from [2a00:1450:4864:20::432] (helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1swIDp-00017a-Iw
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 05:35:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37cca239886so466864f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2024 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727947966; x=1728552766; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ycXDRcdcXLZwuoHP9km9AQxpWwIIMZ0TaqavHhtd9l0=;
 b=DcWAJ2N7BcYWniztlucD3aZT/36FrEHtyYlcBdHQv6jjXqpKSUssUjOGVhtTgshCGC
 Md9U8c1P3zxbdy4yYbylXoyRbb5flpYHZ6n8vivwuWRZ7UZVPB1Zme0iSxo8svQn7CiS
 YF+HJFuSFqiDEUgQpF0GcQPUd3MGRlVhA2GFPl2j8QJj6gVX97e8LWSB0FrjP8hK7LFp
 rev0qCBsdMdv0iShNO1HY4W1KUBQQ5zZ035A0WFxHIy+1QF1sz1ufARKUKhByMvZ+kBA
 gbDutGTRdkbjuYQoRl7nYQzmupr2FgVmF3T0JXekVuJCbqzlAnrwGHqUghIHV6WYhFKn
 +G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727947966; x=1728552766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycXDRcdcXLZwuoHP9km9AQxpWwIIMZ0TaqavHhtd9l0=;
 b=JEseHQq1B0PUwRNrLECZil7gF+pLehDn3wxjJ59rOttMQLzipv7xTCchYLAnIfp1Xw
 EZWd/yr6AzCf2UHSxi3dxFuZhFV3/6BhkFbDwxowXDezR7F7wB2JptnuDJ9MwDh+RbT/
 VGyocVO4aAeOBZVYRmws0A/wMyM3ynRQmYiXy4FWhp0XRAkaxd5d91CmzyWCLzY4Tzz3
 qPXx21AO+6lF0U/LH04f27xLerN+fr+MmfduvVbgF8gSgAnr4JLzpcMUtiqJImVj/7lW
 cY+miqEd0wRaPmA00p8y2UvS0/kR3PrrV/kj1OKZy5b9O9CFoRAjahKpaEY0dLE3YzfL
 QxBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5dE0VLW+hiLSc0G8IujY/nbBvWmM0lyVb+vpMQawbnx3nGdutABYH/21UGqN73jWyTexyXKt0HNy3@nongnu.org
X-Gm-Message-State: AOJu0YyE+fVyixo20JUXyDVr+K/k0ydKfUZ/FWLa5FlZUvT7UV2rM30c
 VRZI3QpcXAhh67sEH658jhYU7E6vUrpZG7h7TIhRbujfHlC3Lrcnr00MJSiMwr3hSNli5Ias16k
 g
X-Google-Smtp-Source: AGHT+IGGTYI2ZRORFKZaagGS491vVMcUtMjiQGeU3Jcac1M4T/XJyXteW5voFd2dhdv3WsQTJ08w8A==
X-Received: by 2002:a05:600c:1d8a:b0:426:6f27:379a with SMTP id
 5b1f17b1804b1-42f777bf9a5mr40414295e9.13.1727947591748; 
 Thu, 03 Oct 2024 02:26:31 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79d8d2d0sm40608515e9.3.2024.10.03.02.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 02:26:31 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:26:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, peter.maydell@linaro.org,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Sebastien Boeuf <seb@rivosinc.com>
Subject: Re: [PATCH v8 03/12] hw/riscv: add RISC-V IOMMU base emulation
Message-ID: <20241003-c10c27e0855533db764a1490@orel>
References: <20241002010314.1928515-1-dbarboza@ventanamicro.com>
 <20241002010314.1928515-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002010314.1928515-4-dbarboza@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (deferred)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, Oct 01, 2024 at 10:02:58PM GMT, Daniel Henrique Barboza wrote:
...
> +/*
> + * RISCV IOMMU Address Translation Lookup - Page Table Walk
> + *
> + * Note: Code is based on get_physical_address() from target/riscv/cpu_helper.c
> + * Both implementation can be merged into single helper function in future.
> + * Keeping them separate for now, as error reporting and flow specifics are
> + * sufficiently different for separate implementation.
> + *
> + * @s        : IOMMU Device State
> + * @ctx      : Translation context for device id and process address space id.
> + * @iotlb    : translation data: physical address and access mode.
> + * @return   : success or fault cause code.
> + */
> +static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
> +    IOMMUTLBEntry *iotlb)
> +{
> +    dma_addr_t addr, base;
> +    uint64_t satp, gatp, pte;
> +    bool en_s, en_g;
> +    struct {
> +        unsigned char step;
> +        unsigned char levels;
> +        unsigned char ptidxbits;
> +        unsigned char ptesize;
> +    } sc[2];
> +    /* Translation stage phase */
> +    enum {
> +        S_STAGE = 0,
> +        G_STAGE = 1,
> +    } pass;
> +    MemTxResult ret;
> +
> +    satp = get_field(ctx->satp, RISCV_IOMMU_ATP_MODE_FIELD);
> +    gatp = get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
> +
> +    en_s = satp != RISCV_IOMMU_DC_FSC_MODE_BARE;
> +    en_g = gatp != RISCV_IOMMU_DC_IOHGATP_MODE_BARE;
> +
> +    /*
> +     * Early check for MSI address match when IOVA == GPA. This check
> +     * is required to ensure MSI translation is applied in case
> +     * first-stage translation is set to BARE mode. In this case IOVA
> +     * provided is a valid GPA. Running translation through page walk
> +     * second stage translation will incorrectly try to translate GPA
> +     * to host physical page, likely hitting IOPF.
> +     */

Why was this comment expanded from the simple

"Early check for MSI address match when IOVA == GPA."

The comment is now incorrect since the check is required even when
first-stage translation is not BARE. I just skimmed the spec again trying
to figure out if the removal of '!en_s' is a hack or a fix, and I'm
inclined to say "fix", but it's an incomplete fix. I found a sentence that
says

"If the virtual memory scheme selected for first-stage is Bare but the
scheme for the second-stage is not Bare then the IOVA is a GPA."

which, in a way, defines a GPA to only be a GPA when second-stage is used
(and all MSI translation specifications refer to GPAs). However, maybe I
missed it, but I couldn't find any actual reason that the MSI table can't
be used when first-stage is not BARE and second-stage is (and, of course,
it makes no difference for single-stage translations to call IOVAs GPAs
or not).

Now, I also see

"If the virtual memory scheme selected for neither stage is Bare then the
IOVA is a VA. Two-stage address translation is in effect. The first-stage
translates the VA to a GPA and the second-stage translates the GPA to a
SPA."

in the spec, which means we should probably change the removal of '!en_s'
to '!(en_s && en_g)'. VFIO+irqbypass would still work with that and, when
Linux learns to support two-stage translation, we wouldn't incorrectly try
to check for a GVA in the MSI table.

Thanks,
drew

