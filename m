Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0070C021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwKR-00027T-Ht; Mon, 17 Feb 2025 03:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwKM-00023Y-7d
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:18:07 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwKK-00011D-9Y
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:18:05 -0500
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6ddcff5a823so28138256d6.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780283; x=1740385083; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q3Bh+vRBI9kfj9ST5eVx6et/EgzdN8R/GNSb/Gp3tTc=;
 b=AR4t6kSdBbCbrfWDp2C3jGUae6hAmlFF/q4AStgkCXHt6VFaXNl70Rpo/EtXrvWszh
 uPNDL7oT1DpRRGy60zYo87YcSJzDbJhz9M8FJylKT9Vfh+UymP0bUkPBccoPPIuZjFZJ
 Lna9WssefCbLh1zbjz/6CjKgJRyuT0D30eakmqS1tPfJbs25Rgj9oFtkWMHHKQFyDqOL
 uIrvOQICS0dnTtygNnyP10B5PuT2W8SFZhWunQOstvu4LTpB+oNf1pfGk1PXghCQ60Hh
 LUA507/tlj3lw29FT8UL1MZNaWNZxRXv5qf2dUVwjwNYiyDZfewjf8UTfcbti9m4k+lI
 r4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780283; x=1740385083;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3Bh+vRBI9kfj9ST5eVx6et/EgzdN8R/GNSb/Gp3tTc=;
 b=qJ+tNoXlP8s31KNU/2GLHaSK9+vWcSIsu2t3hss9Cg0mVOBjM1mmzSnCgf0cGuJz3H
 y2FwlPY5i0XWEPCwErItwf4QcMuiV8+mM6qvIkaxLXQVAPIPY+HYIGW98ARDkB9Qh6YZ
 RpNAPWVvBgqBqReZYn/2soVJQnXlY+bOuG3CjGDcQ1jQo72VVxDBvOTLMeqaMQQXXhuY
 5rZanUyilyk7b9tnw4L1WB0RR5VbKSHZEKtV6fX39OXv1ngSxXG9lVA66pv4Cn/0wMYt
 tfBzTKR4YqN3acGmQ4KIViXFFOHkUgwxK/5Zy48+nSyUzPA2sh0U34DrYMkNkW98lhCl
 6LzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQwrxKlEIp/HAWdFfAx7xYjLEUmrtd5q5Jxgg/9vplqXzWslIcihlsqk5wtE2hGOiC545I2wHgICss@nongnu.org
X-Gm-Message-State: AOJu0YziS3T4J73YL9E+iYA01CTZpVfEToqVNKgf7XDJWFBfWX+R3uz1
 OvfHJEhOtCvb3EDmyGoOQu/8DSUWYltHmfpMlaAf/K5kAsr/VTXNl2FjK7K5pyg=
X-Gm-Gg: ASbGncv/uTrqwvkN9l9uzWKA5AFbQSyK1dgmauth57JNlF4exv/BktFknrdOGsugUmm
 HrtGxENn7KlIOgMiI6iy+vS58/0j43bdCHi/iwNqxwUpQian15FbEHBnBm6d9LSnER0a3HyBJUl
 clusFl3XqpNGHfX6kJeA0AWpCaVtbw8qq5aiTXJXgIBCKu+Yi1s1shzQjH7EndXjzYNIelSYnHJ
 AqOreqwxkQaihbqtfPdnD63giS1yegUKtzz4LwWuZkeWJXGVrkIaxG2MsHekfuaf3FwbIXfSoRQ
 agb42ET78CadJ92YgLzU1QShoAp10vlbjpgW6Lgu3tTruQ==
X-Google-Smtp-Source: AGHT+IELU3mvD3QGaGLyVLLCYxlaAzw2k6zmPzfP4iFKRKx5g0Z/GQMRrS41GCT/aq/PTxQfoKWdyA==
X-Received: by 2002:a05:6214:29cb:b0:6e4:2ef4:2a01 with SMTP id
 6a1803df08f44-6e66ccccc72mr131501216d6.22.1739780283120; 
 Mon, 17 Feb 2025 00:18:03 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d9f38absm49673346d6.88.2025.02.17.00.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:18:02 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] target/riscv/kvm: add KVM_REG_RISCV_CSR_SMSTATEEN
Date: Mon, 17 Feb 2025 16:17:23 +0800
Message-Id: <20250217081730.9000-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250217081730.9000-1-yongxuan.wang@sifive.com>
References: <20250217081730.9000-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-qv1-xf29.google.com
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

Add KVM_REG_RISCV_CSR_SMSTATEEN support to get/set the context of
Smstateen extension in VS mode.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 target/riscv/kvm/kvm-cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index e74c1d7cdcee..79e80cdf7406 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -135,6 +135,9 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
 #define RISCV_AIA_CSR_REG(name) \
     (KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(name))
 
+#define RISCV_SMSTATEEN_CSR_REG(name) \
+    (KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(name))
+
 #define KVM_RISCV_GET_CSR(cs, env, idx, reg) \
     do { \
         int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, idx), &reg); \
@@ -684,10 +687,31 @@ static int kvm_riscv_put_regs_aia_csr(CPUState *cs)
     return 0;
 }
 
+static int kvm_riscv_get_regs_smstateen_csr(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    KVM_RISCV_GET_CSR(cs, env,
+                      RISCV_SMSTATEEN_CSR_REG(sstateen0), env->sstateen[0]);
+
+    return 0;
+}
+
+static int kvm_riscv_put_regs_smstateen_csr(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    KVM_RISCV_SET_CSR(cs, env,
+                      RISCV_SMSTATEEN_CSR_REG(sstateen0), env->sstateen[0]);
+
+    return 0;
+}
+
 static int kvm_riscv_get_regs_csr(CPUState *cs)
 {
     kvm_riscv_get_regs_general_csr(cs);
     kvm_riscv_get_regs_aia_csr(cs);
+    kvm_riscv_get_regs_smstateen_csr(cs);
 
     return 0;
 }
@@ -696,6 +720,7 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
 {
     kvm_riscv_put_regs_general_csr(cs);
     kvm_riscv_put_regs_aia_csr(cs);
+    kvm_riscv_put_regs_smstateen_csr(cs);
 
     return 0;
 }
-- 
2.17.1


