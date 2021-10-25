Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65C-0002ak-FS
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf659-0002PG-UH; Mon, 25 Oct 2021 15:56:31 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf656-0005Su-Ot; Mon, 25 Oct 2021 15:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191788; x=1666727788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6k5UcEhX2Sg2NVSbB+P7pXyyTAwvG5hWjbn85+xzSiM=;
 b=DLuL66YyENjX+t04ZL0dMrfhBheQ9ly8DWT0eaet8ouoacseGKIl799m
 +CZOxktQbRMvd2P1YI11JEoLjStVqoDwAcwutstWk9Avir1awhMC8Kf5Q
 17ZiYjpQu1DxdUV+fd/brIhhuMvJ72j/pGlhhpzRhqyGX/N6nlJVemLaz
 YjXrXpGB5aafAAVlzld6pvIxl8uwvFlEki+bSWlYYxrEF74OvjZV15uTc
 SASgdxdiNNg8aHdBq259L36d3ohGZ8w6RfqS/n6jxECpJNYLlzTWxZqtv
 qOUB8TCj8v8CyrNEuj+5okM8mjCEUgr6Q+Z1HBgFUl16SQz1llJMvxJ+H g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683001"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:23 +0800
IronPort-SDR: hMHxFY5dWTgbXuG6kl8SjjTQjIudO5iIAS8fR/4w9yGZVHp+L2xeqrwx8nmNiiwEvMuPR2xmqU
 ClhhjgUUI3ihe7OTWrDSxk220iPyuDgL6QgW312SNoEo9ZaZQy2SOT/XwrkXhG3Cfobgjacmi9
 czYpKIt1zxKTq1J8MBi4mzZD+ANKa5Xdk1uFqFS2niNG5EaH26qGAE9tge/4rFxlHjIG8+SoGm
 Ma/tgrOqIgwnutrHDhgekcUSIimg7XLz3AWzc2JFDSYXim2Q5PtQFRpSA41S73Php8rkx5Hd2d
 jQAKTfT7LJ6BYXX/5+Cg+EEf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:54 -0700
IronPort-SDR: jnkxO3DWfl1uvEGpUejGvxYgnfYWgVlFWSnUKl5062UhsvaDrHi+e+yEl6p39FwrXJGgVihw9F
 2pqCya/i1gHVuzJ527PIetTD2Y2TcHkqMaE98s+0ioXEUHftWZ04Jn7F0LtQ/SYzFOEel1A9sw
 mHssjxy5lsmMpwLUS54Q/4lfIsawOALhNN6MnjTpHd+fA5DC5HCsujod5oWhkh4nztCrbICxDG
 VJ+T3r4c/t9IT4ibv3c86mYKtiz3XEwq1gauQ+5CxHoq0relclUTe86leReVme3x0NOLOfBbwX
 oCY=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 02/10] target/riscv: Implement PMU CSR predicate function
 for
Date: Mon, 25 Oct 2021 12:55:53 -0700
Message-Id: <20211025195601.245631-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195601.245631-1-atish.patra@wdc.com>
References: <20211025195601.245631-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 25 Oct 2021 19:56:32 -0000

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1ec776013435..de484c74d3b4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -62,12 +62,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.31.1


