Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE257C0032E
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 10:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwgmu-0005Nt-MY; Sat, 28 Oct 2023 06:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwgmq-0005NQ-6E
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 06:43:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwgme-0005H4-1r
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 06:43:23 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso5975567a12.0
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698489789; x=1699094589; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mYiqLiUF9aM2ExPiFa/fXFQHFZi7c0D8136uFI509/0=;
 b=ZwL+Pqy+vTcYJj5z8JYrtDfuWze8QELPYKKHD06x8zSZefbLYyx6h14RGC9oseCZ4c
 X5IIjgZP48zmoPg6wUGedEVdQwB0VnHxNkSqLKYSmKhNgUUp2s3NV+Z/asaSaWO/KVrV
 8fY7KSp85ioODNt1QQ9blsS8MphBfdYg5dJSsZw5SU74AFT+UIZ40oy8y8d8jlrlOmwY
 o4rajmb0cuBCnjFOIGnZoCbfnjt/Dg5E7Qb7RfVrpjciyI/ghM2xc1Dkn1r9KsJd0oKm
 g5EtXPG3oPLDOkqnVZf+3skVitWaZ+gulO753LpnXP9H8Ii+lkoBd4N83VRMoqA0WEkl
 ESAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698489789; x=1699094589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYiqLiUF9aM2ExPiFa/fXFQHFZi7c0D8136uFI509/0=;
 b=shPS07TG8zOdXWwofQIfBIFxqYT7L7eXQYf31J+0B3yqChNkY++OfmoX9dDNmM97Mx
 9rd0TyDbvZypgl3gtzQZGmXji/534wgpwHB5ml9qS1buNeHwKFNGmykMvm2MpIUqIi1f
 otGWmpo+zebnJFYQOQ4O6TgVTcXZ7AFBbYgAoykgB3Udo/Putlu2LIPVASEflhhvLNX6
 Jl/W4/tuOadnR/tzXI40XqdfRF6kJP8vB09sLGoL+mVCT9km9zevyvmzdyXXdY0v9Ur4
 EiPveaHp037ZoCSJsWDXJ54kQgwEzIwSkr6Lq0I9iuvHSftHupZJ5+VrXCSydSC8QGNs
 TKgQ==
X-Gm-Message-State: AOJu0YxXCVz2ONZl6qHjGioD/FHINCDziptgYfxapRDXnJMmXxKlBF1I
 A77yeFVUOofgVCqbFkZ306zP4g==
X-Google-Smtp-Source: AGHT+IGB3ib5saRyLWm+VxaAjzJmApYBOABzx1kd/mBScYGInEwAnRHkHuQpLJYNZIjPdc5YzypQKQ==
X-Received: by 2002:a05:6402:31e7:b0:53d:a18d:73b4 with SMTP id
 dy7-20020a05640231e700b0053da18d73b4mr4986710edb.12.1698489788869; 
 Sat, 28 Oct 2023 03:43:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a508ad3000000b0053e0395059csm2708705edk.21.2023.10.28.03.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 03:43:08 -0700 (PDT)
Date: Sat, 28 Oct 2023 12:43:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v6 06/12] target/riscv/tcg: add user flag for profile
 support
Message-ID: <20231028-588cc5e3969c1962985c2f69@orel>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-7-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028085427.707060-7-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sat, Oct 28, 2023 at 05:54:21AM -0300, Daniel Henrique Barboza wrote:
> The TCG emulation implements all the extensions described in the
> RVA22U64 profile, both mandatory and optional. The mandatory extensions
> will be enabled via the profile flag. We'll leave the optional
> extensions to be enabled by hand.
> 
> Given that this is the first profile we're implementing in TCG we'll
> need some ground work first:
> 
> - all profiles declared in riscv_profiles[] will be exposed to users.
> TCG is the main accelerator we're considering when adding profile
> support in QEMU, so for now it's safe to assume that all profiles in
> riscv_profiles[] will be relevant to TCG;
> 
> - we'll not support user profile settings for vendor CPUs. The flags
> will still be exposed but users won't be able to change them. The idea
> is that vendor CPUs in the future can enable profiles internally in
> their cpu_init() functions, showing to the external world that the CPU
> supports a certain profile. But users won't be able to enable/disable
> it;
> 
> - Setting a profile to 'true' means 'enable all mandatory extensions of
> this profile, setting it to 'false' means 'do not enable all mandatory
> extensions for this profile'.

While this definition of profile=off looks appealing at first, it's really
just saying 'do not do anything', which means it's limiting the potential
of the property. But, I'll stop talking about this now, as I have another
design suggestion instead:

Since profiles are like G, and other shorthand extensions (just without an
official shorthand extension name), then I believe they should behave like
shorthand extensions. Also, since shorthand extensions can be derived from
their parts, then I think shorthand extensions should behave like
synthetic extensions. For example, zic64b starts 'false', but, at realize
time, if all its conditions are present, then it turns 'true'. Shorthand
extensions should be able to do that too by detecting that each of the
extensions they represent is present.

So, I think we should automatically turn G and profiles (and future
shorthand extensions) on when all their respective extensions are present.

Thanks,
drew

