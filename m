Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B125E7716A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 09:10:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNTYE-0008SI-Nq; Tue, 17 Dec 2024 04:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY2-0008MH-9a
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTXw-0001WE-5z
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38637614567so2258425f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Dec 2024 01:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734426434; x=1735031234;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eaTDHyYGUwurrDx3I7AZnQtNa0ZJXKnA6MuUrQ8NqEw=;
 b=Vv3EJ6V79hhGPqZUNmJaWvyqGhb/UQ6dgCiDiF6zJM0GYQnbepWaH8BJK9wxJ56gY4
 fuFSpN7ZNRIvZYy2LvNEhFt8Om+hR1CVFb16HWvIQcGqGXmCGM/Mmd44RN0tjYArRj80
 MyjLZ9E5w2B588WMbhifw10BffbTu1utZ/4jRuo/YL+H01N0aorPWpYdExIFtGbkE/Rz
 sh4MD1BrvszdqccCapjpFzOVl8HhH/gtpAJc87Wcg4UGCbMC0N53RhN1ttEqbsAlA4q2
 pqrpjoA4Vh7ODZhhAeJev/NUEuCVhPgi5f2oI9oDSpperqc1bFfzcDKZskn31MKl1xgQ
 wCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734426434; x=1735031234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eaTDHyYGUwurrDx3I7AZnQtNa0ZJXKnA6MuUrQ8NqEw=;
 b=aj7nRff1rI8jR+Blt2MQ1O839bwY1sZpVwuwPBUt8z9Ew2vs0/bDAd2+czcCgvW9rM
 +hMwiPNJEghVsTSg8WR82/73ZmdlVDKASZgH07pNKuWyqJ54zQlBIffi4s+N8SbAEnZp
 1XHJPtyLZfMzvRz4vZYixEUUtnhlVMQzhpfWlpwGvM1Ah8R2mOEpjBx/W+0Smp68+mnt
 mZ85xDvgnJKDvyTg32Nyk7Z7bYeh3TVacKCHyDnlieCGzT/HbQ26hNbPVe3UD4VuxLjj
 JeFQWkLim8wRjCYRNx01yzHT2uNU0ADmMDICwlJD0QFM3wpXdQP7GeQJ8zFVgP0wHrpe
 e1dg==
X-Gm-Message-State: AOJu0Yzmy+qpqPCNeJKai269+LIGjPQ2s9d1gT7RAg8jbfzVFTUPJ3fy
 BA0icyOi9cLh4prJtQ/eJBdFkhKny7tzmx6VaVhv0NfEbbQc7lcz2kiLmP0xBbti1e4AtkAC98j
 dFHk=
X-Gm-Gg: ASbGnctSps0HXNSZ3CChUskx/l93Rx9GpxlGDIdXCMQx6Hxmjcjbbk4UfNf3dRd1kUS
 lJVcB5aDZRHxrnE3iT3sRiEuuRTBue0Y/jg2RPjKTkm8o2YWDUGQ9OiL+/nKcjP7xlezvoONB2t
 euC0bmiRHaflXxct6ljwNktzTkex6DA5vCmmUchJoHgHhJmbL1F2pfnN1Ukvvz8ox0otf5ZyDW8
 U1mVF1ejJAk88KlaotJu4jESceh7kWUcDie1rPVeB7QbniqH0ElrPKBZw==
X-Google-Smtp-Source: AGHT+IGGDh9sXxLmvUUAzIuM4BJARssM39arGx+NM1h0b0U+hixB7fOG/XI9R3mxsTAA5eQjz0JVwA==
X-Received: by 2002:a5d:5f4f:0:b0:385:d7a7:ad60 with SMTP id
 ffacd0b85a97d-388da380a9bmr2485601f8f.3.1734426434374; 
 Tue, 17 Dec 2024 01:07:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c46sm10704122f8f.71.2024.12.17.01.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:07:13 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 3/9] target/riscv: Implement Ssdbltrp sret,
 mret and mnret behavior
Date: Tue, 17 Dec 2024 10:06:59 +0100
Message-ID: <20241217090707.3511160-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217090707.3511160-1-cleger@rivosinc.com>
References: <20241217090707.3511160-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When the Ssdbltrp extension is enabled, SSTATUS.SDT field is cleared
when executing sret. When executing mret/mnret, SSTATUS.SDT is cleared
when returning to U, VS or VU and VSSTATUS.SDT is cleared when returning
to VU from HS.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index a4b625fcd9..eeacb2d1a1 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -287,6 +287,18 @@ target_ulong helper_sret(CPURISCVState *env)
                         get_field(mstatus, MSTATUS_SPIE));
     mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
+
+    if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
+        if (riscv_has_ext(env, RVH)) {
+            target_ulong prev_vu = get_field(env->hstatus, HSTATUS_SPV) &&
+                                   prev_priv == PRV_U;
+            /* Returning to VU from HS, vsstatus.sdt = 0 */
+            if (!env->virt_enabled && prev_vu) {
+                env->vsstatus = set_field(env->vsstatus, MSTATUS_SDT, 0);
+            }
+        }
+        mstatus = set_field(mstatus, MSTATUS_SDT, 0);
+    }
     if (env->priv_ver >= PRIV_VERSION_1_12_0) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -297,7 +309,6 @@ target_ulong helper_sret(CPURISCVState *env)
         target_ulong hstatus = env->hstatus;
 
         prev_virt = get_field(hstatus, HSTATUS_SPV);
-
         hstatus = set_field(hstatus, HSTATUS_SPV, 0);
 
         env->hstatus = hstatus;
@@ -337,6 +348,22 @@ static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
         riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
 }
+static target_ulong ssdbltrp_mxret(CPURISCVState *env, target_ulong mstatus,
+                                   target_ulong prev_priv,
+                                   target_ulong prev_virt)
+{
+    /* If returning to U, VS or VU, sstatus.sdt = 0 */
+    if (prev_priv == PRV_U || (prev_virt &&
+        (prev_priv == PRV_S || prev_priv == PRV_U))) {
+        mstatus = set_field(mstatus, MSTATUS_SDT, 0);
+        /* If returning to VU, vsstatus.sdt = 0 */
+        if (prev_virt && prev_priv == PRV_U) {
+            env->vsstatus = set_field(env->vsstatus, MSTATUS_SDT, 0);
+        }
+    }
+
+    return mstatus;
+}
 
 target_ulong helper_mret(CPURISCVState *env)
 {
@@ -354,6 +381,9 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus = set_field(mstatus, MSTATUS_MPP,
                         riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
+    if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
+        mstatus = ssdbltrp_mxret(env, mstatus, prev_priv, prev_virt);
+    }
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -395,6 +425,9 @@ target_ulong helper_mnret(CPURISCVState *env)
     if (prev_priv < PRV_M) {
         env->mstatus = set_field(env->mstatus, MSTATUS_MPRV, false);
     }
+    if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
+        env->mstatus = ssdbltrp_mxret(env, env->mstatus, prev_priv, prev_virt);
+    }
 
     if (riscv_has_ext(env, RVH) && prev_virt) {
         riscv_cpu_swap_hypervisor_regs(env);
-- 
2.45.2


