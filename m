Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3580C25B7B
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 08:02:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s79ZY-0003wf-CU; Wed, 15 May 2024 04:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79ZL-0003Zm-Qd
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 04:00:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79ZJ-0006Zy-MW
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 04:00:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ecd3867556so50558175ad.0
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715760056; x=1716364856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puBYhI34uigvIMwKdPxu7OXATwqoJShcDnpckyqDkpk=;
 b=OOzFrHlIBBsPa86/zJL3YGLcse2W33YKqU3LuG7JsqB9T6uCPVJz8nQ8zrIOhAEBWG
 zmmpFdRvXLQoZ1s9gl/oGE020H3RmxPZ0ND4WkHrHQv8jCh3TKMXp4mTkZsFhrCxYKe4
 vzNFxfO22mc0RLxbpDzp2GCOZewtD65qQQrXl9/o1lmQ4ZzxXDVQtzn/hOwFrfu45HZe
 C+dvH8qRip/Vf7j1wPrF24RKILCy3qdDFI7jG7Nw3JSahYeisWuOOZmiOrjyQoEWgZn4
 a5F9V82tr3eLnWU2ns6C6WUcwu8OSEbpe5R/2fjjKgWrdMMqXknCWHwFymQRuyFzZMrc
 Aamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715760056; x=1716364856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puBYhI34uigvIMwKdPxu7OXATwqoJShcDnpckyqDkpk=;
 b=GcjoKAn9NiOzB+7PtSsYr4lVAhc7mtX/m+XRTU83Wd8vC7jZIUunx/rBiZKu+Qp/ff
 WWeYxjoPeIipfdQZqSE17URjWUx59Dcg4QnzW+QKzIaIsxA3y2OaiZ6trmpFPVcrU1Ww
 oOor3i7zPCTnlADJrkDlPZMEtysdfMhxqaBGFnku3a0JkoMq/Dve1FHrtinVSTEroboK
 S7+FLkYlq6iHEFh2sUPBfQlF2wAKFPGeOaAgD8E8NrqsLXkBGy0vFe31PTBDSCSRDpjO
 /2DDC3bzLECFMrnaLsD5rHX6a6oksvPyp9yqgErhra98J3ILz1AojSKPTbHkqmoG69w8
 ABcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm9NS+zbVVJQBihnr+x9JfVTsgR9PITnoFWQidKtEr87v0AR8vnPNTgOrYsAj+B79/ZJ01Y85hsmQfSK3TC2vgaGudx4M=
X-Gm-Message-State: AOJu0YxXTSyvHvXvczqjMls4efAU3bx+pNyf0Dv+FDZhuVLOgxvUeBxI
 reIlauVydg7YTEWp7a/M1Jkp1QJJCybg86GpMI7uCf5wiEm+JYdtA/nQeEQ317Y=
X-Google-Smtp-Source: AGHT+IHlOPTH8lJQysptf9S2BGLUCC+1Ov7svBErIf5IpYC37jpXDNH+9RrgllV9LbD7P/QLv2PqhQ==
X-Received: by 2002:a17:902:f70d:b0:1e5:8769:aadc with SMTP id
 d9443c01a7336-1ef43d26f24mr173192145ad.22.1715760056085; 
 Wed, 15 May 2024 01:00:56 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d1642sm111418795ad.31.2024.05.15.01.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 01:00:55 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [RESEND PATCH v2 5/5] target/riscv: Reserve exception codes for
 sw-check and hw-err
Date: Wed, 15 May 2024 16:06:02 +0800
Message-Id: <20240515080605.2675399-6-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515080605.2675399-1-fea.wang@sifive.com>
References: <20240515080605.2675399-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Based on the priv-1.13.0, add the exception codes for Software-check and
Hardware-error.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu_bits.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f888025c59..f037f727d9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -673,6 +673,8 @@ typedef enum RISCVException {
     RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
     RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
     RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SW_CHECK = 0x12, /* since: priv-1.13.0 */
+    RISCV_EXCP_HW_ERR = 0x13, /* since: priv-1.13.0 */
     RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
     RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
     RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
-- 
2.34.1


