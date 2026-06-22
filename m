Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F23CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 22:46:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbnOs-0001Pz-T9; Mon, 22 Jun 2026 18:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wbnOn-0001Pf-UW
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 18:45:52 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stephensportia@gmail.com>)
 id 1wbnOi-0004Wa-Fx
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 18:45:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c40397e746so30490245ad.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 15:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782168342; x=1782773142; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D3P9AYrpA4BY1vKyeayV+CK886D88ViD7/xJCKcwZO0=;
 b=U5gWNMapJ2uaM/a/pFts6cC1X1J2/RVrnb2VIQQNvpveC2vKwoyZZvBaPbDbr274A4
 EY/Wk5lqGYIy6D/q7criIT98SP71m1CaXDoiEusX/tLiL265S/TY6UQweUaf5poYSRn5
 /ENe4y1bX8BBpJJTUhGu/5U7DBMtjEkl90ldGGde6CQapfOBcqe4Q6TllE2KazcsGKI7
 rIm9eMMeIjsVk1Xc55PaxNjwqcVr1CMQTQdokd6/9RW6fAJ4nm942xZ3IKt+/qHU3fhB
 7Gu569bw/iDblK6s/cmys9ov+Xc9tXj01mdehiDLLDT/r4Vdn8qOpxiCTQ105ChNSkqC
 WyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782168342; x=1782773142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3P9AYrpA4BY1vKyeayV+CK886D88ViD7/xJCKcwZO0=;
 b=aH+oe+Wu3sRC51XwO2aqZcQb9Nsl1ClYgl85ssJuPvjJO5ym2mSg55UeVAS/maqAs4
 3OinreHPK/zNRKRl/6w63xZQIgnPy4ydo4JTsRHElZlQLZNnxvmH0vjabHFSLs+eqU6v
 k33WjNhaGvJyT9egdBy/zsJR/SGSKmsyin8MY+4eMeuErSPy2AF+YFTYAMYTObi4hohI
 5KY+rH5P+mgvu2WtI6mMojQpIkUPaj6Q2JAcKABjZIX5VJ5gWPN8PtIJ6iiXVzKtzOPI
 K/nzctplVFZvh5a9sno5XRX0RvwzVvGe/F9921/6yZRG5k4z7X1Vj9KtZ6GtiIIp149g
 /WSw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqb3JVfSarxrpAIU9VTbPNJEi4rPRaLDmDwV3M+X9JhkH8cLj5locME7O4AREyrPbCJ8KBKbf0K5yte@nongnu.org
X-Gm-Message-State: AOJu0Ywn7++gT/aS3VTLLIUDReRwiPAk5MMIVCG0i0tKojtv1qWOSX87
 sDQ5FMCBiq3j9q9n0UF3zSokL34AyJpRM4oyflrxjZNz4XpWo/VoQdNT
X-Gm-Gg: AfdE7ckmMXtbHzQrPBTMDcjD+uObi/VayErDwJ/+9uDrDNg95ovUV4FNBcOKjSMHgCa
 FoEVbJMg4T+LO+boIBxpTLCyUosojMlW6MOdv2UHtuoZSKkB03InIzTXi9uGuzn6fJhb8tOKkjV
 ZXwZi7iNfiQ8F+a6IPJ71OkTPVC+5FGf+knyX3JGVnZiUpFX7QJEJ8JhgStaG+LalE3F4jZG1Ym
 8miUnksXqcOiiAdcDIawE8NXiUKLfDX2R3p5N259zrc6z3mRcha+Oc5j4M7PHv8osxEqSU8tcHx
 /cfHFP7ghRGF+QGkS2KehIOOjdInmfmLKlcIdlhlDwks6+lzoasjRt8gEcZkJ0ZmYRNdOEv5xNI
 Gol5PwJ+aa9B/eQb43PUXMEbHdnPGcWMQRJuaM66dKQNqa7N8IHgY/UNmktGKG2iM/oPmnpQrZ8
 Rnqr+30hr2NZeXyl88Xq/E20r4CC4iybcYODRSL4xSgbm1zavH3MI2W5aNYw==
X-Received: by 2002:a17:903:1a26:b0:2c0:f807:9bf3 with SMTP id
 d9443c01a7336-2c7423d65cemr125205855ad.10.1782168342240; 
 Mon, 22 Jun 2026 15:45:42 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7436af585sm92060885ad.5.2026.06.22.15.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 15:45:41 -0700 (PDT)
From: stephensportia@gmail.com
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH] target/riscv: Generate illegal exception for inval.ir and
 w.inval in U-mode
Date: Tue, 23 Jun 2026 08:45:34 +1000
Message-ID: <20260622224534.1923407-1-stephensportia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=stephensportia@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Portia Stephens <portias@oss.tenstorrent.com>

According to the priv spec "Attempting to execute SFENCE.W.INVAL or
SFENCE.INVAL.IR in U-mode raises an illegal-instruction exception." Fix
the current implementation to generate exception.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3543
Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 target/riscv/insn_trans/trans_svinval.c.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
index a06c3b214f..10cb9e32b6 100644
--- a/target/riscv/insn_trans/trans_svinval.c.inc
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -39,6 +39,12 @@ static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
 {
     REQUIRE_SVINVAL(ctx);
     REQUIRE_EXT(ctx, RVS);
+    if (ctx->priv == PRV_U) {
+        /* Set the virtual exception if virt enabled */
+        ctx->virt_inst_excp = ctx->virt_enabled;
+        gen_exception_illegal(ctx);
+        return false;
+    }
     /* Do nothing currently */
     return true;
 }
@@ -47,6 +53,12 @@ static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
 {
     REQUIRE_SVINVAL(ctx);
     REQUIRE_EXT(ctx, RVS);
+    if (ctx->priv == PRV_U) {
+        /* Set the virtual exception if virt enabled */
+        ctx->virt_inst_excp = ctx->virt_enabled;
+        gen_exception_illegal(ctx);
+        return false;
+    }
     /* Do nothing currently */
     return true;
 }
-- 
2.43.0


