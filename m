Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E675C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 15:13:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rKgRQ-0002zu-HZ; Tue, 02 Jan 2024 10:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rKgRO-0002z8-TG
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 10:12:26 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rKgRN-0001xg-0C
 for qemu-riscv@nongnu.org; Tue, 02 Jan 2024 10:12:26 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d5b89e2bfso56245995e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Jan 2024 07:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704208342; x=1704813142; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ltAD2reCi8OLeWksla404AxOzdE3eOZ5sOpyHL6yi1k=;
 b=Ilr/ICOS802k2JypX6kvqbwyADwmH1EiDCgQOz2GIvyX8ns2qlkYI9Sk9ke62U31rq
 WXBhK8IHg+9EBxo/cjYXE1SCwjhvRcue8yvMhCDW4tRgAPHuWeDdZSV5BNm6L+KX8jns
 4tP+wugONEmGwBlrJw7m2K5IrG60yH9xtn2ij82VKam2YjaUEAhbHv3OzQKxw+rlwsdP
 P7pxgvBbOILutXmKlaepI/OK/ufyw5bC1hjAkVq/aOwK+DsglB0acEovFCi6gO413mF/
 7MfepMp1MAuZ82K0Ll9/zxZmE/8U+70rYGKDDDXtq8knHMnwNtLK7yA1qaYNZQyeHdrd
 361A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704208342; x=1704813142;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltAD2reCi8OLeWksla404AxOzdE3eOZ5sOpyHL6yi1k=;
 b=AykSWDBf6oN0WjBleedcY5OqzsB4IeeHI0m3qTftaA6acOodop84aXb62gBV7n3a2G
 7/C8rjflGY7ypfBsI4CmiQydQcAxQguSsN6O+7CR1AntQ0OsUfn+jq6mzWc7SOcGbiSB
 RDmWCCThD+tGlpxwUaeZ8UZPS/AEtjKm+eqNvNAigoPM1PI8xWnQ3crAsIxY0h+9x3Jj
 0LMUMvsc+6RWaGGdhmgWqG/wFiVQVd4aR3BSz/zCEgH1PwpvQRZyEr8ol52xf/cV9D5X
 ZgbuAQegOBde0BICoYp7M8U6S+OAJbBBH4lDKvAr+djuwDjtEXWVJCb1WyK4ako1A0GB
 gJ6Q==
X-Gm-Message-State: AOJu0YytB2cumHwdxq+gjrQ3uYTNXCIZD+R8VcN7m9rY815YM/xdxFHD
 KtJuZc7KJUzllop+8QZUFjGOoecjgc5IqQ==
X-Google-Smtp-Source: AGHT+IHkQDIdPkoglL31POYEajFYwKGYQisQBLYF04BABilsKdNKdPHOdX4B89bgiFUvCFlcwEHTLw==
X-Received: by 2002:a05:600c:520c:b0:40d:8a04:a134 with SMTP id
 fb12-20020a05600c520c00b0040d8a04a134mr896655wmb.79.1704208342508; 
 Tue, 02 Jan 2024 07:12:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 fc20-20020a05600c525400b0040d6e07a147sm18861462wmb.23.2024.01.02.07.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 07:12:22 -0800 (PST)
Date: Tue, 2 Jan 2024 16:12:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: Re: [PATCH v13 00/26] riscv: RVA22 profiles support
Message-ID: <20240102-72dbc203ded50b48a3aebb76@orel>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <a3f0392c-6a1a-4d48-8d55-13348457c345@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3f0392c-6a1a-4d48-8d55-13348457c345@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
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

On Tue, Jan 02, 2024 at 08:40:48AM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> Drew brought to my attention the following post on the tech-unprivileged mailing
> list:
> 
> "Architecture Review Committee meeting minutes, 12/19/23"
> https://lists.riscv.org/g/tech-unprivileged/message/611
> 
> Second paragraph mentions:
> 
> "In response to some recent discussion in the Apps and Tools HC about how profiles should
> be represented in GCC/LLVM, the ARC provides this answer: compilers should use a single parameter
> for an ISA string.  An ISA string begins with either a base ISA name (e.g. rv64i) or a profile name
> (e.g. rva23u64) and is optionally followed by additional extensions (e.g.  rv64imac_zicond or
> rva23u64_zfh_zicond).  If the ISA string begins with a profile name, it is equivalent to
> replacing the profile name with its mandatory base ISA and its mandatory extensions; any
> optional extensions in a profile must be explicitly named if their inclusion is desired.
> ISAs are sets, and concatenating strings takes the union, so redundancy is legal (e.g.
> rva23u64, rva23u64_zicsr, and rva23u64_zicsr_zicsr are all valid and equivalent)."
> 
> The takeaways from it:
> 
> - this implementation is compliant with how profiles are interpreted, i.e. a profile is
> considered a set of the mandatory base ISA and mandatory extensions, and any additional/optional
> extensions must be explicitly named;

Yes, it's good QEMU's RISC-V CPU model command line will be consistent
with the above paragraph (and then presumably with RISC-V compiler
"ISA strings")

> 
> - our ISA string format is also since we use the base ISA name + extensions format already.
> This series don't  change/add anything in this regard.
> 
> 
> If we have enough demand for it, I can do a follow-up to add support for the ISA string
> profile format. I.e. this:
> 
> $ build/qemu-system-riscv64 -M virt -cpu rva22s64 (...)
> 
> # cat /proc/device-tree/cpus/cpu@0/riscv,isa
> rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt
> 
> Would become this:
> 
> # cat /proc/device-tree/cpus/cpu@0/riscv,isa
> rva22s64

We can't do that. The "ISA string" referred to in the above command line
isn't the ISA string specified in "ISA Extension Naming Conventions" of
the unpriv spec, it's the string given to the compiler to tell it which
extensions it may assume when generating instructions.

Thanks,
drew

