Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJFK-0001lC-2D
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJFH-0001go-MK; Fri, 02 Apr 2021 08:49:51 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJFF-000523-UW; Fri, 02 Apr 2021 08:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367805; x=1648903805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLRkE88V0qiEHhrz5ZgOJJoTbr4qtEL+x80XQoS99gs=;
 b=lG/HzSA/leWK9Jr9lSwh9kjZAiaEKAjep9rD9PQy3KryiExJXQyvtJFn
 qRnrl/o27yXqp+AbI/uabRhT2kKj+07bdJHZj4LdKaSpF/YZbDG7iFvhx
 lRlxZIU/c6L7SyCe78QDBxdoYjHF7XHdFyvtM9QjJzxBRle6am7EX6gDI
 ZMr7qgWC7hEHTWiuelPu9D2PkSfrRhjMQG/t79yRqMrpoY8JS97WLi2wn
 W5vGwX36qwmaKk8kdCk/JSG2m/ESTyUA6/bJaM/BSIbnHIZswve7s4iAf
 6ObMGaxXdmRybLNpidRg0We/DEX+W/w42kQI4SfGBM2K0WYCNMZCHa+ZF g==;
IronPort-SDR: QaJxch5x/T3zfbL+OntfD9gY4saKvKxltwjFPEeaWlXcLEHmVkq9GPUbiI7u9Dt7jVahDU+L1A
 FBd3AbrU73nrpCltK/VOvGF07bsFysjebNB5UI+snpQX9URZEvRb7JnmouS6xiliOou8s/L/kk
 TGvK9qpH+KPbM7fKPcoC30AfxwmfKy1BzGHMxkrXpqZ6LKtSploKqL4Y06uK5YZF7e1DfhVxwO
 Nbp1qjBfIDbtkd/mmptba36vf+S1d/GSx7Tm1E0XG2+pJ+CQ+VsGz3Ycvr6dEJSb9eGg8qlTvv
 65s=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="268041744"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:49:36 +0800
IronPort-SDR: q6FTSXdWoSVusW9++OM+BzsBN9DdWnid8Z0XWvYj2c9qsGnAPWWM+Fc6wfGPVmutDx25BjRm9i
 u+BXPdT2crELGIY0d3iZYUX6sl77HHbRNt8WgwPSKN3ynAHeINkjZoDUPU4323pWIxfEujcmdH
 /4ipL4fNZBMtjE/DoRpatcvQIgD+e40DIQjr4oSkI5+6rW5vjC/i04R8lUGfD+bhmkoHA6w+FM
 lhrQ/iT10X6upsUdGzkTmZox7Y4RQGo32aCQ0vYeHH1kmXyV1fC4zwH1rNUWGQQbpvx/D37mIb
 TtWRLrHqRcpMT3p0rYJcXS/2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:31:02 -0700
IronPort-SDR: apMdOsI0RZSZ7UC1BXFPGjoHED4l3/b0KfdZMFex5QSj5n8Iq9S7oIDBap0JWapWwJerCpOzRh
 gZ7mYbAMW7PFvwbGr5vNdXdjtboKBlTgt5dftvPeiTeYGTPnwo+GrOYU7ymWeJkoxbK0nDJKwe
 o4mCgKSo+yIQsdcDvrvIDXkLW0MT42tw3LfoPwmqgEXpgkHBbVoq72ne8jOuApwTOHNDm4/VfA
 lKzfMsWQkWvRKvJ7S1ssqfT+eRjA1w5yXKBmzKPS2aW89oln1R2+WyPqrJ2w3B36oP5PzzzRTH
 cPw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:49:20 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 1/8] target/riscv: Fix the PMP is locked check when using
 TOR
Date: Fri,  2 Apr 2021 08:47:25 -0400
Message-Id: <4123032daa32329ded1b4c7690dd0886d5ffe135.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Apr 2021 12:49:52 -0000

The RISC-V spec says:
    if PMP entry i is locked and pmpicfg.A is set to TOR, writes to
    pmpaddri-1 are ignored.

The current QEMU code ignores accesses to pmpaddri-1 and pmpcfgi-1 which
is incorrect.

Update the pmp_is_locked() function to not check the suppording fields
and instaed enforce the lock functionality in the pmpaddr write operation.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index cff020122a..6141d0f8f9 100644
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
 
@@ -380,7 +370,22 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
 {
     trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
+
     if (addr_index < MAX_RISCV_PMPS) {
+        /* In TOR mode, need to check the lock bit of the next pmp
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
2.31.0


