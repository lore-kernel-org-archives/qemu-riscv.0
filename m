Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtj-0002LT-W5
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtU-00024Y-8E
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtN-0002zv-8N
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:15 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-0000r0-Ow
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pf1-x444.google.com with SMTP id j18so1336523pfe.1
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=Y7QlvuNBEJtOWvnrX8nX22Tnl1f2RmFv/qKHDggdEv4=;
	b=AtLEoa1ampzTddVV0v8tbSrQ5BWZiSMi8GhEgYAE57qEHZ+qXhO/SaU/NpQGxeNXCO
	a5RNNBt5+ZUMNoinxQq7fbEInOKoJjlbagw6GXBVrm0AFRLzCs+ACIINijTCjlDpQSD1
	3rJZJqFYG3+pQGbtZ+4ePiKOhRoLGJhyn/kjoasSazPjcbApgSj5QH2salS4mCG1ISFO
	Bv5dewE1dW8bAiwTLpvZ15RGVpA1F+RutR2mBMtxmvGoH+QmLgMq28jv3AznUMssRdPH
	kJXtXFgABdbNykw+r9U0xAJ3/C5uVJpO6b0nLVzFOia6kIBFdr13XlG8EtPr8sFhBXqi
	JLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=Y7QlvuNBEJtOWvnrX8nX22Tnl1f2RmFv/qKHDggdEv4=;
	b=BBL9rnhDHizx9V7ynADmWtA5NmpjiZWtuAs2vjOTtyQ5krRdqnAAF+Y/1NOxGr6gRB
	MCfE72vyfGHSuK6ZNVNg+hjwy3FChcloffKmrgiiPadpokkaDNpRrq4ktKF0uFoB9KKH
	dFpl6fjfVFdHfrmPZqhxcd8+D1fC52xky0uBi6TJhByiTd8A9yBgrTlPGwrVOG+Dw8Mj
	Vs37cLzjSzLk31yeUB7RQ2mSifrljhhO2MWROLee+K1ODjUlNCBMkhn7ipF1cYn/4C8L
	w18+v/JTq6MgbY7Pp7ACQ6vc1CL2cr6IxtUjQaqxskMgS7tL9898q9523Pxr3p+CBM1X
	B+fA==
X-Gm-Message-State: AHQUAub7pqj2t4bFPpBvaLvCU0Qwwkaz3o8lMP4MQlzKS+SrEb1IIb4/
	oaYZbDWysI6q6uVKnQWxzSVJ2w==
X-Google-Smtp-Source: AHgI3IZ1SbKh9ySN8ksd9Jnqd8CLx9V9rYM4gboLVFcm2WWHZ8MHsdezfIqG+Vawvn1y0TeXOBmc+A==
X-Received: by 2002:a62:b2c3:: with SMTP id z64mr1106239pfl.149.1550073278263; 
	Wed, 13 Feb 2019 07:54:38 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w185sm25443328pfb.135.2019.02.13.07.54.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:37 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:40 -0800
Message-Id: <20190213155414.22285-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH v7 01/35] target/riscv: Move CPURISCVState
 pointer to DisasContext
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:26 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

CPURISCVState is rarely used, so there is no need to pass it to every
translate function. This paves the way for decodetree which only passes
DisasContext to translate functions.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b7176cbf98e1..9e06eb8c2de5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -54,6 +54,7 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    CPURISCVState *env;
 } DisasContext;
 
 /* convert riscv funct3 to qemu memop for load/store */
@@ -2003,7 +2004,7 @@ static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
     if (extract32(ctx->opcode, 0, 2) != 3) {
-        if (!has_ext(ctx, RVC)) {
+        if (!riscv_has_ext(ctx->env, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
@@ -2058,9 +2059,9 @@ static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    CPURISCVState *env = cpu->env_ptr;
+    ctx->env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = cpu_ldl_code(ctx->env, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-- 
2.18.1


