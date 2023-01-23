Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJslk-00017m-7m
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 04:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJslh-00017K-7h
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 04:05:34 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJsld-0003q3-Iq
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 04:05:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id b7so10102615wrt.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 01:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8spMprAsa6MCDDlueScecGJZmjzYC45CUjlzeSiGbvw=;
 b=Me8RZhnnAW/q1wRaMAqB2blaKMubDBwL49QrlR/hfuFrOGw/KnuYha9Y2E1QuMW8eY
 kK9+G9P2doFJst10IHfE/jJ9GRASt29FgAy+A7bN04TKHxLgOKV+P3nXP92vPpwNP8gp
 9l9QtfWQBgwI5MO7ncJYhAdc0K2f1r6o2GXDYoTw64QEPBmf0xogUQ5rvcUZHL1aLR3p
 jxVXGuNO9/2FtXT88F7s34t1RKkFTxaMsAvdnFlKZAsKEZ1yxaPIoAkrgq4Ya7vwlyWU
 4lPxpB7RWD4PtGHDqb6xbXAwPwnWakxv6sQ+9ZOlAmWHztjHXu8/PWIpgMuaQsB3clpv
 VIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8spMprAsa6MCDDlueScecGJZmjzYC45CUjlzeSiGbvw=;
 b=SJjgFxuSEDryzLgxxGyMlsxeT7RuMiAEQ7cKEasus7Z5qpNSkwy+uojeyUrY2g6OMO
 p8NmX5PDrUm4Xdl4nQU4TML1ZDTzG41cW7nhzm/Y2fxIyJ6sk91N6+fX3mcC5qWcq+2d
 OQPZeQbscETjArCuefQMAC0ZAU+dnNCcDMmYPNORIGeuN1TsWojdKCWkIpufLmcYZ3f0
 +HxEP0q+8lKA68rXrC3zbITgvMqzr9OQeZXpb5HSbREC/K6DLnJP9m1okYk31F9aZa4+
 kUa+8syd7MGoSIMwZgzMgv+rm8CKdgN5sxk3U/HGF22PkXinr+9PT69/sR3uskbpUNqP
 +KnQ==
X-Gm-Message-State: AFqh2koBuMXgxD/v7zOXJytqf2bPcVEi90Y7IQ/RAnk/4XDcVbJpdQwh
 xEL++xSrJ7eh5RchEoyLwj8WEg==
X-Google-Smtp-Source: AMrXdXvtHyd1eUX/ehqKeFeoqQUSVyfsytqHWT11mpw4NqyEkE4/4E925rGFx3FrDKtqRnz2queV5w==
X-Received: by 2002:adf:f501:0:b0:2ba:dce5:ee28 with SMTP id
 q1-20020adff501000000b002badce5ee28mr20090467wro.18.1674464728211; 
 Mon, 23 Jan 2023 01:05:28 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe10d000000b002b6bcc0b64dsm29827405wrz.4.2023.01.23.01.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 01:05:27 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Mon, 23 Jan 2023 10:03:21 +0100
Message-Id: <20230123090324.732681-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123090324.732681-1-alexghiti@rivosinc.com>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 09:05:34 -0000

This array is actually used as a boolean so swap its current char type
to a boolean and at the same time, change the type of validate_vm to
bool since it returns valid_vm_1_10_[32|64].

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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


