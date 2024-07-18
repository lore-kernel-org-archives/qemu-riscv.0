Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756BAC3DA63
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 17:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sUV9y-0004Uz-Kr; Thu, 18 Jul 2024 13:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sUV9v-0004Og-6E
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 13:43:15 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sUV9t-00068s-6S
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 13:43:14 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3d9db222782so636259b6e.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Jul 2024 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721324590; x=1721929390; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cKlbO+77o2OvDnFq3MYtocWYHRN/qj83A4WUjQhzjHw=;
 b=e07S7PQ2izIxpDFJsF3vmpFx77d7pQX6YZUcKvkhFxaIC2iVyqZdN5tky+ePGpdh03
 SWnmLFPtqap2SOGi+yTumMuKizjR+XZVMzEPxBh0qk9BnL0lgl7KMVyYctna0oPL+dns
 6DqgXHprJeJxaeiMDpx7sSyFxNsBOzpIhGaEx1o0iQXjV/iTiGqjjgsvXNsIVCAUmHaP
 dFMkDs2dDG0Wt3YlU6mva93O0mCnHeXDaIzBm687yFdFTjwLRqxQBOJ/NTfU/LjKyPgV
 H1qdbLdkdARXzLKd8cFKAbigk9cpRWY8YOlWdyF/m8d6MCgEYbJdrES7kK7d7ULTbY8p
 /9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721324590; x=1721929390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKlbO+77o2OvDnFq3MYtocWYHRN/qj83A4WUjQhzjHw=;
 b=cH2wGZcnMs9obhvF08e5R0Or99JxS7sM5N4YcZdkKhV1pvZ11mWQk/aCzOVqvDldf6
 PxkpFnqOTjZ2LRQWKGja40XZ+NU7l/78FedNzzBB/4XL5+X+In+ZTXjrN4YkkNRST8cP
 lhjHKiDRGQUaa8G7CS2trkSUEOq19ntXViK65cD0OzOzNjEU/EOOY9OW9WDTdNZStEmq
 +rTzXa10XEYek7+cITrkWSbqM/0JFtQXiVGy6KEZZncak6K01BSwUQco327SoYxtq0C/
 aN1AYnVq1ogdX2TZEZmwGdt8Q8NmBVMzDdbd45ZMZ7Y1kO0Y6ycL4AlDuW9t7dme7BHF
 URog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVez5LqOj9dq5Xcd0pXE2DpiYgwupMMwgNsWok/9fv42xErhhqEQ6FDIusARVN406QvlG0I3nkZUYRKjSAmFKxWzjWMHDg=
X-Gm-Message-State: AOJu0YybMJFSyC5LKB6A1vZhbugXPib9oAbyI1kDBqfe5l1IWOKlINjs
 Efzq8nRVJGl4F4fiSzcUa6Neot9zlkDIDbOOChTw8vdFwbuQ7807BlvitinsknQ=
X-Google-Smtp-Source: AGHT+IGv7pHNf5iBNadKevDtdZIudlG5mWWeEDUavrDRrhRk0iunXpUfXJJqcSNN84W8K72s7/V4Jg==
X-Received: by 2002:a05:6808:f02:b0:3d9:245c:4224 with SMTP id
 5614622812f47-3dad1f889ccmr5899253b6e.40.1721324589722; 
 Thu, 18 Jul 2024 10:43:09 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1938ed08fsm48693485a.55.2024.07.18.10.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 10:43:09 -0700 (PDT)
Date: Thu, 18 Jul 2024 12:43:08 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] target: riscv: Add Svvptc extension support
Message-ID: <20240718-34d268f8591f6227d99b9f71@orel>
References: <20240718160737.211285-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718160737.211285-1-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=ajones@ventanamicro.com; helo=mail-oi1-x236.google.com
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

On Thu, Jul 18, 2024 at 06:07:37PM GMT, Alexandre Ghiti wrote:
> The Svvptc extension describes a uarch that does not cache invalid TLB
> entries: that's the case for qemu so there is nothing particular to
> implement other than the introduction of this extension.
> 
> Since qemu already exposes Svvptc behaviour, let's enable it by default
> since it allows to drastically reduce the number of sfence.vma emitted
> by S-mode.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> Changes in v2:
> - Rebase on top of master
> - Enable Svvptc by default
> 
>  target/riscv/cpu.c     | 2 ++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c53b0d5b40..19421c8a45 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -192,6 +192,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_12_0, ext_svvptc),

Since Svvptc was just ratified then it isn't spec 1.12. We need another
patch adding later versions first (there is at least one [1]).

[1] https://lists.gnu.org/archive/html/qemu-riscv/2024-05/msg00045.html

This version field is annoying to keep accurate... Maybe we should
make it optional and only specify a version when there are wider
spread changes, such as envcfg bits, which need to be present too.

>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -1499,6 +1500,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
>      MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
>      MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
> +    MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
>  
>      MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
>      MULTI_EXT_CFG_BOOL("zihpm", ext_zihpm, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index fb7eebde52..62612ae348 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -78,6 +78,7 @@ struct RISCVCPUConfig {
>      bool ext_svinval;
>      bool ext_svnapot;
>      bool ext_svpbmt;
> +    bool ext_svvptc;
>      bool ext_zdinx;
>      bool ext_zaamo;
>      bool ext_zacas;
> -- 
> 2.39.2
> 
>

Thanks,
drew

