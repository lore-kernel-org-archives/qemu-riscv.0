Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E00C021B8
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:03:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmxOh-0000Jb-Td; Tue, 25 Feb 2025 11:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tmxN1-0007Gp-J2
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 11:01:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tmxMt-0001wg-VZ
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 11:01:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-439946a49e1so37023575e9.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2025 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740499257; x=1741104057;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dajlQOoRvoQV8eXeQsdm+0Ep1VZ3BLLQlzfHq44Vuqc=;
 b=QpOLiPYeMG2eJ7ud/9ztyh6+BYNj2vj4y+712QrrvikdbU8JSaiLEWb+L0EJHM4pzS
 AAMrV6h55jQuufZ+/C0tIzwQ5REDyPuXDma+oafts9J0gaviTkWd+mj/frnKqz0NwSU4
 KG+FUqqOOwTiVpGv1vcaLFganRgBpHgMjDZHYz9Zv3/VMxJa8V9RB76nTpRr5nFHgJzy
 dtDN024UjJ9Lcm5tv3S5fEHa59rhdc5R/RA1BitDroCHzt2cct1FSrIloa+m+pIP83xR
 3I2fBJPb3g1GFoBt4NSjI9q28LguTbiAhqvm5fKymQHJikUwvqHrxz1vrwr8v4IvS8KV
 h3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740499257; x=1741104057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dajlQOoRvoQV8eXeQsdm+0Ep1VZ3BLLQlzfHq44Vuqc=;
 b=jo6If0YkiC3W9om87PR4XHWv0yBeZrqKFp0XpgvjGEFoi/v4m2Qrz/V+N2ye5VrYqV
 IIAPSUWwibX4ORJqVemEYKfmF727J0kUA0P00YLw/GtLnhI5tbquhssPlpa1p8xuYfoO
 DIsXEI2bElMYgrlxZlWDbV7hLOfqmKlN4Y/RvlDWqKwQoYbVrb/3rJBwXY5+uZyFsi5g
 KqtaLA43xwtttT5ZuI776X/2A2DSnGJ0a2rDwwjpnLL98Qe+PJOtvKL/AwSDZIgZykL/
 jFYa+pBLwBPjbeIwEP6t1G8L2KezZKbHc5TijJ0lv7Jl37LdeDBz8pnufIlUAGwuS5mW
 08xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFowC4zzQdcxXdvx+JHjXKeiUg59ILd2yESrA2BCqGS5M5csiQPx1fUzJlqr3EjrOt1Eb6879jOV+t@nongnu.org
X-Gm-Message-State: AOJu0YxuADCPBvZQt04BaCra0zIfammope+Og4vo7qwIMA5C3AD5V/K+
 WlFTXKgrqBko5bZsBxwkEAqxTW32VnlmR42+R23AtKmlIMR00woZy+3/EnVDt0o=
X-Gm-Gg: ASbGncsIVMkNPAbciZM+dADr4ArR01jW6TZVlMneUlUOZiVXWQwtA5CHxy7AEM4cInl
 mgy+QcFgUQqC5q47dWPOnyOhD2pX29MhFHsl2DOm3jDQz6/dEHQ/AAE6C0JRXRBifQQhd91E2Gg
 xT0oOoOWMeFa+17ZnsyXHLjMKTkser7JbV8TJfqJIEWxni/dmBFjs1sSzEqHceZy7YwAIiKLL3p
 nuYhsdNdQIH9cWGqUevqe5KUib0Of3bKCUEoHa0vDQ+Qy+jV7Oa7YZthYlFnTXyGphFUAOPms1n
 SDBk04lzfUdjK6oRjo5EUzY1FD+NSjcZ0Dr842CZtcgMncA3IIauqqMhn+z7C6P9yn1x35mBtQ=
 =
X-Google-Smtp-Source: AGHT+IFUr/WlrbZLLx9gxZm7xca9g+gDD17sYS3lfk02dfE1n8u+q6vptoQT3QiGSyBQtVFlTy2DKQ==
X-Received: by 2002:a05:600c:190d:b0:439:685e:d4c8 with SMTP id
 5b1f17b1804b1-43ab8fe9461mr730105e9.15.1740499256670; 
 Tue, 25 Feb 2025 08:00:56 -0800 (PST)
Received: from llx1.cad.pilog.net (lfbn-mar-1-50-94.w86-229.abo.wanadoo.fr.
 [86.229.28.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab1546df4sm30530755e9.17.2025.02.25.08.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 08:00:56 -0800 (PST)
From: =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
Subject: [PATCH 2/5] target/riscv: pmp: move Smepmp operation conversion into
 a function
Date: Tue, 25 Feb 2025 17:00:49 +0100
Message-ID: <20250225160052.39564-3-loic@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250225160052.39564-1-loic@rivosinc.com>
References: <20250225160052.39564-1-loic@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=loic@rivosinc.com; helo=mail-wm1-x332.google.com
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

Signed-off-by: Loïc Lefort <loic@rivosinc.com>
---
 target/riscv/pmp.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ddb7e0d23c..b7f1430ff8 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -31,6 +31,15 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
                           uint8_t val);
 static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
 
+/*
+ * Convert the PMP permissions to match the truth table in the Smepmp spec.
+ */
+static inline uint8_t pmp_get_smepmp_operation(uint8_t cfg)
+{
+    return ((cfg & PMP_LOCK) >> 4) | ((cfg & PMP_READ) << 2) |
+           (cfg & PMP_WRITE) | ((cfg & PMP_EXEC) >> 2);
+}
+
 /*
  * Accessor method to extract address matching type 'a field' from cfg reg
  */
@@ -357,16 +366,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         const uint8_t a_field =
             pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
 
-        /*
-         * Convert the PMP permissions to match the truth table in the
-         * Smepmp spec.
-         */
-        const uint8_t smepmp_operation =
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
-            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
-
         if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
             /*
              * If the PMP entry is not off and the address is in range,
@@ -385,6 +384,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
                 /*
                  * If mseccfg.MML Bit set, do the enhanced pmp priv check
                  */
+                const uint8_t smepmp_operation =
+                    pmp_get_smepmp_operation(env->pmp_state.pmp[i].cfg_reg);
+
                 if (mode == PRV_M) {
                     switch (smepmp_operation) {
                     case 0:
-- 
2.47.2


