Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5717D16243
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 11:23:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0J9z-0006bV-Vh; Mon, 14 Oct 2024 07:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0J9y-0006ZE-RM
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 07:22:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0J9v-0002eO-QH
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 07:22:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d6756659eso996504f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728904961; x=1729509761;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jjVOqHYyme7TuTf7cP0qU+WrovStk5IdwfY0O87Bfg=;
 b=TpleimeFxDfFZpYBGoksyP8y9xG5HRya70/ivnohPtoelFLVlquESknbytmZWWuX6p
 tucSea1NIx/gzXGk+x6dspa3vrRPv2AgHCBYxFRnBJU3A+Qj1UDo3nMOYSxJunbKmDgq
 uhqvPlYZF10rrZcCfOq4OTxvAG5hEuSxmGaSTsSu1s6lqlC9fQbiHGdANnAZWpMwQDSM
 SWKsZUFp9LEhBJO9r/1dk8LaG4v5rzeTP3CqeG9AO1gySIOB8/2dxFn4+XBrCoXCpWxF
 TgIQIRQ++ZTsWMT/vvsFMaY6wl+tzWxCL51aqT+JIenHwjL4bywftYVGJt8BiMIYu5yU
 UMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728904961; x=1729509761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jjVOqHYyme7TuTf7cP0qU+WrovStk5IdwfY0O87Bfg=;
 b=pFF/Icn298f3yQf/TKtz5w7ejsU1X+A4RH9xgrVZxbKa/9BELIb+6P10AY35U4hEsr
 S2SYPKz+lAVtFmIcuVlOFmebS95ml4iR3PzdSGqwQkdlqf2AVg4mRuJZqrwk7xNyPuaJ
 26MwBsOfaVvr7qGLhI9wzBVoH8TYyzstTx4GygtonCC+oz2swzUPFI+1tODGXXb3yFQk
 xiW69qIi1iXK4tdpVrD3u3vbtOQO3iQoUwz/ljPGj+liDcYv+qIIGkqJVoFDGXnX2ga3
 /WwFNwd4v4A69d+LZJTn1qzKTeM1qCw0Gr2c7FjfVOadl9XONzQVNYJJDhcnDEQgBUet
 PkTA==
X-Gm-Message-State: AOJu0YyjEb+I6MGF+gFSFzGSHZnVJZaC0VLDrJIlaB/3BF8zR1KChXtQ
 04yssEtgjX3xiOUR+F7OdEYoX4oTUXnhZUK4VPBYU/sVUoWvi0llEL07m/s1WtxXXR76b7tqupM
 JdjQ=
X-Google-Smtp-Source: AGHT+IEhB0fsnX6b9YVK+DJ0kLB/v+DmYLq6ZjkIFYA6wjx0kLtx1QnYd3CVEK855WuOjkwTLeUPkA==
X-Received: by 2002:a05:6000:b91:b0:37d:47e2:5e30 with SMTP id
 ffacd0b85a97d-37d5ff6ce3fmr5078588f8f.42.1728904960778; 
 Mon, 14 Oct 2024 04:22:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd382sm11117303f8f.43.2024.10.14.04.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:22:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] target/riscv: Implement Smdbltrp behavior
Date: Mon, 14 Oct 2024 13:22:17 +0200
Message-ID: <20241014112225.90297-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014112225.90297-1-cleger@rivosinc.com>
References: <20241014112225.90297-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When the Smsdbltrp ISA extension is enabled, if a trap happens while
MSTATUS.MDT is already set, it will trigger an abort or an NMI is the
Smrnmi extension is available.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu_helper.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5173155070..8b44986cd6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1699,6 +1699,17 @@ static target_ulong riscv_transformed_insn(CPURISCVState *env,
     return xinsn;
 }
 
+static void riscv_do_nmi(CPURISCVState *env, target_ulong cause, bool virt)
+{
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV, virt);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP, env->priv);
+    env->mncause = cause;
+    env->mnepc = env->pc;
+    env->pc = env->rnmi_irqvec;
+    riscv_cpu_set_mode(env, PRV_M, virt);
+}
+
 /*
  * Handle Traps
  *
@@ -1735,15 +1746,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool nmi_execp = false;
 
     if (cpu->cfg.ext_smrnmi && env->rnmip && async) {
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV,
-                                  env->virt_enabled);
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP,
-                                  env->priv);
-        env->mncause = cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1));
-        env->mnepc = env->pc;
-        env->pc = env->rnmi_irqvec;
-        riscv_cpu_set_mode(env, PRV_M, virt);
+        riscv_do_nmi(env, cause | ((target_ulong)1U << (TARGET_LONG_BITS - 1)),
+                     virt);
         return;
     }
 
@@ -1938,6 +1942,19 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         s = set_field(s, MSTATUS_MPIE, get_field(s, MSTATUS_MIE));
         s = set_field(s, MSTATUS_MPP, env->priv);
         s = set_field(s, MSTATUS_MIE, 0);
+        if (cpu->cfg.ext_smdbltrp) {
+            if (env->mstatus & MSTATUS_MDT) {
+                assert(env->priv == PRV_M);
+                if (!cpu->cfg.ext_smrnmi || nmi_execp) {
+                    cpu_abort(CPU(cpu), "M-mode double trap\n");
+                } else {
+                    riscv_do_nmi(env, cause, false);
+                    return;
+                }
+            }
+
+            s = set_field(s, MSTATUS_MDT, 1);
+        }
         env->mstatus = s;
         env->mcause = cause | ~(((target_ulong)-1) >> async);
         if (smode_double_trap) {
-- 
2.45.2


