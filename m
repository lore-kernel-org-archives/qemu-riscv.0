Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F03EB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 13:13:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLkWJ-00029r-FM; Tue, 18 Jul 2023 09:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qLkWH-00029Q-Vr
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 09:13:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qLkWE-00064X-S2
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 09:13:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so52855575e9.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689686012; x=1692278012; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XeGID/4mYA3iIotafZH3yaAZ5FNXSRriP/wZOkRTUJY=;
 b=vz3W9JZ4bja1pURg0N7QnYmZ97p7JOAFU9moEEUmPDDstLpTteqCQfkqtvPpHa2UPN
 TisqiBEkHfI1Sebb1uyYlCCufKFhBSNPlN3/lrp7MCyyjwUCsa2IxObBw3FLGU+m3kTx
 Yiv/GEN6VsS5NiEArvVUkuAgKfSKGIODdnlKlqgdQWW1Ah3LzD6VtjANgL14xNRPfINQ
 AGjow2YV7s4fwx4JCTZH9XP4DOTIJg/osu1hPQEuk8iV+txfCP2DSFmY/d6gFgH6ohPr
 Zb0mXYqQUrneLwGQBsFjThmpVZLzze9TqHxc5EgDrUChXwhPqkfRVyHDWgMJn9XfAZoi
 uCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689686012; x=1692278012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XeGID/4mYA3iIotafZH3yaAZ5FNXSRriP/wZOkRTUJY=;
 b=BSuVeiDtT/AWodizJOJB+3W8eobC+yf8+l5dSXLmZnj5MpliGxB0xC39lff0Xz4ln6
 4pwA/RSGQ8vvZ4fqEjAXyx4Hz/l6p+z2zIsv84o3X+Jx+/RFMio3EmjpbTj3LjpbIVWP
 4K7+/CJ8cc4pnJu1ifI3DouCTpQpLZ2OwQzESmTfxxFD7KSz2+32SG7McnB8D5DDOBld
 RgfL6zlXCHp3EHL2wkdHFEyBJ2bzFfwAMo88h3mUG1KA8jBqH5D762vFRWcS3hLDUkTD
 EBtvo80ZWIoU7TGKRCXszsTdYKcFpAFg4ZuTzg2MiKoBBs/t8hXc8m71XMyAOIjgRf09
 38GQ==
X-Gm-Message-State: ABy/qLYdRvwcDnU4rHN8TNS6wB0Bzz5PKqK2scoKc7WLWskUn2f/P9D4
 ZdEhh34GzTwuB7TiylzWxzLZyQ==
X-Google-Smtp-Source: APBJJlFpsxTMctQ+y7DOv/Kumm7qQXeIKpoE8rAySiUhX0WTrurdgafu9tejxZaF1stkvDnpYiroZQ==
X-Received: by 2002:a7b:c391:0:b0:3f4:a09f:1877 with SMTP id
 s17-20020a7bc391000000b003f4a09f1877mr1654809wmj.23.1689686012418; 
 Tue, 18 Jul 2023 06:13:32 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b003fc16ee2864sm2099526wmd.48.2023.07.18.06.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 06:13:32 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Rob Bradford <rbradford@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2] target/riscv: Fix LMUL check to use VLEN
Date: Tue, 18 Jul 2023 14:11:44 +0100
Message-ID: <20230718131316.12283-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The previous check was failing with:

VLEN=128 ELEN = 64 SEW = 16 and LMUL = 1/8 which is a
valid combination.

Fix the check to allow valid combinations when VLEN is a multiple of
ELEN.

From the specification:

"In general, the requirement is to support LMUL ≥ SEWMIN/ELEN, where
SEWMIN is the narrowest supported SEW value and ELEN is the widest
supported SEW value. In the standard extensions, SEWMIN=8. For standard
vector extensions with ELEN=32, fractional LMULs of 1/2 and 1/4 must be
supported. For standard vector extensions with ELEN=64, fractional LMULs
of 1/2, 1/4, and 1/8 must be supported." Elsewhere in the specification
it makes clear that VLEN>=ELEN.

From inspection this new check allows:

VLEN=ELEN=64 1/2, 1/4, 1/8 for SEW >=8
VLEN=ELEN=32 1/2, 1/4 for SEW >=8

Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure instructions")

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
V2: Switch check to use VLEN and active SEW vs ELEN and minimum SEW
---
 target/riscv/vector_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cfacf2ebba..4d06754826 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
                                             xlen - 1 - R_VTYPE_RESERVED_SHIFT);
 
     if (lmul & 4) {
-        /* Fractional LMUL. */
+        /* Fractional LMUL - check LMUL * VLEN >= SEW */
         if (lmul == 4 ||
-            cpu->cfg.elen >> (8 - lmul) < sew) {
+            cpu->cfg.vlen >> (8 - lmul) < sew) {
             vill = true;
         }
     }
-- 
2.41.0


