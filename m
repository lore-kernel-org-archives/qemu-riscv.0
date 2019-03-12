Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUD-0003Z7-Ky
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hU3-00031K-Km
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hHI-0000Tz-QN
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:17:09 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hHI-0000TP-J1
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:17:08 -0400
Received: by mail-pg1-x533.google.com with SMTP id h8so1816841pgp.6
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=2CAwZI4S+7DAxH3nV1kh9nIJ7eYm5PMYGr8Ydfr/ZLQ=;
	b=jpObqvh6D/KlR/WgWOA0S1HYMAUxGRLJOv4gPnIkdHu9FLxA7XRqc8AzTJglkObFr9
	Nfnn0mUnmKULHiHgL1np6SEAp+vd8vFRf+9Ug7reYYBefmrf4mufUGwpZ1tEHIszXO+A
	LpdJYQhElG99n/Z2pVf4SA9GEMl4sCmQfHXnauC9brtZTVwz+pem14AIiTdzPW+9YQkX
	Wj7F1fTt6lQObvJIiEfQnWw3LggJkzEHplrpU2VVwlf7ztDLHjAec4G9KYwU/pLsFs9e
	pw8ozyzbDxvofTRI/R8puVtWTpoTgUsZa/tnG8UdM07l4XLWo9i11B9AVyiS9MUBHIG+
	Njxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=2CAwZI4S+7DAxH3nV1kh9nIJ7eYm5PMYGr8Ydfr/ZLQ=;
	b=s0ifqGVpOifBVlZ1R4KaoK0WnlytJ2eCgcuPqRsyL8YHtMhYQLPSZ8Oc5o6L0bt2x9
	9rqhr4sEr68BBtnE9WSDbqb43+ITL9P1cy3SU3LTlayotr7Imf/1t6Qx1kihVUifDXsk
	syYhEbMy7xBxr+NCnisT/bBP7ojmTPipUPH/7VkqhsZTXgwJ+ofhJtxRI2M5yqeRC8Ao
	nHTi5n3PcKJDbXCDKGQCZFOVpzN3jGdnDE2b1MF2W1iOhrT5VPjf4LjGC4p62ylO+mel
	drHd1a20EzCcVyAmbTCwuREITdup4VXR5ByJB5MXRKYPGBfZrlW65tX8tq/LwfFo9H9y
	Jg5g==
X-Gm-Message-State: APjAAAWkirvoaanIZ/D/ks1cbMM1mxqadWp4M5I4m2f+xCXag4CCVzD5
	1a7UErDpx9IxqnXJGZYYBYuvWA==
X-Google-Smtp-Source: APXvYqzF6oQnOUhy/qYnRnbiz+ux63hXlsStsv62yluLUvJgqUWn33G9vKBV5z/6tww53lzye0oF2g==
X-Received: by 2002:aa7:8384:: with SMTP id u4mr37961626pfm.190.1552396626296; 
	Tue, 12 Mar 2019 06:17:06 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	u13sm20432837pfa.169.2019.03.12.06.17.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:17:05 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:25 -0700
Message-Id: <20190312131526.14710-29-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-riscv] [PULL 28/29] target/riscv: Remove gen_system()
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2019 13:30:21 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

with all 16 bit insns moved to decodetree no path is falling back to
gen_system(), so we can remove it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index dedf4189d5b7..92be090bc7bb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -473,33 +473,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-                       int csr)
-{
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-
-    switch (opc) {
-    case OPC_RISC_ECALL:
-        switch (csr) {
-        case 0x0: /* ECALL */
-            /* always generates U-level ECALL, fixed in do_interrupt handler */
-            generate_exception(ctx, RISCV_EXCP_U_ECALL);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        case 0x1: /* EBREAK */
-            generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        default:
-            gen_exception_illegal(ctx);
-            break;
-        }
-        break;
-    }
-}
-
 static void decode_RV32_64C0(DisasContext *ctx)
 {
     uint8_t funct3 = extract32(ctx->opcode, 13, 3);
@@ -680,7 +653,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-    int rs1, rd;
     uint32_t op;
 
     /* We do not do misaligned address check here: the address should never be
@@ -689,14 +661,8 @@ static void decode_RV32_64G(DisasContext *ctx)
      * perform the misaligned instruction fetch */
 
     op = MASK_OP_MAJOR(ctx->opcode);
-    rs1 = GET_RS1(ctx->opcode);
-    rd = GET_RD(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_SYSTEM:
-        gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-                   (ctx->opcode & 0xFFF00000) >> 20);
-        break;
     default:
         gen_exception_illegal(ctx);
         break;
-- 
2.19.2


