Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AFAC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:23:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7adn-00089N-2d; Mon, 27 Nov 2023 07:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r7adl-00088u-NP
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 07:23:05 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r7adj-0006d2-4q
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 07:23:05 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c6b30aca06so50558821fa.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 04:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701087780; x=1701692580; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V+U7VtFygTW9hvTtZG6Vlp0YGTp3rzWZaM35sxTn3O8=;
 b=iZUgDp3RuXTKuTf9y0D1SgMH/11k+RuVAk7p41nPUyzJjMWVivE1GoYy1YaSFNRMqR
 D0/w4Uz9V01NkzcRobhoeXH0eJEn8a64ddDMdcgCBM7bJdowtMXmedZAwnPBeaqA+JAr
 GFYMAxm7j/VLgUKmwqk7Ehq1EFhFH0OM30tU6dw09IK9cH4yzScwOEoFWHtoA9Xg8g1L
 /5BzrRd9e37ivhy5Xqz5QSdhkM7XOLGDhFpmL0Iz9MzboYHOUNrRD61ooHqS/KayQSbI
 peoH+t+FMVHWmkhWvHKRVxJHm7bOQPR1OpL7dt+23bx1qQ1Tp9SNPxtHF36TcxfefJWg
 41Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701087780; x=1701692580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+U7VtFygTW9hvTtZG6Vlp0YGTp3rzWZaM35sxTn3O8=;
 b=QF+yebrduEN8inLPxSU2QvptkgLBxn/i8u3LU1dKb9GKf9VF2yOcFZoFAh+AjpGopz
 rY7j29Mqqxx/R/HEiqszEon57pU3shN0nnvhhQlpfSCN08pEz7j17/3hZko2u8oRgdoo
 RxpqBiQeF90Hk8Rxajs0qhJdQOKJ2yxI7XI3dRu5BfstvxQjSGrlnMdsX7UHuJeocTgQ
 ThPEzm261m5xHXSFkvyGrsdnlf02Og/5Dv5JqGknQ6mWa9iO0ThLQs0pBTAlJAq4Lddq
 aSjSwuuXmQyIFShJp5NLHpPcb6loCrMGW0ushhWiOv241/Qz2iDrz/1/5rhZSNya74ax
 vhXA==
X-Gm-Message-State: AOJu0YzAh75xB0z8SCBP1Q0yg3AQDaHw+/NdXo+Ms3IinAnTLL3YCvpi
 PHRLpWF9KbauXWrptfxe9z/WlA==
X-Google-Smtp-Source: AGHT+IEo2THRHRGJ8TqFQ0/fsDPnIMlqG1HrEzUMw+Ycgo81sT+Q+/ADlMwzOQhfwS0kxCEa01Xm+Q==
X-Received: by 2002:a2e:954f:0:b0:2c5:13e8:e6d5 with SMTP id
 t15-20020a2e954f000000b002c513e8e6d5mr6976016ljh.23.1701087780435; 
 Mon, 27 Nov 2023 04:23:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 c37-20020a05600c4a2500b003fee6e170f9sm13518062wmp.45.2023.11.27.04.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 04:23:00 -0800 (PST)
Date: Mon, 27 Nov 2023 13:22:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 v2 7/8] target/riscv: add RVA22S64 profile
Message-ID: <20231127-7950e81713274bd4c623ba06@orel>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
 <20231127113752.1290265-8-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127113752.1290265-8-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x229.google.com
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

On Mon, Nov 27, 2023 at 08:37:51AM -0300, Daniel Henrique Barboza wrote:
> The RVA22S64 profile consists of the following:
> 
> - all mandatory extensions of RVA22U64;
> - priv spec v1.12.0;
> - satp mode sv39;
> - Ssccptr, a cache related named feature that we're assuming always
>   enable since we don't implement a cache;
> - Other named features already implemented: Sstvecd, Sstvala,
>   Sscounterenw;
> - the new Svade named feature that was recently added.
> 
> Most of the work is already done, so this patch is enough to implement
> the profile.
> 
> After this patch, the 'rva22s64' user flag alone can be used with the
> rva64i CPU to boot Linux:
> 
> -cpu rv64i,rva22s64=true
> 
> This is the /proc/cpuinfo with this profile enabled:
> 
>  # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt
> mmu		: sv39
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

