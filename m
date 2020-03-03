Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmH-0005Oy-UL
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkg-00025i-OV
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkf-0004Pc-Jm
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:38 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45940)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkf-0004Ou-EN
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:37 -0500
Received: by mail-pl1-x634.google.com with SMTP id b22so492033pls.12
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=R6s1oATWB6yYMgO1fR6ahvnaLvJxcC15AdAU3isfkJU=;
 b=j8PBInUNjsEflSqowWu/mQPEMH6d3Mv4q85Vk/u8E4L2V/3d+adE+pLRQHM0pTL96U
 cy8DVoTZuw2ddg3eATwXRsp+pAxcat/Q1uKZthnsNRXMI0ntIcG9jzBWmGplnYHqLg8C
 f6DN9TA4H0ga1DVkz9IoCYy9SzFGZ0dYJo5AqhmUS1W4GKLJpO21wg3x5hZu3F4qA32X
 v2q2toHsC9dUAH8SHMONNZakMCbA8LdJCSqvWsg0FgdjYf1+1zuktu08eEzVacgqyg7c
 B/1zsDGhIgImOCVTCO2f3AsbRn933CiIHPxbvvtppTk+u+M/Qjc3cdUqkdQNFzWxdZpR
 kDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=R6s1oATWB6yYMgO1fR6ahvnaLvJxcC15AdAU3isfkJU=;
 b=BSZ4cYa/9b8pUhC/ansJNmJtg8kNtz9dN/IEPpYjzvzvkGxFVO/Cff8TB0zk42HTw7
 6bK3EaaNN0JKTdLUtkF2a+TLA78YOCeTScHTp3UGy483WHtNtZWrhAyVa8AAX4vdLl8t
 B0y40Piv2hETyg2gDUhFF1yX7M5BGgzfYGqJaVXBobRX7PRNqWMh1KoMAv1HO57ylyMa
 vQV7t9c5UqqkL+1SW8FXEpAvycDOeM4Yk62E8wBfZ2zeJO/SUantwyaSUv3ICNgQxIbn
 JsIbYWGWeTLXRoAYdhgUr5NtbbH6Prd5bImmr8nISegzue1jcYhapYLa7yMre9stMQLr
 3SQQ==
X-Gm-Message-State: ANhLgQ3krE35pYpbfnR4jSonGj1RJ3EuDlcjSGo4trKy5athPiskCUoS
 MkOPVz42oig3U0DW+cF+qg9UNuppo4XYlw==
X-Google-Smtp-Source: ADFU+vvSj0u+mvknBgNaiaw+78kPdvNgz5Ht1gusO2FBuEYRE7JeZkaqjQqVJVAzfEdR4lFO6beMZA==
X-Received: by 2002:a17:90a:3266:: with SMTP id
 k93mr1267410pjb.23.1583196576043; 
 Mon, 02 Mar 2020 16:49:36 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id r13sm22296228pgf.1.2020.03.02.16.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:35 -0800 (PST)
Subject: [PULL 23/38] target/riscv: Add hfence instructions
Date: Mon,  2 Mar 2020 16:48:33 -0800
Message-Id: <20200303004848.136788-24-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::634
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 00:49:40 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/insn32.decode                    | 23 ++++++-----
 .../riscv/insn_trans/trans_privileged.inc.c   | 40 +++++++++++++++++++
 2 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 77f794ed70..cfd9ca6d2b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -63,20 +63,25 @@
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 
+@hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+@hfence_bvma ....... ..... .....   ... ..... ....... %rs2 %rs1
+
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
 
 # *** Privileged Instructions ***
-ecall      000000000000     00000 000 00000 1110011
-ebreak     000000000001     00000 000 00000 1110011
-uret       0000000    00010 00000 000 00000 1110011
-sret       0001000    00010 00000 000 00000 1110011
-hret       0010000    00010 00000 000 00000 1110011
-mret       0011000    00010 00000 000 00000 1110011
-wfi        0001000    00101 00000 000 00000 1110011
-sfence_vma 0001001    ..... ..... 000 00000 1110011 @sfence_vma
-sfence_vm  0001000    00100 ..... 000 00000 1110011 @sfence_vm
+ecall       000000000000     00000 000 00000 1110011
+ebreak      000000000001     00000 000 00000 1110011
+uret        0000000    00010 00000 000 00000 1110011
+sret        0001000    00010 00000 000 00000 1110011
+hret        0010000    00010 00000 000 00000 1110011
+mret        0011000    00010 00000 000 00000 1110011
+wfi         0001000    00101 00000 000 00000 1110011
+hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
+hfence_bvma 0010001    ..... ..... 000 00000 1110011 @hfence_bvma
+sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
+sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index c5e4b3e49a..b9b5a89b52 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -108,3 +108,43 @@ static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
 #endif
     return false;
 }
+
+static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
+
+static bool trans_hfence_bvma(DisasContext *ctx, arg_sfence_vma *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0 &&
+        has_ext(ctx, RVH)) {
+        /* Hpervisor extensions exist */
+        /*
+         * if (env->priv == PRV_M ||
+         *   (env->priv == PRV_S &&
+         *    !riscv_cpu_virt_enabled(env) &&
+         *    get_field(ctx->mstatus_fs, MSTATUS_TVM))) {
+         */
+            gen_helper_tlb_flush(cpu_env);
+            return true;
+        /* } */
+    }
+#endif
+    return false;
+}
-- 
2.25.0.265.gbab2e86ba0-goog


