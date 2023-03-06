Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwl-0006mW-St
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwj-0006kK-M6
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:41 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwg-0006rZ-FC
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:40 -0500
Received: by mail-pl1-x633.google.com with SMTP id y11so12116552plg.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140277;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e32/f4uJI8Xsh47JTD6oMpzp6kkZE6i5wkSH5g4r7LA=;
 b=WVvaF9wIUb+DPX3LzZ15A4/uvKgYZa+hVFueCMCJzGjtb006e/yc8qV6iNxDEWDI7f
 UPDIxtVzd9mdi6w3vQHnKdY3UbWkpMo4t+npQfFxXpZKmUFi9iy2780D62/J4vel+m89
 v6X0d11Dk3iJdUhODNoCT1if4RqmTRbRcRLLNTftONb/CHkqOMVYMNmtnhzuvqSmoYVt
 M3fdab4Kpy37qELbMEpWAmHLUtzU0QMWDkbo5yT8L044vuHBkbPutUYTBzzOO82JzdKx
 jVA6EedqAXwKMAHj92udrbrBcjuxKs2K4hwPTLvGablqjm0ubDca7ocjG4qlavmRw7++
 1Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140277;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e32/f4uJI8Xsh47JTD6oMpzp6kkZE6i5wkSH5g4r7LA=;
 b=Py4M3/sALNFTdP9o6qD43cm61+/pA8DSWt4HfXXqAmLT78VZfYkxl/7gHH+Edy9Cy6
 AoLg2zNRJVV15VxpQDwd+Uo6H9PYdOF33gidqoPv2/AkP8VtXQexVC6gDYsxD2OUxeK9
 Zjk9FQ4ImcdXr9xlfzA54SlqobEtz6tQSuNuvTuaZM3OZvwGMue/MrDL/zq0caBQBzNd
 3NJobsFRdKc+KVxzbFYmkqbDel4II2a7JE/UJq6/nM73d2wZr9XpJFZk1C4VQjZ1+fX/
 KP0NOkMmWFnzs3TFfvwAbLU7G86MVtZkGovPAZYabesJZ5LKDsreBxgQD0fTDdcVGs+p
 RHuw==
X-Gm-Message-State: AO0yUKXFTKbRF7LFT53+lX3AiB39b5mtw0HxSW071DSxzYW2seU22nsv
 tsh8ZTr+oq9NwPGlZZYDtEeR6DO/AAsQrFQFnH0=
X-Google-Smtp-Source: AK7set9AQHQ0I8eOaCqDopwHHneGgd8dDfmvrfmwLJRs3y8JVG4EGKrt5rZDNiYF28X2Bht9obN3Dw==
X-Received: by 2002:a17:903:1103:b0:19e:8075:5545 with SMTP id
 n3-20020a170903110300b0019e80755545mr15307337plh.54.1678140276878; 
 Mon, 06 Mar 2023 14:04:36 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170903230d00b0019c13d032d8sm7160400plh.253.2023.03.06.14.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:36 -0800 (PST)
Subject: [PULL 11/22] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Mon,  6 Mar 2023 14:02:48 -0800
Message-Id: <20230306220259.7748-12-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:41 -0000

From: Alexandre Ghiti <alexghiti@rivosinc.com>

This array is actually used as a boolean so swap its current char type
to a boolean and at the same time, change the type of validate_vm to
bool since it returns valid_vm_1_10_[32|64].

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-ID: <20230303131252.892893-3-alexghiti@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3106f96212..d93d481bd6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1141,16 +1141,16 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-static const char valid_vm_1_10_32[16] = {
-    [VM_1_10_MBARE] = 1,
-    [VM_1_10_SV32] = 1
+static const bool valid_vm_1_10_32[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV32] = true
 };
 
-static const char valid_vm_1_10_64[16] = {
-    [VM_1_10_MBARE] = 1,
-    [VM_1_10_SV39] = 1,
-    [VM_1_10_SV48] = 1,
-    [VM_1_10_SV57] = 1
+static const bool valid_vm_1_10_64[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV39] = true,
+    [VM_1_10_SV48] = true,
+    [VM_1_10_SV57] = true
 };
 
 /* Machine Information Registers */
@@ -1230,7 +1230,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static int validate_vm(CPURISCVState *env, target_ulong vm)
+static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
@@ -2669,7 +2669,8 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong vm, mask;
+    target_ulong mask;
+    bool vm;
 
     if (!riscv_cpu_cfg(env)->mmu) {
         return RISCV_EXCP_NONE;
-- 
2.39.2


