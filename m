Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbtG-0008EQ-4U
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbt0-0007zk-UM
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsz-0007GH-NC
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsz-0007Fi-Hl
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id q12so190182pff.9
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=MhpoxMmHxg0lKHxp/4pAOLqG726Jjd89bWqoZDT3AGo=;
 b=qjHXaIOEviJmn08hR5e/U66tZ1xntVGvg4GXdkrANI/m+uZJ87F3CTOG7DQVAWvB5h
 4k3pXJrtIklec9tR5d0XFIXGJ+zCAvc5vhtVWP+5jmfw1iTKKDx1jCNZeu4SyCVdzU8F
 uswViTttTGpHVp7IyIysCmR7bLG+QjPKbpCuohNTZpdDr6DLdZDAGtLyU8n7g+TpDP7g
 3SyA/+FnASK4GWN9po6kCCwj3hSiA1kO17gK07R8IZtsbPkF5KTxxa9yh8obfeYJXwgD
 QHWAtfoBmtxiR/5pdHdDfVeh+o5sCWjPiVe0AfD35NK9XoZwpRycBRNflMxqEsT3ELZ1
 gxLw==
X-Gm-Message-State: APjAAAV0b5a57MCDum/hvUaeDnFQdQ/sZ31vrtxJo684Uf7Zuzg9VQsL
 VN3OBZfxZIcfnC5A1FGhDKWh59Jun20=
X-Google-Smtp-Source: APXvYqwPQ1oQ1Qz9FhVPFZZl2I+e0I+cO0pEPLeCvedK2TKe3T3Dgg2Ck8T9+R5AhfdWSSPauB786A==
X-Received: by 2002:a63:6947:: with SMTP id e68mr4588266pgc.60.1568820531931; 
 Wed, 18 Sep 2019 08:28:51 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 5sm4269904pgk.75.2019.09.18.08.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:51 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:40 -0700
Message-Id: <20190918145640.17349-49-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 48/48] gdbstub: riscv: fix the fflags registers
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:59 -0000

From: KONRAD Frederic <frederic.konrad@adacore.com>

While debugging an application with GDB the following might happen:

(gdb) return
Make xxx return now? (y or n) y
Could not fetch register "fflags"; remote failure reply 'E14'

This is because riscv_gdb_get_fpu calls riscv_csrrw_debug with a wrong csr
number (8). It should use the csr_register_map in order to reach the
riscv_cpu_get_fflags callback.

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/gdbstub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 27be93279b..ded140e8d8 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -313,7 +313,8 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
+        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], &val,
+                                   0, 0);
         if (result == 0) {
             return gdb_get_regl(mem_buf, val);
         }
@@ -335,7 +336,8 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
          * register 33, so we recalculate the map index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
+        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], NULL,
+                                   val, -1);
         if (result == 0) {
             return sizeof(target_ulong);
         }
-- 
2.21.0


