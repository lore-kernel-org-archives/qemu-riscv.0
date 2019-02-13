Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwto-0002Pe-2v
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtl-0002NJ-FT
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtN-00030x-KV
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:20 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtN-00020p-Ap
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:09 -0500
Received: by mail-pf1-x444.google.com with SMTP id c123so1338570pfb.0
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=7OEpEoCrDgblhCwQ9MN3mlSDqeTGypkU6eobIakpdj4=;
	b=bnKsabSArpwRvdJ6jX+4aKYZRxeOad7F46Py5MQhTjBZYDgnEVa0e3aEKYlDvWvS5w
	jw5UopxJKg9O2LthHXYgXK3HWTMB+ZvJ/ksHpDsQMXt7h8TjrGgDdgMrv7H5/HrlD8Qb
	GUzWdT9f/+gyfzGohBdsIGVDr9goL0YaCYHsk6wfz33B8BeHskoKv9ARhNrdV6IzDVtJ
	GysThrjmj8HvhGOd+x0iZHJGYjBlZslVnFNxS7g7P4fgbeeuo3hseKiWSIYURmb7cwon
	XWTxbNYMJPJDdPGRIRXMIy6au/FkKvVU2Mo9NzYt5PX8HRJA9WTILhu9crK35QbpN3bS
	R9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=7OEpEoCrDgblhCwQ9MN3mlSDqeTGypkU6eobIakpdj4=;
	b=QuDCu8dWPbyherhYJQ4jPFEsjwljjN+EKNpmrnW6FwCJvsv8AmZTjju1e287zNdQVf
	GCi131AP/kocglFqiVMjfDNc3bHxRsMcyTDgnACeNq33A3RDImN5gRS1hgDT7OoLkdZY
	ePDXDuS7cvB+2ruKU6zzIcJOKzySXJmtfqyAppXJbHdqrwLj+ImRLlo2EUh7z/olhtqw
	fG8BJPAxWgR9vnk6IIHPGY2e9ycLN+tWTsGjcr7jggBAn75juSQ+xieS9IfEIj/IMOqw
	QvA4Q0V5dIRFDv3cH+tzvkcxuZMpIRGas5W3oua14VeI1lr3EZbYYbOMmgJczvzTxBks
	dcUQ==
X-Gm-Message-State: AHQUAuYq+WVnvP1ibcdBLkH2FtgbGwQNb68+jhQcb3Nkq/RzK6m2++lr
	q3MrT6Oe9A2a2cnVqCU22N/IZA==
X-Google-Smtp-Source: AHgI3IbGla5NAKGtYTIADRt7q5ohA+WvT2ZQSgs+dNQj/0z0tA56J9ucE4VliNt8BXY9Opv1WOdxMg==
X-Received: by 2002:a63:fa51:: with SMTP id g17mr1091691pgk.66.1550073325073; 
	Wed, 13 Feb 2019 07:55:25 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	z127sm27429251pfb.80.2019.02.13.07.55.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:24 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:09 -0800
Message-Id: <20190213155414.22285-31-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH v7 30/35] target/riscv: Remove decode_RV32_64G()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:34 -0000

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
index 65bedc966497..59c297915158 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -646,24 +646,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
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
@@ -680,8 +662,7 @@ static void decode_opc(DisasContext *ctx)
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


