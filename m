Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYND9-0002lD-1u
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYND7-0002k4-Ue; Mon, 19 Apr 2021 02:16:42 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYND3-0004w7-Ji; Mon, 19 Apr 2021 02:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618812997; x=1650348997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Ok+tcjiS+FZn/FXu1Fpq+gKJ8dmBUMypcJItbhVtUk=;
 b=NLNyAug7M94rcuuwzCW0UHJ4EW8P2FQyiSLf9QtFXUmyJVemAdEimK4J
 0fMrC0zvT3YaVEYBWKk7alu2erHhKLyCdRKHR2hB5P8pp9nX2hBe3UHEL
 Pqj259SuuRz6nnbd6JtD9Cdk8JxHh92l/80PKOBsiWmyy/mvjY5r0PvOJ
 DVSlIlL1VtRx5FPGmkS29kqyWYS9XLGChJMzQPvlvHXpA6Fskj9dUoe4S
 Dk/JikDSHc+lCue1kX5a/NgBGnWCDLWxN84rd8gLQZDzN09+E4uOCvdAK
 3cJHLUuTzhVPOAq3hXEQYODFQpdMYrFB/grQ6nm2CrNLhgDlmPN1G4g43 A==;
IronPort-SDR: QLP9VRP+EUJVYoL8yDBNoSpJ0Jv7eK0EqTcHb9YCVTkZkn0pO7rO9YsWJduDWh1YnpxSm7Iu04
 zdSXB4TPifkhsAya1YGzPwBl3j+fEXNNy6gGFd4G8gY73fzwX3+8DboBWKt8r30ixx2bb4s+c6
 kb0KFPqHrlXqauK6ignIqbYBhl3Ud3HgX19OumIbX00UBjU0KfNrKJvQJXQlnh6OTJMmwJSWWQ
 kwKRnvTXCZVFxKoVQua5kOOz2oND1QtduyOeTO4RKemxTfGIcaos50UF45lrAM6vOqnuABKcJp
 vy8=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="165415572"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:16:35 +0800
IronPort-SDR: o+75Sb4aX9zmYb1LE9UNk1o/qhjIiWPykHxceq1QUJjhxurJLnR3Y4dneGV1IiZKvcCB/RdNn6
 qhY6fXSzhK4rfsBop0yW5eYOPJgdA/KH5LIzOi2OFq363KrKHUIM0gfnVEGhV0xHq+jA3JlvJ8
 2YpSeS9XazJMdfm3Nu+RyEPbg5CvKPyTE0hMKdEsZiv6weI7ra7JQloO4L5XBmjysTgy/rXM2k
 NuKoAJEztjdnuWcs5LmFRDIckzf5GGJITbA+d4mMsR/lH8iDW26KC57pkZDKGPOxdstjx4mHCI
 5D2YcW74KyCB2rOaS8Trd0tF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:57:19 -0700
IronPort-SDR: uDuAjhU7dhi+1howAo+qWqsFWH3sGn3HC9/bUmhr+8skZbCnBjVBlEZSIzsK5Kc5YRYzOUW7OY
 pXXk/d7kTlnBcbm+el9OmxHK7AnFMlyGNjeP0RBNuiz0j7w1FYDgE6+sACgMJD986odbM+faSP
 N2zgxvrSZBUahMCHpK/3QwO6AinHiEWEpxLkFl6675fo5vL0I+/jR8RtooKTWE2GSQHXFeXTl2
 tu0tZs4HwCBjyzFYHKkBNlKPvgKvndUuXVhCEwmzwZR+zsmmQ27moXPM2RWFQ3R4EB9+Z1j4rH
 duI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Apr 2021 23:16:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 1/8] target/riscv: Fix the PMP is locked check when using
 TOR
Date: Mon, 19 Apr 2021 16:16:25 +1000
Message-Id: <2831241458163f445a89bd59c59990247265b0c6.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
References: <cover.1618812899.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=736d87ece=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 19 Apr 2021 06:16:42 -0000

The RISC-V spec says:
    if PMP entry i is locked and pmpicfg.A is set to TOR, writes to
    pmpaddri-1 are ignored.

The current QEMU code ignores accesses to pmpaddri-1 and pmpcfgi-1 which
is incorrect.

Update the pmp_is_locked() function to not check the supporting fields
and instead enforce the lock functionality in the pmpaddr write operation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/pmp.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index cff020122a..a3b253bb15 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -59,16 +59,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
         return 0;
     }
 
-    /* In TOR mode, need to check the lock bit of the next pmp
-     * (if there is a next)
-     */
-    const uint8_t a_field =
-        pmp_get_a_field(env->pmp_state.pmp[pmp_index + 1].cfg_reg);
-    if ((env->pmp_state.pmp[pmp_index + 1u].cfg_reg & PMP_LOCK) &&
-         (PMP_AMATCH_TOR == a_field)) {
-        return 1;
-    }
-
     return 0;
 }
 
@@ -380,7 +370,23 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
 {
     trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
+
     if (addr_index < MAX_RISCV_PMPS) {
+        /*
+         * In TOR mode, need to check the lock bit of the next pmp
+         * (if there is a next).
+         */
+        if (addr_index + 1 < MAX_RISCV_PMPS) {
+            uint8_t pmp_cfg = env->pmp_state.pmp[addr_index + 1].cfg_reg;
+
+            if (pmp_cfg & PMP_LOCK &&
+                PMP_AMATCH_TOR == pmp_get_a_field(pmp_cfg)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "ignoring pmpaddr write - pmpcfg + 1 locked\n");
+                return;
+            }
+        }
+
         if (!pmp_is_locked(env, addr_index)) {
             env->pmp_state.pmp[addr_index].addr_reg = val;
             pmp_update_rule(env, addr_index);
-- 
2.31.1


