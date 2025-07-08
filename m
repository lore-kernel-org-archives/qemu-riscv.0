Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC0C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 22:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZGUE-0006Mw-4l; Tue, 08 Jul 2025 18:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luxu.kernel@bytedance.com>)
 id 1uZFwc-0000Gs-Kn
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:33:42 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luxu.kernel@bytedance.com>)
 id 1uZFwX-0000oc-EU
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:33:42 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7d7f0fcef86so280037785a.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1752010413; x=1752615213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DlW7iJ+C8rcpKrpFJBlschQsTW0cjQ0FNGJLVtjFCKo=;
 b=bHUg0X92KJ4cRYUEZSxdFdldAN5lh+wZ+hK7qQdvRpGr/4ENOipHH4EABeMwhTIFew
 XCcnVlWbokKl0M60pcQjNfKAJDiw12zugGjty2EsK0PKZgh5laFP5q9Z4Mz+MvrcsgXy
 h4M3Nq07fegcOQFcdMgWc30oVRl1V6QHSBECp7HhD1rOtabcIEX6DlY6UZbsL/TEF22+
 mozrw6LC+tAIhwzMiaJSlO8UycZg8ny001mEiR5jojSZ0+ulm070fOyg4wN4+RDXT7hM
 rAEA7bCyuqHg72HC0IXPHOF3WXwoK33Gla/PdmWs/9hsLchHG2AVMbPi2vWXfs0hYwD1
 yDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752010413; x=1752615213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DlW7iJ+C8rcpKrpFJBlschQsTW0cjQ0FNGJLVtjFCKo=;
 b=krvUC6ONFfKaQrPW2HOYTiJj4HBVg9E5Wzif+jVIMCifa+LNp+zMoQfMg/V+W3yPus
 Ky9qn1TpkF48F5Gnd90lJ3uMhYDxHMTYsZYDFb5QjAAru38CUvWojvugt3h7pOJpEd9e
 StF+MaEKAVgLlxXUUMBHlpgjE7kgPtJkwfikZRLsg1d+K1hi21rzHher/1woPIKpOVU9
 wG/RUTxmPdQOKR8qe7QXQTsrcuNgZSi2/GnhS1jgJRP/WXkRrqfKcpuvxZ5D+xSEP6fF
 +4h8hUscmKdRID1i6h/Pb4LjrR1lmttsDtrk4rxke4CG5THg09+PFma2Z8iQxTnPDHma
 CWtw==
X-Gm-Message-State: AOJu0Yy8DdIK3qwMlorxfhM7OjiEeQWtm+ijFbEekq4EPXlHWqT2Azu0
 MVbI7Zlm6+ULSGfYTXvnVwxltlIsZXS3kGmJVv0YTo41YhJURieKtoiVLTF1zbdXc9IAtynD3Jm
 vcOun+gZ9riMw
X-Gm-Gg: ASbGncu4FUsX85P32IggKNzn2g2QyAoDBWdfRHx7J5FSeRgrmu4vGrF1WlM/L4Xl6sg
 mnZcvQJNRTpRKhsGGQaca0LfGq1l+oWJjHdWeqJqDmd9hnpT9y6HUlDiD4SOmB+du84AWeIJZst
 7g+DYTDfHvSnPGK+IddalxUGUb6/MB2VZxD1pVUhRNac4s7ERNqpaRBrPCNXBhicK7ZxOLIhSzZ
 8uc4Ml0L9UvDbdr9LtpRBFcmB350qdZGTQGPMN/t70MbHd1Igba/Nz+qbVliqiXXiPZPm+pxuJH
 zV0bBin6sCwt4zzAUcCJVVopEyeSDUpCFc/GbxLt5qv0evcC2glUZp1m8FyL3DizoNC3en5vTHf
 qEBKpulVEpIYvGx85EMKPBqSqhiZn4SLnVXuqRvj9vctAco5emcu+U12779S6
X-Google-Smtp-Source: AGHT+IF6AAIvK9eyIkmGLUG4TOKJUDJZ2TnguFMof4aiR9CrOjY+tkFI+unFspBENtcPGZ+AxsiDUg==
X-Received: by 2002:a05:6a21:a81:b0:220:e7d:8e30 with SMTP id
 adf61e73a8af0-225b8104ab1mr26951229637.18.1751954849898; 
 Mon, 07 Jul 2025 23:07:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359d634sm10615776b3a.25.2025.07.07.23.07.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 23:07:29 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, apatel@ventanamicro.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] target/riscv: Fix exception type when VU accesses supervisor
 CSRs
Date: Tue,  8 Jul 2025 14:07:20 +0800
Message-Id: <20250708060720.7030-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=luxu.kernel@bytedance.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

When supervisor CSRs are accessed from VU-mode, a virtual instruction
exception should be raised instead of an illegal instruction.

Fixes: c1fbcecb3a (target/riscv: Fix csr number based privilege checking)
Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8631be97c5..9bebfae3f0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5577,7 +5577,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 
     csr_priv = get_field(csrno, 0x300);
     if (!env->debugger && (effective_priv < csr_priv)) {
-        if (csr_priv == (PRV_S + 1) && env->virt_enabled) {
+        if (csr_priv <= (PRV_S + 1) && env->virt_enabled) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
         return RISCV_EXCP_ILLEGAL_INST;
-- 
2.20.1


