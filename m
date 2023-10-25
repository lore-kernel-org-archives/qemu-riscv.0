Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E8DC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:28:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvgjq-00024T-Uy; Wed, 25 Oct 2023 12:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgjp-00023w-3i
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:28:09 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgjn-0001GJ-HO
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:28:08 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so9347022a12.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698251285; x=1698856085; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3SI1HDQRYn5vEk3Jxs0ZfjcgDJQfz/8c5MwAMN+n82E=;
 b=nhhyAbe2YE93dx/Smf/y7J/cDte9Rqzp9ZlwKCQ4mhsu6iSc6h9R+u1hJVT/Jctiax
 AnJ/dKMx/+w+0LqjygEcrgUPti0/8DPWk6jTCCevL2gcSY3sYuAGePb6gcrerTWW8o7l
 FQ9gv9SyVa1rlFWa23EU2VlZ+iH3tyV3JeGDE37/DhGF6Hsyzq2pjrDTUlKcFppNV/rk
 r6ehFmhx1hZ7t0HCzdOvbG/bSuJWT02+Xdvkn+o3OZVZBE8Hk7QysPlUFgfOvFBpprr5
 dupPUp1GBqF182HIYXlltc6gH3BmNW0uDc4RNz+9YjuYPiY/APm7xSWpDdrjgTj+i+ps
 A0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698251285; x=1698856085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SI1HDQRYn5vEk3Jxs0ZfjcgDJQfz/8c5MwAMN+n82E=;
 b=rRWMK+u4tvsSTKaSu+lh8K6rskbOPZs4bQaCCQCAC8XLgvKEoEF+X0gIAqc6vzdWXV
 UFKAHkqrs7lwGuN6o3TOXASEsGITkFdHkaHLZ44zngjW6z0+VU3hYWl4qbM9niqHRoqS
 L94IVF8gmm8SEPhr1uyEyhChDxoI+W8BuyoWtOdrSNsbeJ2+oDJ0guPK9JFgMtVGPAYL
 Ef8UVPHtyml0EICP9nWaoUJJYCxAgO7UA0kIu2g+gCG6iGno5BG/FK0TjUet/oUbj6y6
 zFUuALYNSDTcWFjsBCGrCVWJ3IxqnU7jX0zv+pIpw4ka4t8SeV+VmcqkhGpyUJzTmM8i
 EAkg==
X-Gm-Message-State: AOJu0YyScpqr7yEYX7Fw4smeqLncseocpm4Xs/EJeGYKC/DDEZkJZ6ni
 MkBiT7EhrIO5rA1PlzjS1j1i/g==
X-Google-Smtp-Source: AGHT+IGllsRs2OU5FQV2P4rzbLWC6hU4Eqn7yaG67yLUJZ+XfURruSkQ8Q6cqlNdcZ4easqKnZmGBQ==
X-Received: by 2002:a17:907:980c:b0:9bd:a75a:5644 with SMTP id
 ji12-20020a170907980c00b009bda75a5644mr13607887ejc.16.1698251284915; 
 Wed, 25 Oct 2023 09:28:04 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ay18-20020a170906d29200b009b2c5363ebasm10088849ejb.26.2023.10.25.09.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 09:28:04 -0700 (PDT)
Date: Wed, 25 Oct 2023 18:28:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 9/9] target/riscv/tcg: warn if profile exts are disabled
Message-ID: <20231025-8fa7e3ae7b0d41ae96e2e2d1@orel>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-10-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135001.531224-10-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x536.google.com
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

On Wed, Oct 25, 2023 at 10:50:01AM -0300, Daniel Henrique Barboza wrote:
> Enabling a profile and then disabling some of its mandatory extensions
> is a valid use. It can be useful for debugging and testing. But the
> common expected use of enabling a profile is to enable all its mandatory
> extensions.
> 
> Add an user warning when mandatory extensions from an enabled profile
> are disabled in the command line, like we're already doing with RVG.
> 
> After this patch, this will throw warnings:
> 
> -cpu rv64,rva22u64=true,zihintpause=false,zicbom=false,zicboz=false
> 
> qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zihintpause
> qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zicbom
> qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zicboz
> 
> Note that the following  will NOT throw warnings because the profile is
> being enabled last, hence all its mandatory extensions will be enabled:
> 
> -cpu rv64,zihintpause=false,zicbom=false,zicboz=false,rva22u64=true
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 57 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

