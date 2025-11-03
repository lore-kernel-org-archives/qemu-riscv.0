Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909A7CCF9FE
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 03:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vFlOH-00068m-3g; Sun, 02 Nov 2025 22:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vFlOA-00065A-Eg
 for qemu-riscv@nongnu.org; Sun, 02 Nov 2025 22:37:50 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vFlO3-0000E3-1L
 for qemu-riscv@nongnu.org; Sun, 02 Nov 2025 22:37:45 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-339d7c4039aso3862433a91.0
 for <qemu-riscv@nongnu.org>; Sun, 02 Nov 2025 19:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762141060; x=1762745860; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+ADKirZFYh3BWmDuvkt9w0xdIjzP2BapZzLBzSFQ2w=;
 b=VGWAYKBCPNRyvXGbn8nL0xd8nTQHez5tNDorYDmLZ2uSUiq/1Ixm5/F3UD9PyEjBwB
 nVz8JAWuceKwTRiArDiCAD//xJuPsFYCBC6fsQnaSjdJjFVDpDDiTD9gmRCIHeIZWP77
 LRzouGY5yP+tenXI4G+9hDbjAYx0oI8Z4pjOAZLJFrdXLIEJvhk5O8jKazJg1iJf7wqZ
 0lOk9WTdtxwMBZyw17YlAr3SmBsXoRlCsAIJOQxuwik/A6xR4Yb9A9pSxnJ3gLl6vVgn
 fxvn8jDVtxiAdLvK6cMo9Fg5ESG8ieBp0j0yklc2er5Pp0rZ6NJNeeJ8JPUoCvHZ9Wqu
 JykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762141060; x=1762745860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+ADKirZFYh3BWmDuvkt9w0xdIjzP2BapZzLBzSFQ2w=;
 b=uXAAtGIEmB9pm8GOLMXJuJthlQEvB3VMqyUTkS1+iJL3r0nmfbEt6slXKWD4qX/1sT
 YiTAIFvYcz6mPooNHs4cgdK8FS0HKG3umRUxcpDZONlD45sm8zTzmL56B7vj1Ofhmv4f
 NVEOuYteEIK4xk5X8UYuFJ7p10Pp8QcVI5az9cIJ3Vw1AwZxpLni+2f/Uf5Z3+FZc66i
 qmSVlUHs4Yz7vyX5qREdMD4CAZk/w3G67/u1ul1Y6bguw7duHE5K1glEb09SqvYqugYQ
 83qT2l3rLShAFOVx2NFCiGFGp5oYkaM3BFCwUcrJ4HcEbbJfsedZsHXD93/II3ICsyDn
 pnbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ7xEPeEyr8wJ/XCX5n7dJD7NvwArVmbPG3Klrje0qs3xVvkzjBOtLkAi+huVICFuOF7C1FScpXsKB@nongnu.org
X-Gm-Message-State: AOJu0Yy7oYi1b8Vh+co84ygSh7dECYAvNuSOSRfYuPSgGNEmm8/husTy
 Uu9Mj+IcM4XOAGe+fBpb71w7t+qO4Zla3WkRwxm2AoN3X83a7oHunjKM
X-Gm-Gg: ASbGnctwYmf7QyDPz3YoTjF9+m6MjMASz7HRysTArSYUpTcni3nX2Vo8ti03jJ7G50b
 qnXPg2MQ0E6wv/j5KsjeCFXH46mQyXKCV6VlKzS7nG50MnnBmI9hj+WXX7qBM3RoVdmEAGDq/dO
 pPeph0Kf3ogN3SY1rW5nx1UwUTkLcc15ai5Nat7KYVbo8B9ZPbMWNqiQxDVXWrwfNppuKU77+3/
 bc5gd9s9bPH4YIy6pIqZCsheJ0XDcCU4tZJv3Eg5Q7hxLqD9YJ7c/zCg4xq7SBsenz7u3Phe1AF
 MGww0IJpiifsfSd/RnSeL9rfuHZ8nzPag11x7PvgW+/h9aarwlKaAjp9rP7ZqJpr5v01Z2hLQIo
 E9AHx0VTQsAwxkKc88hCozfWOrFjCwgLYw/ghT1pRhmyX9Ob2TeYWSlDoFylI/CoLZQnZidqxAo
 aRcLKIqbaq7oRtCLlotoi9r/c06yFYuR9900C+nsZylsxce1RjLNm9cDYnye9RwLMpf7tJfg7ZO
 hVXT5FQmtUn6tunoEGfpYo5CJlyXw==
X-Google-Smtp-Source: AGHT+IG4t+cgJ1ZaTlpQBBexQXuie4pc6gqZtjvzZIfPlsSk+nQiWrnwDHRJhq7sNecyd/WOgugDQQ==
X-Received: by 2002:a17:90b:2781:b0:340:dcd4:f851 with SMTP id
 98e67ed59e1d1-340dcd4fa95mr6689535a91.3.1762141059600; 
 Sun, 02 Nov 2025 19:37:39 -0800 (PST)
Received: from toolbx.alistair23.me
 (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net.
 [2403:580b:97e8:0:82ce:f179:8a79:69f4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-340a460ed24sm7939641a91.16.2025.11.02.19.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 19:37:38 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: qemu-devel@nongnu.org, anjo@rev.ng, philmd@linaro.org, palmer@dabbelt.com,
 dbarboza@ventanamicro.com, atishp@rivosinc.com
Cc: alistair23@gmail.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/8] target/riscv: Fix size of mhartid
Date: Mon,  3 Nov 2025 13:37:07 +1000
Message-ID: <20251103033713.904455-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103033713.904455-1-alistair.francis@wdc.com>
References: <20251103033713.904455-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Anton Johansson <anjo@rev.ng>

and update formatting in log.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20251027181831.27016-3-anjo@rev.ng>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h         | 2 +-
 target/riscv/cpu_helper.c  | 2 +-
 target/riscv/machine.c     | 2 +-
 target/riscv/tcg/tcg-cpu.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7ffc4dac26..adeb36abc2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -280,7 +280,7 @@ struct CPUArchState {
     target_ulong geilen;
     uint64_t resetvec;
 
-    target_ulong mhartid;
+    uint64_t mhartid;
     /*
      * For RV32 this is 32-bit mstatus and 32-bit mstatush.
      * For RV64 this is a 64-bit mstatus.
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c4fb68b5de..dd6c861a90 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -2280,7 +2280,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                      riscv_cpu_get_trap_name(cause, async));
 
     qemu_log_mask(CPU_LOG_INT,
-                  "%s: hart:"TARGET_FMT_ld", async:%d, cause:"TARGET_FMT_lx", "
+                  "%s: hart:%"PRIu64", async:%d, cause:"TARGET_FMT_lx", "
                   "epc:0x"TARGET_FMT_lx", tval:0x"TARGET_FMT_lx", desc=%s\n",
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f6ca017211..ab0bc32e1f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -450,7 +450,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
-        VMSTATE_UINTTL(env.mhartid, RISCVCPU),
+        VMSTATE_UINT64(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
         VMSTATE_UINT64(env.mip, RISCVCPU),
         VMSTATE_UINT64(env.miclaim, RISCVCPU),
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index d3968251fa..850a383702 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -489,7 +489,7 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
                 continue;
             }
 #ifndef CONFIG_USER_ONLY
-            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
+            warn_report("disabling %s extension for hart 0x%" PRIx64
                         " because privilege spec version does not match",
                         edata->name, env->mhartid);
 #else
-- 
2.51.1


