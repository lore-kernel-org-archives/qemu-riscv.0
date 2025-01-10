Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3733BE7719D
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 12:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWEYK-0005LC-Lh; Fri, 10 Jan 2025 07:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXa-0004G5-JB
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:07 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXX-000104-JJ
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e3621518so1162530f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 04:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736513699; x=1737118499;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlbfSsf0XLSLDDHpVKMC9VWFuIj2IqfXKyNi6zEbLXw=;
 b=tbnYaWxGZfECy4x9OO3uCoe1GZg2douZ2MTsytyvYyovp7qCLfGdNzDB+t94jqbnKu
 MYuPvg05T6YcPZUPDXcfQPK4LbBTctaJzJpBbjjb5IdYCRvd3cj0VBhMBdALr+C40PZE
 +qz5Vm0lcCc0IoEQ53EZwbG4ntICnmE9HFTp58TryCCGttoHvpvTlGhxpMNzHeQDVjPz
 0hOYdw0jps/4ORgR+cZp5hJT9VBgjz7J2h32HxGJRd/Oq7y5a9mgu15OQi3MOUt0LxJV
 zutfdCdqis2iw5ppzJv3pABmlMxVmYs2GPPRC5I027IDhk7OLKRK2FGdze3wy0/OuffS
 5R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736513699; x=1737118499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlbfSsf0XLSLDDHpVKMC9VWFuIj2IqfXKyNi6zEbLXw=;
 b=GnzXZ+U8K1emReUUiLTf42zPSeyT6c3Pr/qiH5fj5qhAJ00sPFWWX8yqjtHeDQms8K
 lrLUGcmq1wbx8wTUpmhTpq2a+IjUHC3UzzBUC4f8Fhzhk5nJVH4XyZcUJ2q3gpv7xO3K
 8hGy63XnVmBLBzCHITF6sG6HCMz9HTmscPAMgUwKTiMUqGjlrGCPtvUu6Ioa8SbUwrl3
 f7eLeNOmtNwI7xw8FHYnmDPsemUuorHMcDAfnaG2RDATLNea38+wEDjx02OPwBWQNijR
 0hgAVAgDPTjpclsJ4mE8M1JuncaAjxnSXW83IhcwVqpE6+006XgymiQcNVxswamLMCfQ
 kgBg==
X-Gm-Message-State: AOJu0Yw/lgS33t6FhsNNROJQECqK/9GPtFqcbqIm4X7b++tK1GvX5AtJ
 ZwvFfs2HwPQBzHtX/WM4YWspAQW2EPvIb9l7h4dEuQwAkFaNeQFX0JqdmTm/OvpxSB+FsoqIHzM
 q
X-Gm-Gg: ASbGncuzbOlKUNVZYLoWoQJFm/6rpN6eWls+J4VCgUuVXq9gQIvB44qnv0B1K2E1EUs
 5B0drq7OHNXZDFHTMvOaswZAIQs/7zaHksYPtVDnBtnSJ/SYJvAJa708fa0gIzf3h8cuCF8G+Ts
 y8+GyvS4tZNaejE432AbqbSuIqdiOI52LxuimNH39U+g3ilnUfe/av9QHE+wvgAu1PQDsuhnLqJ
 OEKsUqRJVviMz4SNTiYSwGOiMp3OKTVP5NuZmKr5f0j64KmwnJk1Wn48g==
X-Google-Smtp-Source: AGHT+IFlfnLsF/DkG0WbSLrRgDXRjnUt53LMczPXVmUoOzD9VdLX/pRLMfMhdY/DOvIpPiMRVgUyKA==
X-Received: by 2002:a5d:6c66:0:b0:38a:4184:151a with SMTP id
 ffacd0b85a97d-38a87336d7emr9247148f8f.37.1736513698809; 
 Fri, 10 Jan 2025 04:54:58 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1c01sm4548921f8f.97.2025.01.10.04.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:54:57 -0800 (PST)
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
Subject: [PATCH v8 6/9] target/riscv: Add Smdbltrp CSRs handling
Date: Fri, 10 Jan 2025 13:54:37 +0100
Message-ID: <20250110125441.3208676-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110125441.3208676-1-cleger@rivosinc.com>
References: <20250110125441.3208676-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x429.google.com
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
index 9e1ce0e1f1..e3ed11b0fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1064,6 +1064,9 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
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
index a3acda4bc8..f97c48a394 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -559,6 +559,7 @@
 #define MSTATUS_MPELP       0x020000000000 /* zicfilp */
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
+#define MSTATUS_MDT         0x40000000000ULL /* Smdbltrp extension */
 
 #define MSTATUS64_UXL       0x0000000300000000ULL
 #define MSTATUS64_SXL       0x0000000C00000000ULL
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 20e11a5bdd..aef896ba00 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -84,6 +84,7 @@ struct RISCVCPUConfig {
     bool ext_smcsrind;
     bool ext_sscsrind;
     bool ext_ssdbltrp;
+    bool ext_smdbltrp;
     bool ext_svadu;
     bool ext_svinval;
     bool ext_svnapot;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4aded3f00c..afb7544f07 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1954,6 +1954,13 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
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
@@ -1996,6 +2003,12 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
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
2.47.1


