Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98DFC3600C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u26Nd-0005GU-KU; Tue, 08 Apr 2025 06:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26N7-00053Y-Pa
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:04 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26N4-00088K-40
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:00 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so4398014b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744108797; x=1744713597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QfCL35hEfTLqFWRY5RUiSCNmhgdy0g4LIg3NqW2j28=;
 b=Y0k6mt+GTE2MerjN+xdIT+hPgt10KdrarPZrV3KlbEtVJ/Gg9qJI2xv3ssOIGNoV9Z
 mBhsUdpVTxx3jNWi6xvJRzFqIXz2CMCQvAa3XukoMJfC68YxFHrPnRTJgWWvtheymBlP
 T+AbrYr1ywXdojanFpq1YgMp9iKV9MeKe9/KN506tfWHj8qBqZgIwcvPxQU1WY+5gQ8K
 zpp+pIoYN37jF7GnRkK4nELbTgQ6XNfBR/ICqDAJzyscP66B6q6H7CNEKV2e4ge0XYqn
 zjl93VKSwJ81bIf9JG5tT99q0c6ne5vSsUo8HZaNKmQnK+mjthGVGJvpdFtepQBb/O4j
 AGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744108797; x=1744713597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0QfCL35hEfTLqFWRY5RUiSCNmhgdy0g4LIg3NqW2j28=;
 b=vcw8jVGYieHsNSpbF2Ucd4k7brVGFe6hOj2bFUDYjI4L3JsdsI6Hg+OABmQ7v2va2P
 CvfX5v6iSYu3RRxWhTb5HRbAPvscoJrsGJMy81B+iFTn0s6db+KTiGYUgf94e9/nYfmW
 udca6yNKhtPPm35GB3MJzAIUIqiAbkgNJlKsukaoXQSJpUzqkdIGxSDI3Yj3fp6V3Jjf
 5Oqdsqn2gu9UO5j1ULNxkObz+LJQwe8N4Bgo2vUNhmbRZN2yyqq78Iwu2J/znXp5geEK
 sQnB++RrIZ+BFVgXsZMxPyvW/NWstMaY1ALpU13HGYW+ajZP6HuUo18JaDzAlBFyhkwS
 xTwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIIVXd7Opv5s+5jZE8M9q0+j+DJs7K18g8gf4mivbz89FVOFm01LpkZsjPrl3ZM6tDvpqsj8G/Yw3C@nongnu.org
X-Gm-Message-State: AOJu0YyRhJovhAtjpm37EPHMSqwbm9yTt8T0h1eWW+3r7vt0u1TCeOoy
 SvBuiHGjd9yujD2bCFzN6vhmYHDisO1oDsxyYzWhF759busOLDoy/3ZltEjFHuw=
X-Gm-Gg: ASbGnctbuvXoTaur8rYg3dlfmwgZZnJf6HcN8upB1iBUqr//FtOafelx+sH1PSo6Ygu
 dwi93/0TfkLjZmRSlvaWyGhAM0jOmHp/JE+txfmQeMPkn7VygnmEYzf9/A/px1t2No0kumHahYL
 odjsF169yt9mgH2y+P1B+axJI5QSwiQVrfbqOhxsWIrluP0JAZFqA0cliQaR/EybBWIAzgk7iK9
 8o6mEl+zSxH2Jzy9BUKsT9iAO9VQGLQOG9Y3eOo8TOf7/nThS7T3mG1Vc+3EeT3ybIMNSChtCzu
 0PDFCtk5vqVx7CbD/8e3+YJKzKODeGXTQUIO793QdLDtFm1JAmlUM1rOvEW32Q2EtjiFSpqyXxx
 xHt9Uyq+eulu01Q==
X-Google-Smtp-Source: AGHT+IGyiyk9Jd9O6cWtsOMilXlxrNhDz7z05dJETpiqRClwzIfA8Ovn4VXdX4CwBNInWcjKJ0oDcQ==
X-Received: by 2002:a05:6a21:9211:b0:1f5:7873:3053 with SMTP id
 adf61e73a8af0-20108187d17mr24888259637.29.1744108796826; 
 Tue, 08 Apr 2025 03:39:56 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e3734sm10532380b3a.179.2025.04.08.03.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:39:56 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 02/10] target/riscv: rvv: Add CHECK arg to
 GEN_OPFVF_WIDEN_TRANS
Date: Tue,  8 Apr 2025 18:39:30 +0800
Message-ID: <20250408103938.3623486-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408103938.3623486-1-max.chou@sifive.com>
References: <20250408103938.3623486-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42e.google.com
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

From: Anton Blanchard <antonb@tenstorrent.com>

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 20b1cb127b4..e630f8661e1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2403,10 +2403,10 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 }
 
 /* OPFVF with WIDEN */
-#define GEN_OPFVF_WIDEN_TRANS(NAME)                              \
+#define GEN_OPFVF_WIDEN_TRANS(NAME, CHECK)                       \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
 {                                                                \
-    if (opfvf_widen_check(s, a)) {                               \
+    if (CHECK(s, a)) {                                           \
         uint32_t data = 0;                                       \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
@@ -2422,8 +2422,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
     return false;                                                \
 }
 
-GEN_OPFVF_WIDEN_TRANS(vfwadd_vf)
-GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwadd_vf, opfvf_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwsub_vf, opfvf_widen_check)
 
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2505,7 +2505,7 @@ GEN_OPFVF_TRANS(vfrdiv_vf,  opfvf_check)
 
 /* Vector Widening Floating-Point Multiply */
 GEN_OPFVV_WIDEN_TRANS(vfwmul_vv, opfvv_widen_check)
-GEN_OPFVF_WIDEN_TRANS(vfwmul_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwmul_vf, opfvf_widen_check)
 
 /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
 GEN_OPFVV_TRANS(vfmacc_vv, opfvv_check)
@@ -2530,10 +2530,10 @@ GEN_OPFVV_WIDEN_TRANS(vfwmacc_vv, opfvv_widen_check)
 GEN_OPFVV_WIDEN_TRANS(vfwnmacc_vv, opfvv_widen_check)
 GEN_OPFVV_WIDEN_TRANS(vfwmsac_vv, opfvv_widen_check)
 GEN_OPFVV_WIDEN_TRANS(vfwnmsac_vv, opfvv_widen_check)
-GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf)
-GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf)
-GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf)
-GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf, opfvf_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf, opfvf_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf, opfvf_widen_check)
+GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf, opfvf_widen_check)
 
 /* Vector Floating-Point Square-Root Instruction */
 
-- 
2.43.0


