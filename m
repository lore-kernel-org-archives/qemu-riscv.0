Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74ECC47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:59:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL6Qu-0005AH-M8; Wed, 03 Jan 2024 13:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qs-00058l-4X; Wed, 03 Jan 2024 13:57:38 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qp-00042D-Tu; Wed, 03 Jan 2024 13:57:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33674f60184so10796442f8f.1; 
 Wed, 03 Jan 2024 10:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704308254; x=1704913054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHX167RE3euJXF9kyocBWZgVJ7RfvoObHUcQLg8ghPc=;
 b=Ayx4kbiEfe3gDd9xL7Cnw9KSt3T9w9ymx7B7sJuPYjTgx6qqqPt6NCO9OwhaDEdTXQ
 pqUEGuszwVldd+4pVvyNk5BzatNMDMUuca5zh6Pp7J8VVxT/Nfp1c7bs9UZM4s58uZ+6
 H/K7qEloZQXxdPvJD39D6so/AMhYoJG6ba98hX4u04MNv89iSD1PLIWKjAqCSO9DxVAo
 mYQYt+SRuLUndT0G8JXMTDoyXNshmCUqJ3QnEFvrs2maekQ0iiASncSgAU4D/GcF1Mnx
 bWvyB5zxXH2+TGl2FzHxofYHMsUEvhoNsfC0R/T8rUtwV5hI5JX5VputZSEBfl+v7Jvr
 InTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704308254; x=1704913054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHX167RE3euJXF9kyocBWZgVJ7RfvoObHUcQLg8ghPc=;
 b=SjQnwbzXIpX9gyo7hgZYuTnoEV3CSJsK0yDt+7/lREBGMpOqGTiAiV3ikdXs7Wula8
 iEv6rI694fKWI5eT0bgGJJb2I4P4moBN8DmxSIsnPjracuvtRdZQnOw1/wNTlwo0Kd8Y
 UZUxC2i04f7E1QI1uodZCHhlnKfGghbKTSBwIj6UmFAvgVJUNq6G9NNg9o7/qIYyydpO
 vQVHqH/al0x7lcc+Vd5G3d7WiORh28z8Tz0COADZgmUljflmtDQbK9/W1cKhVaduU3mi
 aJWJR+ezWaPZEXlPkcUK3FUc+kVxkwTN2MQwoEIVni8Ovz34Ck8QrWo3mJhf6MhSsgti
 s4rA==
X-Gm-Message-State: AOJu0Yx7zUPeHMbhIhvpLrIB+dkDrQkBFh4l7LJDYL6nLdIBJn8pMHNa
 NQxgHaUuPwnEV9T2jy333PE=
X-Google-Smtp-Source: AGHT+IGzyC97foEQL1nSzdecqOFjMEJQ9kZEk4DM5k1a6UiCHpRRaK0ptUg29v4PtfJ/GQzpYlgoKA==
X-Received: by 2002:a05:600c:3f85:b0:40d:88ca:75ff with SMTP id
 fs5-20020a05600c3f8500b0040d88ca75ffmr2262743wmb.240.1704308254035; 
 Wed, 03 Jan 2024 10:57:34 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm3897915ejc.105.2024.01.03.10.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:57:33 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
Date: Wed,  3 Jan 2024 18:57:13 +0000
Message-Id: <20240103185716.1790546-4-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103185716.1790546-1-me@deliversmonkey.space>
References: <20240103185716.1790546-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h        |  4 +++
 target/riscv/cpu_helper.c | 54 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bd379ee653..c607a94bba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -672,6 +672,10 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
+bool riscv_cpu_bare_mode(CPURISCVState *env);
+RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
+int riscv_pm_get_pmlen(RISCVPmPmm pmm);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a3d477d226..4c34e12ee3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -139,6 +139,60 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     *pflags = flags;
 }
 
+RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
+{
+    int pmm = 0;
+#ifndef CONFIG_USER_ONLY
+    int priv_mode = cpu_address_mode(env);
+    /* Get current PMM field */
+    switch (priv_mode) {
+    case PRV_M:
+        pmm = riscv_cpu_cfg(env)->ext_smmpm ?
+                  get_field(env->mseccfg, MSECCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    case PRV_S:
+        pmm = riscv_cpu_cfg(env)->ext_smnpm ?
+                  get_field(env->menvcfg, MENVCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    case PRV_U:
+        pmm = riscv_cpu_cfg(env)->ext_ssnpm ?
+                  get_field(env->senvcfg, SENVCFG_PMM) : PMM_FIELD_DISABLED;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+#endif
+    return pmm;
+}
+
+bool riscv_cpu_bare_mode(CPURISCVState *env)
+{
+    int satp_mode = 0;
+#ifndef CONFIG_USER_ONLY
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        satp_mode = get_field(env->satp, SATP32_MODE);
+    } else {
+        satp_mode = get_field(env->satp, SATP64_MODE);
+    }
+#endif
+    return (satp_mode == VM_1_10_MBARE);
+}
+
+int riscv_pm_get_pmlen(RISCVPmPmm pmm)
+{
+    switch (pmm) {
+    case PMM_FIELD_DISABLED:
+        return 0;
+    case PMM_FIELD_PMLEN7:
+        return 7;
+    case PMM_FIELD_PMLEN16:
+        return 16;
+    default:
+        g_assert_not_reached();
+    }
+    return -1;
+}
+
 #ifndef CONFIG_USER_ONLY
 
 /*
-- 
2.34.1


