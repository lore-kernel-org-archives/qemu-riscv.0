Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01351C46CD4
	for <qemu-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 04:50:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rHGPu-0002hE-GL; Sat, 23 Dec 2023 23:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPm-0002cR-BR; Sat, 23 Dec 2023 23:48:38 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPk-0000hn-Jr; Sat, 23 Dec 2023 23:48:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33694bf8835so1689190f8f.3; 
 Sat, 23 Dec 2023 20:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703393315; x=1703998115; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JE/VO33WKXFXXUOBP+JEC4oRE8TaofRjEZyVtsGi9I=;
 b=lshHyWF7SaOZ8HWYiwahU2QPNSNCJngFkMWp8wpkC5zF0UEk/ovAdqNBLDMYKyBBFL
 B/tDhQRsxAumCEh5Q+CRfdtF0kgctV+dvJm09YOkZ4/DIGX2UJOFOvTgJe3p7XyRlP3j
 1jh/AWB6YHzbt/P9dpqxezyP/BU6rJNbsSg3pmdSMMaGDgm1Vn6eP7R7IFqX8MRBkGG4
 39e5/zUvf071kPQH8B6Bm5PES1iNU4O/bYAFiQ3GndKGulcjFpaCpFOR5Iq6rr814wl8
 6by3QdojdbGiQJDWf4eGvEW7G7W1G+ChKHtZ0czWh+IGN2b1k1WKu+02H85WUf674Feq
 bG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703393315; x=1703998115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JE/VO33WKXFXXUOBP+JEC4oRE8TaofRjEZyVtsGi9I=;
 b=WeT2XgdeCERDUISZxU6gwHv8Duz3WUrSqYGRkgW+TGm788BiB7wgnE8nhgnlr+XxzU
 oiH4ZKr0rr4VMDf5LROZC6xkXE/WXwezWAYL5omDoOKEbxZmk2/j4bLaF3LkLi4s3aWD
 FUBXBVbvhnhQamOS5jYDSV2HhLqwtetcf0S/7kxDMSMhSzkagrGsXSz8u/FIzKaKmOvX
 jU2eVdoqzvB2/P6zca7DrG7LYEF7WhQaFizozK6QrCSvzvlb6+AUK1bub+B9Gl14AIXU
 Rpraay1latY5uSspngSXSne5dL2unqJ3os+o+8XPyq/yYHXAJuf5EHYbuDyz8t2ytciQ
 e8fw==
X-Gm-Message-State: AOJu0YxkXVBShDWTvyGvSgbeqivjJo0GEbjaHREWw9P4mzVA+bayU5pR
 nJIzQszh2p7b4WVxzzsq0Nc=
X-Google-Smtp-Source: AGHT+IGlrJLEbKeAdWsWmBNBa5b3eBhgXE28bD656rEBB8m1oMYAIfxrSv31VA+95k09uDWbsAUF5A==
X-Received: by 2002:a5d:6d8b:0:b0:336:95d3:94b9 with SMTP id
 l11-20020a5d6d8b000000b0033695d394b9mr1760994wrs.21.1703393314887; 
 Sat, 23 Dec 2023 20:48:34 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0033668ac65ddsm7639513wrv.25.2023.12.23.20.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 20:48:33 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v2 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
Date: Sun, 24 Dec 2023 04:48:09 +0000
Message-Id: <20231224044812.2072140-4-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224044812.2072140-1-me@deliversmonkey.space>
References: <20231224044812.2072140-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wr1-x434.google.com
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
index a3d477d226..47f325294e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -139,6 +139,60 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     *pflags = flags;
 }
 
+RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    int priv_mode = cpu_address_mode(env);
+    int pmm = 0;
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
+    return pmm;
+#endif
+}
+
+bool riscv_cpu_bare_mode(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    int satp_mode = 0;
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        satp_mode = get_field(env->satp, SATP32_MODE);
+    } else {
+        satp_mode = get_field(env->satp, SATP64_MODE);
+    }
+    return (satp_mode == VM_1_10_MBARE);
+#endif
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


