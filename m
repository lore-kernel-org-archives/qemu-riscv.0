Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD09CC36008
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:46:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXQw-0007yV-5X; Sat, 29 Mar 2025 10:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQl-0007uV-RS
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:06 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQj-0004ET-R2
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:45:03 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so6330126a91.0
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259500; x=1743864300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtSo8S5OEBT4DMRlalXCu7rqXrD21r5pPZJo/XU9Y9s=;
 b=S7/ett0nxXThRZ511gpWet+GPl0EH9IYf7Svni1OCDkJqjVzlaRgdjmb+9z1+CJCdp
 C/bX6jdf6KBqX6Fj/e8d6Nuu5qfqanNPwGmmtmXNhqBt0/tmFz1Cy9Mi93sImGxmarlK
 8G+Nz3c91RKWUuJGui8ZZM+U+uUv3nHMpOdr0a5nzoXQsxGrCvampPtJAWTlHbh/vUoN
 kijMQPLHDWwmKxliotjR7rhamkU81CJVuGuH8/C5gUHc4siwZvkGmcivY+hGLnHh8rnO
 NA7527c2ZoyJQzPnfl2tSuAfCWVQktv6Ud6XSRnnFRcPaC72SiS3JzzhEFsjPQwKTL21
 YsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259500; x=1743864300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtSo8S5OEBT4DMRlalXCu7rqXrD21r5pPZJo/XU9Y9s=;
 b=R0vJ6kFV3xMYPFLMlT+TV1P8e9pOSsVtlNxqTyxxEAOzEBCj7lyZwJjlnzUXk1R98D
 5r8Wmg2l5a4yx5KBQVShOxZy3c4txQifjei4pvCXTZCvvutDmOePLF4oPwrk7d4mGpY0
 rMnH5SRwB8pfPWWN/Y0kWnFlU5y3GXeBaVnhFfAEjAYfqAmGukXqe/G0VP96CpP2XEAK
 jeh+QkG4PrS5T4WPxXrETIbAV5tQrOesAjvDvZVO4cYzJak+BbFf1/4vJO0/s2mtGhXD
 logMESH0Nc/OOgdGYKEleKc062C66ouAXm+mDHn/Y/oErP7PrZzU/qjegXRC/Oa+2PSs
 p8RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXjPJ4JfFCvBXBtRNjEX1U5UX5tyudb3Rv96+M72sxBE0MX6sXJnwF4D0/GGsm2JNWvk5HrHKqmyTU@nongnu.org
X-Gm-Message-State: AOJu0YzPJqfHKhN0/h4O8lHGDq3xlsoFg6yBvtZlc4SNMHzqIljNcCdx
 4J5AMQP7RjVKAzZh46Jg1R9AMAY88EvdcafNUJoCwNkBzu68Xr+qSdfP8DSx5kA=
X-Gm-Gg: ASbGncspquYMGLnP19ALshqsqAwJBZER5n4EOcaVn4M39SE4byF49uTe11ixr5NN6hE
 3DehBb3VV0irm365yOGhqUrahsMU4NoIp3SOoOKT6AMv43ndhr9uqoX0Tg+FVHpDsNIOXvxoaGI
 dKz9gDWdJ8CxsQn10RgALWrgVmkKCMDjFNUqZMzJB8zUl20ncKGtNJ7/M82W0JxsK9jCcgr8s7d
 hX1+YryAin4ibMEEUZn9VR/HE4MGO8sVh04TcZEJYbaOXA7R7rL4WezVdavI6RHgAbFV+T37tYs
 0l9JlMdzTQLsNQDQpvOSTpdDcGlacFGmCYYfFKxpvABJd82dun8f1925HukUSfAHBf7TwQ6myNC
 t9RtiAHjaLKImKg==
X-Google-Smtp-Source: AGHT+IGhMkJTmTKVty3lDI0HZVYQlybcZIK0+t+SGMbZYc8kAdoU+OBLajVmCqeIOk+Myg5KCKNk2g==
X-Received: by 2002:a17:90b:56cb:b0:2ee:9e06:7db0 with SMTP id
 98e67ed59e1d1-30531f94677mr5273778a91.11.1743259500126; 
 Sat, 29 Mar 2025 07:45:00 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:44:59 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 02/12] target/riscv: rvv: Add CHECK arg to
 GEN_OPFVF_WIDEN_TRANS
Date: Sat, 29 Mar 2025 22:44:36 +0800
Message-ID: <20250329144446.2619306-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329144446.2619306-1-max.chou@sifive.com>
References: <20250329144446.2619306-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102b.google.com
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


