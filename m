Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D1ACDB47F
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 08:16:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcfG7-0007B7-09; Thu, 25 Jun 2026 04:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1wcfFh-00079z-GV
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 04:16:20 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suunj1331@gmail.com>)
 id 1wcfFf-0001dz-HC
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 04:16:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c891d27b10eso1147988a12.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782375357; x=1782980157; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2o7sKN6n20YLRxgIgS5cX38Zxp20rf7inv0GaVmEH7A=;
 b=ld9K9fG4irz9kDSyzyvCvvvM+yf0YNPpFoM1t4KweROEHnmrvwi5B9mEKNtRSvkf8d
 HUNRWfm+a733wEzYr7vR6El0NEnr5OcukXR1p24ynrPFCSB9RGdvYemdcbuns1Tx8lkK
 Hv/DNF+WlAwHBZM649WdLskwecKKAD/ekqfx6vv2pgihjIitXpvUs0yRqv2kXgzIQfAM
 3GESnavij5qr3bzBJ/+rLn0DCwSCx2w/Jnxpkg672/J6FY+bXpgSe8B9040Vm8yWF1+C
 L1nawFnj0Udzmv73WcV9B9MHRC22e9nYyNNUNhBlSFlmfEK7SGidYrOy0NxzFzbuwcoi
 vJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782375357; x=1782980157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2o7sKN6n20YLRxgIgS5cX38Zxp20rf7inv0GaVmEH7A=;
 b=raZ0dxvrjCDvkOj+UoCeAUOUC9NH2D3pKpt7IH1QUezMv2F8pQZYSIKgfzMkQA5xh1
 9W1vSYrCebrOEMqkGkCcZNgEqt1bWZAf7IMiaEs+UH6NB3TEyy22wAg/FrpAfTr3uSZw
 ST9+xig0/LDUA366deYJDVNmYvi8p+xtjdhAqyV8VVSPRroEXSF883+79I5rxtjDOIbm
 IiJ9OQyTGz+oDBWtcNS4ymN8l2h227eeAC6A+VxpVIyi6d27/x6gvjn4mT2vkGGmaKdP
 Fml0zPYj2qNEul85rLCVO8zAkOydkxG+ohfnBz3+QN/UNNzlmhYwePVMcfXw+JH0O8Pw
 NUTw==
X-Gm-Message-State: AOJu0YxWaZJR1qa5pg7/x2AwzNPLnYnsrXcZifgFvSobTII0zeO1MRxP
 JqmZvPIjSKKAqAuiDcFjXoCGYBFGy2Es6zcp6aMCuev9pWj6dyMlJPQ/
X-Gm-Gg: AfdE7ckOB6wwlils3tUV+leaOAteTOsOYMBmNWcu89WvH7L0oyCBlAGnqd1X6udYlNG
 9nSU7k4rbbdImqfMyTLaefQ5uxzu09JqOvSPLQGviUZNqS4BqDp6Ar+lzNnhkZ1Kfl3XmJUcfFz
 txX3vglwxEoQYTDN6V2Ta3AFGLCATBv5vlmCvr5lS9pkLTsekwcS1FTQ7zj9Rlm5fFfVnSjRTDD
 fjPdJMfi2qb5UEYP5MoVGhf5BwlDgPEPK+iU1a+Y92xObOxkcUJYeBqEfr4S+6TjYfI7eNf3yWa
 TF7sVPzabtMBOaZWIfL0XRJYeFypdJVbUzPkAATviptM5RwNFWDcAPlT1i5yoqOUHR/iBy7W2oa
 nBWOZMZN7qzACEIVyyq+qQb3OkRhm1JLm93wihHWLfFaTtouxDqkfHICoeR/YSW7o19B3iSJ9S1
 tvYGq2iGDNm3Go/6j0tYYRi3Xq1b+subDOBR8f
X-Received: by 2002:a05:6a21:8cc7:b0:3bb:21ad:40d8 with SMTP id
 adf61e73a8af0-3bd4afac2acmr1982946637.39.1782375356831; 
 Thu, 25 Jun 2026 01:15:56 -0700 (PDT)
Received: from fedora ([61.74.238.173]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c92bc1e0d10sm1188683a12.21.2026.06.25.01.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 01:15:56 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v2] target/riscv: Apply UXL WARL handling to vsstatus
Date: Thu, 25 Jun 2026 17:15:21 +0900
Message-ID: <20260625081521.595683-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=suunj1331@gmail.com; helo=mail-pg1-x52b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

write_mstatus() already handles the reserved UXL value by writing a
legal value instead.

Apply the same handling when writing vsstatus so that reserved UXL
values follow the same WARL behavior.

Factor the common logic into a local helper riscv_write_uxl() and use
it for both mstatus and vsstatus.

Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Fixes: f310df58bd2 ("target/riscv: Enable uxl field write")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 target/riscv/csr.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index dd9726fcf4..12f1ce5180 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2012,6 +2012,20 @@ static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
     return val;
 }
 
+static uint64_t riscv_write_uxl(CPURISCVState *env, uint64_t val,
+                                uint64_t field)
+{
+    RISCVMXL xl = riscv_cpu_mxl(env);
+    uint64_t uxl = get_field(val, field);
+
+    if (uxl == MXL_RV128) {
+        uxl = xl == MXL_RV128 ? MXL_RV64 : xl;
+        val = set_field(val, field, uxl);
+    }
+
+    return val;
+}
+
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
                                     target_ulong val, uintptr_t ra)
 {
@@ -2058,17 +2072,8 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     if (xl != MXL_RV32 || env->debugger) {
         if ((val & MSTATUS64_UXL) != 0) {
-            uint64_t uxl = val & MSTATUS64_UXL >> 32;
             mask |= MSTATUS64_UXL;
-
-            /*
-             * uxl = 3 is reserved so write the current xl instead.
-             * In case xl = MXL_RV128 (3) write MXL_RV64.
-             */
-            if (uxl == 3) {
-                uxl = xl == MXL_RV128 ? MXL_RV64 : xl;
-                val = deposit64(val, 32, 2, uxl);
-            }
+            val = riscv_write_uxl(env, val, MSTATUS64_UXL);
         }
     }
 
@@ -5226,6 +5231,8 @@ static RISCVException write_vsstatus(CPURISCVState *env, int csrno,
     uint64_t mask = (target_ulong)-1;
     if ((val & VSSTATUS64_UXL) == 0) {
         mask &= ~VSSTATUS64_UXL;
+    } else {
+        val = riscv_write_uxl(env, val, VSSTATUS64_UXL);
     }
     if ((env->henvcfg & HENVCFG_DTE)) {
         if ((val & SSTATUS_SDT) != 0) {
-- 
2.52.0


