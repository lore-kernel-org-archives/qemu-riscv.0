Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ2y-00065w-SP
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ2u-00063l-Hq; Fri, 02 Apr 2021 16:05:34 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ2o-0003oA-VE; Fri, 02 Apr 2021 16:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393926; x=1648929926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUm7inRKj+7G1rTvuCFJJ80cTV26/SwUHAm1uIyaze8=;
 b=rYIT/WEEyjoxBH8Jw2HtdCZo3O0xAO0Qs9ytFGYbcXeBC1EdQfF3M7PU
 kBoJmAlI8FDfQz1GUN7CixZX+tX+9lkUB0QK2Zj66iv1IaDdYxOVjf3Sd
 8Pi0r/L9JMopDDAi2hwJVmtBRW8uwj9Xx1EIPvYJlqfYGnwOhkxY0CSqd
 as+eCfw1JP0U4NdPchJPOtx6MY6QpbLYt4tDvRwZjlfXJhSku73J7myVJ
 tVnrKtxGgds+3BLs6JS/3CglwuGMUrsSJlco1EjqgfV/1+MALYUpkw0gS
 7tSMaFaHxK5swsbJcEirFhS7YsR9YnfYUFlst9+SxgnnvyKCOlX46sfnm A==;
IronPort-SDR: 6xjkHUNGfgsusHRI1eqL8AXj1Uva/YlHHRrOyQf7VKkvN+DX3psxIapD8kigYztoHP1FOkYYG8
 KIoVrsb8s4m6h9YIl+neSM5tL3zYek0ikt6TVjve7bX4j2a9cLep0ZizapS7fOCOwFaPZ3oij6
 g7b8WpQQoYA8loZyYKMDxS1KbX5fH9GoGOWwXzYln3QN8aWSCBlbcUbVvjHmWk0G4DmxT/Dl4k
 yBWZSMxkf+iZGvT7Q5TktlUJYD50SoPuJE0YFPdVFRpfAxSUc1z4Ar000TohmwhWxDRASkEye1
 yIo=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="163541917"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:05:10 +0800
IronPort-SDR: TcU/1Nzfi8AS99To7wCaB168YjL5Puym9cSjOKUAAbuPbfrfdASyhT9lcJAG2rYazUGA4rQ7eg
 qwElTYkZ7ptUOFCWSCVX3uIrvDwQYW1igRiq2CFpL7qdf/oGBEvruvFuja1HlVTyTRlUZKPjyZ
 4mobkUnTQrKP7lNG7KXMfcgX5yDuk5Dk++7VtWDRLXCmcVQRZ+TxRPV/jdU3e4pR/aHvZk7yC9
 CQFsc2eIgxFnr+aXUHh+q94Uq8/WWeOJnVuICPktrlKeck+lthBBr1YqOpNMxnr60aXh/tUE8p
 La3qCGFwtyWnnzeUIL1Rgpz8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:46:43 -0700
IronPort-SDR: FlQr1toDWzxNX8lxN+ysvbz8dhZpVHunGSGTOYwKkJk/v82Bbayrjbq3+sEOtnLmIJdWM9O0dZ
 Cm3EyP/8YolgN80loKz8nCsi0f5sKy+F77my/wOcGv7s4LfgqmfBQqmHz4newQIYc6KxgyV5cE
 n8N2wdTPVLoq/4vJqLbGrnycpYd6omBgjwgkSQ+dA4leaPmsF5Yu7CrdJcWt4BzYTJ4kuj7niC
 d5da6NFl2C2yaSBaF9bSUTubFWCoghM0fB1BOE6v69weWrOHjmgFbe8ma1EQD/VDchZd8CEDUX
 wqw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 13:05:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 8/8] target/riscv: Include RV32 instructions in RV64 build
Date: Fri,  2 Apr 2021 16:03:07 -0400
Message-Id: <1c19d0112fae5ec6087cfc415f0d6cc56495220b.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 20:05:35 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16-32.decode | 24 ++++++++++++++++++++++++
 target/riscv/insn16-64.decode | 31 +++++++++++++++++++++++++++++++
 target/riscv/translate.c      | 18 +++++++++++++++++-
 target/riscv/meson.build      |  7 +++++--
 4 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn16-32.decode b/target/riscv/insn16-32.decode
index 0819b17028..f83f43e955 100644
--- a/target/riscv/insn16-32.decode
+++ b/target/riscv/insn16-32.decode
@@ -16,6 +16,30 @@
 # You should have received a copy of the GNU General Public License along with
 # this program.  If not, see <http://www.gnu.org/licenses/>.
 
+# Fields imported from insn16.decode:
+%rd        7:5
+%rs1_3     7:3                !function=ex_rvc_register
+%rs2_3     2:3                !function=ex_rvc_register
+%rs2_5     2:5
+
+# Immediates imported from insn16.decode:
+%uimm_cl_w     5:1 10:3 6:1       !function=ex_shift_2
+%uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
+%uimm_6bit_sw 7:2 9:4                !function=ex_shift_2
+%imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
+
+# Argument sets imported from insn16.decode:
+&j         imm rd       !extern
+&i         imm rs1 rd   !extern
+&s         imm rs1 rs2  !extern
+
+# Formats 16 imported from insn16.decode:
+@cl_w      ... ... ... .. ... .. &i      imm=%uimm_cl_w   rs1=%rs1_3  rd=%rs2_3
+@cj        ...    ........... .. &j      imm=%imm_cj
+@c_lwsp    ... . .....  ..... .. &i      imm=%uimm_6bit_lw rs1=2 %rd
+@c_swsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sw rs1=2 rs2=%rs2_5
+@cs_w      ... ... ... .. ... .. &s      imm=%uimm_cl_w   rs1=%rs1_3  rs2=%rs2_3
+
 # *** RV32C Standard Extension (Quadrant 0) ***
 flw               011  ... ... .. ... 00 @cl_w
 fsw               111  ... ... .. ... 00 @cs_w
diff --git a/target/riscv/insn16-64.decode b/target/riscv/insn16-64.decode
index 672e1e916f..dbef1e5365 100644
--- a/target/riscv/insn16-64.decode
+++ b/target/riscv/insn16-64.decode
@@ -16,6 +16,37 @@
 # You should have received a copy of the GNU General Public License along with
 # this program.  If not, see <http://www.gnu.org/licenses/>.
 
+# Fields imported from insn16.decode:
+%rd        7:5
+%rs1_3     7:3                !function=ex_rvc_register
+%rs2_3     2:3                !function=ex_rvc_register
+%rs2_5     2:5
+
+# Immediates imported from insn16.decode:
+%imm_ci        12:s1 2:5
+%uimm_cl_d     5:2 10:3           !function=ex_shift_3
+%uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
+%uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
+%uimm_6bit_sd 7:3 10:3               !function=ex_shift_3
+
+# Argument sets imported from insn16.decode:
+&empty                  !extern
+&r         rd rs1 rs2   !extern
+&i         imm rs1 rd   !extern
+&s         imm rs1 rs2  !extern
+&j         imm rd       !extern
+&b         imm rs2 rs1  !extern
+&u         imm rd       !extern
+&shift     shamt rs1 rd !extern
+
+# Formats 16 imported from insn16.decode:
+@ci        ... . ..... .....  .. &i      imm=%imm_ci      rs1=%rd     %rd
+@cl_d      ... ... ... .. ... .. &i      imm=%uimm_cl_d   rs1=%rs1_3  rd=%rs2_3
+@cs_d      ... ... ... .. ... .. &s      imm=%uimm_cl_d   rs1=%rs1_3  rs2=%rs2_3
+@cs_2      ... ... ... .. ... .. &r      rs2=%rs2_3       rs1=%rs1_3  rd=%rs1_3
+@c_ldsp    ... . .....  ..... .. &i      imm=%uimm_6bit_ld rs1=2 %rd
+@c_sdsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sd rs1=2 rs2=%rs2_5
+
 # *** RV64C Standard Extension (Quadrant 0) ***
 ld                011  ... ... .. ... 00 @cl_d
 sd                111  ... ... .. ... 00 @cs_d
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4af55deaea..9a93c77fd6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -602,6 +602,10 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+#include "decode-insn16-32.c.inc"
+#ifdef TARGET_RISCV64
+# include "decode-insn16-64.c.inc"
+#endif
 
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
@@ -612,7 +616,19 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
-                gen_exception_illegal(ctx);
+                if (riscv_cpu_is_32bit(env)) {
+                    if (!decode_insn16_32(ctx, opcode)) {
+                        gen_exception_illegal(ctx);
+                    }
+                } else {
+#ifdef TARGET_RISCV64
+                    if (!decode_insn16_64(ctx, opcode)) {
+                        gen_exception_illegal(ctx);
+                    }
+#else
+                    gen_exception_illegal(ctx);
+#endif
+                }
             }
         }
     } else {
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 88ab850682..d17b478120 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,12 +1,15 @@
 # FIXME extra_args should accept files()
 dir = meson.current_source_dir()
 gen32 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-32.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
+  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
+  decodetree.process('insn16-32.decode', extra_args: ['--static-decode=decode_insn16_32', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
 ]
 
 gen64 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-64.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
+  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
+  decodetree.process('insn16-32.decode', extra_args: ['--static-decode=decode_insn16_32', '--insnwidth=16']),
+  decodetree.process('insn16-64.decode', extra_args: ['--static-decode=decode_insn16_64', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: [dir / 'insn32-64.decode', '--static-decode=decode_insn32']),
 ]
 
-- 
2.31.0


