Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h455s-0000UC-ON
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:42:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455n-0000I0-Lc
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451k-0004uj-QK
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451k-0004uN-L8
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:40 -0400
Received: by mail-pf1-x42e.google.com with SMTP id n74so1516228pfi.9
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=Tl5PnOy5GDzrA+FAy0gJrOttK1v2QCAPy/ANBmR3QLA=;
	b=k3Y7qvYas+RlgCWm0PtZPeSqkLxP8viqS3z9VycKjG0E2IXPMU8hdD5wz5b5KWyeQZ
	BwxDT3mGTaF41QkWbpGWb9YA5tEiNI19e1rdWDnJJWHPrVlWTt36el9LNV6lD6Q5EUv6
	FUBP7SzCGSNGxgvDyvjGkCLzOQXDVc3y/6IkC3whbDytWql6SYLiEo/83sfb+TYviYjg
	D3r+u3HDBsjE5jKCl/Sg/mXWNzaDPW3FNmfjJ4JwwUIZZnx1Nye0rjqLkUTBqg/Sqzq5
	yieFINZPWljrxWC/4Gr0OC3T4sNfZ/PibWv85S3xmExExhD8TuriDiqSvNzAvcuNZoRL
	BHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=Tl5PnOy5GDzrA+FAy0gJrOttK1v2QCAPy/ANBmR3QLA=;
	b=C4V59UrBUBvTXqEtdajnbSzK5jtWYXuL0mQY2zztccM4eVkucC5Az/Z9txYId6veNY
	FSMoo2aI+8+ni7s5loh9C3PydA80sDdYsthNER2eqFVwWC/6aOgttX7cfFD+Fof2fL4u
	pOJ2UnWxcl1KC5B7qTds43VQItvXVOARpueIWWkZKdFCosg/7sdY5hd2IXbAIvFMCRxY
	XE3u3GwcLxp37hnDxn8WJUe/HQXfUoqH9ac5r+ImfJnWnKI4B/tquZWgOJ8kHbyC7hq0
	NAbY0UMAWKsx7UTYQxxnpVS10Hyt+NknCKCxD9dUefzNLMiwYl+xk7DRK/gkoTbfoann
	0KLg==
X-Gm-Message-State: APjAAAWJdplPiKklHsgT5X32IENHgwVnnETA3l+Bpuy/x9mT1M5zQcXr
	KDDHN0K2ziSQRoa7ca5+ziKPO/qW7aBvUWFG
X-Google-Smtp-Source: APXvYqxtSUMd8lPjuJSauT8ZPil2cCSSA2h3mmlKmVJrF2KP5sJIlH6gR9GBiLudXsCddVH8V2zS9Q==
X-Received: by 2002:a17:902:1486:: with SMTP id
	k6mr34951171pla.3.1552487919322; 
	Wed, 13 Mar 2019 07:38:39 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	j14sm17737406pfe.12.2019.03.13.07.38.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:38 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:37:05 -0700
Message-Id: <20190313143705.29129-30-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42e
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
X-List-Received-Date: Wed, 13 Mar 2019 14:42:52 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

decodetree handles all instructions now so the fallback is not necessary
anymore.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
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


