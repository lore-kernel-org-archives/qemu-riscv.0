Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF10EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 19:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJf6X-0000ro-VW; Wed, 12 Jul 2023 15:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf6L-0000pA-Ut
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:02:15 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf6J-0006Yy-Qm
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:02:12 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a425ef874dso765033b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689188531; x=1691780531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISGp9WhmlakO4roPRO9/GdVvd2qgHOTCTKibkwihSgI=;
 b=JFqlSPmm8p73PvbU8WuCQbESvpOjhU1Dg9OGeaQrqr4PuJ5lc+lqqOTaFYv5KdKt4E
 I6tmfv9l0ZBGBYR+dLka+rOwTelc+DwUgbALOF3x8OwOLRxujUuin7KHJ615u5oDKeio
 mXRopax1tG49f6dU+S22uiCGkteRy+sB2CGWg6T0RA2hefvb14GhoSMXTiidb+HAMgQ4
 JxfT3bwbRPWua8h/W0IdpUjogVUjKcEiqwLrHRhXwyGlhEKVAcv5cg2Hs7hQSTEsNAbO
 FtqZOIIqkzSgH+qkTy4P/Nq2pfIyU2Xp//yVw7uuKIBE6quG6F4q2St+BLfEDP70Zv9t
 OYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689188531; x=1691780531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISGp9WhmlakO4roPRO9/GdVvd2qgHOTCTKibkwihSgI=;
 b=LoPulbBr9XFtDIoEUYGnbpHkslV0TbNweaBoR1RYjsh0tJwxZhZjzNdcwUwVyi+wRE
 WlQ1mh8eCs/CBkUDD0o/VPiR3OFk6erjk1CvXivgczzvt3iXjDVsE0w0kkVQvQA2SvNt
 sXkLnU9qruszje8swM83cB1WZqHccRqKRB7J2lYBa2TRpHoGHpKEN/bTxx1I1igr6S9L
 BIm3c+p6ocxk8u/Rabka/jdnsJfPpEBGOs7YfdF+IoooYzdBQX2eomr/wn+Qhef5Y5YV
 XZPjgdxYStHWx2K7a40/Q3uEt6EZWgVDUhkWRL4tQ2t0RqxkOIPSAGb18J1Ip3G1snyj
 mgyg==
X-Gm-Message-State: ABy/qLYsM5WwZJj4oiSU92oCoY/uak1GM8SV+ZlzsEnoyf9CnV/LekR6
 beKJ5MNugLTrRGDSaiA8zcm4MA==
X-Google-Smtp-Source: APBJJlEBR0EZBSkfc+0m1yWErHUOfhH/6G+zdsTkd3RTzEMfAht2KXMTobwxUn87HDcCKUOPmIBchg==
X-Received: by 2002:a05:6808:290e:b0:3a0:5ee3:ea67 with SMTP id
 ev14-20020a056808290e00b003a05ee3ea67mr16873295oib.16.1689188530848; 
 Wed, 12 Jul 2023 12:02:10 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05680802c900b003a020d24d7dsm2174435oid.56.2023.07.12.12.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 12:02:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 5/7] target/riscv/cpu.c: add a
 ADD_CPU_PROPERTIES_ARRAY() macro
Date: Wed, 12 Jul 2023 16:01:47 -0300
Message-ID: <20230712190149.424675-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712190149.424675-1-dbarboza@ventanamicro.com>
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The code inside riscv_cpu_add_user_properties() became quite repetitive
after recent changes. Add a macro to hide the repetition away.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c0826b449d..b61465c8c4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1881,6 +1881,11 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 }
 #endif
 
+#define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
+    for (prop = _array; prop && prop->name; prop++) { \
+        qdev_property_add_static(_dev, prop); \
+    } \
+
 /*
  * Add CPU properties with user-facing flags.
  *
@@ -1924,17 +1929,9 @@ static void riscv_cpu_add_user_properties(Object *obj)
         qdev_property_add_static(dev, prop);
     }
 
-    for (prop = riscv_cpu_options; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
-
-    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
-    }
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_options);
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_vendor_exts);
+    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


