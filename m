Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0449E8FDD1
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 08:13:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnx0F-0004nE-Hu; Wed, 04 Oct 2023 04:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qnx0E-0004h9-0T
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 04:13:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qnx0C-0004wM-9s
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 04:13:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4054f790190so18333655e9.2
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696407183; x=1697011983; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hBEh8ytPQcp5upkJhE3pHDuENyMoE1me17C/n0XclBk=;
 b=AyM/CpRmdJDNwLhkjYiDjv4hitAzslu0a/3gPj/PlKGgK6/mDmzVqyu+Any605y2xL
 omU2US1gg7K/aLzmyKP5pYO5tBI5E2TLZQnUvxObxfluEFsI6lXhlvs3YxBVbePJed+0
 Np1O/wGTAvEEiyrDX95gOIWLEIqfMxAfmwlEsDWepAuayazxT2P2jPxVbUT8DlmA++5c
 XdWta7/YTlmBe72XaOTTNA/0mNA9L259JNpF8aY8Rsq3j0W+HKeIK3F0Wq2J+DZIKgBn
 wU71FSfUJYnXW/XMtn1bJbJFpZM8t5K7DacAaM2OyGiFePBVnsWHOrcunU8YTx4b9pfu
 TJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696407183; x=1697011983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBEh8ytPQcp5upkJhE3pHDuENyMoE1me17C/n0XclBk=;
 b=dC/n4XlKUO1Day8iFzHWTVPOqrFqO/m6/tAYkQMWJu1f8MkAyY0omeKsuAe/NVOxGN
 FOPUk17WN+eQX1AZd25cx718Efy3WoYGKTl2eVbba80mIGGmhO26Jj49zMDhC69EKRbP
 bPbRaU2VMCLhFPza/LZrRQS42Foum5Gl1idaQgktJhl4RcbKgYClRd/UhVGAjmHkRm6I
 3FZNKq4oD4yxf8v71Q8PHOWAv8Q+jIkKASIRNY+mqQjCSwTG64b2LXPKBqqu5Bf33+pb
 oUGg5iSbYTc7av0xH+BUyHDnSKcwoqnvYyT0m8nYICCJj62LRWJs2LdVYEaDMwQO45rP
 dYaQ==
X-Gm-Message-State: AOJu0YzD0eP+QksQGNJnAYrkYUYkd2JtijAu8u58yZjjr7U+cQ2UNEbi
 8TrC4I8JV3xhZDHgQnsPKptNfg==
X-Google-Smtp-Source: AGHT+IFzexKZJcJ2F3wlkjRvKMzd5XFfXx/BgyuX/UcC5sezoDrLETWi6AhPgTF+gpiA+YwUvwdnsw==
X-Received: by 2002:adf:f286:0:b0:31f:db1b:7296 with SMTP id
 k6-20020adff286000000b0031fdb1b7296mr1401061wro.21.1696407182739; 
 Wed, 04 Oct 2023 01:13:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a056000118e00b003231ca246b6sm3386048wrx.95.2023.10.04.01.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 01:13:02 -0700 (PDT)
Date: Wed, 4 Oct 2023 10:13:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, "Paul A . Clarke" <pclarke@ventanamicro.com>
Subject: Re: [PATCH] target/riscv/tcg: remove RVG warning
Message-ID: <20231004-5e0c2c9d1723355b793d1cca@orel>
References: <20231003122539.775932-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003122539.775932-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 03, 2023 at 09:25:39AM -0300, Daniel Henrique Barboza wrote:
> Vendor CPUs that set RVG are displaying user warnings about other
> extensions that RVG must enable, one warning per CPU. E.g.:
> 
> $ ./build/qemu-system-riscv64 -smp 8 -M virt -cpu veyron-v1 -nographic
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> 
> This happens because we decided a while ago that, for simplicity, vendor
> CPUs could set RVG instead of setting each G extension individually in
> their cpu_init(). Our warning isn't taking that into account, and we're
> bugging users with a warning that we're causing ourselves.
> 
> In a closer look we conclude that this warning is not warranted in any
> other circumstance since we're just following the ISA [1], which states
> in chapter 24:
> 
> "One goal of the RISC-V project is that it be used as a stable software
> development target. For this purpose, we define a combination of a base
> ISA (RV32I or RV64I) plus selected standard extensions (IMAFD, Zicsr,
> Zifencei) as a 'general-purpose' ISA, and we use the abbreviation G for
> the IMAFDZicsr Zifencei combination of instruction-set extensions."
> 
> With this in mind, enabling IMAFD_Zicsr_Zifencei if the user explicitly
> enables 'G' is an expected behavior and the warning is unneeded. Any
> user caught by surprise should refer to the ISA.
> 
> Remove the warning when handling RVG.
> 
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf
> 
> Reported-by: Paul A. Clarke <pclarke@ventanamicro.com>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08b806dc07..f50ce57602 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -293,7 +293,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>              return;
>          }
>  
> -        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
>  
> -- 
> 2.41.0
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

