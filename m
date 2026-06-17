Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F0ACD98E1
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 05:41:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZj1V-0007JI-Oa; Wed, 17 Jun 2026 01:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZj1T-0007If-Cv
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 01:41:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZj1Q-0003uD-Ge
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 01:41:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2c132ac5ec2so53521125ad.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 22:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781674867; x=1782279667; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=BQEWgXktcVOZGb0SH4AhjUQ8K9ug44WGZ2I0DwVF5GA=;
 b=hZjkftaCGLZ41y9WXaD3vcoufpDICRlMTdCGWJPg/rVFsbvQuC6tRKZ1yInFv5ORgm
 Izpm6OaAiWSDZvhf8o3QlQfirvXYBSL5i+uynTNdZP0BgUy+qbc08+RGvvDLf1GDi4nP
 o+pgv8P9rSNoJDV1o0mRfUQTlcCt4auT0EwKcUN1DcORoNS8RTNdd9UKU/eJ39jLDmOc
 I0eaOCfuktFe07xBe8G9lTgl516KNFvEH+Fbo/Cx2BOOM6DvIplMGZSA+lkQtqU6ol9j
 RdbTqok8JI0U/Du44jVHLEAGDKYTMu3eNXPp1d54NSJmlcDNKQotsUuATHiQhaT02qvv
 jqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781674867; x=1782279667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQEWgXktcVOZGb0SH4AhjUQ8K9ug44WGZ2I0DwVF5GA=;
 b=dOLBcA7nihpkdS9HEg7rhKQ1sxQnXw5GGQayks6LaO92XeWYwXYS2r4prArd7PisFj
 PrrMbLf37M44bRgn/54tAvLGgTn74yWy/Vz9a5lCTHhqWq/Y1Pi/NWXpihd460PWUEPE
 jSVYVD5/iHXO424Enw7dbIOY9hxUmZv6LN6fP/u34LUqP3P4LQCbBp/i6OeEJr48V2dD
 tP27A1xTDIwERzO+OPsuqKSJOwWJPGbVq/5WI+c9/jZPdlJk21Xp1lNSQih9/A3WZ6UF
 8o0RLe5i201cEzB2t/lMNsmLqFTnB3K60slWoLpa4z0AFoomWpFWBhKYrGQ/jTqGK+Cy
 whbA==
X-Gm-Message-State: AOJu0YxrzES7A5fq6ObfYYXzFXJFfpXiX7g16OcxXoL7jRtddiTV5uXG
 dcgZpH7pMDP+FRd6ec6qn4A2KkPtqpnabHRYVimUGVlEKPCWWVOVCFHy
X-Gm-Gg: AfdE7cmnOS9Sh7RoJfmzI1NBxV/Oq38vZJwGuHstq82CIaPJJIm1/WtT3dsYunvusca
 gUzSOftFkVliPPNr4n38S8T3qnJDA/kNyyI6wi4Okrc3swsV2iyWlVe0rotFjIXEt9UAdVBnXeA
 88QUXKg8k9s9sSggE/VXfrODZE36ecine6W18gypxD25ThVC3TsPAk+QzWi7kmNVAvz4qpLciZp
 F96eahZ2ruFRNf67UyRL3rD/WyA7FDAp64s9AqWPKi5NkvdfjvGZ8rR1Lw/CeQevQVyFJxlAWV9
 ISubQunxTrp9BVLGXOK8zZcb6vRekSVCVqOOj1eDneFJ16Bd+uFbevMVzJB5yXUGDAdHGc63F+v
 bSIhjKyKg9R1UPAnkM8hBthEk9Q8uzHYzuYDnGGHyW8jkr7yo0bcskZVtNbvUq3QKnOIrcuRNpG
 DkTMNw3RFT3gc96RsIcVsU98eHsnFth1Bff4v4DdE3nSdk/RnNFWOtgomOi93Ql6wRRMYlQifH7
 9O9NxhfrtERmoFSvnLoCFa7BiYSOtoIvwYY0HaI7DU=
X-Received: by 2002:a17:902:ecca:b0:2c1:a19:839b with SMTP id
 d9443c01a7336-2c6bc24ab5dmr23415805ad.27.1781674866607; 
 Tue, 16 Jun 2026 22:41:06 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c433078264sm149294725ad.65.2026.06.16.22.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 22:41:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: alistair.francis@wdc.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anton Johansson <anjo@rev.ng>
Cc: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] riscv: Fix IMSIC CSR write and add tests 
Date: Wed, 17 Jun 2026 15:09:25 +0930
Message-ID: <20260617054034.1020724-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This fixes a segfault in master with any machine that uses the imsic.
A test using the virt machine is added to catch this in the future.

Joel Stanley (3):
  target/riscv: Avoid NULL deref in IMSIC CSR write
  tests/functional/riscv64: Use newer kernel for tuxrun boot
  tests/functional/riscv64: Add virt machine AIA boot test

 target/riscv/csr.c                      |  8 ++++++--
 tests/functional/riscv64/test_tuxrun.py | 11 +++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.47.3


