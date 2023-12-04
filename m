Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B0C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 15:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAApz-0004CJ-Il; Mon, 04 Dec 2023 10:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApp-00042J-0F
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApm-0005Ss-6W
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b479ec4a3so45629825e9.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Dec 2023 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701703568; x=1702308368; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwIlmu7y+8erPdoR/Kkd+7013w7hW587KwHOvMnbXVw=;
 b=MB/sBipiwkb23i9jGyz/FuzYzwo/tL9DvMx8tI32jrTb1hZbXDKQBKGT49F+B84bRw
 TNndYFi6jP1HjOHggS/8eEvinRohZZ8pWwjBjhrNT48HwqYl3rwuK0VliMh5+Sk+npK+
 R+W+nbbdF4QDFcXPPIuSLnYM407qA2HPrlGW7amMpwdTNOCuLbZGNZIyG8ijvHzTh4KE
 IygEVVjkHodQVjwZJF0YFoBsfsysLk8dq10Sn+0Uqmf2r7bl/41pit2mk/6IqJsIdy/o
 6zSTWiJRdsNx9Bg2wcBzhqFDTKPzu7ZlKJxK4E4LwmSlnrA8QeICKXDRYC/vkmvsHZs/
 bsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701703568; x=1702308368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwIlmu7y+8erPdoR/Kkd+7013w7hW587KwHOvMnbXVw=;
 b=p37mpI73djJVJ7LD/0+LD5rhbFuoXPk9PkmW0AMWWMc4hP29TLyERxllq9u/Iw+MO1
 xZomWlDTeTzVnQwfsYFy4nMeBcS2oSDjm0BlNF4ICMhG3m5ccKY6adkwuobrPoua0/I0
 2oQEJr1jUeBcNrA3s6Ev/P0FRLkMi1c9lukIE4DhCIxrWFbtmmdMqWXYBh8gGDETRJk+
 bHrQ5ZaJr4yKYen/D0WA55MrqfQcaFGP3zeGLJcJwn34XwBl3/gDFkKMhhSzHtgJGulq
 Qkts215aAtJAlMtZTddtxRtJ2/uQKvi1j0d5moE+i9UAiU5Le3YmFC5K0paOCEe5EBHg
 t89g==
X-Gm-Message-State: AOJu0YzBC1r2+ScXr2jvKpj40mJ0azL3X7lhxrZBDX13S25k+mR9mbi2
 vzDY5421XB9zC9ALJr/NyWYh8g==
X-Google-Smtp-Source: AGHT+IEO8jGWysVtJ00t3Be9HD2MxetjOg8h35eCcRxj0jBNyQExo3+7A8UzZGuCwcPrVVepITwy/A==
X-Received: by 2002:a05:600c:354f:b0:40b:3645:4671 with SMTP id
 i15-20020a05600c354f00b0040b36454671mr3949699wmq.10.1701703568398; 
 Mon, 04 Dec 2023 07:26:08 -0800 (PST)
Received: from m1x-phil.lan ([176.176.140.35])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b0040b3e79bad3sm15354298wmq.40.2023.12.04.07.26.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Dec 2023 07:26:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 2/4] target/riscv/kvm: fix shadowing in
 kvm_riscv_(get|put)_regs_csr
Date: Mon,  4 Dec 2023 16:25:22 +0100
Message-ID: <20231204152524.37803-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204152524.37803-1-philmd@linaro.org>
References: <20231204152524.37803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

KVM_RISCV_GET_CSR() and KVM_RISCV_SET_CSR() use an 'int ret' variable
that is used to do an early 'return' if ret > 0. Both are being called
in functions that are also declaring a 'ret' integer, initialized with
'0', and this integer is used as return of the function.

The result is that the compiler is less than pleased and is pointing
shadowing errors:

../target/riscv/kvm/kvm-cpu.c: In function 'kvm_riscv_get_regs_csr':
../target/riscv/kvm/kvm-cpu.c:90:13: error: declaration of 'ret' shadows a previous local [-Werror=shadow=compatible-local]
   90 |         int ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
      |             ^~~
../target/riscv/kvm/kvm-cpu.c:539:5: note: in expansion of macro 'KVM_RISCV_GET_CSR'
  539 |     KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
      |     ^~~~~~~~~~~~~~~~~
../target/riscv/kvm/kvm-cpu.c:536:9: note: shadowed declaration is here
  536 |     int ret = 0;
      |         ^~~

../target/riscv/kvm/kvm-cpu.c: In function 'kvm_riscv_put_regs_csr':
../target/riscv/kvm/kvm-cpu.c:98:13: error: declaration of 'ret' shadows a previous local [-Werror=shadow=compatible-local]
   98 |         int ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
      |             ^~~
../target/riscv/kvm/kvm-cpu.c:556:5: note: in expansion of macro 'KVM_RISCV_SET_CSR'
  556 |     KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
      |     ^~~~~~~~~~~~~~~~~
../target/riscv/kvm/kvm-cpu.c:553:9: note: shadowed declaration is here
  553 |     int ret = 0;
      |         ^~~

The macros are doing early returns for non-zero returns and the local
'ret' variable for both functions is used just to do 'return 0', so
remove them from kvm_riscv_get_regs_csr() and kvm_riscv_put_regs_csr()
and do a straight 'return 0' in the end.

For good measure let's also rename the 'ret' variables in
KVM_RISCV_GET_CSR() and KVM_RISCV_SET_CSR() to '_ret' to make them more
resilient to these kind of errors.

Fixes: 937f0b4512 ("target/riscv: Implement kvm_arch_get_registers")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20231123101338.1040134-1-dbarboza@ventanamicro.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/kvm/kvm-cpu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 78fa1fa162..45b6cf1cfa 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -87,17 +87,17 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
 
 #define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
     do { \
-        int ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
-        if (ret) { \
-            return ret; \
+        int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
+        if (_ret) { \
+            return _ret; \
         } \
     } while (0)
 
 #define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
     do { \
-        int ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
-        if (ret) { \
-            return ret; \
+        int _ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
+        if (_ret) { \
+            return _ret; \
         } \
     } while (0)
 
@@ -533,7 +533,6 @@ static int kvm_riscv_put_regs_core(CPUState *cs)
 
 static int kvm_riscv_get_regs_csr(CPUState *cs)
 {
-    int ret = 0;
     CPURISCVState *env = &RISCV_CPU(cs)->env;
 
     KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
@@ -545,12 +544,12 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
-    return ret;
+
+    return 0;
 }
 
 static int kvm_riscv_put_regs_csr(CPUState *cs)
 {
-    int ret = 0;
     CPURISCVState *env = &RISCV_CPU(cs)->env;
 
     KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
@@ -563,7 +562,7 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
     KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
 
-    return ret;
+    return 0;
 }
 
 static int kvm_riscv_get_regs_fp(CPUState *cs)
-- 
2.41.0


