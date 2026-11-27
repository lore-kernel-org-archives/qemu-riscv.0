Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328B606A321
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nongnu.org header.i=@nongnu.org header.a=rsa-sha256 header.s=lists1p-gnu-org header.b=hok4Hxe1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rev.ng header.i=@rev.ng header.a=rsa-sha256 header.s=dkim header.b=YinvqJTG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nongnu.org;
	 s=lists1p-gnu-org; h=From:In-Reply-To:MIME-Version:References:Subject:To:
	Date; bh=sXZBIsSSj7xhSEsl87gkJUnoxihhymWMO6udIHtBDWk=; b=hok4Hxe1QUHrqtYasjwM
	VcGEtRrSJ5aZUP+2g0i4nn79vmCulEqCVfBR6ZFAZO4UaL5584xqc69mDCdVglZL+fYOSZQKR58Q+
	058jTeKTo+MaZYMnMA+cXDVaZiuuEHfMK1JafNRD5G041PVaOqdk/L5C1sOo2NHL3cuVt3lCtWRai
	cl8tgBZ4F8fJ+zL00kvsGUxRnKJniG6k91afUMluxPkvmVtHuZilmkVr6P1RiGYLVVTKE/29+A/HM
	8PsARqTWSHNumyulbCjl+QSHefNpmb9nehPfsujFA0hBAyaXxdbBYvU2GDasr6xGVHVzpGzFku64T
	StAHbcWvK+6xxw==;
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWtoA-0008Lk-6f; Fri, 27 Nov 2026 06:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWto3-00083I-WA; Fri, 27 Nov 2026 06:07:56 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWto2-0006Cs-GB; Fri, 27 Nov 2026 06:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=sXZBIsSSj7xhSEsl87gkJUnoxihhymWMO6udIHtBDWk=; b=YinvqJTGMxYwMH3
 s5DbQDT3yEFu+RUfmrsSrv5Ct1Yy8yw7EPgC8w6m0e+jvh1x8dYS9EwCdCid0HdjEjzEc/JpIrUfw
 ujPpqgq3r81zruF/R6S8sI8IDsyB1vm0QLqb/JOkns8tUQLDkovS/maIfGLNSYQ7kqXmB/NZtc/oS
 us=;
Date: Fri, 27 Nov 2026 12:14:18 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 09/24] target/i386: Use 64-bit TB flags
Message-ID: <awll95bByooTc7BW@hive.localdomain>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-10-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126233604.67722-10-philmd@oss.qualcomm.com>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-riscv@nongnu.org>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/26, Philippe Mathieu-Daudé wrote:
> TranslationBlock::flags and TCGTBCPUState::flags are now
> 64-bit, use matching types for the values derived from them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/i386/tcg/tcg-cpu.c   | 3 ++-
>  target/i386/tcg/translate.c | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index 167ff7695ae6..bdfd08107d6a 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -53,7 +53,8 @@ static void x86_cpu_exec_exit(CPUState *cs)
>  static TCGTBCPUState x86_get_tb_cpu_state(CPUState *cs)
>  {
>      CPUX86State *env = cpu_env(cs);
> -    uint32_t flags, cs_base;
> +    uint64_t flags;
> +    uint32_t cs_base;
>      vaddr pc;
>  
>      flags = env->hflags |
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 719771032ff5..af98125cd718 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -122,7 +122,7 @@ typedef struct DisasContext {
>  
>      CCOp cc_op;  /* current CC operation */
>      int mem_index; /* select memory access functions */
> -    uint32_t flags; /* all execution flags */
> +    uint64_t flags; /* all execution flags */
>      int cpuid_features;
>      int cpuid_ext_features;
>      int cpuid_ext2_features;
> @@ -3535,7 +3535,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>      CPUX86State *env = cpu_env(cpu);
> -    uint32_t flags = dc->base.tb->flags;
> +    uint64_t flags = dc->base.tb->flags;
>      uint32_t cflags = tb_cflags(dc->base.tb);
>      int cpl = (flags >> HF_CPL_SHIFT) & 3;
>      int iopl = (flags >> IOPL_SHIFT) & 3;
> -- 
> 2.55.0
> 
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>

