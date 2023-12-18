Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D124BC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 13:00:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD9A-0003bF-IU; Mon, 18 Dec 2023 07:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD99-0003ZR-GV
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:59 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD97-00052G-PM
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d3cfb1568eso1750225ad.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904096; x=1703508896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5HauQPFqzxmC86+2vGUW0CUcH6O5M/C9Akb6Ybe9e8=;
 b=n/JOdg1kY1pr41qV+iTZzOpQq6RTN/6/amn/sBUqdGXnlUZtUCd8VY+feNrpa3Nw2f
 z9nM+dyF8eu7ORceKxCNDCOHeJIKQ0DWGwr/Es6JYnfnbOtJQa0NtsEEhILtoidzd7DU
 zM/Wt9kHU/1Qds9JaJ0UnKBpxhzCoC7wtj/8upB/RFT9TAVc/zeR1SAc/vtmLbY+iikl
 NOZYr5+bhTQOWnbg+nfvZQvrFLcyeEakmE8p0TAItAFpSm07gZcf73L2Vw4+OVTvDx3J
 v3dz0k5Dcef6kzQPia2d14a9MG0A3lh4Jp8m/jzgf4Z6ggShxVI2qDpQY/qZ6GThmE5c
 Vasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904096; x=1703508896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5HauQPFqzxmC86+2vGUW0CUcH6O5M/C9Akb6Ybe9e8=;
 b=ct5VBPx2sgphluaKHi3uYn6HBb48Wsrli1KnWriSht/MYpggu8hFIWF9kNnNbAZYfO
 FjJoWisInEFr1LSsnzlaom5NkI4fUJswznwlUFAtMKB5DhN+5tNy/7D2NsrisNl1eDQY
 oT9El9OZuVyJ9k7MRSB18DmNveWcmljfj1+ySrhbrZIzn0rNAwkqFusG3abFsgjZ3oHR
 Es5LXeQrPI56L2WG0PzGik4nfXVVM4gSm+S8hiVgExsGz9cFyUmhV8OLxJpe/P3OA3DD
 Awu4VVKXGheEmA5vrE47WjddUI9Pv2mdRBcenaT2JXiXnO3B/zZtW1n137obv1s2Z6LE
 kw0A==
X-Gm-Message-State: AOJu0YxZAYt0HO1dGwRdM34bcJ5udqwWEIV2Q9SlAXBpNp10gFT4XnxO
 9Jk8Cin5tmIi4Hiv/VKzaN2X0w==
X-Google-Smtp-Source: AGHT+IFkbl8bcnv2gBnOn+IkXiQACc84J01ID5HMGXffEmO63lzRZzPSLQXM//7MbtGUtcUOvUmp7w==
X-Received: by 2002:a17:902:db05:b0:1d3:c21c:940d with SMTP id
 m5-20020a170902db0500b001d3c21c940dmr1171379plx.34.1702904096579; 
 Mon, 18 Dec 2023 04:54:56 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 23/26] target/riscv: add satp_mode profile support
Date: Mon, 18 Dec 2023 09:53:31 -0300
Message-ID: <20231218125334.37184-24-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
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

'satp_mode' is a requirement for supervisor profiles like RVA22S64.
User-mode/application profiles like RVA22U64 doesn't care.

Add 'satp_mode' to the profile description. If a profile requires it,
set it during cpu_set_profile(). We'll also check it during finalize()
to validate if the running config implements the profile.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         |  1 +
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 40 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1dea5db52d..6795f5da41 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1543,6 +1543,7 @@ static RISCVCPUProfile RVA22U64 = {
     .name = "rva22u64",
     .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
     .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
+    .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
     .ext_offsets = {
         CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
         CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 485d2da3c2..6c5fceb5f5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,6 +82,7 @@ typedef struct riscv_cpu_profile {
     bool enabled;
     bool user_set;
     int priv_spec;
+    int satp_mode;
     const int32_t ext_offsets[];
 } RISCVCPUProfile;
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 4d25fc43d2..152f95718b 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -766,6 +766,31 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool riscv_cpu_validate_profile_satp(RISCVCPU *cpu,
+                                            RISCVCPUProfile *profile,
+                                            bool send_warn)
+{
+    int satp_max = satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
+
+    if (profile->satp_mode > satp_max) {
+        if (send_warn) {
+            bool is_32bit = riscv_cpu_is_32bit(cpu);
+            const char *req_satp = satp_mode_str(profile->satp_mode, is_32bit);
+            const char *cur_satp = satp_mode_str(satp_max, is_32bit);
+
+            warn_report("Profile %s requires satp mode %s, "
+                        "but satp mode %s was set", profile->name,
+                        req_satp, cur_satp);
+        }
+
+        return false;
+    }
+
+    return true;
+}
+#endif
+
 static void riscv_cpu_validate_profile(RISCVCPU *cpu,
                                        RISCVCPUProfile *profile)
 {
@@ -775,6 +800,13 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
     bool profile_impl = true;
     int i;
 
+#ifndef CONFIG_USER_ONLY
+    if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+        profile_impl = riscv_cpu_validate_profile_satp(cpu, profile,
+                                                       send_warn);
+    }
+#endif
+
     if (profile->priv_spec != RISCV_PROFILE_ATTR_UNUSED &&
         profile->priv_spec != env->priv_ver) {
         profile_impl = false;
@@ -1079,6 +1111,14 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
         cpu->env.priv_ver = profile->priv_spec;
     }
 
+#ifndef CONFIG_USER_ONLY
+    if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+        const char *satp_prop = satp_mode_str(profile->satp_mode,
+                                              riscv_cpu_is_32bit(cpu));
+        object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
+    }
+#endif
+
     for (i = 0; misa_bits[i] != 0; i++) {
         uint32_t bit = misa_bits[i];
 
-- 
2.43.0


