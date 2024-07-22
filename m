Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9D4C3DA5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 17:51:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVxBK-000439-O7; Mon, 22 Jul 2024 13:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1sVxBC-0003y8-9v
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 13:50:35 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1sVxB6-0001u9-O0
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 13:50:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-70d1d6369acso1074235b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2024 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721670625; x=1722275425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iuE2zhO94ud85q0/GlYCCByRnpO9dMwp6MJra1x8GNs=;
 b=jqQ2yOcaLrDnJUVPukcMp8gkzdcUql7zejXxx2B8ak0LhWasK1oa2IVR3puSfi0RM9
 cQtPkXu/BBNjRXAW23y/iJaxlHkIwuLrtp1rE96+YvIaO9/MNpNEjd7OE/hu/Cf3SLki
 afNUQPEJ+fhm+PHZwL8D7pa8i5WSCFtTQRSGGzOw0PnRR7NCHHUDlEMJuJpJTiBarGoa
 PYfRL077EEllv26DbujefYISG2nTjjHOrIZZ04aoavalYBBFrvNvXXRc3/AG1yS55z5D
 Kh1qT+GdqNUVYtUeENMjJMPV+tVgZJAyxmh2Hvypfc88hjV+d1VCs4xLQvi3ukjUNGL/
 J8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721670625; x=1722275425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuE2zhO94ud85q0/GlYCCByRnpO9dMwp6MJra1x8GNs=;
 b=DHv1oUlUArJzncMbGAbnw7Hj08QyEMArFKP6hUPBSoaEsDHtSwVp6cEGR6mQcuUMfR
 iV8vr9SByQFBQk9R4sTjVQbMhBHK59CRsx7K9SOIn/2u9nN18yp0I6qMfI772RlNQpRH
 RSFBlk5U+Pxx6qwJWZqe1SGWPqoM+RCFgN+XadDCEtTNlZo+sxwYJoBwVsvh7lYwpu75
 u5rjyoCbFZ9dsiqkhmxpJbk8/8ZLU/oQoOfwIABRlMvA1WlU5G/ETWhOkZq403EjSHje
 PJwHc3fVQQ+fG7qYQHaV/Xqe0HPtlMFncnRkN5sKakhfr5hxktIfw5xBII7avrPqALYC
 +oEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqYO6lr3/E56NTwlLo9jj+REyvvwhZ3MQdTITdduRjKHAn9yNZtME639ldrsLhkJn4Qcx/wTyvGPQDsPr8hIikgtx/pqA=
X-Gm-Message-State: AOJu0YyBoqZR9PsbU1bFOtwVKxkdnKdoaKKolIAdmABAfEP5xi0pOtDY
 xdBbqoHkI9YnLnFJNwHddJ9+fovs8Hj+tyagOdYqczFY9eElVI3RteP0hv7+ox4=
X-Google-Smtp-Source: AGHT+IHkhWqG+hhzuFHl7wfK+y4D4eA97FM2SOOrLADgNRLgunbESvELT9hZglIr3l2zyrZ1hOOLyg==
X-Received: by 2002:a05:6a00:851:b0:70d:2fef:2ca0 with SMTP id
 d2e1a72fcca58-70d2fef2ec1mr3436167b3a.2.1721670625496; 
 Mon, 22 Jul 2024 10:50:25 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70d26d98169sm2234850b3a.76.2024.07.22.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:50:24 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH] target/riscv: Add a property to set vl to ceil(AVL/2)
Date: Tue, 23 Jul 2024 01:50:04 +0800
Message-ID: <20240722175004.23666-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x429.google.com
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

RVV spec allows implementations to set vl with values within
[ceil(AVL/2),VLMAX] when VLMAX < AVL < 2*VLMAX. This commit adds a
property "rvv_vl_half_avl" to enable setting vl = ceil(AVL/2). This
behavior helps identify compiler issues and bugs.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/cpu.c           | 1 +
 target/riscv/cpu_cfg.h       | 1 +
 target/riscv/vector_helper.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a90808a3ba..8f21171ffa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2687,6 +2687,7 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+    DEFINE_PROP_BOOL("rvv_vl_half_avl", RISCVCPU, cfg.rvv_vl_half_avl, false),
 
     /*
      * write_misa() is marked as experimental for now so mark
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 8b272fb826..96fe26d4ea 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -127,6 +127,7 @@ struct RISCVCPUConfig {
     bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
+    bool rvv_vl_half_avl;
 
     uint32_t mvendorid;
     uint64_t marchid;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1b4d5a8e37..825312552b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -75,6 +75,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
     if (s1 <= vlmax) {
         vl = s1;
+    } else if (s1 < 2 * vlmax && cpu->cfg.rvv_vl_half_avl) {
+        vl = (s1 + 1) >> 1;
     } else {
         vl = vlmax;
     }
-- 
2.43.2


