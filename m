Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3c-0003eT-IO
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3a-0003aZ-2s
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3V-0003KJ-UZ
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:59 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3L-0002pP-PA
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:57 -0500
Received: by mail-pl1-x62b.google.com with SMTP id v11so6669445plg.9
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=CFx6B31nCjILFTUHEacG7TYITvH/PAmwJpdUczN1+Hk=;
	b=gHZkucnnR1AWCd2IPGhI+4GGhK0CFJvbZcGaQXpiT2TPoOmCsbnkOOMcdSfz6oRPBB
	mjgUbL8msysXHcqwBS5YgLPuIIWZve1eoihL5o2t1dGazlGQxN1iNBFqENnk2mYIV7n6
	e3dcBADUgRMyof1ssBBSnsMsh+vvk9pAWQTZ3wS1sb7zpzcvBSfVdjj9BhH6voQK9sIR
	j4DpF7RLW4L5JV2VOe0wac6B2r0Iq8uQZwhvbaN2ouu69qACKYGsa9SLjeUHj/iYl3/F
	jTVBAPWjQ/Zrd534VM+CHba88kcXzhtQtwszE29AZ/PutWo9i6BMKfhfSpoojDVIt8Rl
	s0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=CFx6B31nCjILFTUHEacG7TYITvH/PAmwJpdUczN1+Hk=;
	b=YPRkWy19zUrHCHOf8D53qO2rCsaDy7q6GhnCFTYEqXBdl5zGjGxWTtFiMAxOIE4hsi
	1w6s+665D8hwo6Av2lbfVwj3jVw+xsfOX6O3topnQYnqAuSy+SqvwNyC884sl3bGuLnz
	N7Ys1Py0iSs/GkgzJf8KRY6t3yR3KuFTj/1JqYAvT7s24bel/0VVPSM2IU6CDBc/UNR0
	VGkn0Zy4MEJlEPjT6kRAA7+jDJpRNDx1TqSHMC9jBhnWJNnfspWcR+UHv/BGmskRCx9S
	kI60efxkxm+nHBYaQOMaOe0Bayfl2/D6gAsR8nPXxI0r0bbwN7UPQ8XbPol5IK+PJk/n
	d1Sg==
X-Gm-Message-State: APjAAAVJjS9AI8ihPCbIaEmpAA56dR6yZp+QGmiKODs/9aYy5uxnQUHK
	5LkUbdQjLjfpPUgh3gWfbt2BOQ==
X-Google-Smtp-Source: APXvYqxnkH6DaHSnS3Shkidry7h8UVBNuf7PG0Q40pVTSOeE72DOMk5Rv6Nh/DZazYcnXEHAOTYisQ==
X-Received: by 2002:a17:902:2888:: with SMTP id
	f8mr7834310plb.244.1551477045311; 
	Fri, 01 Mar 2019 13:50:45 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	s6sm41015813pgi.56.2019.03.01.13.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:44 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:40 -0800
Message-Id: <20190301214945.4353-30-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: [Qemu-riscv] [PULL 29/34] target/riscv: Remove decode_RV32_64G()
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:03 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

decodetree handles all instructions now so the fallback is not necessary
anymore.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 92be090bc7bb..049fa65c6611 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -651,24 +651,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 #include "decode_insn16.inc.c"
 #include "insn_trans/trans_rvc.inc.c"
 
-static void decode_RV32_64G(DisasContext *ctx)
-{
-    uint32_t op;
-
-    /* We do not do misaligned address check here: the address should never be
-     * misaligned at this point. Instructions that set PC must do the check,
-     * since epc must be the address of the instruction that caused us to
-     * perform the misaligned instruction fetch */
-
-    op = MASK_OP_MAJOR(ctx->opcode);
-
-    switch (op) {
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-}
-
 static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
@@ -685,8 +667,7 @@ static void decode_opc(DisasContext *ctx)
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, ctx->opcode)) {
-            /* fallback to old decoder */
-            decode_RV32_64G(ctx);
+            gen_exception_illegal(ctx);
         }
     }
 }
-- 
2.18.1


