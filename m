Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6CBD16245
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 11:25:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0J9y-0006a3-DI; Mon, 14 Oct 2024 07:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0J9w-0006YJ-9k
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 07:22:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0J9u-0002dY-JL
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 07:22:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-431286f50e1so20959285e9.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 04:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728904958; x=1729509758;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQQO2T5uiR+FYgD4cQeDW1X+EPKbvqM649D/aATLO28=;
 b=Rsdz0dKLUyq4qvZLGDmpXelSsVwgsoCPmyjgxL7fVFSGycmF8jIh+M/iuFbLD/gpc+
 05y4bZZiuUIzhFvIXg0z0TwESvvbmvlpDyOEvAyBkKAmzmvdCOQV4lLsHYiBi6O/xhil
 Z7mIxHVcNkwbXzEalMqWcOIgwRVujZ2SgqUf/hfe5Y+1NRKpqQyzh9cK6DAPJOznnCdl
 9sKZXgUeoFOtCfYIX84MniyHVMuU1O3YEmIfwRXFBEQ+Ps07guxa3ulN6tFJCZDsQ/vF
 aWR6uqbDGfEjdbnkWno1B87lyNgyb2JCfn+pKDspDZpvu1RJ6bm3OsqYd7wa0zm8siAo
 /32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728904958; x=1729509758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQQO2T5uiR+FYgD4cQeDW1X+EPKbvqM649D/aATLO28=;
 b=KeclvpeifbDVJQlZolAf5T4cPszcyhV2eG5kn9C3HLT85C/9GtUTYm7P9HIqvvJ1R8
 GBOwTXhEdvExTXsUaP5BYXR25hgFqOdzOJwjsXQx3qljekjafZFSMX6gLKz8UkaowTIe
 rsB9HLN0BhPkQVZvt6MC1WORJjek2xO0nW8S1Ge0ImORf6vi9BG/p7sbGnPiE2ZFcVdg
 o9NZc0hgu5S4fu1Xdhkx7huSgWW+cwE77XUTS4uCZDrhE4BCQ0r5pW3r0cumuH75Uabu
 ykAQ3/fHyQKabzhLkzPek/+/7O6vpX9XEuJo7LLADO7e1wZio43LP/i/2vZYIAVzAstF
 dpNA==
X-Gm-Message-State: AOJu0YxwOilk7KxssydUs3JqC0Att14tYaIQld527n3L1OUgSfzJskJK
 JzIqhdATF7M9FV4IimIyPshzhGmmk8s7zLSHuVlhtZ0O2x3wmdtjTuQdVOmzVi1O4gLYe5dTGwr
 taKI=
X-Google-Smtp-Source: AGHT+IEjYxqgLJ2n8zlhNXgKVsYmlQ03KfR0qpjFGlsWbLm/7uQv5GlqIwVpRXnShmdSKGUsKvnKTw==
X-Received: by 2002:adf:ffc5:0:b0:374:c1c5:43ca with SMTP id
 ffacd0b85a97d-37d5ffa3561mr6197519f8f.32.1728904957840; 
 Mon, 14 Oct 2024 04:22:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd382sm11117303f8f.43.2024.10.14.04.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:22:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] target/riscv: Add Smdbltrp CSRs handling
Date: Mon, 14 Oct 2024 13:22:15 +0200
Message-ID: <20241014112225.90297-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014112225.90297-1-cleger@rivosinc.com>
References: <20241014112225.90297-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add `ext_smdbltrp`in RISCVCPUConfig and implement MSTATUS.MDT behavior.
Also set MDT to 1 at reset according to the specification.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu.c      |  3 +++
 target/riscv/cpu_bits.h |  1 +
 target/riscv/cpu_cfg.h  |  1 +
 target/riscv/csr.c      | 15 +++++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4a146bb637..53e3bb6b37 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -946,6 +946,9 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
             env->mstatus_hs = set_field(env->mstatus_hs,
                                         MSTATUS64_UXL, env->misa_mxl);
         }
+        if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MDT, 1);
+        }
     }
     env->mcause = 0;
     env->miclaim = MIP_SGEIP;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5557a86348..62bab1bf55 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -561,6 +561,7 @@
 #define MSTATUS_SDT         0x01000000
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
+#define MSTATUS_MDT         0x40000000000ULL /* Smdbltrp extension */
 
 #define MSTATUS64_UXL       0x0000000300000000ULL
 #define MSTATUS64_SXL       0x0000000C00000000ULL
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index dd804f95d4..4c4caa2b39 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -78,6 +78,7 @@ struct RISCVCPUConfig {
     bool ext_sstc;
     bool ext_smcntrpmf;
     bool ext_ssdbltrp;
+    bool ext_smdbltrp;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d8280ec956..cc1940447a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1617,6 +1617,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         }
     }
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mask |= MSTATUS_MDT;
+        if ((val & MSTATUS_MDT) != 0) {
+            mstatus &= ~MSTATUS_MIE;
+            val &= ~MSTATUS_MIE;
+        }
+    }
+
     if (xl != MXL_RV32 || env->debugger) {
         if (riscv_has_ext(env, RVH)) {
             mask |= MSTATUS_MPV | MSTATUS_GVA;
@@ -1655,6 +1663,13 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     uint64_t valh = (uint64_t)val << 32;
     uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GVA : 0;
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mask |= MSTATUS_MDT;
+        if ((val & MSTATUS_MDT) != 0) {
+            env->mstatus &= ~MSTATUS_MIE;
+            val &= ~MSTATUS_MIE;
+        }
+    }
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
 
     return RISCV_EXCP_NONE;
-- 
2.45.2


