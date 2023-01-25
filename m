Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKbNI-0000f1-6o
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 03:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKbNF-0000eI-3P
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:43:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKbND-0007bn-I8
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:43:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so16244281wrb.11
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TrQUDShuSlYfHT4YnhyHx3S9WBzIjkLW6v+vF/2lyw=;
 b=8R8nHv1V9HmeyRvkLYOz7Z1J45Ddw22pteExu33h0koeI9zCq3p8DqaqXl2yapLjmg
 7pRUe0+YqAWByDSBGW0x9Nk72aKZwFvkoDQVNR8xidwYTifRFvwxpCqR4PLoZeSGPijg
 Z4NTSfl5urKLdMp/uVtGcruqM7jLVU/svfqezBd2vkiNeNg52l/LlbaEv17gJlJwNRVd
 tP6nZOQQWQqxS/bXx/g1XP9CQNC42DBS/pnXtpJP8QTFzoi+vscpQmLIoMAGzGHQiNhK
 U1P9Qd+bmtmQWxyvbxrb5Kn6SBA9YYxv5BanCPXNsxD+BD7ALSEG+PQbT/X5uxGH2Fca
 JbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TrQUDShuSlYfHT4YnhyHx3S9WBzIjkLW6v+vF/2lyw=;
 b=0PuexdX/XP5fbPAmSGIL/01d45VJJCl2Douu/s+qqggPt3A1HPvozJWfQ+63bmaLYe
 ujCztS/KaRdOeaNjYnsfrfZ+/IYW4ylf/D+Q8XSqpT3XFdNHt+HLVzCFmoKodM09g+wl
 lKX4VstKzq01/aul7BlKqJXnVl259GIk4FaivHCGPwJi5dmOxtyTNHxfgzPprXD8bANo
 RDmxmmnlFNCa9L1xW5hWv4M0MKbkcHXsSklX9okdpH2kgCubLjJC1prbHCL/EqXFmmau
 vyDfkItIYbxIbOyGeKIYc7Q06S7sUXfz18g0Kd8ZiV51UdbKOtrZweqLA8RUFzsDaXGb
 inYQ==
X-Gm-Message-State: AFqh2kpBdN1jWjeF8mNGp5D64HZKxxFzq6jNqgdwEUrwDcCldTfy5Ucc
 rCzfuYnollF2xtapzDngIH1cHw==
X-Google-Smtp-Source: AMrXdXud3UfGnFAFnf/YYiPjD1LXALQ4hLzEvqlmsCQaKviyKF25Mqoy8ZEt7oOHGIfvB5h1fQyNzQ==
X-Received: by 2002:a05:6000:1f81:b0:2bd:f444:9677 with SMTP id
 bw1-20020a0560001f8100b002bdf4449677mr28128780wrb.66.1674636194042; 
 Wed, 25 Jan 2023 00:43:14 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 x6-20020a5d4906000000b002bc6c180738sm4363839wrq.90.2023.01.25.00.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 00:43:13 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Wed, 25 Jan 2023 09:41:04 +0100
Message-Id: <20230125084107.1580972-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125084107.1580972-1-alexghiti@rivosinc.com>
References: <20230125084107.1580972-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Wed, 25 Jan 2023 08:43:17 -0000

This array is actually used as a boolean so swap its current char type
to a boolean and at the same time, change the type of validate_vm to
bool since it returns valid_vm_1_10_[32|64].

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0db2c233e5..6b157806a5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1117,16 +1117,16 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
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
@@ -1209,7 +1209,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static int validate_vm(CPURISCVState *env, target_ulong vm)
+static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
@@ -2648,7 +2648,8 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong vm, mask;
+    target_ulong mask;
+    bool vm;
 
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
-- 
2.37.2


