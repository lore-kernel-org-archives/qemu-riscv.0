Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2DCAC598
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:42:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4mN-0007zy-PP; Mon, 15 Sep 2025 04:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4mB-0007cT-SQ
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4lo-0002Pg-HU
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-24c8ef94e5dso31023635ad.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925662; x=1758530462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2aTgYBYQIaIB2ry1ZOOQRZzj19yzWH4/DlOx0B0kCk=;
 b=OPNPLCvni+eKzlBdpgsO4bnzjlyJ9Gvgbp2SNBcLl333++7eMRyTBm5oXrVFKqYYXZ
 aMOMl3zKiDSAKVCYiJjHvPa2xoikX1S/idJPGlHyaaw41HjcB3We2sFmiAuo1vPg5smB
 ZqNwyEiYXJfPIYCRrTSCYUVjzqPQYRgIRNkNQiFwRyw1izJnuFdjMda4EA3eGWwuQwKE
 4n7H9AfCFMT42p7B45JzSGS4SgI/IVMFBGC/KCO16bDYolHIVHyfnrnibKaimmCNfM89
 ZpUrsmoph+lIkJkD5e2oh6zC+A3K59vN5QQD4djs5KcBXK9vDVVkF1LxewY6OmefBsEM
 sWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925662; x=1758530462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q2aTgYBYQIaIB2ry1ZOOQRZzj19yzWH4/DlOx0B0kCk=;
 b=NBueSyoRipEmn6Li5qclF7Soexz/Ipdd7N5a5JvWzqDKx7NWzvzmsDkiaxEqX5IjH+
 ZrwxAKYuqmn5ks6itZJG0/rPIDmd9mikai05A2rHpHWedtzhQMC0bGjZaRgQq3HgQazY
 qiC/KoDqrDJcpYAwjw+QR1hNAI3OK8ky6aj9pXN3o3qNUzfqC7N5d0RujCk7jnR+6NU3
 dZnJwicSLZC3rqyEXzfIIiGLDvyUuhBKE8sXst8AcXh4wm5LBVsAuH2xT/zoRq0akbUQ
 ynrZDVG/+39wpjgR7sMttiq051zNGLgvdmVYp84wUn2/p+gpFOghRNG2+tVefYVchDsK
 ApdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLqBH2hEvZKcBSPQWGYplpObAIZJ81cAjUBKaf0smAjYpPjUuyfUIryWIfVsTQLJpEzC7RB5bmG9QB@nongnu.org
X-Gm-Message-State: AOJu0YyQCWcoYE6KzYSMX7a7QuewCIjfpfWUNhi3BJbXfxR1j2suqnF6
 uzngv17KYtebtJ6vzOQq2A3hH/hadaRcXU4aUTCEHFPbUGnoj7ZknRkhqn4ucRnixl0=
X-Gm-Gg: ASbGncviwyWjR/nRXayTW3MkJteLGG2/M5J4lRt0q7AZi0Qvt0TfNshGxFp2eoV8hPY
 GMASYbtS63A6NVQe3bYTy0LgRi14BlxoIqkuf0NXsjU7njRaAoRpsxLaN2GFH8S774L1Qp8tP9s
 0VQYRnCDqDafdFevyZLqQJEf3FVgfYVC/V/71YoAE16xL3gyUAcHGj1TuhW+WfZZ3GnPq9dSSWN
 HLtTh+bKAn0trem0vP0zz2KcapUWwfbONN5KBv59H5qOFoZ7N8kkhRQNxbnnd393PKNSOw6XUfY
 +LMy/7SkeZysyeGD6326FNezwz+y7awWFHQA2RomprkXIj4oapm1vl/vKvkXOuvNdbDNOlomPDG
 152QRS5G7JNdtynGicB7kMOhwNZJ69dabe0iXfp1o3zvVd7BvMbGs+I/iikZWIcOOsD8=
X-Google-Smtp-Source: AGHT+IH8V7MdroBz/3fN9apeVG6sXCH4KqW8b+316l/Kr5KVgm+tp5xdLxZX9LqTEazx0tpHOBjK8w==
X-Received: by 2002:a17:903:19c8:b0:24c:e9de:ee11 with SMTP id
 d9443c01a7336-25d2c560f8emr140821965ad.17.1757925661514; 
 Mon, 15 Sep 2025 01:41:01 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:41:01 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 4/8] target/riscv: Use the tb->cs_bqse as the extend tb
 flags.
Date: Mon, 15 Sep 2025 16:40:32 +0800
Message-ID: <20250915084037.1816893-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915084037.1816893-1-max.chou@sifive.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

We have more than 32-bits worth of state per TB, so use the
tb->cs_base, which is otherwise unused for RISC-V, as the extend flag.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 include/exec/translation-block.h | 1 +
 target/riscv/cpu.h               | 2 ++
 target/riscv/tcg/tcg-cpu.c       | 6 +++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index cdce399ebab..aa2dd4b12f8 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -63,6 +63,7 @@ struct TranslationBlock {
      * arm: an extension of tb->flags,
      * s390x: instruction data for EXECUTE,
      * sparc: the next pc of the instruction queue (for delay slots).
+     * riscv: an extension of tb->flags,
      */
     uint64_t cs_base;
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 532386000af..d10464eeeca 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -704,6 +704,8 @@ FIELD(TB_FLAGS, BCFI_ENABLED, 28, 1)
 FIELD(TB_FLAGS, PM_PMM, 29, 2)
 FIELD(TB_FLAGS, PM_SIGNEXTEND, 31, 1)
 
+FIELD(EXT_TB_FLAGS, ALTFMT, 0, 1)
+
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
 #else
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 07b2b137934..6fe3ae9c085 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -104,6 +104,7 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
     RISCVCPU *cpu = env_archcpu(env);
     RISCVExtStatus fs, vs;
     uint32_t flags = 0;
+    uint64_t ext_flags = 0;
     bool pm_signext = riscv_cpu_virt_mem_enabled(env);
 
     if (cpu->cfg.ext_zve32x) {
@@ -118,6 +119,7 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
 
         /* lmul encoded as in DisasContext::lmul */
         int8_t lmul = sextract32(FIELD_EX64(env->vtype, VTYPE, VLMUL), 0, 3);
+        uint8_t altfmt = FIELD_EX64(env->vtype, VTYPE, ALTFMT);
         uint32_t vsew = FIELD_EX64(env->vtype, VTYPE, VSEW);
         uint32_t vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
         uint32_t maxsz = vlmax << vsew;
@@ -133,6 +135,7 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
         flags = FIELD_DP32(flags, TB_FLAGS, VMA,
                            FIELD_EX64(env->vtype, VTYPE, VMA));
         flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
+        ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, ALTFMT, altfmt);
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
@@ -191,7 +194,8 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
 
     return (TCGTBCPUState){
         .pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc,
-        .flags = flags
+        .flags = flags,
+        .cs_base = ext_flags,
     };
 }
 
-- 
2.43.0


