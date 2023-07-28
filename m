Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA922C001DE
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 14:25:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPNK2-0006W9-RF; Fri, 28 Jul 2023 09:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJv-0006Ql-IB
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:51 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJr-0003Ph-VB
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:51 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b9d68a7abaso1789980a34.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690550137; x=1691154937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hURLgEYq1ah5AvqohmfouRDP0rqjlMJUdkrq8M2Fn4k=;
 b=SzFZbs5Bs1zvTAEsyk46J/s6cTaBuIiVx4axjsYkVdIMoTA0Ov1CKVxHfOvGIV/Agz
 Gg+qQP5bT3Lw4wFTobl7j0qUZJevQqLLbOVA/+whOZvrGMtdhc7ydf5nFwYIyl58kQ0c
 h8V4+ISYfkmve3j3aePTu2fT14Ip9RD9EDJ2JqVqX+7uH2clTXsOQ9cBAa2n41u/BdiB
 4ORFV6LRhPQv1afpipPA8dIGhsMcwGCfDSqBJEpNvrwSylqcAE6RewHkcEp+cUUmOAno
 kDSAtebmgLQ3HeAxHWpvgpttI4gX+pBAVpMjbOF6obCxzWcHLxhZiTH0RmCnlz/lStI9
 xqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690550137; x=1691154937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hURLgEYq1ah5AvqohmfouRDP0rqjlMJUdkrq8M2Fn4k=;
 b=l+nZza3C4l0FYOplExNjE0gFjlJ1HK/WRLHi1CbeIwhDvr6tBFa3eBqWb4GKvdqgJN
 wTVjbZMoS2sfE44rep7UYWp2vYixGubVhuuIEz6tVYyJWsXgbA0sfhpQnQCpaeH9DSOT
 OcIFo/HXJQYbU+taH31wmD2OWSQH256NGM60RhAP5E5NG4sk6y3m2VApzFVJVF7rX7o4
 qZ8DQgtjBEyq1W4gm7jpLhKDcargVEc+jWVzs/dDwZXLrF/95k/K5fNmv8IPuw3n4w++
 ljEVBDIWwS1rNRHdY938o7tj8VN3ZXEOzN3MO491wYT1ghJjmmtJ8AFqLDXRzt4gRZXO
 MEyw==
X-Gm-Message-State: ABy/qLZVmMdfGdTia8k8tl1LGV0CJHxZDXEXNQjqInmd6bsk0JWFuiW3
 p7aX5PQ7f+mRwZcmQ33wZewOjBXiNL/0PNx0/vhdgQ==
X-Google-Smtp-Source: APBJJlFaD6lUXHpCyfYfbHsuve2yFQWDgZKquVN3bkPU4+TKlyM7sWpTPGTbKqn5SCNuc3YxPTqtBw==
X-Received: by 2002:a05:6870:c093:b0:1b0:b13:c18 with SMTP id
 c19-20020a056870c09300b001b00b130c18mr3363467oad.3.1690550136837; 
 Fri, 28 Jul 2023 06:15:36 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a056871cc0600b001b3d93884fdsm1699371oac.57.2023.07.28.06.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 06:15:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/8] target/riscv/cpu.c: use cpu_cfg_ext_auto_update() during
 realize()
Date: Fri, 28 Jul 2023 10:15:16 -0300
Message-ID: <20230728131520.110394-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728131520.110394-1-dbarboza@ventanamicro.com>
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Let's change the other instances in realize() where we're enabling an
extension based on a certain criteria (e.g. it's a dependency of another
extension).

We're leaving icsr and ifencei being enabled during RVG for later -
we'll want to error out in that case. Every other extension enablement
during realize is now done via cpu_cfg_ext_auto_update().

The end goal is that only cpu init() functions will handle extension
flags directly via "cpu->cfg.ext_N = true|false".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 50 +++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 75dc83407e..88b263e830 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1174,7 +1174,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     if (cpu->cfg.ext_zfh) {
-        cpu->cfg.ext_zfhmin = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zfhmin), true);
     }
 
     if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
@@ -1200,17 +1200,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
 
         /* The V vector extension depends on the Zve64d extension */
-        cpu->cfg.ext_zve64d = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64d), true);
     }
 
     /* The Zve64d extension depends on the Zve64f extension */
     if (cpu->cfg.ext_zve64d) {
-        cpu->cfg.ext_zve64f = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64f), true);
     }
 
     /* The Zve64f extension depends on the Zve32f extension */
     if (cpu->cfg.ext_zve64f) {
-        cpu->cfg.ext_zve32f = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32f), true);
     }
 
     if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
@@ -1224,7 +1224,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     if (cpu->cfg.ext_zvfh) {
-        cpu->cfg.ext_zvfhmin = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvfhmin), true);
     }
 
     if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
@@ -1254,7 +1254,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 
     /* Set the ISA extensions, checks should have happened above */
     if (cpu->cfg.ext_zhinx) {
-        cpu->cfg.ext_zhinxmin = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
     }
 
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
@@ -1275,12 +1275,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     if (cpu->cfg.ext_zce) {
-        cpu->cfg.ext_zca = true;
-        cpu->cfg.ext_zcb = true;
-        cpu->cfg.ext_zcmp = true;
-        cpu->cfg.ext_zcmt = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
         if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
-            cpu->cfg.ext_zcf = true;
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
         }
     }
 
@@ -1329,26 +1329,26 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     if (cpu->cfg.ext_zk) {
-        cpu->cfg.ext_zkn = true;
-        cpu->cfg.ext_zkr = true;
-        cpu->cfg.ext_zkt = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkn), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkr), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkt), true);
     }
 
     if (cpu->cfg.ext_zkn) {
-        cpu->cfg.ext_zbkb = true;
-        cpu->cfg.ext_zbkc = true;
-        cpu->cfg.ext_zbkx = true;
-        cpu->cfg.ext_zkne = true;
-        cpu->cfg.ext_zknd = true;
-        cpu->cfg.ext_zknh = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkc), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkx), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkne), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zknd), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zknh), true);
     }
 
     if (cpu->cfg.ext_zks) {
-        cpu->cfg.ext_zbkb = true;
-        cpu->cfg.ext_zbkc = true;
-        cpu->cfg.ext_zbkx = true;
-        cpu->cfg.ext_zksed = true;
-        cpu->cfg.ext_zksh = true;
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkc), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkx), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksed), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
     }
 
     /*
-- 
2.41.0


