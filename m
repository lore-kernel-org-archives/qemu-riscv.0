Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB7EC4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2eec-000694-P9; Mon, 13 Nov 2023 16:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeb-00068m-IN
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:33 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeZ-0001V2-QT
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:33 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc37fb1310so36654255ad.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 13:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699911570; x=1700516370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUh/6KkW4XcW8kKVIfjTyve/D2pqne6pt1Gsp4Re3wQ=;
 b=R9hX4BooM9sAf+CjIGIDaxXEL+Qv49y5g0w9vz7mMso1C2A7chk0pVpCBVr30vdr6h
 jJQw436YaH5EFUPt4ENsgjmTd3/lFX6BbjSUvbetl9ywxucgMz0ehQrTQJickBqhloTd
 ycXZgXb3iijUGyLixSTU6Te+P0raCzperU3On+gFh2sHdLsm8H613JR85nW5syuwDblp
 uMgMS99/k64XX11K+1TLZfYyjO8Ou2zukwBsGV9qtN1n0E95JC9TeId8jw1I73QoHsLV
 vOS2XIYRlDNDp90D6QMQzlaSMQ3WTlaxPQ7VoivXJDCvBG3CX9rtaGLEqNY4Tru0ZBtF
 poqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699911570; x=1700516370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUh/6KkW4XcW8kKVIfjTyve/D2pqne6pt1Gsp4Re3wQ=;
 b=VbCrDWiTe8SrE51w4Nd17JsaBO6UvsGCQ1Ys/RonZCCfIClfcDTpaxAbR9Tc72+o4W
 zcpMT+J5tdStU29dj0aKjx8FLEj0kTG7R7QmVQkNUxUR19NiiOSDf7SKOwP3QNJqoXmY
 AVVw7gSRPcz3T5Lc7zCcQ/UjeaAvwzU5ExX8yTpKoWMV2jm/skJNYIoQ7+KqAJyJkjRk
 IrbcrhMFGYLYAZ3ZaViXADPLqb05TOVAk/8s7Mu/8NxTHYDanthJ4nW/Jg+16FfeUY5z
 tWEy8mmPQp/hiwM/AirKCy+aAbroQMuB96q0j8HKpNQNBnF/uQWxVxsIzz2JRV2PCLXt
 z/8A==
X-Gm-Message-State: AOJu0YwQBH1LyLhPMCNaLTL0lM++LgLn0t4AiTSrGuv2xadUFIeGYrj8
 4iwgXWMvfRK/tCe94ug7KCboKw==
X-Google-Smtp-Source: AGHT+IHUSu7MpgylO/d+b9HuQStXxv4++OOMX1Jpi6gmMuwW+RIUQlSx12lu6CWx67c2oJfy5/PpFQ==
X-Received: by 2002:a17:902:ab4f:b0:1ca:7909:6ee6 with SMTP id
 ij15-20020a170902ab4f00b001ca79096ee6mr440336plb.61.1699911570545; 
 Mon, 13 Nov 2023 13:39:30 -0800 (PST)
Received: from grind.. ([152.250.131.148]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b001c736746d33sm4455423plp.217.2023.11.13.13.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 13:39:30 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 5/6] target/riscv: add rv32i CPU
Date: Mon, 13 Nov 2023 18:39:03 -0300
Message-ID: <20231113213904.185320-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113213904.185320-1-dbarboza@ventanamicro.com>
References: <20231113213904.185320-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Add a bare bones 32 bit CPU, like we already did with rv64i, to ease the
pain of users trying to build a CPU from scratch and having to disable
the defaults we have with the regular rv32 CPU.

See:

https://lore.kernel.org/qemu-riscv/258be47f-97be-4308-bed5-dc34ef7ff954@Spark/

For a use case where the existence of rv32i would make things simpler.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 4d1aa54311..f345c17e69 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -34,6 +34,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
+#define TYPE_RISCV_CPU_RV32I            RISCV_CPU_TYPE_NAME("rv32i")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a52bf1e33c..55cf114b61 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -666,6 +666,28 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
 }
+
+static void rv32i_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV32, RVI);
+
+    /* Remove the defaults from the parent class */
+    RISCV_CPU(obj)->cfg.ext_zicntr = false;
+    RISCV_CPU(obj)->cfg.ext_zihpm = false;
+
+    /* Set to QEMU's first supported priv version */
+    env->priv_ver = PRIV_VERSION_1_10_0;
+
+    /*
+     * Support all available satp_mode settings. The default
+     * value will be set to MBARE if the user doesn't set
+     * satp_mode manually (see set_satp_mode_default()).
+     */
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
+}
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -1860,6 +1882,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E31,  rv32_sifive_e_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E34,  rv32_imafcu_nommu_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U34,  rv32_sifive_u_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32I, rv32i_bare_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51,  rv64_sifive_e_cpu_init),
-- 
2.41.0


