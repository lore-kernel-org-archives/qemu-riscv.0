Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMqsy-0003To-V4
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 08:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqst-0003TQ-Cz
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:41:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqsq-000690-Dd
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:41:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso4462082wmp.3
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ku5chqQZqihMdsh/PiLWwwVUxYQvo63LZ6tE21x8W2E=;
 b=AwzYVplaT0WA/lNvdWJFGBJ/s1hcEeT1p+2quzbqk5/KvUx9MvaXHt1rP8Pbe9Yzq2
 NAF4aSKEY2h69EzcpeSOWNpQo2SczlktgZq3Yx6sKC3u2nVmjl2We0pW1i72JI4HdRmz
 w42U1tOcmO/vo+Jw6mVBgCZHF/blne/bV9obo4X4J//yGzFbdFK32fuvRhGguIHib800
 qb0sIcWduPcNWWaov8udkFvK9jU4lG42iHw6yZSXUDPRlAgVnkG9nv8z/TJ664Kt5uTX
 0sQEDLnMG2RKJE8RYkjuhie/dUSXxbLy1k3pgC8VTQW89vc8+hVaqRKrrLkXlzfOJ8ZK
 Lm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ku5chqQZqihMdsh/PiLWwwVUxYQvo63LZ6tE21x8W2E=;
 b=igYJ1A3YKP/q3la5A3oIwDHI/2CCV3RozKwCpVnuXUFvatuT4nG5yDh1qTdBPdWU+z
 kswocF1LrFx2/c39gE5KfNoMzOVCVPU5BOfMPrhPxNrMW4CvyI3frgWxafapEjCL5Cw7
 1DkUrXw3atUZGsGHp/rJzczbL7+PiLW5z6G3/b2wdIPCAfuaF2wOtO8cKolvoq7aefUo
 t7t76tTEtyosxMUqoAEt9b7Lf69AsY1296KP4/edTUoLLPAiko5JcPCD2URT82rUm8nG
 76NKPOBFT9xBc422oKiuBVzc6NtMKDVrjgmOBfPHLTFgNSMPcBeIPdV8lb9FilTITRrv
 8Fxw==
X-Gm-Message-State: AO0yUKWp2yiTxp33mdB5ne1OuKCNqQWe3W9iZttscUaKYlgHAqMVw2vK
 b95mPiEg1W7TijqRJW/56doAxQ==
X-Google-Smtp-Source: AK7set+xnFsQeypNN5GmlkA9HSsjJNUzwVGy636BPp46R9gstn14tGJE7W/jW4k+1SChO5ZcPiB/8A==
X-Received: by 2002:a05:600c:4e89:b0:3dc:198c:dde with SMTP id
 f9-20020a05600c4e8900b003dc198c0ddemr24378639wmq.41.1675172470734; 
 Tue, 31 Jan 2023 05:41:10 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b003dc530186e1sm9930680wmo.45.2023.01.31.05.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:41:10 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v9 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Tue, 31 Jan 2023 14:39:03 +0100
Message-Id: <20230131133906.1956228-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131133906.1956228-1-alexghiti@rivosinc.com>
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 13:41:18 -0000

This array is actually used as a boolean so swap its current char type
to a boolean and at the same time, change the type of validate_vm to
bool since it returns valid_vm_1_10_[32|64].

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
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


