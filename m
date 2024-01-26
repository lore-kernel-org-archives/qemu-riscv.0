Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B1CC47422
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 22:08:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTULD-0002Ob-2A; Fri, 26 Jan 2024 17:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUKS-0000A8-MT
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 17:05:41 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTUKP-0004CW-CZ
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 17:05:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so17302915e9.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 14:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706306735; x=1706911535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFJLEX8dK90+jos80xXDDodOgI2wmwmhf0FUxCQuinw=;
 b=Cz5GAQzXyFWJQnda5cT/mRJM4/z+9llym5n18wu+pTRcQrYEHaes3+dEXrVr6SD9uc
 FNP+8aFBPxkUuI/D0SE7WtV1oXxNiaxJjjTw5N2NJTNEKJ1S+q+AmW1lDbMDdYQMVR7I
 Cvc6Xb4bCKD809lorEV4AyW4b0DqPpiE5reWpKzzAyhCwPlOqqYHGSUlPhjAIzLcwVAL
 xtGMyOTmrXIjzbZ+B4qfuhLqge3ot7bqed4Pzu+V2ewdgVL0z+h8Ei/UE6XsvnSrOQlo
 HE0CpHaWNX6mtbQW6CedRX1yGukZP7rxMEQMyz9wwBOcaDbGvlJz45WwZXxdYTrfUYrx
 ooDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706306735; x=1706911535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFJLEX8dK90+jos80xXDDodOgI2wmwmhf0FUxCQuinw=;
 b=imKN2WXG9RxhQ1cIZst3+08KTHRTooN45xyhzJeZZqEfER8yBDD9brB0U13Pdi5bou
 MVDvburS1yDh7+fz+n0IpGdY8PYfuq/gQEbgvk2k45lGaJG7tMPgQyc3kv7eezA9IYzu
 7wP5zXrd2d3HVylbaS5fj7YoYYhNwn6GdY3jeE0sytJdG651ogcULpVucLD95ENTDKY8
 ICcm7NLQJIu6ENYA1C1W7u5I8y6jisBwPq+VRhuj2OiKwZP6gh/CplyhvQ00Z1gd6uAq
 W8FH+5PKa9KPbDPpMw68MXre4nxY68eZAKz1fVxqRoe87/wf+2dXknVLiXguXd1u7BLj
 4X+w==
X-Gm-Message-State: AOJu0YxAKZ+bjLBY88FxG4TNOvhvQ2SQVx30dgEkQIkolAXIazfV8wnz
 Yd0Rzj2ZtOB2OGFnG9ZCYrDkdqOyzErxBKFU3D/IoMjf4Lhf6TGbpwk99FT8/Jc=
X-Google-Smtp-Source: AGHT+IERKWPKqMlUDr8TgLLCEk48utrgqZ8fZ+srVdZ0DPEqZSZhTX1J0vsKsxaQU/Y2UaXBmJlN2g==
X-Received: by 2002:a05:600c:2246:b0:40e:e944:154a with SMTP id
 a6-20020a05600c224600b0040ee944154amr243867wmm.198.1706306735629; 
 Fri, 26 Jan 2024 14:05:35 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1709060c0600b00a2a37f63216sm1056778ejf.171.2024.01.26.14.05.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Jan 2024 14:05:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 14/23] target/nios2: Prefer fast cpu_env() over slower CPU
 QOM cast macro
Date: Fri, 26 Jan 2024 23:03:56 +0100
Message-ID: <20240126220407.95022-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/nios2/cpu.c        | 15 +++------------
 target/nios2/helper.c     |  3 +--
 target/nios2/nios2-semi.c |  6 ++----
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index a27732bf2b..a2eaf35c1a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -28,28 +28,19 @@
 
 static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 {
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-
-    env->pc = value;
+    cpu_env(cs)->pc = value;
 }
 
 static vaddr nios2_cpu_get_pc(CPUState *cs)
 {
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-
-    return env->pc;
+    return cpu_env(cs)->pc;
 }
 
 static void nios2_restore_state_to_opc(CPUState *cs,
                                        const TranslationBlock *tb,
                                        const uint64_t *data)
 {
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-
-    env->pc = data[0];
+    cpu_env(cs)->pc = data[0];
 }
 
 static bool nios2_cpu_has_work(CPUState *cs)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index bb3b09e5a7..ac57121afc 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -287,8 +287,7 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr)
 {
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
+    CPUNios2State *env = cpu_env(cs);
 
     env->ctrl[CR_BADADDR] = addr;
     cs->exception_index = EXCP_UNALIGN;
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 0b84fcb6b6..420702e293 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -75,8 +75,7 @@ static int host_to_gdb_errno(int err)
 
 static void nios2_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
+    CPUNios2State *env = cpu_env(cs);
     target_ulong args = env->regs[R_ARG1];
 
     if (put_user_u32(ret, args) ||
@@ -93,8 +92,7 @@ static void nios2_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 
 static void nios2_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
 {
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
+    CPUNios2State *env = cpu_env(cs);
     target_ulong args = env->regs[R_ARG1];
 
     if (put_user_u32(ret >> 32, args) ||
-- 
2.41.0


