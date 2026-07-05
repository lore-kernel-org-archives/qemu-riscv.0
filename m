Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06938C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdN-0006ua-Mh; Sun, 05 Jul 2026 00:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcC-000518-IS
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbw-0004Dr-JX
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:59 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2c9bd2f8bf7so29047835ad.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226263; x=1783831063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqD0i4B4xHusdPHG8dIAD4vZ8p3PsgamfaStAkj5bxU=;
 b=AzRG0dZYLvts+avzH/A+mJrVNbhh+ARKRpJMI+794bitl6nnhGFag5yCuc3mBDqXR2
 LSulufFK91D721ToyE3xdd1kxJU2HTzeMLMQAPWNv7HEbdONqZxZHI5ZHzhVVEaT5xYn
 gIg58jOhjPmD3vT9c8RsZCIcwr5En0TODqxna/xQPaSu2Mn3yAuVvWBR+JurRFq93Huz
 bkNCX3EGwXU6ftljpz+zncBrlPT/ZN0DHzQdZFBviefJncNw9AkM+Mz2vyQzTzIfBLER
 2T3RogMQBtSYlTtQsuh8hFi6JAHbP/RxR85ROYq6Gedj/VzFeyBwxdfrUtCC+OTRh8h6
 WwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226263; x=1783831063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sqD0i4B4xHusdPHG8dIAD4vZ8p3PsgamfaStAkj5bxU=;
 b=nhd0zWge/vHCsA+PIc142d1gpVWhibbycm+T9SZovlCCTl5/vObwh30Y9619wmC81w
 NsilD3TvIzRJgsIR1kvT4/FnmlhnnMdvdaLciR2a82XZ5Oi/xgSJ96PH/MIj11kqybcc
 GHwMO8j2L/nwnNhHI4WBnoF77d/j8FMlaVAIo0ckB19SemgHWQrcGZPu0QhHFWBZ4nzl
 lcwiewV+b8RQlJxhORM2PIt8OBBs0kM86x56jPhDmlsDGxp/8qD9xuKYNbkNCt1lrGyn
 fm6C5IJq8E7+g1SCGviMzfBd6Pl6h97UTKf7KoofC3L00Kr3w8Kr5zPDd1aVRMw3e3bY
 HSFg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpesEaqFntZi5tES/8g64CNMlIvEIgX2oqs96sPLbSCViNfW0hc+YzTB0UsriOSLXBmnblZwwgt6ZlJ@nongnu.org
X-Gm-Message-State: AOJu0YwhzMiSmfOf6XYM5D27SHxnjCy/RLUFOUW1PGh44EQkijJ8ylEt
 Fuoz1J+kiyVVHtwcQ3eDreTS+ojedN8SuwiZvXQR49CBFHRDvlOBoP30E6uDj+M3E+w=
X-Gm-Gg: AfdE7cm9pbZjgbmv4dKOrJiXVgBFyzKeitI18Z/DuYKA2l7u+lYhWim2QCTN/iHzt9g
 FJ2Ej+as3wYEKMN1Xief/O4vafrpPDkO+pDYuxDGz/EeYVYomVBiY5w2czlUyFnokLDmMpeOMqv
 NPq5fzy6uCnO3pnU+d2Bn1kzJ63F0V5IAwu0baS1TQIBkEVZYNjv8Bgzz6/fyxBuyil65sJAgv9
 smbXWQqp8imsrCal9cHG4qDmRdGnHU4GFzGSQvi2JH2B7Y4VSmIIg8nO6Q0klpvKlBiuxHsY8/E
 nl5NjNa48IocT0cnibUblYuUD1oRT77Db+hJZA08B1enYIeoLlI6g6CQp1gFl3GVnrOOX/gtLyv
 XjdEsKTWfTpLEJGWe3FwUg5FYaAEOZR9sqVdGAj4Qi0GB0NNguC0f0c2A+ZeNf30e22L5Q+Z8U1
 Jo2ieSGShk8BPbqRg3Jy/Cf3Z0a866ReRG2m9Ys77yeSCgicE=
X-Received: by 2002:a17:902:d551:b0:2c9:c517:d08b with SMTP id
 d9443c01a7336-2cc0b23ef33mr42159675ad.22.1783226263046; 
 Sat, 04 Jul 2026 21:37:43 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 18/46] target/xtensa: Use bp argument in
 xtensa_debug_check_breakpoint
Date: Sat,  4 Jul 2026 21:36:57 -0700
Message-ID: <20260705043725.1373137-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Use the ID of the breakpoint instead of a loop over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/dbg_helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 557a7852c8..b08bd03435 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -67,18 +67,11 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
 bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
     CPUXtensaState *env = cpu_env(cs);
-    unsigned int i;
 
     if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
         return false;
     }
-    for (i = 0; i < env->config->nibreak; ++i) {
-        if (env->sregs[IBREAKENABLE] & (1 << i) &&
-            env->sregs[IBREAKA + i] == env->pc) {
-            return true;
-        }
-    }
-    return false;
+    return (env->sregs[IBREAKENABLE] >> bp->id) & 1;
 }
 
 static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
-- 
2.43.0


