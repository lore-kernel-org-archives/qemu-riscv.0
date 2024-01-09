Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86C8C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 10:31:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN9Mu-00063m-GI; Tue, 09 Jan 2024 05:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mr-00061r-5z; Tue, 09 Jan 2024 05:29:57 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mp-0005xU-HU; Tue, 09 Jan 2024 05:29:56 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-557bfc7f7b4so2696699a12.0; 
 Tue, 09 Jan 2024 02:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704796193; x=1705400993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbX4+ybdo/OyShd/5+DAyR8pqK7OrIHy9zKIt9Znd6Q=;
 b=iWb6Hyzxr+bL8VTPnJYi0R4WL1cS8NtIK8Yhl8H5rnMMb/7DAnaNuoyUrcfRoY8vao
 X1FGlykmLzxFl81WGdj3c7v88ON6AJJQBrlrU1JnrmvW45b1y5gSBtkc3bEc7fkFfeGx
 ki0GgybtrSPK+fLIsZV7LZlh9ivGJAcT+9ImBK5YVMOElNMAdqPO0eFLKnFT/ZU1bbHc
 QY+vmTSI0GF/Yqsx9ld9iRWI8Om+t7H1daXNdbC54haMOf5YJu6Ldzx7A27XCja/dtyp
 yz1Yl78+wbaux8Uhv7dlhDb5oZdzLolopBI7dNakqXV3w1K8bH/qFmmAdIU4ItjzLK8e
 Y+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704796193; x=1705400993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbX4+ybdo/OyShd/5+DAyR8pqK7OrIHy9zKIt9Znd6Q=;
 b=Nzfm9qHtaem+3lOm6jTPom658GtKDZDuse4dfKsSshuDZsB2K3ZZmyEkK6LhV4JJ/N
 w0eFRs2E7n4maZ3xC2Rw9U+kM2PvG+SI077yCn69aTQDj7/Nf9nzgMvcSaTRLNpoRHZA
 YWUovS0Kr6naouk5JMzXQM0X5sW6/8lvvRnK60WE7H8Qy8pMSRa2NX2qQ/IeNUP+XUFd
 ECSNmGqocH2x1l5ndstW48iGQ8vD6tWHrGNSAM6WwokCmUrQD/zKYL8HaXz9z5J8P1fZ
 4YHUO60I0F4sH1IOtHG1VDNKLNG3FCyk4C1MXJ5EluaymXC2zYq24Zr8q7M0mDbJEfHM
 O7wg==
X-Gm-Message-State: AOJu0YwbFzXMOyxVyvl5VfXDjazYAd91OeoJVQI5TgC7LeDWWxakFCXT
 M2I4IBYSlp7bbhSKAj0jik0=
X-Google-Smtp-Source: AGHT+IGurmz6bg0RCeDeaaM8KQQUfQVpNOmyvhtuyLXKY35cHyE0XtPwkjD+FGawJi56DBtl05TAZQ==
X-Received: by 2002:a17:906:a157:b0:a29:b31d:1dc6 with SMTP id
 bu23-20020a170906a15700b00a29b31d1dc6mr672278ejb.6.1704796193640; 
 Tue, 09 Jan 2024 02:29:53 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 d24-20020a170906175800b00a26ac037ff3sm869643eje.132.2024.01.09.02.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:29:52 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v4 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
Date: Tue,  9 Jan 2024 10:29:27 +0000
Message-Id: <20240109102930.405323-4-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109102930.405323-1-me@deliversmonkey.space>
References: <20240109102930.405323-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52c.google.com
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
 target/riscv/cpu_helper.c | 58 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c9bed5c9fc..1c8979c1c8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -671,6 +671,10 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
                           uint64_t *cs_base, uint32_t *pflags);
 
+bool riscv_cpu_virt_mem_enabled(CPURISCVState *env);
+RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
+int riscv_pm_get_pmlen(RISCVPmPmm pmm);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a3d477d226..9640e4c2c5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -139,6 +139,64 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
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
+bool riscv_cpu_virt_mem_enabled(CPURISCVState *env)
+{
+    bool virt_mem_en = false;
+#ifndef CONFIG_USER_ONLY
+    int satp_mode = 0;
+    int priv_mode = cpu_address_mode(env);
+    /* Get current PMM field */
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        satp_mode = get_field(env->satp, SATP32_MODE);
+    } else {
+        satp_mode = get_field(env->satp, SATP64_MODE);
+    }
+    virt_mem_en = ((satp_mode != VM_1_10_MBARE) && (priv_mode != PRV_M));
+#endif
+    return virt_mem_en;
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


