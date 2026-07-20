Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019CEC44520
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 10:56:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllfi-0008J0-7K; Mon, 20 Jul 2026 06:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wllff-0008IF-6I
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 06:56:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wllfd-00029z-8g
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 06:56:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38175907a56so2667214a91.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784544983; x=1785149783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ohX+6Yw6pMY18P5edWzMX1PEBXVYSegrTf1jxHWkr1k=;
 b=l7Pu4Y85eTS1wWX/bYmqtwn8OtFM8wnTNNm54OC+MU1qPT/VnWqTwUoWld3zha1eNY
 wuFLrTRo7ZrfLivdC/W7+jC/NrtGr5o04acHWOVKBFG2fx6a/nH0Fa5bvvr9gHL7zdYo
 hwtjU2iLksBJoSF7BxeBEl7Q8EYl75xgSwGcHWLHcnbyxqKjLJmohZ1cnh63d+zUrp0n
 31iTN/NZAiI3eLa9gY6m94bIgXa1RFCtmdlK3ZL4fkJwoifp+p7BpPHo2yzsTUsGVhYH
 v9jyPykyFS8e0jjlE2Brj5gIU1l5ojLnEkrdXR0OTjRxVelDNzG5aC03oP+9Loc78fBp
 ITAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784544983; x=1785149783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ohX+6Yw6pMY18P5edWzMX1PEBXVYSegrTf1jxHWkr1k=;
 b=lO7bjCdko3QVC+y59LNhsj0C2R3GJx0rPQS6/C52HuMJDUjFsvrmgbn7kU4AQI/h6G
 +fonBrJA1cnZMXUaFXwNGEGIlXsK8L7+ZWnb42FHCyy4/PKdvdnEKmdd6ZDEnTF+Ujgi
 IFLXlGIWvfEDtQ8BFU1qV+JoCcXnXK858q25kOl0SjdJhpvrwoftAqcMELH073q1seTk
 nQwPvYOoZOvTb1PtzLoywNCyg0Z6mhXG/sPQTtttJ5DFUaEPdNQXo205eqpgMagKiolI
 7tET6aPMDp0WgM0fg1oR6vOCxvWjtATtvzGUYG1fwWIHGXYWL2VQIrk7kdKdF4Bbixlx
 HJrQ==
X-Gm-Message-State: AOJu0YyjHNAm/KV4fH4F/wf3wUpvD37Sm3P71OQ4ryDyh8cc821JZIEs
 +aZ4IEdWQkNpf06q6mb2d1rWpNXe4VZUI9TfVlZZKCiqAahAkA57hBOi
X-Gm-Gg: AfdE7cnv66GqcburdqVx5tp3TeQ+pxO9/9PK2YULXncrq8l79F1EZ1VerZWqtD3l/EX
 T+A9UtL04Hw1D9pSqjWKOr9pTBfzbgPFpD/CAArKpICfeAiiPGpG/u9fwu1a/MjvhSIIeViCQfs
 8JUj7/vaUHo4WAc+XJi4xtb8jeN/YTHsW9rjS3ot6h7+QQuZ58v0d5hGIHSNwNs7Ilby4BwZ59S
 lbxqKrjIX3MZ8LEdz6+jdYPQo71tEkRBjod4dv/G4SpPGk4sSZJ+R4dkhShuS7lYw/nt2CdlaTl
 C/vf8um5x4E8gVfn2HqLZnD1XpFjW0MwWJZrVfZxT2vwOsLnwOs7LKfrHZ3ATxBoyAnGmU3QZud
 1EKmVd0pvgTGLBshVMKotMsjozEYN1PStAA7z7vmZ6kT7d6IwLlGqsK2gPDXOmPE7uv793GAXNg
 ==
X-Received: by 2002:a05:6a20:258a:b0:3bf:aa54:4cbc with SMTP id
 adf61e73a8af0-3c38dbb8287mr20051724637.26.1784544983327; 
 Mon, 20 Jul 2026 03:56:23 -0700 (PDT)
Received: from arch ([112.133.246.0]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31429cf22b3sm36122216eec.0.2026.07.20.03.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 03:56:22 -0700 (PDT)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH] target/riscv: use SXL instead of MXL for read_sstatus
Date: Mon, 20 Jul 2026 16:26:12 +0530
Message-ID: <20260720105612.953478-1-314abh@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=314abh@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

According to the RISC-V spec, a 64-bit system can have M-mode in 64-bit
with S-mode being 32-bit (SXL bits or mstatus[35:34] being 1). In this
case, read_sstatus should use SXL.

QEMU doesn't allow changing the SXL bits in mstatus in M-mode. This was
because of the missing MSTATUS64_SXL mask in write_mstatus. Now, both
the SXL field in mstatus can be safely modified in M-mode and
read_sstatus correctly uses SXL not MXL.

Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 target/riscv/tcg/csr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 36f2004bc..b67a5a301 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2067,6 +2067,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     }
 
     if (xl != MXL_RV32 || env->debugger) {
+        if ((val & MSTATUS64_SXL) != 0) {
+            mask |= MSTATUS64_SXL;
+            val = riscv_write_uxl(env, val, MSTATUS64_SXL);
+        }
+    
         if ((val & MSTATUS64_UXL) != 0) {
             mask |= MSTATUS64_UXL;
             val = riscv_write_uxl(env, val, MSTATUS64_UXL);
@@ -4014,8 +4019,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
     if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
         mask |= SSTATUS_SDT;
     }
-    /* TODO: Use SXL not MXL. */
-    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
+
+    *val = add_status_sd(riscv_cpu_sxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.55.0


