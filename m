Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65E-0002h4-4h
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65A-0002Sz-BR; Mon, 25 Oct 2021 15:56:32 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf656-0005UD-Mu; Mon, 25 Oct 2021 15:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191788; x=1666727788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tOzvjqZBgBbh6hhjshLMcUkRPj1rYsYkPrMwh9QKvrA=;
 b=oUbB5Bvce3Hu6FkjJVxMSZ1PQKjM6O39ekRZve3UAxHNRDBjEYbV8q7w
 VScDs9aGZVNMsn4tgfkau6gY9b9SpDLYy2grpFjPe36/E0dThsdOs7pSD
 czcdvOzqrIz+3KYmUGve0oiJKLI5+CAz4aaFBDQ1H1V0Q8nsz7gP1JMPz
 m7EQGo/EIMe+0eRHOlEWAJDy3WWQHZZODqhaFjcDUeUZC15YDwtNCgG1O
 y3q4cCZOybVBKPyaUCYXz9YtqsqjZAPnPECtDq/nesyVpYA3TEeoKf/Ko
 k7593aS+H98K+u9flkbo+AnSjuucKW0du3/qXMIV+z1bu9eWKabKog3g4 A==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683000"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:23 +0800
IronPort-SDR: J4tY9o+II63RLhqfRsN+hYPnoPCR0DVb8e5MJA8HgQRVuZfYq8OL1hudv/sejZXY5WGOS7JaGK
 lgYwkr2hHW/T11oOoWB9FrErocFDG1AzyExbh89E9ODTq6pFBSRtaV9b2kv45O3likyWVecyA/
 N82/gBqnB9oJY+wfH6oxWT//2EUFJC8YduE0fRbCHWzfONN5mt4Je6WBpKki/+rJIyEXn0vFxC
 Vp83eYd27uNjuzT0Sa7ZAYqNDg9KzgtyJumxTTAr/LYJ1r+ACuoHMJP7Dtax4m9nPNfc/bChNp
 YrPd0Ip8eCFUiLJpcTkx3HhP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:54 -0700
IronPort-SDR: Juf51POCFLOqoxo/8QZwv016FiUY7J6149AorYjiaylM2QRii/LKFJ/CxPyLBVSpU9wUnyh5aJ
 QFrbiOdPuXd4i1Ueht6tYWBLg9+kL2EJcFg2YCACAN5vk/nvVAT1a01kpf+VnFoa+LBrd4CBet
 FGwpD9bp9u5F2D+iVS5w/0dF5JvRXT9H4rOvlL9iIdqPnb8WJblYTbBRFiHbF+d89ieQic7dRT
 4ZluL2lcP4tgkk+OoE8j51U3jPVPu3hSQsLRLjngWAmMWDSvKkumNX//hs89EwKnjfWPSo+NnZ
 oUc=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 01/10] target/riscv: Fix PMU CSR predicate function
Date: Mon, 25 Oct 2021 12:55:52 -0700
Message-Id: <20211025195601.245631-2-atish.patra@wdc.com>
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

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/csr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd32162a..1ec776013435 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -89,8 +89,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -116,8 +117,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.31.1


