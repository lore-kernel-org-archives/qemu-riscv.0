Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E626EEEB560
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:29:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegC7-0003OU-51; Fri, 08 Sep 2023 14:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC4-0003MN-1L; Fri, 08 Sep 2023 14:27:00 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC1-0006nc-Gf; Fri, 08 Sep 2023 14:26:59 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so288212866b.3; 
 Fri, 08 Sep 2023 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197615; x=1694802415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCMPg3srOuNK1zxCrcmJhIPfQWCsaR+9i85+FTGMjt4=;
 b=o93fcAmEhcxP13iEn+QQtJbsETYWpPwSdLdS99bYts2NmtL7pFOqBP60gSc+D35YS9
 G9CyDkSt6Sh8eOuyvrdHIpGme1BpbffwxnVJzMWNGgvqwb7BChnQ/aH3w7TAuksIbKJ1
 ooSOQ9kMUVbr3WQjqCeoKqVIxy1kIO/tdMk7aovG4KXnUhWAEIXqdktLGiErEMdfDfdU
 0BpXC669wliFHRslSn9djas9RAtAATBbcqIQyEzV8OqehYGa1e1vmguTypHpQUYNhlUR
 PC2I0ct5D1+fl+llI5Huw6WjIi3yxS5kr7QqJC0UrSC08n23OQeFYZONfixNEno1WIpO
 KTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197615; x=1694802415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCMPg3srOuNK1zxCrcmJhIPfQWCsaR+9i85+FTGMjt4=;
 b=eepcZdbudbKVa1AuWVn2jkuDT8ZqovsDdyYVtTrKeds7zTrG/JixhoaC89DhZKFIcm
 2xdvE3XC2bnsqnSTGyBSLy/unyMs1pipjZIVmJn9f0bRZKBFbOQO3xwhtU/wxMPfqP4g
 UPNb/bhVo3y80buntpS65fWATOgXeSGDiY8PUBm0pu15N4Sw12MR4xHoVOu875EAwA02
 mpm7gYTAUP4umhAo+57HdxrwyewgNzjVr1XcfZ+muWVoMP11aFCyJsCwglnaqyKdtReS
 dg118aO13IqdR/nzDXrCGIt73dB0k1itUvC81Npt+r0mnYr4HyBmAef10HS9JwigI3YL
 4o7g==
X-Gm-Message-State: AOJu0Yz7nSMaZbEKmaSUa/ZokqXjD1ku6RJrIuhV9X/SRwrXn/GzeBdP
 +SEUQ/5rCsnJkTAgknRb3SA=
X-Google-Smtp-Source: AGHT+IFBzWnrWCcA0f2LxybbbsZz//9+hIzWGz/+eD6SFgrLyEtkvHf8Xsu3cA9hjriTeGJFPvZtGg==
X-Received: by 2002:a17:906:8a6e:b0:9a1:fb4c:3b6c with SMTP id
 hy14-20020a1709068a6e00b009a1fb4c3b6cmr2413319ejc.59.1694197615491; 
 Fri, 08 Sep 2023 11:26:55 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:54 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 6/8] target/riscv: Add functions to calculate current N
 masked bits for pointer masking
Date: Fri,  8 Sep 2023 18:26:38 +0000
Message-Id: <20230908182640.1102270-7-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h        |  6 ++--
 target/riscv/cpu_helper.c | 58 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 17d0088cb4..c87c4f26a2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -91,11 +91,9 @@ typedef enum {
 /* Enum holds maximum for N bits to be ignored depending on privilege level */
 typedef enum {
     PM_BARE_N_BITS = 16,
-    PM_SV32_N_BITS = 0,
     PM_SV39_N_BITS = 25,
     PM_SV48_N_BITS = 16,
     PM_SV57_N_BITS = 7,
-    PM_SV64_N_BITS = 0,
 } RISCVZjpmMaxNBits;
 
 #define MMU_USER_IDX 3
@@ -633,6 +631,10 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+RISCVZjpmMaxNBits riscv_cpu_pm_get_n_bits(int satp_mode, int priv_mode);
+bool riscv_cpu_pm_check_applicable(CPURISCVState *env, int priv_mode);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b3871b0a28..6e68b2fc27 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -144,6 +144,64 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     *pflags = flags;
 }
 
+/*
+ * Curernt Zjpm v0.6.1 spec doesn't strictly specify the exact value of N bits.
+ * It allows it to be dependent on both translation mode and priv level.
+ * For now let's ignore priv mode and always return max available value.
+ */
+RISCVZjpmMaxNBits riscv_cpu_pm_get_n_bits(int satp_mode, int priv_mode)
+{
+    switch (satp_mode) {
+    case VM_1_10_MBARE:
+        return PM_BARE_N_BITS;
+    case VM_1_10_SV39:
+        return PM_SV39_N_BITS;
+    case VM_1_10_SV48:
+        return PM_SV48_N_BITS;
+    case VM_1_10_SV57:
+        return PM_SV57_N_BITS;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* For current priv level check if pointer masking should be applied */
+bool riscv_cpu_pm_check_applicable(CPURISCVState *env, int priv_mode)
+{
+    /* checks if appropriate extension is present and enable bit is set */
+    switch (priv_mode) {
+    case PRV_M:
+        return riscv_cpu_cfg(env)->ext_smmjpm && env->mseccfg & MSECCFG_MPMEN;
+    case PRV_S:
+        return riscv_cpu_cfg(env)->ext_smnjpm && env->menvcfg & MENVCFG_SPMEN;
+    case PRV_U:
+        return riscv_cpu_cfg(env)->ext_ssnjpm && env->senvcfg & SENVCFG_UPMEN;
+    default:
+        g_assert_not_reached();
+    }
+    g_assert_not_reached();
+    return false;
+}
+
+void riscv_cpu_update_mask(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    int priv_mode = cpu_address_mode(env);
+    int satp_mode = 0;
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        satp_mode = get_field(env->satp, SATP32_MODE);
+    } else {
+        satp_mode = get_field(env->satp, SATP64_MODE);
+    }
+    RISCVZjpmMaxNBits n_bits = riscv_cpu_pm_get_n_bits(satp_mode, priv_mode);
+    /* in bare mode address is not sign extended */
+    env->pm_signext = (satp_mode != VM_1_10_MBARE);
+    /* if pointer masking is applicable set env variable */
+    bool applicable = riscv_cpu_pm_check_applicable(env, priv_mode);
+    env->pm_n_bits = applicable ? n_bits : 0;
+#endif
+}
+
 #ifndef CONFIG_USER_ONLY
 
 /*
-- 
2.34.1


