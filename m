Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82304C48BF6
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 15:12:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfi5F-0006m2-Rz; Thu, 29 Feb 2024 10:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rfi57-0006J9-4W
 for qemu-riscv@nongnu.org; Thu, 29 Feb 2024 10:12:22 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rfi55-0000aP-Da
 for qemu-riscv@nongnu.org; Thu, 29 Feb 2024 10:12:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33d0a7f2424so678869f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Feb 2024 07:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709219537; x=1709824337; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/BJCypZDYOEbOHfjNS0azTsDa0tFh+QHIlxmEgB+bks=;
 b=IPZTJolsmOAdzHPtHlUULn64YiP13y9Oo1OWUOgFbqU6WqrqVFYSoYO66AOouQghvB
 YfaR84jTBvlN8Jyaw+/TgvLACH01dFNbv4iaYwz2GVz7fudauU/MdMhQ6peCkYNrN5N8
 vlXH49lgVpJFNbXs+x9SObRyaU6goUg7UsGOlhNd7OgzFtBaTQbQcj9PdzMCqL38Bvhk
 B+giHp47K4oTIap55FMC7fO2DE5lf5jdC6qPx0YlelPK6PUdnhtHzGIRPqsYQlaBol3e
 GX/vetJ/Nw6X8fO306i2HOOowX70FGm7mp8/thinhHNgW5ahDhJSlepkd+5sRRqAHpHX
 cLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709219537; x=1709824337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/BJCypZDYOEbOHfjNS0azTsDa0tFh+QHIlxmEgB+bks=;
 b=NOF8oh9aCbMCyEtsDoMTQLMvw9IqM0qp74X7+blri96J+zhKk1yJVwPdbPxrTl7Yj3
 o7xP0By8vBQrw9FKcU7eW+tA/zt4ErqvYHVFbnha7gd5ATO3OnO6Nyyvh6GfI+GJPkxJ
 AkMmdj9ikNk76Y/cgFPyq7PGecWCsY6nE63+XAxXt5eVJdrWqwbX9dZFjyrm3O0937ub
 s0wHc2XGHKdEkBWA8MAqnocJi3/sKbd40waWPX+jPJVIw1iPYMSpPxp6PjQshIXnm0lZ
 AXLw4tHv1ih6Ukem/zV8fbZBLJXpEpnstUkFjp+od8oloGt7NmU1PjCHuhSMmiwBzQuB
 iVgQ==
X-Gm-Message-State: AOJu0YwEDgskIVeBi/aNuFjDOPqDuNhcGIR5fjjCzl3gwbMLIL/pQ/Vr
 nUR2pJKzv48nchvrE9HX0Rue+U8a0Mg79036fwZCc2wMy2ld/FACHKJKCvWn+mazD2yb8nUcVlo
 s
X-Google-Smtp-Source: AGHT+IGrx1jJ7dTQYXKOyViuZQgGwHJB01jZAH+CFrlqyJdZcarps7x6pzjBZViQeeqxS15yU38K2w==
X-Received: by 2002:adf:e742:0:b0:33e:1802:92f0 with SMTP id
 c2-20020adfe742000000b0033e180292f0mr200228wrn.14.1709219537560; 
 Thu, 29 Feb 2024 07:12:17 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 bo30-20020a056000069e00b0033d6bd4eab9sm2107507wrb.1.2024.02.29.07.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 07:12:17 -0800 (PST)
Date: Thu, 29 Feb 2024 16:12:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/2] Export debug triggers as an extension
Message-ID: <20240229-92706c0ccb3d6a6e8b725815@orel>
References: <20240229133745.771154-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229133745.771154-1-hchauhan@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Feb 29, 2024 at 07:07:43PM +0530, Himanshu Chauhan wrote:
> All the CPUs may or may not implement the debug triggers (sdtrig)
> extension. The presence of it should be dynamically detectable.
> This patch exports the debug triggers as an extension which
> can be turned on or off by sdtrig=<true/false> option. It is
> turned on by default.
> 
> "sdtrig" is concatenated to ISA string when it is enabled.
> Like so:
>     rv64imafdch_zicbom_*_sdtrig_*_sstc_svadu
> 
> Changes from v1:
>    - Replaced the debug property with ext_sdtrig
>    - Marked it experimenatal by naming it x-sdtrig
>    - x-sdtrig is added to ISA string
>    - Reversed the patch order
> 
> Changes from v2:
>    - Mark debug property as deprecated and replace internally with sdtrig extension

I'm getting lost in our discussions, but I thought we needed both in case
a machine only implements debug 0.13, since sdtrig is at least 'more than'
debug, even if backwards compatible (which I also wasn't sure was the
case). If, OTOH, QEMU's debug implementation exactly implements sdtrig's
specification, then I'm in favor of deprecating the 'debug' extension.

Thanks,
drew


>    - setting/unsetting debug property shows warning and sets/unsets ext_sdtrig
>    - sdtrig is added to ISA string as RISC-V debug specification is frozen
> 
> Himanshu Chauhan (2):
>   target/riscv: Mark debug property as deprecated
>   target/riscv: Export sdtrig in ISA string
> 
>  target/riscv/cpu.c        | 38 +++++++++++++++++++++++++++++++++++---
>  target/riscv/cpu_cfg.h    |  2 +-
>  target/riscv/cpu_helper.c |  2 +-
>  target/riscv/csr.c        |  2 +-
>  target/riscv/machine.c    |  2 +-
>  5 files changed, 39 insertions(+), 7 deletions(-)
> 
> -- 
> 2.34.1
> 
> 

