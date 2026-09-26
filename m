Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297C0C98332
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:09:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQH5-000857-Hy; Sat, 26 Sep 2026 07:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGw-00083E-Jy
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:52 -0400
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGt-0002ki-8p
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:49 -0400
Received: by mail-dy2-x0d.google.com with SMTP id
 5a478bee46e88-34346932d93so201857eec.3
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420926; x=1791025726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=guuk/GU2+6svkxqusCAEMJJEdeLkWutsxCBXdBcfQM0=;
 b=KbzpJANR2X4BdWMVG0sJeiF8+TfaXtbJZ2ETcfziNfVV8i2Bu99jTfJoLUtSefrrmt
 0pRq3lONT4WI3g79kofEUZecc4fg1JUxRLNg+h3AeLSo5OhU60qIpc6oJPx0U4pT5AHz
 qcUiRqNgCr9wZWNa3aVAtlOUftEtDG9UA+TRjEhqPbQHsGsZ4+pk3xnN6qthlPO1RQ87
 j1n9C7ix+TLfwLqGzuE10CD6NqrzVjTBEvdwwwXxRH6uXQzXAPgz62it5baMVFepqVJD
 kzRbeLFBHBaWdhj6FdFXs9GxgSzA5/ytfUwIgHenlzsK0wCnMuD1gQnarzL1tPEuy3Az
 Actg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420926; x=1791025726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=guuk/GU2+6svkxqusCAEMJJEdeLkWutsxCBXdBcfQM0=;
 b=a4UXybebmfNbCbMZb+ym7e+kZGEs9UDQys/ReVUKXEmdXaGZ8PJ/nxo0805IpSiyCm
 H/bD5cocRG9EgphGfu8YXDD3eCN+BhcrZGtA9yxNTb+aLo5arPV1vP9iALke0QNA1A42
 oYxStHzACS6t9k8vT0aG4aBnczBr6mM7wlILo2SlKqaA3EvlJfvK/WTMTNixDa+l3lap
 f70saZE8HWTt1GqRCfM0Iz6nVe2UrtcXTKtDU5jyBr93YU8xb5uQ3X44HMDhPAPStmtd
 9vunKakseaM7A/7xoL2WvYkxPg+rQh8yqkkPqNYHTRmlEKgsqRMz/FH/B/mCrqzeAYBF
 c6BQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwNmvSOI7opp2xZ/NjjnTAt9xsHEpq6VCFpnAsZFPzXgVt0r0dRJ2j3W5I36Z1+vl/Pu3poztOxl0bj@nongnu.org
X-Gm-Message-State: AFuF++mciLlgIspEGh+swhWyoN4THdBDxpggYA8XXUYIauUOdv+btHFV
 SsJsCUwKnVu1FcNnD2gUoHpee/z2+Sbm1VpbvcHocITxagpn8CINRgGv
X-Gm-Gg: AYBFou3+iTSLo7McSpSzwfvqI9GlHmmjHmrbAUK+mKAF+ognlBHORW+kWanUzina0VU
 Rq9OkKI+Q4OVU/PrScg924UoEcxZD4flrnME17D1GKnKS1QDxE5zza2oZR9Zt7usxQlt7tFaDVn
 +nra2suzDXjkfqfdQjQUmrv6BNHzYLHyPl8DcVQ3CUG9h6mFZ7gU7yV7arvFSbb3Oj/Sdyx9uUi
 swq65fXwyNAfOYagVcaDx+tyCG3Ce+JSx8yGq8Kf/sxCRNvmb/PIQRz2s/S6KP5KGdn3XXpJFuY
 pIOXJCGnkfneK2dhStxQF7GbSyx8ybqPNW4yLNPDCBz8PezVCwDLeaIblFHfC1inm0gk30mbu/8
 /yLoPKokx8TFLnbSfT0cXP45EFQgUTYmYFb2f1/cbKxNg8aBrQpnBYC4fYOyVFyUhf9xz++EoNL
 oRa4WODVUK4JBKJp40IYOqwLwcFCEQ0JheJ54omWnewiSnXb+LApruI/jnQIVjFdKlY3EDIkr+A
 fuM9DhSGHF/Q1zI6un+l9RaT9xejDo=
X-Received: by 2002:a05:701b:4343:b0:143:26ed:2dd4 with SMTP id
 a92af1059eb24-146cfcd91c7mr2281470c88.30.1790420925630; 
 Sat, 26 Sep 2026 04:08:45 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 3/9] target/hexagon: rename helper_wait to helper_hexagon_wait
Date: Sat, 26 Sep 2026 19:08:11 +0800
Message-ID: <20260926110818.1912-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

helper_wait is a global C symbol. Prefix it and take the resume PC
as vaddr.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/hexagon/gen_tcg_sys.h | 2 +-
 target/hexagon/helper.h      | 2 +-
 target/hexagon/op_helper.c   | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hexagon/gen_tcg_sys.h b/target/hexagon/gen_tcg_sys.h
index af5032214c4..489d2780470 100644
--- a/target/hexagon/gen_tcg_sys.h
+++ b/target/hexagon/gen_tcg_sys.h
@@ -80,7 +80,7 @@
 #define fGEN_TCG_Y2_wait(SHORTCODE) \
     do { \
         RsV = RsV; \
-        gen_helper_wait(tcg_env, tcg_constant_tl(ctx->pkt.pc)); \
+        gen_helper_hexagon_wait(tcg_env, tcg_constant_vaddr(ctx->pkt.pc)); \
     } while (0)
 
 #define fGEN_TCG_Y2_resume(SHORTCODE) \
diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index 71c8da4c46d..030ed6dcef5 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -136,7 +136,7 @@ DEF_HELPER_3(sreg_write_masked, void, env, i32, i32)
 DEF_HELPER_3(setprio, void, env, i32, i32)
 DEF_HELPER_2(start, void, env, i32)
 DEF_HELPER_1(stop, void, env)
-DEF_HELPER_2(wait, void, env, i32)
+DEF_HELPER_2(hexagon_wait, void, env, vaddr)
 DEF_HELPER_2(resume, void, env, i32)
 DEF_HELPER_1(resched, void, env)
 DEF_HELPER_3(modify_ssr, void, env, i32, i32)
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 4f00ca773f3..7f026292ce8 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -1741,7 +1741,7 @@ static void set_wait_mode(CPUHexagonState *env)
     SET_SYSTEM_FIELD(env, HEX_SREG_MODECTL, MODECTL_W, thread_wait_mask);
 }
 
-static void hexagon_wait_thread(CPUHexagonState *env, uint32_t PC)
+static void hexagon_wait_thread(CPUHexagonState *env, vaddr pc)
 {
     CPUState *cs;
 
@@ -1768,7 +1768,7 @@ static void hexagon_wait_thread(CPUHexagonState *env, uint32_t PC)
         return;
     }
     set_wait_mode(env);
-    env->wait_next_pc = PC + 4;
+    env->wait_next_pc = pc + 4;
 
     cpu_interrupt(cs, CPU_INTERRUPT_HALT);
 }
@@ -1836,12 +1836,12 @@ void HELPER(resched)(CPUHexagonState *env)
     resched(env);
 }
 
-void HELPER(wait)(CPUHexagonState *env, uint32_t PC)
+void HELPER(hexagon_wait)(CPUHexagonState *env, vaddr pc)
 {
     BQL_LOCK_GUARD();
 
     if (!fIN_DEBUG_MODE(env->threadId)) {
-        hexagon_wait_thread(env, PC);
+        hexagon_wait_thread(env, pc);
     }
 }
 
-- 
2.52.0.windows.1


