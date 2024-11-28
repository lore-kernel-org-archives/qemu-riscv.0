Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E12DD69113
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:14:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGfH9-0005R2-SR; Thu, 28 Nov 2024 09:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfH6-0005QK-6F
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:13:44 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tGfH3-00061i-2p
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:13:42 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-212884028a3so5758065ad.0
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732803219; x=1733408019;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jQmZHVZGJH8bUITrZGLb9vyQJRHYXGRdZuUVz+4EJM=;
 b=RYxsWi19IojJJsvfNYjKxwVqJMHYhv58DgNg0JUbTUnlk/rG6307ZfULTK33YzhYWo
 PgXBK9Q9YZpByTdy2FK19fRzB/Il/6IC85Gqf1Evc27KVHq4nVAjNpDo9V94jAHizwvm
 xDPAw9Jmk7F0suze6F5j05X7hHLNvZYGHI/isXUHj50Yodz1TLdAFAkXD7d3+oyX3zcm
 5Y8ygjqBoEFxHkj9JILSuo4ew4NwexQPaMerX6PhmWv5ZdkxlvI1HkDREjlQJs9tZm4W
 d34Dgnh+pBI9qzOXQ8lxuS4AMayC3ujAhwJNwtbFp3CBHtksr7X0EVLOreGDdgMUkFX3
 eTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803219; x=1733408019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jQmZHVZGJH8bUITrZGLb9vyQJRHYXGRdZuUVz+4EJM=;
 b=Sq9t+gbCxyDpf2aOfg+8CSB5hbUhHJW2a3GvNS4On8y5u2fqPoCxXObAxRiG9IwLz6
 l5mr/CMXlEPv7R4DP1ZsZDqBrFMuVBHlI+wCMrRRByBQKDweavWqypUer3HwvfGmIzR+
 oYblVGoJcu5aGXQKWX9c+jPCxNKT3Eo20OI/al+7qQcr7kcxzknG2o9htogYcSRK7bkI
 InIMJX8ndHKBFDqM4s4Hjhrb23/2P4bp+kS9SqpsVo502xC8y3eDdkaRuUjFcP/Dvs57
 jip1kECuAeV43+h4X2YOgAIDyjxLdItQPdVMAgd/GG6zNBK1WNxFCeG6loB/jzMvdUBW
 N2lQ==
X-Gm-Message-State: AOJu0Yw+a2lnyKjsnjmv48yJYbGwmGFzP7nMVkt0ZI9d8zXJoy89Kn0w
 1wC2Z1kHJXDh0cCzE7y7gYm1nKF6/YRUEWsT6g8nA9TazTkYTAsbQHWjuwZhevFxY4vmdPKG2nZ
 J
X-Gm-Gg: ASbGncsouhgSSVbM7e5ML/g5k0xnXwKZ0W/jsJBQ5fxyz7eXO8trwjHUML0i1Q+yXyE
 irAGowr2SYFuWwz7wHlmkjrt7eBDoyAzJcOUII9Bnrlu+3SmVzg7jcmxxtLsM/Wpk42Gd3XsRje
 vUWaycnwZpxThKGo4WbE7dGwfP918MHwXZrJawQ1eEyNpvB64mtx2eoVgCefU5Y+mcxRS/Ws8/a
 UKmS2eVt3GJlYStOWTHN+5xjs8KWgqf+4BAoXBNBMz/uogqqi8=
X-Google-Smtp-Source: AGHT+IEkX3KMCtHfmsbAFe2ylla4UOAbvh+ROmASYv+JpYewu+jeSYrOoe+VyrZLAWeFYzAIYNXNOg==
X-Received: by 2002:a17:902:e809:b0:20c:7196:a1e9 with SMTP id
 d9443c01a7336-2151d32eafbmr52108815ad.13.1732803219140; 
 Thu, 28 Nov 2024 06:13:39 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f452csm13829005ad.48.2024.11.28.06.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:13:38 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 6/9] target/riscv: Add Smdbltrp CSRs handling
Date: Thu, 28 Nov 2024 15:12:26 +0100
Message-ID: <20241128141230.284320-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241128141230.284320-1-cleger@rivosinc.com>
References: <20241128141230.284320-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=cleger@rivosinc.com; helo=mail-pl1-x62c.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  3 +++
 target/riscv/cpu_bits.h |  1 +
 target/riscv/cpu_cfg.h  |  1 +
 target/riscv/csr.c      | 13 +++++++++++++
 4 files changed, 18 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f30630e947..be7c0475bf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1027,6 +1027,9 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
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
index ed33610b83..ab9d0b19d8 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -566,6 +566,7 @@
 #define MSTATUS_MPELP       0x020000000000 /* zicfilp */
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
+#define MSTATUS_MDT         0x40000000000ULL /* Smdbltrp extension */
 
 #define MSTATUS64_UXL       0x0000000300000000ULL
 #define MSTATUS64_SXL       0x0000000C00000000ULL
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 1194dfd3bc..6699e134ee 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -80,6 +80,7 @@ struct RISCVCPUConfig {
     bool ext_sstc;
     bool ext_smcntrpmf;
     bool ext_ssdbltrp;
+    bool ext_smdbltrp;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 611f44e044..055b19d517 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1649,6 +1649,13 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         }
     }
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mask |= MSTATUS_MDT;
+        if ((val & MSTATUS_MDT) != 0) {
+            val &= ~MSTATUS_MIE;
+        }
+    }
+
     if (xl != MXL_RV32 || env->debugger) {
         if (riscv_has_ext(env, RVH)) {
             mask |= MSTATUS_MPV | MSTATUS_GVA;
@@ -1692,6 +1699,12 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     uint64_t valh = (uint64_t)val << 32;
     uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GVA : 0;
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mask |= MSTATUS_MDT;
+        if ((valh & MSTATUS_MDT) != 0) {
+            mask |= MSTATUS_MIE;
+        }
+    }
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
 
     return RISCV_EXCP_NONE;
-- 
2.45.2


