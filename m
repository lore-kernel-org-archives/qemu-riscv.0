Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47151CA5FF0
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 12:31:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDhqJ-00033m-3e; Mon, 05 Oct 2026 08:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevincheng60303@gmail.com>)
 id 1xDhLx-0001qF-3S
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 07:59:39 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevincheng60303@gmail.com>)
 id 1xDhLr-00033s-37
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 07:59:30 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d747eb79f7so5418315ad.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791201562; x=1791806362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kXY8X4qyai2cQehCVlEpPRB7/FEYuF+0iLxJD7N9epc=;
 b=XvFEQ2rxh6cLhaerV5uT1lqXs+rVepdNgzr7eTRxLJzOb6IWZ74YvJABM5TcuWqreM
 +rov4w8rxpoLRqOIQQkAmflbqksV1B6YtBDxD/BOD6Ddioc1NgUBSis8jhMW+PJG6BE3
 k3Oyok5pSktDjHsMeosvcQ39HqJzBGpqPkOKPke0ehPwV6+7YpymMnHTamJrV0hVTCi7
 vH6FZNdC7i14QFJbmdWf1CliBEZazsGQuRxjeAHFkbkNmZ52NA+uiCdJDKtksGniNtgC
 eYSfVnb6eujp/jpnRrj4vOG1dAdo9sqA63ENq+tyEazTSOS7sxdhPmLWOcQmgJzWBr2k
 jeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791201562; x=1791806362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kXY8X4qyai2cQehCVlEpPRB7/FEYuF+0iLxJD7N9epc=;
 b=1qyjsUgR6BdiCba72ZqRz2o0/KIudCvUZ/TqJokFMd40VI53M5xdI5tBMVjjxR6QsG
 qx+edI9H8W4BCWQvs9Ex6ulbsmFMzvabCyCZrZF/CeaPi/kAXO3gAh7UFu2u2ZwK55MN
 lUJ3X0xUTkWf4rxvJLO1M/owSzJPJXs61d5FmctYzoViZ31z1hamYhoFPkW7Gqe2uzKg
 YdMcl2bs7pwZXTov1sA14sVAZX+DGZXWK0GxYSML1nfeLM82n1hUnERWS4oN7gw+ykMd
 6r9+IacqmPfRjVM55+TZq2q2a1ri6aGlg5pKTsAXBAWgsOqqaEGq4QRPdbVKem2JX/E4
 WqVQ==
X-Gm-Message-State: AFq9FYJR6/bE1nmsznli8q178uet5/SV/5SxX5bb8ikMexXYiU411zG+
 g6SmINIyW7IphcvoNMV7xh26aKp3iBbogsDvwjXiWDWffmksRL83duPZ
X-Gm-Gg: AYBFou38b59KTcvx89PSm0lIDbApwkVWM1GCJS7ML0dtWBYnckkLBfKPC73ko2ZkjXR
 AiX0VL1X8vbSYxvmlZx4yycU+eSHb7/M+F1ka+7w8vX7vovMYOB0jgsjDyswF2Kp1e4MEvqwGvK
 BXF9Qf/tsKFcmXpaB71A2ov9tGvLiWkkxN5OgXP0dS/UHkCQwCjz7pDR36Z4EuAT3b3yX1Oc0+m
 4aP8gBLCqX7SHvyOKeaNgdlS51mDMx2xWaSoYZmQ86TXsLJbTmbtTlHyzMtlynGA0PMCzm94J3x
 kgzjgDoGvfwWSGhLneemVqjoTBxOZ39mC/Xal8eaKl+H4acGj3dLWmoTsQolWuZ1E1BqN+RT4IY
 b+puykJ6ZP1TWqm2UxEnnvefFa7zbqYv8kHLnGKgXH+5jqDkQRVGJU9I1sYFDkoim+NrB11U7ff
 nkCKq9VxHSEon4VYuWVWxbxAZQkN6fjeA4R6AAha1Y4wSrNIBRRT7khQw+peQn34iuhyLe/ms6a
 GNkq6hnBU12dPvWFdDbDEhX3fAzUJX/booxLt6SSGh38LUhsWzNk3mW3VSTp5fsXpp/3R7YdpL+
 F1TfoTLRxQ5LyjKKYe18wyIbIXtlpOTd/Iaj
X-Received: by 2002:a17:902:cec4:b0:2df:ae99:7595 with SMTP id
 d9443c01a7336-2e49b694ce0mr92908525ad.69.1791201562603; 
 Mon, 05 Oct 2026 04:59:22 -0700 (PDT)
Received: from localhost.localdomain (ip24-93.wifi.cc.ntu.edu.tw.
 [140.112.24.93]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e5a5ef67f2sm6024465ad.76.2026.10.05.04.59.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Oct 2026 04:59:22 -0700 (PDT)
From: dodochicha <kevincheng60303@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 dodochicha <kevincheng60303@gmail.com>
Subject: [PATCH] target/riscv: Check Svnapot PTE before updating A/D bits
Date: Mon,  5 Oct 2026 19:59:16 +0800
Message-ID: <20261005115916.21196-1-kevincheng60303@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=kevincheng60303@gmail.com; helo=mail-pj2-x10.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Oct 2026 08:30:53 -0400
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

Reserved Svnapot PTE encodings must raise a page fault without modifying the PTE. Currently the A/D bits may be updated before the Svnapot encoding is validated.

Move the Svnapot validation before the A/D update so reserved PTEs fault without changing the PTE.

Signed-off-by: dodochicha <kevincheng60303@gmail.com>
---
 target/riscv/tcg/cpu_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d9222652..105f2f1927 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1403,6 +1403,13 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         return sstack_page ? TRANSLATE_PMP_FAIL : TRANSLATE_FAIL;
     }
 
+    if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
+        napot_bits = ctzl(ppn) + 1;
+        if ((i != (levels - 1)) || (napot_bits != 4)) {
+            return TRANSLATE_FAIL;
+        }
+    }
+
     target_ulong updated_pte = pte;
 
     /*
@@ -1473,13 +1480,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     /* For superpage mappings, make a fake leaf PTE for the TLB's benefit. */
     target_ulong vpn = addr >> PGSHIFT;
 
-    if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
-        napot_bits = ctzl(ppn) + 1;
-        if ((i != (levels - 1)) || (napot_bits != 4)) {
-            return TRANSLATE_FAIL;
-        }
-    }
-
     napot_mask = (1 << napot_bits) - 1;
     *physical = (((ppn & ~napot_mask) | (vpn & napot_mask) |
                   (vpn & (((target_ulong)1 << ptshift) - 1))
-- 
2.50.1 (Apple Git-155)


