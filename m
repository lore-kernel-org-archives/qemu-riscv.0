Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D8C001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 15:43:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTOrH-00069C-2U; Tue, 08 Aug 2023 11:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qTOrE-00067K-0i; Tue, 08 Aug 2023 11:42:52 -0400
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qTOrB-0000af-S1; Tue, 08 Aug 2023 11:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=91G9Pk0Exz2mrf4Mv1KaJG1Ne+IHpYla8z7w4QzCQVw=; b=qcsIPBCW/vDZKar83LXCiFUh4Z
 SaXGG+ZnklQThYtxlVJaYU2kjjY0Mfub+l6ZlvgT3Y0yl+407uRaC0NAzm0aOHBIFj1p36g/995vB
 ujhAw5ZaBI8JdcytHYayMuFsdzvTUXJJfLFLVrAOBRE9oZwQRWHgZE1jLkIu4wE+jUYA=;
Date: Tue, 8 Aug 2023 17:42:37 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH 09/24] target/tricore: Replace gen_cond_w with
 tcg_gen_negsetcond_tl
Message-ID: <sodhcladibb7xf7ibqdirlwqfmcsj3xabthqheixzldqwhpogw@kujjnqe4aoed>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808031143.50925-10-richard.henderson@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-IMT-rspamd-score: 14
X-IMT-rspamd-bar: +
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.8.8.153316, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2023.8.6.602002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=ham autolearn_force=no
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

On Mon, Aug 07, 2023 at 08:11:28PM -0700, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/translate.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 1947733870..6ae5ccbf72 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

