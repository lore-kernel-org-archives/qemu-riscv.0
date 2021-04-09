Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUq9L-0000dy-S2
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9E-0000c9-PN; Fri, 09 Apr 2021 08:22:05 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:37640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9C-0000i2-1i; Fri, 09 Apr 2021 08:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970921; x=1649506921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0sfoUXLHQc/pUjewitz2fdpjNYtkwDNkeFqT57A9v0=;
 b=naJe8bwPP7fEDgMcw0q7OwucoSi26q2puqItm1hOVeHFG3jtjvKgHbzY
 tU0pAAn6aJRU+7KrYC4aitltq3GJMQuztlN90h40F76wFw1cIjIcQ11/s
 8lku8WXrAQuEPG6r+xFXWRIqhOz1OsCcvqDh4bU04aDjcgsrtwHercr+I
 WWULIMMnJYHM4YNEsK2G/Rs3bQQX7e/eH5D25yoLKhRuWUMy4Bxb6Pwrk
 p4uuH0fcApLhOVRCYrHF1llvTj/XxIcDqzHUAXFDctK21zhh8+MCJaLGZ
 2HFSqJgC2ohMBckak5IPZSoAgo2ArXczRCwI4Utaq9KXx91hRzFGAjs3t g==;
IronPort-SDR: ObJHlJLPbgnV8akhjI4cUVKhd4aQpRwSPRZunNDBv3aZ+cHtUOYpsqss+S1Gm5tCFvme7CEZBW
 /IxP1HrTLVazzGZPs/XDCVNzut2L4fcPhWZ4sDK0RlOfefueWKQIXVxPJdrm0/yO+OKnxuDCai
 rxP7vH2EaEvWVjMMRkglK/m4F0DtPqQghjBbusA7/DO7eS6iYcjkX0MvHG2ahZOjaxzmaLbpaU
 S39j3MXY/V4qX1oS3ZiddmR79z2FGbVYARo0Tjx2eekP++jNebG1sV+dIyJS2Fv8zPYUsvDpuF
 hQs=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="164302800"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:21:58 +0800
IronPort-SDR: tNeagxNo/hl2h+/T1sGssYZWuGphPPMVX0UtIZeEB0S8fS+O0+gyIWzNmQiwssVbvwMASTBUFW
 +WDqeiOJIsm/S6TPUdami+0X0w1ejezqElIx5BHRXU4cCWARMrOatV+23p3RowtPo/ZelnHr38
 mUeqXLqr+tALb1pV8Rl31F9pNYymjjTvx719Ap0PnNsgBgpPCq0AH+QaIcfeUTvQ9uQOJ47xnu
 3oEnaQegn/8cFd4eAcxf6ZrwFPzXJ2ctouqNnsZJqY1exXbyqg+J3blg4PnXB5Rms9ggDy3N14
 uSyXCJTEqT5URywkJgbHcf/w
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:03:08 -0700
IronPort-SDR: eyetF5l9Ph57VP8FKcSRdAptUa2ascwiBYmOL6SjtraqgdgfxG2NCCtc0GHdbRJpKC26zLSSGX
 nN6Lvi+Tz86SzrygrMK5QUUJo7eYIyHlckACyXnKfNlI4+bntq25DFlR5iJJpt2tzrDYebtHFU
 /Etcc/pjMqKgEgpBHse5USgXOYGmvFoSBtwDUihDNQvQLj2cIE2lw5G3WMqc6JJYyB0wqxMm/R
 WxZyvMhx9dRfZacoRJ8DI3Tk0AUlHpkd6F5e9olfWQUecFFjA7F4ufeBVBo7EM7QZNYTQAe7c5
 aB4=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Apr 2021 05:21:58 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/8] target/riscv: Fix the PMP is locked check when using
 TOR
Date: Fri,  9 Apr 2021 08:19:56 -0400
Message-Id: <040c147d100a86e14007e4cabc7da22855f24b87.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:05 -0000

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
2.31.0


