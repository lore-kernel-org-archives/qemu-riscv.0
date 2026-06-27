Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0861C43458
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 11:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdRZ7-0007Wv-3n; Sat, 27 Jun 2026 07:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wdRZ2-0007WW-Lj
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2026 07:51:12 -0400
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wdRZ1-0008CZ-4s
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2026 07:51:12 -0400
Received: by mail-dy1-x1343.google.com with SMTP id
 5a478bee46e88-30b6dad2382so3735233eec.0
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782561069; x=1783165869; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IUnORiluSyuZ+mbZJuXI4pqG6fp6N1DpGQoJRa4eEg=;
 b=hPWhsj3aosfmaFV1up5AQm+ooVEVqhfZ+wDVR/akS9XNXad4stNWSmio2Dxb5t662M
 8OSuoZ8K2/7bRTGHq1aYF1gzbpXKVVFLDklWKc+1iQ9znYBd/5Z7g3aOfixjdY0ymz5j
 p4MqvzaxCRM1bge80LXtYBivr3eeym45S65YTeuu306lxQvVSn+elWafC0/PcPZF4N5n
 s6ecEBztGq1QDVk9rl4OCLgL5EG4JL55QQwyIkLsgpM9ElgUV4x2qj0XkmShrFOg9OzL
 rBOpqAb7bXZszstK5lrnaZXLRAs0d3ihb7lRDqRdtTb2x028dIeQYiL1xWMm2kNuAzJW
 umjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782561069; x=1783165869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IUnORiluSyuZ+mbZJuXI4pqG6fp6N1DpGQoJRa4eEg=;
 b=r9Xp4yOqCUo7zFXqYhPqvddcXhFqdvDogNwX/F57fDFVe44Oy8E69uBNr7sn0rquOk
 a23T75KvhLSjr2cuGPkuBf/ug0qgACvuSpw/kyP3sMI9RL2tQFYiYtGE67MMEDVMBENo
 mJEhfug98afTNcBLeRCVgDvlEekJ2GqCsrvEOSiaaV0Y5J411e83HEndpmM8WuhJhgE2
 y5nQFBMF9+3ga36t/mwaE9QzFau0zmLjl/AykegAZf6tp7sjIeHxaL184+0XvfpiaPCd
 EV+YwzpwF5uJBgP1qlLubffflgmEV4Gsc1NoxXKKo4hEVqeS2b3/OG+YRmdn1Ael2s14
 V+NQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlkoDvVKepThTjCvA22zuWNuZl6Wmm1HMXB8niaqw9z6MbESrKTru6DYiFKckoQeWJmBlTHZQKXG50@nongnu.org
X-Gm-Message-State: AOJu0YxONE/RMN/8DxEe4XNLzQgaaCUO+Uqx7N3H8iIxdvfNzGXxlixe
 glaO7SVGbxVfi6xiFe4F2pI5dcMkCljtJ0dky3ZbMSXmhJXcKy18tHrY
X-Gm-Gg: AfdE7ckvJYkFyOc+zxMKuY4WNRYPwas+U/Sh7R9KxTGALjkB45uPwAIYIggDNdAEHdp
 zJN8aOBhLKMt+XHHFz33WqJnOl12woFHc8E0kLcTzsrqYXpY/TvDEPsycv6TZmLTwxG8Znza+ed
 9N5I5wvh18UuMC+PLAetKQHjaQvFiPG84hxqNvCmQZOPQHgGoxVyUwz58DV++pqrnyNOQhsGpq3
 PyKluIF98VaM9jSQiQHmslFa6Z/kgmw0pcv27m6IqT3ckd3wCwY5zqu1epouNz+egTpY6B8BJ+m
 tr6dOG5iPDEEkh345bMvYPKX3pUAKofUpkCAJnVbs5uiQKSBBCh5RJMc4gqx89gte/TVl1ZVGcX
 u/iCIJZaaxYRjOI46+QicwnS8NUea5IPUealacDWXQlL7xTgGSL4/ZVHzhQuOHUoLnXMolyTBe1
 aKXdjVV8wzbvwm1ht+5ISxoEWu9tCs6uowDAhibzCmpIvlKIwj
X-Received: by 2002:a05:7300:2d2c:b0:30c:41df:3734 with SMTP id
 5a478bee46e88-30c84caee33mr10337920eec.22.1782561069195; 
 Sat, 27 Jun 2026 04:51:09 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c8afc91sm28676797eec.14.2026.06.27.04.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2026 04:51:08 -0700 (PDT)
Date: Sat, 27 Jun 2026 19:51:06 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, philmd@oss.qualcomm.com, 
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 04/24] target/riscv: move pmp files to tcg subdir
Message-ID: <aj-5H76DGwxXs7pu@ChaodeMacBook-Pro.local>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-5-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622193141.1449724-5-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1343;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1343.google.com
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

On Mon, Jun 22, 2026 at 04:31:20PM +0800, Daniel Henrique Barboza wrote:
> A trivial header change is required too.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  target/riscv/cpu.h           | 2 +-
>  target/riscv/meson.build     | 1 -
>  target/riscv/tcg/meson.build | 1 +
>  target/riscv/{ => tcg}/pmp.c | 0
>  target/riscv/{ => tcg}/pmp.h | 0
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename target/riscv/{ => tcg}/pmp.c (100%)
>  rename target/riscv/{ => tcg}/pmp.h (100%)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bdd28d329b..f0c78c1474 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -183,7 +183,7 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[];
>  #define MMU_USER_IDX 3
>  
>  #if !defined(CONFIG_USER_ONLY)
> -#include "pmp.h"
> +#include "tcg/pmp.h"
>  #endif
>  
>  #define RV_VLEN_MAX 1024
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 61874ed0af..42d0f6d538 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -22,7 +22,6 @@ riscv_ss.add(files(
>  riscv_system_ss = ss.source_set()
>  riscv_system_ss.add(files(
>    'arch_dump.c',
> -  'pmp.c',
>    'monitor.c',
>    'machine.c',
>    'time_helper.c',
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> index 5684fcf985..a05ab642f4 100644
> --- a/target/riscv/tcg/meson.build
> +++ b/target/riscv/tcg/meson.build
> @@ -21,6 +21,7 @@ riscv_ss.add(files(
>  riscv_system_ss.add(files(
>    'debug.c',
>    'mips_csr.c',
> +  'pmp.c',
>    'pmu.c',
>    'th_csr.c',
>  ))
> diff --git a/target/riscv/pmp.c b/target/riscv/tcg/pmp.c
> similarity index 100%
> rename from target/riscv/pmp.c
> rename to target/riscv/tcg/pmp.c
> diff --git a/target/riscv/pmp.h b/target/riscv/tcg/pmp.h
> similarity index 100%
> rename from target/riscv/pmp.h
> rename to target/riscv/tcg/pmp.h
> -- 
> 2.43.0
> 

