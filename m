Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD095C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSNh-0002Vn-4R; Thu, 27 Aug 2026 01:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNc-0002UG-S1
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:24 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNa-000411-FA
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-cc1c3c90074so1547824a12.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807421; x=1788412221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m8Kte4PTJGY69G7A8K62LLjGu3iDEpCuzO0dR9OmEVQ=;
 b=FJIInTNh2TP8GWwmEZmr8Kt5gbFPIL1Q752KUzWt6TVfmz+Rw0uoUrJGDwsprIPztz
 z5aIVhp43MxLxPaiMBLEL1BJclY7+Ed/p/09qBpHQY230cldqvBkskpZ6ajqbnqiktjA
 I8u0RzFiY9oiVFgJx50Cl3DNo38HMJy86dWfxPvM30qxDxDGnjl9H2RiOzFywGd2DfRV
 ErBfV9KjUOCW++c6ofhAYqBK4TNVlFmrdtOICUEV0i9LavdriLqSHNJZlI4M6vc8rgO+
 VnHDIMPEN0nz8gbx19aRUKk8BaMWnsnVTbgVuumM4y7kIseqKThV60A8uMK6ARwQECf0
 RMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807421; x=1788412221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m8Kte4PTJGY69G7A8K62LLjGu3iDEpCuzO0dR9OmEVQ=;
 b=AkpYxMZg8UAWp3pXDLrDvIenkfgp/EpAPx8EoGIonFBSuNZ4KsL82vkv1lXzNb8u3J
 saET5JzrdMrjnQpsedNr5+Nq1ELOEvcAWUUy9EkhP8LS5PM34Ha18Txmj9FHC8TNXZy+
 sg5wZt1f0Lfg5ONdONs3k4U8QXiWSxFtZ7X5HcB4TVY6pnjcjVTyVLgzI1fRlDSoCTCh
 WWzPzZfC9qISdlR71mPaLAGniX5uClzgTuqesY0i/cE3xf4jfxG8vV8rGNNZ2MwLBQlx
 Cd9PwA2tMPIY95lhlpNjybZTRuNxcolWkAeFoUNt17wzBV95KRmM+CUsuhey97L9PWH+
 F8kw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpD/3waJ53qs9Qu/xkU/gPcgm+KCd08jvd/G2nBDphvjK6hXVip+1RZDYFcMxwBy6MzHD5qy1goQCHs@nongnu.org
X-Gm-Message-State: AFuF++mZXuVXa7h1MPLvA9uekB8CWwRohvCZv9fRlXNpng1ZmTLNuWzF
 6odn2Eu8y9MKipVG/ZsAULng5+uyOSFq/xQRf7gLLiS3kYkCNYIcj5bk
X-Gm-Gg: AR+sD10rO1E1yJXx6RUunOzV4D3IKe5yOnlUbIdJ7l9618GpMgbTuggIHzJ0Y+WTotq
 z3t3EcFwsShWP++L3ND/oY7EdzI+cPAiX2XsN8y5PeP5mylEEhgdSnm9d88uuLfAg8SyrM0e6Ax
 iXS1/3WsW5Z5ELVfLM0UO20jZjfXLqQg2hFXHDcgSxgymVUgvR9L/evUA67Hzwbdc+asxiczeSU
 vOhKTiC1mOb6rA/HbRxJW4CGtn4HwGMz3B/0dkSr7xHY0vsDsib3Ghjs8PpbQjDL38JWdR4jTuc
 IGD2c8l82L7EkJg/7nCuBgnS0tgn9StvTXdd4cMpjrQRm1S6C92X1J9dWh/HnMafKTHP1N8UHDa
 k/a82nSzcQpHa5klblqCgAYETKk20aghiNWDh/MAKWkHaeZBNQ+iqr+8A3vlT5eEPGYBSA38rLY
 jNPhacd9AZBgZorWPDIBjXw4ikjn3LnaXvmUR2sz7gnpO5I0wuj2pv5ei5+8DnSisoEsjJFLLZ8
 QwmYWjxLTXjJtVFvYahFlPwl5v2dVD4NCV4Dwvh+XuYAuIPpOTkmCSi3yvngTXYAm2u/ZmOx4wl
 4+1o9F/eRxzSNiYnOfez
X-Received: by 2002:a17:90b:2b4c:b0:38e:97f0:aa4b with SMTP id
 98e67ed59e1d1-3966d4592fdmr26918579a91.13.1787807420908; 
 Wed, 26 Aug 2026 22:10:20 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 01/12] tests/tcg/riscv64: Include stdint.h in semicall.h
Date: Thu, 27 Aug 2026 14:39:40 +0930
Message-ID: <20260827050953.67184-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

semicall.h uses uintptr_t.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/semicall.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
index 11d0650cb06c..2fdd322af91f 100644
--- a/tests/tcg/riscv64/semicall.h
+++ b/tests/tcg/riscv64/semicall.h
@@ -6,6 +6,7 @@
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
+#include <stdint.h>
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
-- 
2.47.3


