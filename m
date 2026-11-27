Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB05606A31C
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nongnu.org header.i=@nongnu.org header.a=rsa-sha256 header.s=lists1p-gnu-org header.b=GlTjcuvl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rev.ng header.i=@rev.ng header.a=rsa-sha256 header.s=dkim header.b=i/KZtK40
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nongnu.org;
	 s=lists1p-gnu-org; h=From:In-Reply-To:MIME-Version:References:Subject:To:
	Date; bh=VF1leqn1GO8eDPS3jIw8D1L56P3UfAKvpF5f425Uj24=; b=GlTjcuvldeO0Epf922uV
	zLaNPnenNpXg0PsilsGctE6VTVe1aIty8A/unSgUozkfjNOFrhxv4ob+km50Iki2tg1KMYJcca8Kp
	v72/UrUEEE2SgbJFRJkJpQCwywPHbe8g9wGQa19tUDYBT9yffkKuQYEY7HM8Q+NRL7JslboFFbd7X
	AZv/YFXSCFac3ZYhPyNBUr0UTv9m0qZZXiJcEPBqMWQ2z72zqLWlGz3dnhGYxgeOU+z4SL0xwiuON
	ibpyaDcrRRpYgwhZ0xfKn5cDjg90I1xoSQRjujKUyTzePcp0TbQEGMgH0IIitLH/MyuHetjujVhq8
	n6/2LrrvCe2Gig==;
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWto7-0008AC-5P; Fri, 27 Nov 2026 06:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWtnh-0007de-W9; Fri, 27 Nov 2026 06:07:35 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWtnb-0006BX-H5; Fri, 27 Nov 2026 06:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=VF1leqn1GO8eDPS3jIw8D1L56P3UfAKvpF5f425Uj24=; b=i/KZtK40Mr7Nkp9
 6li30AUhmTCYd9Ic1sL4gSJaChiQ/CDjh+5pic7s5jiZBEkelfXjX8timcbZ6R8C4QD0CMJ9BhrWk
 ikuytnjv8wWJNj4KAtP6KhMIhNfGuWcJUi+CZ3U8ZB1LxQyvL0HSQ4Wv90oQL/ff3DhIQXS857MD2
 QQ=;
Date: Fri, 27 Nov 2026 12:13:47 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 08/24] target/hppa: Use 64-bit TB flags
Message-ID: <awll55wkQOp6NyeZ@hive.localdomain>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-9-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126233604.67722-9-philmd@oss.qualcomm.com>
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
>  target/hppa/cpu.c       | 2 +-
>  target/hppa/translate.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 83104ae0c70f..2e30451f85ad 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -56,7 +56,7 @@ static vaddr hppa_cpu_get_pc(CPUState *cs)
>  static TCGTBCPUState hppa_get_tb_cpu_state(CPUState *cs)
>  {
>      CPUHPPAState *env = cpu_env(cs);
> -    uint32_t flags = 0;
> +    uint64_t flags = 0;
>      uint64_t cs_base = 0;
>      vaddr pc;
>  
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index ab3505f9c973..16bd0808bb40 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -82,7 +82,7 @@ typedef struct DisasContext {
>      TCGv_i64 zero;
>  
>      uint32_t insn;
> -    uint32_t tb_flags;
> +    uint64_t tb_flags;
>      int mmu_idx;
>      int privilege;
>      uint32_t psw_xb;
> -- 
> 2.55.0
> 
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>

