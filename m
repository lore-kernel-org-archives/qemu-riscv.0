Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF7606A321
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nongnu.org header.i=@nongnu.org header.a=rsa-sha256 header.s=lists1p-gnu-org header.b=YGfOIOND;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rev.ng header.i=@rev.ng header.a=rsa-sha256 header.s=dkim header.b=TDuPX4f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nongnu.org;
	 s=lists1p-gnu-org; h=From:In-Reply-To:MIME-Version:References:Subject:To:
	Date; bh=1T7/7nww0/4/79z0jy9uTnKIXpmgKwoKwH7hVl+Ne/I=; b=YGfOIONDNSlEkp5nBzVz
	B3nIegC0orooJqemOFb8YON3FbWYlq0iktr7ak8HzJOGka02fm4FPenb3cUo/4AtkHO+Yj/tWLRM1
	s9EBSEFCbuI7Snzp3PLIJJMj2z+DxS0eyWG7TJHPQsORK2/Mggj3mtGtDMbk/8AXd66NcUFEStfu8
	fIngGkcYQOhIYN30wGQreFEA9M9n6zy4IWp3U0r4W9qhP8D8O/2O3Cz7Mr3t0YudYDUOcqYYuTFy7
	Wgk3dEoFEllZBxFVrO22zcYfxnNZXK3aIkFqstMDbyJXJwgCSzNQBtr2N9TabfJPLCQ/rIVYYTdSG
	kpx4FBc2KojF7A==;
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWtuW-0006oG-IB; Fri, 27 Nov 2026 06:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWtuP-0006gy-1p; Fri, 27 Nov 2026 06:14:29 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1xWtuM-0003oe-OY; Fri, 27 Nov 2026 06:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=1T7/7nww0/4/79z0jy9uTnKIXpmgKwoKwH7hVl+Ne/I=; b=TDuPX4f25D+RIk6
 EEF7BcVsiaxRSESXdTIBjy69KFAm28BVjJFrmYFf590KPxxZaoNJ6iwrCgOUuuUaveW+hxHTjndmD
 xkaT7yXhGuId/M2wrg1zUppUhF1CDOQcoxDAYzd9Xt/PgnxpWNr+MLKbO2Ji4kN46VAYRCcTAix5H
 I4=;
Date: Fri, 27 Nov 2026 12:20:50 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 14/24] target/or1k: Use 64-bit TB flags
Message-ID: <awlndRBeVJl8zvWo@hive.localdomain>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
 <20261126233604.67722-15-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126233604.67722-15-philmd@oss.qualcomm.com>
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
>  target/or1k/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/or1k/translate.c b/target/or1k/translate.c
> index e00ef45b9b76..e656301642d8 100644
> --- a/target/or1k/translate.c
> +++ b/target/or1k/translate.c
> @@ -45,7 +45,7 @@
>  typedef struct DisasContext {
>      DisasContextBase base;
>      uint32_t mem_idx;
> -    uint32_t tb_flags;
> +    uint64_t tb_flags;
>      uint32_t delayed_branch;
>      uint32_t cpucfgr;
>      uint32_t avr;
> -- 
> 2.55.0
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>

