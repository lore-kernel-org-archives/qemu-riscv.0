Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D8CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 12:59:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtp5J-0002rE-7D; Fri, 20 Oct 2023 08:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtlPJ-0003Mo-4M; Fri, 20 Oct 2023 05:03:01 -0400
Received: from mgamail.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtlPG-0004Ob-FY; Fri, 20 Oct 2023 05:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697792578; x=1729328578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CT/skQFWwUuGW+Ebbnz9CM6Enc+zjShQGF93iIdOLTg=;
 b=Gvybvyy+RJj3FShc1MfE/k0gHJWFdmaXHmepvDzxfuEEvpoIKjneQIjC
 UUhuHkOomTEl5hsDVTXkLMC+BLepvA+4CLmnBRgxg/mPXyGMsIXRLLjT2
 2TZwbXZOevcr/npt8B2r+KMJCwAo1FmwOmMbC1G7KB9AkX5bu6ccM2M/A
 43sszA4U0pEUZQXp5gROM7F4rO9WpTlRHdo/Z3pe5kFpX48ZaMnP2yDfA
 VN+QsPi7KZmTFwlME3VMgKyKchzLoIoonykmfeB5t3sMiq6OKE0cUFfCG
 Z0y9E8gZ7XvxC87/WXAILbpcoCmWgsp4QQeI9ACzGyPmCHabHq29GnQue w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="371533234"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="371533234"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 02:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848024456"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848024456"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2023 02:02:48 -0700
Date: Fri, 20 Oct 2023 17:14:26 +0800
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
Subject: Re: [PATCH 6/6] target/i386: Use env_archcpu() in
 simulate_[rdmsr/wrmsr]()
Message-ID: <ZTJE8kPBnCn3luEE@intel.com>
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009110239.66778-7-philmd@linaro.org>
Received-SPF: pass client-ip=134.134.136.126; envelope-from=zhao1.liu@intel.com;
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

On Mon, Oct 09, 2023 at 01:02:39PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Mon,  9 Oct 2023 13:02:39 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 6/6] target/i386: Use env_archcpu() in
>  simulate_[rdmsr/wrmsr]()
> X-Mailer: git-send-email 2.41.0
> 
> When CPUArchState* is available (here CPUX86State*), we can
> use the fast env_archcpu() macro to get ArchCPU* (here X86CPU*).
> The QOM cast X86_CPU() macro will be slower when building with
> --enable-qom-cast-debug.
> 
> Pass CPUX86State* as argument to simulate_rdmsr / simulate_wrmsr
> instead of a CPUState* to avoid an extra cast.
> 
> simulate_rdmsr/simulate_rdmsr(CPUX86State
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC: Not even build-tested.
> ---
>  target/i386/hvf/x86_emu.h |  4 ++--
>  target/i386/hvf/hvf.c     |  4 ++--
>  target/i386/hvf/x86_emu.c | 21 ++++++++++-----------
>  3 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/target/i386/hvf/x86_emu.h b/target/i386/hvf/x86_emu.h
> index 640da90b30..4b846ba80e 100644
> --- a/target/i386/hvf/x86_emu.h
> +++ b/target/i386/hvf/x86_emu.h
> @@ -29,8 +29,8 @@ bool exec_instruction(CPUX86State *env, struct x86_decode *ins);
>  void load_regs(struct CPUState *cpu);
>  void store_regs(struct CPUState *cpu);
>  
> -void simulate_rdmsr(struct CPUState *cpu);
> -void simulate_wrmsr(struct CPUState *cpu);
> +void simulate_rdmsr(CPUX86State *env);
> +void simulate_wrmsr(CPUX86State *env);
>  
>  target_ulong read_reg(CPUX86State *env, int reg, int size);
>  void write_reg(CPUX86State *env, int reg, target_ulong val, int size);
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index cb2cd0b02f..20b9ca3ef5 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -591,9 +591,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>          {
>              load_regs(cpu);
>              if (exit_reason == EXIT_REASON_RDMSR) {
> -                simulate_rdmsr(cpu);
> +                simulate_rdmsr(env);
>              } else {
> -                simulate_wrmsr(cpu);
> +                simulate_wrmsr(env);
>              }
>              env->eip += ins_len;
>              store_regs(cpu);
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index af1f205ecf..b1f8a685d1 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -663,11 +663,10 @@ static void exec_lods(CPUX86State *env, struct x86_decode *decode)
>      env->eip += decode->len;
>  }
>  
> -void simulate_rdmsr(struct CPUState *cpu)
> +void simulate_rdmsr(CPUX86State *env)
>  {
> -    X86CPU *x86_cpu = X86_CPU(cpu);
> -    CPUX86State *env = &x86_cpu->env;
> -    CPUState *cs = env_cpu(env);
> +    X86CPU *x86_cpu = env_archcpu(env);
> +    CPUState *cpu = env_cpu(env);

I find these names are confusing since in other i386 file
(target/i386/cpu.c), the "X86CPU" is called "cpu", and the "CPUState" is
called "cs".

Regarding this naming, it may be worthy of cleanup to unify the naming
for i386. ;-)

>      uint32_t msr = ECX(env);
>      uint64_t val = 0;
>  
> @@ -746,8 +745,8 @@ void simulate_rdmsr(struct CPUState *cpu)
>          val = env->mtrr_deftype;
>          break;
>      case MSR_CORE_THREAD_COUNT:
> -        val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
> -        val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
> +        val = cpu->nr_threads * cpu->nr_cores;  /* thread count, bits 15..0 */
> +        val |= ((uint32_t)cpu->nr_cores << 16); /* core count, bits 31..16 */
>          break;
>      default:
>          /* fprintf(stderr, "%s: unknown msr 0x%x\n", __func__, msr); */
> @@ -761,14 +760,14 @@ void simulate_rdmsr(struct CPUState *cpu)
>  
>  static void exec_rdmsr(CPUX86State *env, struct x86_decode *decode)
>  {
> -    simulate_rdmsr(env_cpu(env));
> +    simulate_rdmsr(env);
>      env->eip += decode->len;
>  }
>  
> -void simulate_wrmsr(struct CPUState *cpu)
> +void simulate_wrmsr(CPUX86State *env)
>  {
> -    X86CPU *x86_cpu = X86_CPU(cpu);
> -    CPUX86State *env = &x86_cpu->env;
> +    X86CPU *x86_cpu = env_archcpu(env);
> +    CPUState *cpu = env_cpu(env);
>      uint32_t msr = ECX(env);
>      uint64_t data = ((uint64_t)EDX(env) << 32) | EAX(env);
>  
> @@ -856,7 +855,7 @@ void simulate_wrmsr(struct CPUState *cpu)
>  
>  static void exec_wrmsr(CPUX86State *env, struct x86_decode *decode)
>  {
> -    simulate_wrmsr(env_cpu(env));
> +    simulate_wrmsr(env);
>      env->eip += decode->len;
>  }

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

-Zhao

>  
> -- 
> 2.41.0
> 
> 
> 

