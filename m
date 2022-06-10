Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzhxW-0002Ck-PZ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 12:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzhxU-0002Bm-Io; Fri, 10 Jun 2022 12:58:04 -0400
Received: from [187.72.171.209] (port=49760 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzhxS-0006Tt-Dv; Fri, 10 Jun 2022 12:58:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 13:56:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CCC6C800058;
 Fri, 10 Jun 2022 13:56:47 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, victor.colombo@eldorado.org.br
Subject: [PATCH] target/riscv: Remove condition guarding register zero for
 auipc and lui
Date: Fri, 10 Jun 2022 13:55:17 -0300
Message-Id: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 16:56:48.0129 (UTC)
 FILETIME=[12C1F710:01D87CEB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jun 2022 16:58:04 -0000

Commit 57c108b8646 introduced gen_set_gpri(), which already contains
a check for if the destination register is 'zero'. The check in auipc
and lui are then redundant. This patch removes those checks.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f1342f30f8..c190a59f22 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -32,17 +32,13 @@ static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
 
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
-    if (a->rd != 0) {
-        gen_set_gpri(ctx, a->rd, a->imm);
-    }
+    gen_set_gpri(ctx, a->rd, a->imm);
     return true;
 }
 
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
-    if (a->rd != 0) {
-        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
-    }
+    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
     return true;
 }
 
-- 
2.25.1


