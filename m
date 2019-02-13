Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwj4-0002El-DC
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj0-00027b-JL
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwiy-0006rs-K5
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:26 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwis-0006b7-BF
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:21 -0500
Received: by mail-pl1-x62f.google.com with SMTP id f90so1326504plb.10
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=VsEG5EqtY/F+uxugfJZjY5iDDB0h1Q1FwFLq+ViPw8A=;
	b=e4/Z1dmMBry1NJ3ubcYYRerIcMd2PxVzfpMI1AVbeef6+jWxx1mX0oXiHFeOZLKpwC
	kcrpNkneJcoGAOSAXqt8pADwirF9q06ypQQdgNAySYCop27Ct+WiHf7XuzTxHvGlEZSF
	ykGZfnfm9iwDakZx1zMSUfIQDsyK5TL/VvmzuHbI34YTD1acbvJwXD+Y4OGg+y6Kuc1/
	1MpTo7qUpj5mf2iRAXKdLvT301tkTt6TpTm/o1otbaz5G0dIIJjnGSTIpzfPJE+Haj7R
	N47JCXXS0AF94fV1Ln44UE7ok7NNR0FpsQiPVIN9dy6nTTFJbRnmYALYvujzdey2oEQ6
	uMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=VsEG5EqtY/F+uxugfJZjY5iDDB0h1Q1FwFLq+ViPw8A=;
	b=B1BavBnDD6WurBfRS1hair6ABCWAAMS2usxz9qDJSjljvJm+VinhGNnnB9DTCGyjYt
	RH6JeHT9N1woB2O3/adporvDlkXMM+KbRVsM8yRkip3lZ/3kXnqOh+H9BCeFNi14xBFY
	p6phrV3F8zeqPWFNq+xAj8eQiDW77HcLQRhxE8jieLN4iQv46dKkL9+HzLz0NK1aHw3h
	v/I4OrYDEYDIWicVF6QU+OFhpFqSNzWvqUEWKrjzIEE9fQ4MsEk0b4JXMeiANy52I+no
	RvCbXMftprS9y7LE1Z6G0K/qtGuJIgvjuipcrf6i0a4MjEtCAbjnjT8gfycRCpqAVG7b
	1ysA==
X-Gm-Message-State: AHQUAua4OKYcKf8IoilrqBTHDtcgqxl54IuyXgIzsrKymDJjYO1HepxL
	APXtjLUVdsZsDZCboLbZVNU0P4xSODw=
X-Google-Smtp-Source: AHgI3Ia3F1XI6Y0NJBEU6jbRqFIsSE9ulrC51JnFGh9DnuYSudXeUJn60F8nqMBDQCGvRmsQCUd8EA==
X-Received: by 2002:a17:902:4225:: with SMTP id
	g34mr1192793pld.152.1550072710529; 
	Wed, 13 Feb 2019 07:45:10 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	k17sm4098110pfj.92.2019.02.13.07.45.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:09 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:44 -0800
Message-Id: <20190213154450.14749-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62f
Subject: [Qemu-riscv] [PULL 05/11] RISC-V: Add priv_ver to DisasContext
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
X-List-Received-Date: Wed, 13 Feb 2019 15:45:28 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

The gen methods should access state from DisasContext. Add priv_ver
field to the DisasContext struct.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0581b3c1f7d7..35eb6bdfe099 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -43,6 +43,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
+    target_ulong priv_ver;
     uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t mem_idx;
@@ -1330,7 +1331,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
     if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
-        if (env->priv_ver == PRIV_VERSION_1_10_0) {
+        if (ctx->priv_ver == PRIV_VERSION_1_10_0) {
             /* sfence.vma */
             /* TODO: handle ASID specific fences */
             gen_helper_tlb_flush(cpu_env);
@@ -1384,7 +1385,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             gen_helper_wfi(cpu_env);
             break;
         case 0x104: /* SFENCE.VM */
-            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
+            if (ctx->priv_ver <= PRIV_VERSION_1_09_1) {
                 gen_helper_tlb_flush(cpu_env);
             } else {
                 gen_exception_illegal(ctx);
@@ -1854,10 +1855,12 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx)
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPURISCVState *env = cs->env_ptr;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
     ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
+    ctx->priv_ver = env->priv_ver;
     ctx->frm = -1;  /* unknown rounding mode */
 }
 
-- 
2.18.1


