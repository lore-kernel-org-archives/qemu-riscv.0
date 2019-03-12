Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUD-0003Yt-Da
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hU3-00033q-HI
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hHJ-0000Up-T1
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:17:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hHJ-0000UN-Lf
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:17:09 -0400
Received: by mail-pf1-x436.google.com with SMTP id d25so1806911pfn.8
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=A4nqSOiEomNC8Yql/++VvC8Pht0T9boN/3KbHf7SQVM=;
	b=H9V90BnVrn7ReIpFssJP3aw8PP29cMpTwXv4gJxgyNuYyBik9Og90M37mg+RU1BWpv
	+p2GJ5JmCsabVfDvOyL8TKI+rNFRcImnQhyvef3bH8zpNYsG5aU3u/jSfsPlPs8IRBFf
	U1h/vQgUHZQjhUcv7YWx+Q6j7GYntbMR3n1vYgvHB7ygesu/rQOYIIfY339nuxM5RmVl
	c0zRsjIZkesg1QOEjuelBSqox8fRu0vkliwd9/LNuQ+SD5tnXEQCnUyL/BS8afdyU+ps
	muZbwmU3tJ9aRFpoFvEQvwc1reU1/qGv0T3nv2HcmOCJGTytknEtDd/BDi9CpRWoOnm0
	5ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=A4nqSOiEomNC8Yql/++VvC8Pht0T9boN/3KbHf7SQVM=;
	b=UjPhcep7ime+Xnoj7LpXznHcSDCDTfXgL2j3IZ+kPjUSBmdbA35E5OP1XFBQMDPn0D
	g2zbnMCSNNjH78jkBWqsywuF/CesdtcdNlvrE01xbFLs8JT7ofoH0hzX7VvFv6gYHX2t
	05bJTjwfooUSnbaiBOtnYPDOyuzdLQIPqnbxbF7qSlwh81LAQJX7rq9bbAYpUeZgtO3F
	o+1bNasmi0ZDbbNXYm6CgVBmiHFKZRxkKG1EfdKWo5CVoXfNP7vea/qLrquh6lJiZVNf
	UcoIekJWw8uCeX9otM2pVZ3rDnWxMwWlFilPApbgTxqGc2HcbQpakNBqyB6uvy1cD063
	2O2Q==
X-Gm-Message-State: APjAAAW4MckYaqyDXhLXi3/lvCpChl0SMbf5fkNMeRyX+mtklEz6dIgo
	G6XGA3R0F6IJD0W7grTZXTGREw==
X-Google-Smtp-Source: APXvYqzfSifeN3A7p8lZN8zEX1KXl0QFhDx9CRy+CiI1Ym6UyFBJqfzZaXr6ZBpeCkc4QbGfcuxq6Q==
X-Received: by 2002:a63:6193:: with SMTP id v141mr6272757pgb.392.1552396628802;
	Tue, 12 Mar 2019 06:17:08 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	i13sm13129029pfo.106.2019.03.12.06.17.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:17:08 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:26 -0700
Message-Id: <20190312131526.14710-30-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::436
Subject: [Qemu-riscv] [PULL 29/29] target/riscv: Remove decode_RV32_64G()
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
2.19.2


