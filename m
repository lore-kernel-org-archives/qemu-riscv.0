Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F7606A323
	for <qemu-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dABnvSxQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xS8fn-0004Ya-6K; Sat, 14 Nov 2026 02:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xS8fg-0004Xk-GG
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2026 02:59:37 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xS8fe-0003KJ-TF
 for qemu-riscv@nongnu.org; Sat, 14 Nov 2026 02:59:36 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ee2072d1e7so3537135ad.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794643172; x=1795247972; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0rwWj9gIUdkkDpRP/VYAqHreahRQc9G/zfbFzVC9KrU=;
 b=dABnvSxQPbIGnPHpFA+vfCBmOuj/i/jkHqiU5ZSYc7AaxaloTqsyXqr24V8VeUuClp
 jJXUz/OjMkYmTNbSmJUdEfC41/SV2XMb/QPvGsZji/QReLuPEtvj1hdzLhzvUsaIYVYd
 QJk0V5WK3y12xGXdvZrd5Ku62J7kLWGTcD9jmBOakX5N5pXzng/sbI7OoRDbAQQ5PKrg
 gcobRKsn6Cfof8ZfK/W/k2vS62ukiJsa8Orzl0lb2Wx28NgZQEBaYvGdBnYPpjv16gfr
 tt5NX0Fs21yCng/NgkyxHmfmnsDU2YR29WyADAJNLNb1uvaSYlvbVeCIykMKl5GwODuE
 eX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794643172; x=1795247972;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0rwWj9gIUdkkDpRP/VYAqHreahRQc9G/zfbFzVC9KrU=;
 b=inJv89WhaB2uZxzDNIUxyU7XmsAW7P18aVnVC9g7gUECC5tACTXFqWTJv1sv7Qsesw
 e+YC/uQSgR9p1H9iVA/ohAF96DDlCXL/Gk0IdAEwLfaY2M9JWeNI7wkvc8pf5h6yDf1u
 igfkOxkwfMpbE8gHnsu+Bl6Rm05nL8tAGOzBQR40VCqsVsNqhZwKg997IvEj+qVlEk1e
 QtIcM226s2MIFSj1I69JC8xGcl9T4zXD96jP0AV/yq5AIqajGRxxK7xNqohZDULCNAfx
 P2E5x5ZOpN9TWb6q+61dr5e2UJUc5UhC0c53gcCXqsz/xo9v5QqBHLZrtlbhg0Z3pIdx
 HXJg==
X-Forwarded-Encrypted: i=1;
 AL+hErF6Qee5nNCDEBhXljciDDFjszNnsiOyPI7OvWaLuMYhlsv6LB1QJi6aMEXokVrgaAkxGoHfHqo8VkMH@nongnu.org
X-Gm-Message-State: APuU4Z89vtVbbCI/K3RGVyRXQAaTSt2L/JmvVT1l0OYREuOIAR5ohwsr
 eW6PfmeGBT5ESXaVeBRFMXJJn7BNPseask0zCUQlaozHZVUgd2f5wA2l
X-Gm-Gg: AYBFou2JDifFhAJVt+9e2QmPwLHpIXPqzrhda65I0nAZhvodk19k6aYj2232PSFPq77
 /zsreogFNLRcKAEPrNGsZot/CN+7GMKznrZS2xJ/5aP5TblFPG8EvELUstzo30T9G79VMWCbv/7
 IlY3u+F+E736qSkDvSGuvxJF57N6GV1cUbUsSY/2rFcAjNagm+52Gr7dXJyo69J7tTFAOQRJ+SW
 N6Oab5GJtRZEcC90KtIWPKZe2Vpiet9ZrQ5INR4k9wkHv96EDjUjrEWzolhJtsRKN490msYFMMA
 ReT/EAKBi/TGAOF4WBX2zQB50KYXjDvNaRluyj7KDDLO/2RylC0qgXM/PRShbPE/Ozp9/KdgBvq
 GD2rXiPbc2TR0BVY0207qmNZl3BlJaNkqIByXyL/9vMMt5MbjGaGgWPIMDMZAEorAMQ0Nnq0GHJ
 SgEfY8WnxE5fXUlwoaRFKPLsjVd5ScaMxMBBj5miC7nEppAxQdLvxIPRFdX9ZdPc+I6BQL4F85D
 phCpX3gREu+D1yykUJbB6qmgt4Dg+plzbMubGgDtM7sPHAxaF4w5zHFoaMdsdqncwaVacdgPq4k
 yIlx5PJAaFJLOD9qfEJgynKgRvw1y9VM0zvMXOc=
X-Received: by 2002:a17:903:22c1:b0:2e8:6ae2:75db with SMTP id
 d9443c01a7336-2ee0dc05d7bmr44955275ad.41.1794643172507; 
 Fri, 13 Nov 2026 23:59:32 -0800 (PST)
Received: from zhenbaii-ubuntu.. ([2406:da18:17db:6700:d3eb:66a0:6641:5037])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ee17e14e5dsm16169815ad.4.2026.11.13.23.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 23:59:32 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	wxchen0913@gmail.com
Subject: Re: [PATCH v3] target/riscv: use gen_goto_tb for vsetvli
Date: Sat, 14 Nov 2026 15:58:02 +0800
Message-ID: <20261114075803.58854-1-wxchen0913@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <e54b27f6-7130-475c-b2b6-b7a477de48b3@linaro.org>
References: <e54b27f6-7130-475c-b2b6-b7a477de48b3@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=wxchen0913@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Did you mean TCG_COND_GEU? Surely dst very large results in vlmax.

Hi Richard,

Thanks for the review!

I think TCG_COND_NE is correct here. The `dst` value actually comes
from the previous `gen_helper_vsetvl(dst, tcg_env, ...);` call.

According to the definition of the `vsetvli` instruction, it will
set vl CSR and copy its value to a dst reg. The value of `vl` is determined
by the relationship between AVL and VLMAX:

AVL <= VLMAX:
    VL = AVL

AVL < (2 * VLMAX):
    ceil(AVL / 2) ≤ VL ≤ VLMAX

Otherwise:
    VL = VLMAX

So, `dst` here is either equal to VLMAX or smaller than it.
That's why TCG_COND_NE is used here.

Thanks,
Chen

