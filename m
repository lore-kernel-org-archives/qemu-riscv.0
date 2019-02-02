Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gprzS-0007Fb-6t
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 04:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprzE-0006zO-P3
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:53:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprqB-0005l2-RX
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:44:01 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:37759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gprq7-0005XT-V3
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:57 -0500
Received: by mail-ed1-x543.google.com with SMTP id h15so7475831edb.4
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 01:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=VsEG5EqtY/F+uxugfJZjY5iDDB0h1Q1FwFLq+ViPw8A=;
	b=EGmT8jIL7TUd74YGaj3Jsr3YfNXRK3ptPXzUbXooqKQSCvVVmHwQcdAWLnxEVuFS0W
	nkGjJWt8bf3DNHHrjZ0a136IpB83vcBeVv7wuZOy8XsfUOLTWFJlIT3w2mBQf1XgShxI
	CH8R48yUAZ3t6ggsFGOsQus4o1nDmC471CA9yrmrreODwKUCiwu9e0tUjbSQQyRFIL0x
	PT6m/28vthCAV09T6k3RFttHMKqPy8R7MYzu9+uuAKCzYNA6Y10Uhorrq0T3svtda6kx
	v11e3UuVLC5vXAT9ZGYqT0mlprI8J7XBb99BBxMni2FLGQ2nNWxt0cHxLJ91uBlK4vzH
	Hrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=VsEG5EqtY/F+uxugfJZjY5iDDB0h1Q1FwFLq+ViPw8A=;
	b=KEwFV9EUcQipsJzOlRpQ8hY28JWwSyTiLXOvEDFmRqja+a2O+dIGMPPR9lOESco1JN
	/oW8w+DKnfUkJDnEG0wp2ZuyLQM1mW98TTind2le1TmuTZVeab4b/1G+E2P7wg4F+roB
	q94BXy8DtP4gpaT04xTsyJ7J0T3mKJ6bwRRNjyqOCmUvlv0s49awcOCxfSvbXiAWMAiH
	NLF51IpQlCr5nAF76lOBPS5JY9jGMzEfwT8jLhqMgUIZRK5NmvgMTedewdXhT8Ygvf5n
	UWhXoSojY2fGBQzKBVjiUOUt2DD27p8m+516Nfjqf5LCYTpudV/r0JhcjX/DZS1IsSJY
	ysjw==
X-Gm-Message-State: AJcUukdO3Gl3tfl0rm8ziroljk+deOlPyx23lrgc1Kj20BOUYFhUk0dR
	NeImAPBDXS2S1uIUHUrhF3I9qZocm6r7AA==
X-Google-Smtp-Source: ALg8bN5iM9GIyqLWUDJUfeALUsMmV4TvEJdNga3GJYEXmtkL7NuKbO3XiQoej4M+ec83UUgeUAVucg==
X-Received: by 2002:a50:a622:: with SMTP id d31mr44346771edc.228.1549100625259;
	Sat, 02 Feb 2019 01:43:45 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id
	g21sm2665204edc.63.2019.02.02.01.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 01:43:44 -0800 (PST)
Date: Sat,  2 Feb 2019 01:43:24 -0800
Message-Id: <20190202094329.22874-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190202094329.22874-1-palmer@sifive.com>
References: <20190202094329.22874-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: [Qemu-riscv] [PULL 05/10] RISC-V: Add priv_ver to DisasContext
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
X-List-Received-Date: Sat, 02 Feb 2019 09:53:21 -0000

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


