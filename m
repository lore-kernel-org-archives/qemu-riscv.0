Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85628C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 12:59:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtp5J-0002vv-UJ; Fri, 20 Oct 2023 08:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtjXY-000356-TT; Fri, 20 Oct 2023 03:03:24 -0400
Received: from mgamail.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtjXW-0006fG-BG; Fri, 20 Oct 2023 03:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697785402; x=1729321402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t0rX0WxvHEJ7FYnmEat7uxzYY2OROsQ0gZ+kw97Wi5w=;
 b=JJ9g8ZJCp6EEWM6T44kBbP90lKxlOmiKCs5ZoxEiJvNb4O6c57JczQxd
 w7Hjkm/ZrcAOGGkjyfRNhxJXkEe0u4/bDEjIZssox+xg7ZpYosHCYGw1S
 vX/oT7nH2pQqZgig6EDhnscPSOnGrkSzL0PSfMCuMnBkFA5Lh6z/boMqO
 nb/kyOMX/uZaXXiPo35lYM5IX45TZQU4/lP5JoSSmYkXFiZB+SFX4SlEU
 mFjUJPPKmmHkeM+A91iIfBmwA+jLmnEiE1fvkMZITzQlwNQ43zxgtYwGB
 akyQhvezd4ByzbTm9u5Z4ZBg/B4x/M4P20eflH9ErFokKqT19LbnWsKP8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385319678"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="385319678"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5292990"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 00:03:04 -0700
Date: Fri, 20 Oct 2023 15:14:40 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH v2 02/16] target: Mention 'cpu-qom.h' is target agnostic
Message-ID: <ZTIo4NpORQvvRcED@intel.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <20231013140116.255-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013140116.255-3-philmd@linaro.org>
Received-SPF: pass client-ip=192.55.52.120; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Oct 2023 08:58:30 -0400
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

Hi Philippe,

On Fri, Oct 13, 2023 at 04:01:01PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Fri, 13 Oct 2023 16:01:01 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v2 02/16] target: Mention 'cpu-qom.h' is target agnostic
> X-Mailer: git-send-email 2.41.0
> 
> "target/foo/cpu-qom.h" is supposed to be target agnostic
> (include-able by any target). Add such mention in the
> header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-qom.h        | 2 +-
>  target/hppa/cpu-qom.h       | 2 +-
>  target/microblaze/cpu-qom.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Why not mention this description for other qom-cpu.h in this series,
e.g., target/i386/cpu-qom.h.

Otherwise,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 153865d1bb..dfb9d5b827 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU ARM CPU
> + * QEMU ARM CPU QOM header (target agnostic)
>   *
>   * Copyright (c) 2012 SUSE LINUX Products GmbH
>   *
> diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
> index 67f12422c4..4b1d48f7ca 100644
> --- a/target/hppa/cpu-qom.h
> +++ b/target/hppa/cpu-qom.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU HPPA CPU
> + * QEMU HPPA CPU QOM header (target agnostic)
>   *
>   * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
>   *
> diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
> index 2a734e644d..78f549b57d 100644
> --- a/target/microblaze/cpu-qom.h
> +++ b/target/microblaze/cpu-qom.h
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU MicroBlaze CPU
> + * QEMU MicroBlaze CPU QOM header (target agnostic)
>   *
>   * Copyright (c) 2012 SUSE LINUX Products GmbH
>   *
> -- 
> 2.41.0
> 
> 
> 

