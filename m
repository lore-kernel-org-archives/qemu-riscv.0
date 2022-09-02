Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oU9pJ-0000zu-NC
	for mharc-qemu-riscv@gnu.org; Fri, 02 Sep 2022 12:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aurelien@aurel32.net>)
 id 1oU9pD-0000y4-DK; Fri, 02 Sep 2022 12:47:24 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:43032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aurelien@aurel32.net>)
 id 1oU9pA-0002bg-Bf; Fri, 02 Sep 2022 12:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
 Content-Description:In-Reply-To:References:X-Debbugs-Cc;
 bh=ryqa+uOQmcTDwVTPIv+WfiIxcNBcO0snYuoXuJBOnw4=; b=w1zPDbEldWzJItdPMhAQdPK1Xh
 mZnfCeExb+hoI4VuVIPsIViqVjZr0jcMpkWTbUAtcETU0jJkZeL67Nhk5Ko70b/uZ7q6yK3BwCH06
 r0mw0NA8rYmkEPUGLEFLgJpOtl+o6+f847CAGDlaDPr3Y71N2D6IQGwVEo2DMkbJWRgGNZlrxCxdz
 I4qXnh+k5fjH+7xGDbSrzYUpF8mfn9TVCciKpj8JDybEm08xMYXmv+NcgbRDrpdPEAC1SKuh5hgxD
 fHR3a+sFcck/hsN+hrVzPa2t2QKbML1eePNP8YwuzQh3R0j12ZvPbwIt14rHkgacz8oBZvnsVAdZE
 RdfwHxMg==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1oU9og-004uKZ-TZ; Fri, 02 Sep 2022 18:46:50 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
 (envelope-from <aurelien@aurel32.net>) id 1oU9og-00HIPQ-1J;
 Fri, 02 Sep 2022 18:46:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv: Implement PMU CSR predicate function for U-mode
Date: Fri,  2 Sep 2022 18:46:49 +0200
Message-Id: <20220902164649.4122331-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2001:bc8:30d7:100::1;
 envelope-from=aurelien@aurel32.net; helo=hall.aurel32.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 02 Sep 2022 16:47:26 -0000

Recently the Linux kernel started to use a non default value, for
the scounteren CSR, which is ignored by QEMU. Fix that by implementing
the PMU CSR predicate function for U-mode.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 target/riscv/csr.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 235f2a011e..8aba1b35d9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -137,6 +137,55 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 break;
             }
         }
+    } else if (env->priv == PRV_U) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->scounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->scounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->scounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->scounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (rv32) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->scounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->scounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->scounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->scounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-- 
2.35.1


