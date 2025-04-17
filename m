Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8AEC369B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:58:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5Msx-0008PC-VC; Thu, 17 Apr 2025 06:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Msd-0007ge-Rj
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:54:05 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Msa-0003Ss-6s
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:54:03 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so487846b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887238; x=1745492038; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2ynf1dYmwbYGI8KiYXQBOC7joESopxPzlk7K7/NwSsw=;
 b=hJgxRkIVUoPyncr1oKDfuhJCrbGsWYdhS5iaeh4LLhRnp9SSX1cPovDHPSrtsw0H5R
 ecl0zA3wZE5G1TXTgeIgnQ53gkBtYIqRw5rvNXppO1DP7igh+sFiCxE58v8wgQEW/b1Q
 S2ipnTTqOV5MC0blZ6QewcnHz+5L4/1Udf7PIXe16zrE4Y00o7a5IKS/jfKa9EuRRc+C
 szBEAqvLMoSBBOxAvkXbpo1oqx5DgjzEx5o7ljAan1QwDhFXPooS6Oewq/F04gW/o54+
 HAwHwicEZrG9Kz3u/A1YNnaLvPT7PZ8WCp8dyryro1/zaZe1l87oUQPGq4CF3BYkDhsG
 G/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887238; x=1745492038;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ynf1dYmwbYGI8KiYXQBOC7joESopxPzlk7K7/NwSsw=;
 b=OcK8fQTRG0i45l/VeCreBisNKXlr79Fy9oRRY6ayxMHZZhXIU7lnQaUsDdhByJw527
 4O70D4XVVAJM7mYvhaJuKB+br6UWVHawAkvadDEg6PeEGB3aua0Y+bmAAZB9x9Ch7TE+
 0KYYM5XU/gZL68/UIQO40St8/qopVTtRRP7IYAn4DoIYUGbmf9/7Wj5frKcl7XUCIgr0
 iSt97tYapeSFBfErE3YCP142W0E6z+WJeP7aytpICxcCbovhXAy8PZpExXu5Edwhz4cr
 GLXkAGE9za2YeWOpicnHoJanZKVU0vU5J2XBBafTNfONRbBtbP4ITf4yUZ+3xGQm/UAK
 UJ+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNhhp25QiXQgVF8GTcBwNPJJiapszrYf0iHTlEhTtj1WbVN4mk9pQiy2+gDl64yfhnyID1RChpeLGb@nongnu.org
X-Gm-Message-State: AOJu0YyaiIc6JcYBFCpW6z5ZOMxHwYis0UTrsK/mx3LJdxszWjvz9I+L
 Ml4qHJYk+FMCMRxp4ycX8NOWvkB2KqGu/jYArC8cc9HeYP3L3729vSWO0DETeAw=
X-Gm-Gg: ASbGnct2mL5/xZR5uV6fZCOrDmwyC5+J/CXV4e4GdKNIyxn2CuO6B6PlPoO124vmnlJ
 qXlaqUU0MPf0tDvlPBmJQZYR4+O1F8zt1gF0XRO/y+n6wyKuggex5boBqE+GE4rLtXpkjZVCI4r
 WjeLpr7uCu6XajUDS0juK4lJ/Ot5topGc7m53KOFr9ErPDlM8wEBdtkAonR8nPp68ES+Ciqa8uq
 I3Df0y56UIzBR4S8hPuwIY/TumExoYxtux/kf5MYQ93JkduY5RmKVrCG+m2ytMwfKhtOiTAsE61
 SSFs4V7nPk/OptHXQXSBnoL8DwECYBIwMvBdovTWt+KLL3Kmt+stVQn1gfRfpdk=
X-Google-Smtp-Source: AGHT+IHgbOzKff8rpGr7vAShyE/TVFOAk9a78CZeOSMl2RxNdZiEp9IeyuiDmv2prSWkA1bYr5u2WQ==
X-Received: by 2002:a05:6a00:1145:b0:736:4a5b:7f08 with SMTP id
 d2e1a72fcca58-73c267fe1dbmr8043631b3a.22.1744887238063; 
 Thu, 17 Apr 2025 03:53:58 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:53:57 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 10/18] target/riscv: Implement WorldGuard CSRs
Date: Thu, 17 Apr 2025 18:52:41 +0800
Message-Id: <20250417105249.18232-11-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The WG v0.4 specification adds 3 CSRs to configure S/U/HS/VS-mode WIDs
of CPUs in the higher privileged modes.

The Smwg extension at least requires a RISC-V HART to have M/U-mode, and
the Sswg/Smwgd extension at least requires a RISC-V HART to have
M/S/U-mode.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c |   4 ++
 target/riscv/cpu.h |   5 +++
 target/riscv/csr.c | 107 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a182e8c61f..1dbeac0509 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1141,6 +1141,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
     }
 
+    if (riscv_cpu_cfg(env)->ext_smwg && env->wg_reset) {
+        env->wg_reset(env);
+    }
+
     if (kvm_enabled()) {
         kvm_riscv_reset_vcpu(cpu);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6dfc260a07..7bffe62f70 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -501,6 +501,11 @@ struct CPUArchState {
     uint64_t rnmi_irqvec;
     uint64_t rnmi_excpvec;
 
+    /* RISC-V WorldGuard */
+    target_ulong mlwid;
+    target_ulong slwid;
+    target_ulong mwiddeleg;
+
     /* machine specific WorldGuard callback */
     void (*wg_reset)(CPURISCVState *env);
     void (*wid_to_mem_attrs)(MemTxAttrs *attrs, uint32_t wid);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7948188356..614df37d00 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5388,6 +5388,109 @@ static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong val)
     return RISCV_EXCP_NONE;
 }
 
+/* RISC-V Worldguard */
+static RISCVException worldguard_umode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_cfg(env)->ext_smwg) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return umode(env, csrno);
+}
+
+static RISCVException worldguard_sumode(CPURISCVState *env, int csrno)
+{
+    RISCVException ret;
+
+    if (!riscv_cpu_cfg(env)->ext_sswg) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    ret = smode(env, csrno);
+
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    return umode(env, csrno);
+}
+
+static RISCVException rmw_mlwid(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_mask)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    target_ulong new_mlwid = (env->mlwid & ~wr_mask) | (new_val & wr_mask);
+
+    if (ret_val) {
+        *ret_val = env->mlwid;
+    }
+
+    g_assert(cpu->cfg.mwidlist);
+    if (!(BIT(new_mlwid) & cpu->cfg.mwidlist)) {
+        /* Set WID to lowest legal value if writing illegal value (WARL) */
+        new_mlwid = find_first_bit((unsigned long *)&cpu->cfg.mwidlist, 32);
+    }
+
+    if (env->mlwid != new_mlwid) {
+        env->mlwid = new_mlwid;
+        tlb_flush(cs);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_slwid(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong new_slwid = (env->slwid & ~wr_mask) | (new_val & wr_mask);
+
+    if (!env->mwiddeleg) {
+        /*
+         * When mwiddeleg CSR is zero, access to slwid raises an illegal
+         * instruction exception.
+         */
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (ret_val) {
+        *ret_val = env->slwid;
+    }
+
+    if (!(BIT(new_slwid) & env->mwiddeleg)) {
+        /* Set WID to lowest legal value if writing illegal value (WARL) */
+        new_slwid = find_first_bit(
+            (unsigned long *)&env->mwiddeleg, TARGET_LONG_BITS);
+    }
+
+    if (env->slwid != new_slwid) {
+        env->slwid = new_slwid;
+        tlb_flush(env_cpu(env));
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_mwiddeleg(CPURISCVState *env, int csrno,
+                                    target_ulong *ret_val,
+                                    target_ulong new_val, target_ulong wr_mask)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (ret_val) {
+        *ret_val = env->mwiddeleg;
+    }
+
+    env->mwiddeleg = (env->mwiddeleg & ~wr_mask) | (new_val & wr_mask);
+
+    /* Core wgMarker can only have WID value in mwidlist. */
+    env->mwiddeleg &= cpu->cfg.mwidlist;
+
+    return RISCV_EXCP_NONE;
+}
 #endif
 
 /* Crypto Extension */
@@ -6465,5 +6568,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
                              .min_priv_ver = PRIV_VERSION_1_12_0 },
 
+    /* RISC-V WorldGuard */
+    [CSR_MLWID]     = { "mlwid",     worldguard_umode,  NULL, NULL, rmw_mlwid },
+    [CSR_SLWID]     = { "slwid",     worldguard_sumode, NULL, NULL, rmw_slwid },
+    [CSR_MWIDDELEG] = { "mwiddeleg", worldguard_sumode, NULL, NULL, rmw_mwiddeleg },
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.17.1


