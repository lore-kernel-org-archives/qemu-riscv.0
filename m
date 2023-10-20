Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E47C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:00:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtp5I-0002i3-77; Fri, 20 Oct 2023 08:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtkwi-0007nU-UJ; Fri, 20 Oct 2023 04:33:28 -0400
Received: from mgamail.intel.com ([198.175.65.9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtkwc-0002LX-F0; Fri, 20 Oct 2023 04:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697790802; x=1729326802;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tExpAgCycKkq4Jarc0yvqd7IX/S0VLVWSqHREEBjgwQ=;
 b=cybAQ1mU/3zrFwXyTarWrFZP2ln6ennAbqmCk+cUFxxU4szb8W7ri/pF
 wOMkWvgdrlClYuas9mYC/iIxqCuQL97/m6/LrF34FAc/CSA2msLcYGr/e
 6d2ebT9DYTWQcYJ8WsPdtJl4SHv4jgWkgsDQiSHsEesuyMgAUfm5/Z1KQ
 2Jsp9lYFawAFGkLUrUsmz+urY0qTq8GiuEH1IxKakxTC3SlmjaZpbsie9
 hOUhsZwiiJAUJ+/bUfT1HOz2vP9PH+unFBcmZGvvFlBPcHspeFJ308uIx
 sgeNY5vGeyt+VZqG2SkReaowj76pVqjv4iMECs2W4C/vpMFGi/KxSjIYQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="5064650"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5064650"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 01:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848018758"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848018758"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2023 01:33:12 -0700
Date: Fri, 20 Oct 2023 16:44:50 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/6] target/i386/hvf: Use x86_cpu in
 simulate_[rdmsr|wrmsr]()
Message-ID: <ZTI+Al+V69uMJnfA@intel.com>
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009110239.66778-6-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.9; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 09, 2023 at 01:02:38PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Mon,  9 Oct 2023 13:02:38 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 5/6] target/i386/hvf: Use x86_cpu in
>  simulate_[rdmsr|wrmsr]()
> X-Mailer: git-send-email 2.41.0
> 
> We already have 'x86_cpu = X86_CPU(cpu)'. Use the variable
> instead of doing another QOM cast with X86_CPU().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/hvf/x86_emu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index ccda568478..af1f205ecf 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -676,7 +676,7 @@ void simulate_rdmsr(struct CPUState *cpu)
>          val = rdtscp() + rvmcs(cpu->accel->fd, VMCS_TSC_OFFSET);
>          break;
>      case MSR_IA32_APICBASE:
> -        val = cpu_get_apic_base(X86_CPU(cpu)->apic_state);
> +        val = cpu_get_apic_base(x86_cpu->apic_state);
>          break;
>      case MSR_IA32_UCODE_REV:
>          val = x86_cpu->ucode_rev;
> @@ -776,7 +776,7 @@ void simulate_wrmsr(struct CPUState *cpu)
>      case MSR_IA32_TSC:
>          break;
>      case MSR_IA32_APICBASE:
> -        cpu_set_apic_base(X86_CPU(cpu)->apic_state, data);
> +        cpu_set_apic_base(x86_cpu->apic_state, data);
>          break;
>      case MSR_FSBASE:
>          wvmcs(cpu->accel->fd, VMCS_GUEST_FS_BASE, data);
> -- 
> 2.41.0
> 
> 
> 

