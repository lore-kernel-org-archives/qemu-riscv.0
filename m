Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F745C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 00:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfRjP-0000jN-BU; Thu, 02 Jul 2026 20:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wfRjN-0000iu-Ky
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 20:26:09 -0400
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wfRjL-0005TZ-Mr
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 20:26:09 -0400
Received: by mail-pj2-x04.google.com with SMTP id
 98e67ed59e1d1-38108e5002eso784a91.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 17:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783038364; x=1783643164; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WEC49Mi0jP9v902Vo3nlIxeJh1VZzqgxIc+1fV6LqMw=;
 b=kusn9xERy+cWn/2GZmbFDNmP2Ytl3Kw2RPbeEp5Cu0VpsCAnEiYdm2p7AyqIpCgPS8
 19wRMKrm8GksxxhJVDV+zf+7DZXIFjH6NN/C6bCrCmgCE1KSL37kukyS6L9DEhGPFwpq
 vOzlpdWuZrBkfyHY56ClgkS2qiwiVeJBvtDT7I5J8i5SswEaLpufCqpybLH4WB0zk+3+
 a/7IwQDxa03d4nziXehGBQW/qJq5iFsUWXrcGF3y00j1wu6wPVVKvGoiUY0PYoSyFBid
 2zqAURS3TlNRLqw9V+bwAAM3FBibhx4WO4TtLMILpExoBnRxpdXWUhKk3jN8S4aZit+Q
 wHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783038364; x=1783643164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEC49Mi0jP9v902Vo3nlIxeJh1VZzqgxIc+1fV6LqMw=;
 b=mN/5y1O+ZtHmntwW46V9RIaPIZ4mK/sh2e1jAskNKLow9batixSHwME+GDR8D+ij5o
 TXXhP2GrnD53N+4TObg1fVMudZ8yh7OE2Bm+tFhTcziOh+PyNFRyyI8O0QYvJp/gsGCj
 zHTvZlFdGOZFhXo/PUDq9hF25r5CeMy3DvwPOp2jPsKQw6YPp9PsVokVOo2x11oHWG2s
 +m5Q9Rl/fR9cpIeBzdYwPTY1IKr3zK4bjhVyzXwxHqcXGaJMUFzHuFbmKqqAOMCiAMOK
 9YL24ieCSWAwMO5b7U5NeGWsiTg+dYqPik5dTQsBA1kc6jKOlxF0rksVLWcGDaCPpV98
 X9Fw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpFV7QkXubEclCwmm+RrmPVqbpKCA1SiPxIbSFUv+V1lJ6URIsYUZ0w1AfpTz/UqkZIuuCvSlCVcCQV@nongnu.org
X-Gm-Message-State: AOJu0YwNKf7uHkj4GXOVRCXZfWehyU1S4QaUkJ3TRjiuUzKGTJEqP6Iq
 9U/Vx2qMa8hWMCZbMDIuc94LO2+ySPDqF8JfVTZfsMmGTjjli+EhlohI
X-Gm-Gg: AfdE7cmBIKhkoaJnrw9p176HJEvof/8CsVoduss1wM1XMhwJfGJoESvJha+1YDySXCq
 dBe6w5awDbnbm6fGFbuaHo4aojW/DLnbe4+HzBq6tkciS7sPIOysdqn8yAAqe1szVuleNmHUdef
 l6T2RnqD6XYX/xaqLJQmqfByPllM2kebrk6Z26D721FN9B++2ZjuL33b5tC0boSZXh3GvDihV7W
 PzQ+OAH7r9GxFkK4NyKjQDqY9TjJdw2/atlYsOU3Caa7gIjgv5VZGjAPbQSx5es+lijIj52NbF3
 +lfMsSb2R7mOhSQsrOSfgHID6sc7YoB6jB+bA5c46V/DYfOFxdyTgGlqs3HMNbJIyX/dFZQdZPv
 v+CExQxuSS/QsaJTw8dCIS2QFIrKBOgktpHB53RuVG/OHUAJk6YK62lt1dZEg9Ydbw3bIXSQonP
 M/z8UKt9NzHzdC/sXQcsV/bBzPg2lkKJxqCtZA4QcS4KheI3cj
X-Received: by 2002:a17:90b:4a8d:b0:37f:ef32:d444 with SMTP id
 98e67ed59e1d1-380aa0ac3d4mr9162323a91.1.1783038363482; 
 Thu, 02 Jul 2026 17:26:03 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30f0bbd2350sm14920831eec.23.2026.07.02.17.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 17:26:03 -0700 (PDT)
Date: Fri, 3 Jul 2026 08:26:00 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, nutty.liu@hotmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 1/1] hw/riscv/riscv-iommu.c: check for misaligned
 IOHGATP_PPN
Message-ID: <akcBjAdIs4KGhEA5@ChaodeMacBook-Pro.local>
References: <20260702203616.1795588-1-daniel.barboza@oss.qualcomm.com>
 <20260702203616.1795588-2-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702203616.1795588-2-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:39::4;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pj2-x04.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jul 02, 2026 at 05:36:16PM +0800, Daniel Henrique Barboza wrote:
> We must check if IOHGATP_PPN is 16kb aligned for non-bare GATP modes.
> 
> Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3550
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  hw/riscv/riscv-iommu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 974042d017..ad8e108a23 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -813,6 +813,21 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOMMUState *s,
>          return false;
>      }
>  
> +    if (gatp != RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
> +        uint64_t iohgatp_ppn = get_field(ctx->gatp,
> +                                         RISCV_IOMMU_DC_IOHGATP_PPN);
> +
> +        /*
> +         * One of the conditions for a misconfigured DDT entry
> +         * according to the riscv-spec: "DC.iohgatp.MODE is not
> +         * Bare and the root page table (address) determined by
> +         * DC.iohgatp.PPN is not aligned to a 16-KiB boundary."
> +         */
> +        if (PPN_PHYS(iohgatp_ppn) & ((1ULL << 14) - 1)) {
> +            return false;
> +        }
> +    }
> +
>      fsc_mode = get_field(ctx->satp, RISCV_IOMMU_DC_FSC_MODE);
>  
>      if (ctx->tc & RISCV_IOMMU_DC_TC_PDTV) {
> -- 
> 2.43.0
> 

