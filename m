Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F203BCCD1A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:14:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBEzg-0004H3-Sy; Tue, 21 Oct 2025 12:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzf-0004FE-Na
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:13:51 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzd-0001bc-GQ
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:13:51 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7a226a0798cso3732354b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 09:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761063226; x=1761668026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPid8O/40LFlUrPqK0SELP2UT4eulj7CVPfrAr1p+ws=;
 b=WOJUrlxyQXIn+XM+I1rhxKaCMBtpB4mHqTguBc55vaP1rPUJnMWyC9yT1IEuBVsKYu
 zgQeTVgFwDuYIzHpgoKHA76TC0myWFqB6YorHJLEx9sXa60IWjzOrot3bD1y+DYYnfpJ
 edfDAT1vCu+fqzPI/lyBvlYJkVf9Tsm7cvDFbMExENJ3DoJmWzofPCzar+E2WXAJqjwU
 swLcj7xJ7mkN4YAcpnkZyRULi/I4GMQ5G4fWI+tKwwkVqtpXw1q8JznhuxYe5kAv3dSl
 UWq5PKpV5zZU+h79hr4pGw2eENGlhpoXUm38GMbUoBOSuHVfKB7NuG9rV89J/OM0xt/r
 pdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761063226; x=1761668026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPid8O/40LFlUrPqK0SELP2UT4eulj7CVPfrAr1p+ws=;
 b=mrmP2c/iAIEHzfrfdvbmNHAN5qzzX9ZgPdUhHwuoW7meH3jWvbj5LJTijXV5edowPr
 DcTnkGeRzhOsGLpjNbcfHnz81aWzvbcE4nPC+QQ+Wy6BMLHzZVhbAxGTlXQXRBmAHEFx
 Nog+rhFO+zuLpiMMd5acVWRRCXrbI0jGNjNF07xqbYt+CkU3FKNPiuynFfKoYbHREXyh
 b4eY9P7PzuU+6jmrxVNCa9jCbZZsYyqBfx1Cx8JSjTECWTEEjjlYSItqsaegkqvAeKBZ
 9Z3cYEp5TdHiH9M56xxBa+e6tr2vm58j8KtR4kBM6qqm3o3VbKB1vx5jARt8wAMopf6k
 8OQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzvVksweci5nD3of7USiDmSB5fTFavC+iJID44nCjBZaxS02Yv7y1zGzl07wPd4gJqNUnHQ3ngbfAA@nongnu.org
X-Gm-Message-State: AOJu0Yz8DmpalC2vpQPUqXwSjLkr65LBd5uBedVv6+27tAVAQrUmxlqc
 VZyZNLFlwmc8F2eVnlptE+ms8mMsNevh3BB0wnsm+ZOlQ81ljb8GaB+00MOyCCW4gX8=
X-Gm-Gg: ASbGncvgrW2dQhndFi6Ze6FvaZ9th5SbLu4dgefpW4SNWSgc/xcLX681iBQDKW41vmu
 Xmhe5NJ5pRJJkhGQnJzDOprvYg7+3GUYEFu1f7Fm+so97sOKjMeDRYOXsrB+wxurjqpLvtz6CBb
 5RB+PHMEGTANPjhS1SCk++hVAKnQhDXpxNV57AJ0tJEuNKSs5cEuTmuCT61W+6G0RkKfBYfCgrH
 nmLPex9jVGn49WfmqoDN2vI/XyVAhOvBFIr9qaaWSwd51qAhRM4OrGSF5wFpLNBcv0j+NWr+sau
 Re9GesN6yYzm+MnNprjMUSh3ANk5l7RBvQmqceqi3HYQlQIBFvvOW3t7p4xiv8yLQPd0x3jG4JF
 K/iM0bhugJZK7Ezkr0hOL+aY1GMthU9zfFWnLihBEINKkwpfumBxwlWAn6HyS1yffTOYN7MhPgw
 VIHXPN7oPR91G/MrpIAxOIRQ==
X-Google-Smtp-Source: AGHT+IHRpNcOULa6siOygj7bHDL86wtI9uZwhVGxYVuwKJq4fP0bxUJjSmKp+5DHkiIWGu4RHtkblw==
X-Received: by 2002:a05:6a00:886:b0:77d:b0cf:ca14 with SMTP id
 d2e1a72fcca58-7a220af0525mr20092587b3a.22.1761063225839; 
 Tue, 21 Oct 2025 09:13:45 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010f7c7sm11731157b3a.54.2025.10.21.09.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:13:45 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 10/18] target/riscv: Implement WorldGuard CSRs
Date: Wed, 22 Oct 2025 00:13:16 +0800
Message-ID: <20251021161325.585278-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021155548.584543-1-jim.shu@sifive.com>
References: <20251021155548.584543-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42c.google.com
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

The WG v0.4 specification adds 3 CSRs to configure S/U/HS/VS-mode WIDs
of CPUs in the higher privileged modes.

The Smwg extension at least requires a RISC-V HART to have M/U-mode, and
the Sswg/Smwgd extension at least requires a RISC-V HART to have
M/S/U-mode.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c |   4 ++
 target/riscv/cpu.h |   5 +++
 target/riscv/csr.c | 107 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 03946439f2..22b4070476 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -795,6 +795,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
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
index 8e18b5f13e..e99aa11140 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -514,6 +514,11 @@ struct CPUArchState {
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
index 5c91658c3d..be62a30953 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5470,6 +5470,109 @@ static RISCVException write_mnstatus(CPURISCVState *env, int csrno,
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
@@ -6667,5 +6770,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
                              .min_priv_ver = PRIV_VERSION_1_12_0 },
 
+    /* RISC-V WorldGuard */
+    [CSR_MLWID]     = { "mlwid",     worldguard_umode,  NULL, NULL, rmw_mlwid },
+    [CSR_SLWID]     = { "slwid",     worldguard_sumode, NULL, NULL, rmw_slwid },
+    [CSR_MWIDDELEG] = { "mwiddeleg", worldguard_sumode, NULL, NULL, rmw_mwiddeleg },
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.43.0


