Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMiT9-0003bv-8i
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 18:51:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiT4-0003ah-3a
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiT1-0006gu-AR
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:36 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gMiSx-0006aI-Hg
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:31 -0500
Received: by mail-pl1-x643.google.com with SMTP id s5-v6so6804647plq.11
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 15:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=jiJQ+JOIMV0I2GJ3MV1g+OOMPgoMF7Rval6G4QIiJEo=;
	b=QkhHVdjwgtGGWGUd1dLi8WNBR+H5NZ/x1xjM86786xmx555L12jnK+N7FntYwhAchb
	PiuDK5crQYQcwrgU8ElnQsZx9IwYSUM0el9Xs1fKdhB9Hp5QfJQ8itJ1VpvaipCcQ7vS
	ivCUjyEvhXoI+7XoM1LhPgRyqC9Wf7z2YnIOkWcFBKpGop9rrsz4ctHwLSfihD4637/v
	AYB7uWI9cqNZD8qk2jc8h73ujCDGmRo11nYR6z8hRwZbiuEyXv53MZjtF2Rl9as/aoR/
	9ehSL/yp7Za9vbWPLI9Cen3pcDtJef8MRapJDBXGdeXQZKgwmrapT/ziT06uau16OXss
	uugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=jiJQ+JOIMV0I2GJ3MV1g+OOMPgoMF7Rval6G4QIiJEo=;
	b=WKobzNlF6E2LuzwXoA/LfKrw9OG5W+xNlJLz7akFSSQFwmMgDTCs2Tdx1wiBB8FttI
	GVeMhcyAERZ85e5a+EHer6BVapG7dZKZtvY4Z/9+wnosu2PMx0QCUQPKqc1skg38+fYY
	efLneTpI7jSgP1Ea6mTo6UpRcy45PdbqkpFp21Y3r3aTAVrKJLY9x5g2v1/9pg23VTaW
	Mqf7anwmSfu7T5E7h5mzIWb1+L+2Mr6TJrarAbhz+9yX5WzLTCDr9GdTwl+yMiDUiN7l
	n8gAo0+V8z0rOG4Mmr6av3KlGt+vmigr3Rtdq5M+OcBqcy9b6w0AhnJ1GoCQPTvlxwvQ
	RVLw==
X-Gm-Message-State: AGRZ1gKH16s5eChIcKUVAmeRI0538paXLs3brbK0/3RnF8WKS3nozNPq
	a3xV58wVvrnBdP645GcCSvQVdlyIbw8aZA==
X-Google-Smtp-Source: AJdET5fOfG7Gum2pl418WZGURlWpvspf1CkdOB0jOOdFKTtoqHcey6MnQgkTgbs65ObdDIRC5Gsilw==
X-Received: by 2002:a17:902:2ac3:: with SMTP id
	j61mr2840766plb.185.1542153084393; 
	Tue, 13 Nov 2018 15:51:24 -0800 (PST)
Received: from localhost ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
	y25-v6sm99114pfa.136.2018.11.13.15.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 15:51:23 -0800 (PST)
Date: Tue, 13 Nov 2018 15:50:45 -0800
Message-Id: <20181113235045.14155-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113235045.14155-1-palmer@sifive.com>
References: <20181113235045.14155-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PULL 4/4] RISC-V: Respect fences for user-only
 emulators
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
X-List-Received-Date: Tue, 13 Nov 2018 23:51:39 -0000

Our current fence implementation ignores fences for the user-only
configurations.  This is incorrect but unlikely to manifest: it requires
multi-threaded user-only code that takes advantage of the weakness in
the host's memory model and can be inlined by TCG.

This patch simply treats fences the same way for all our emulators.
I've given it to testing as I don't want to construct a test that would
actually trigger the failure.

Our fence implementation has an additional deficiency where we map all
RISC-V fences to full fences.  Now that we have a formal memory model
for RISC-V we can start to take advantage of the strength bits on our
fence instructions.  This requires a bit more though, so I'm going to
split it out because the implementation is still correct without taking
advantage of these weaker fences.

Thanks to Richard Henderson for pointing out both of the issues.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f44eb9c41b48..312bf298b3c2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1776,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
                      GET_RM(ctx->opcode));
         break;
     case OPC_RISC_FENCE:
-#ifndef CONFIG_USER_ONLY
         if (ctx->opcode & 0x1000) {
             /* FENCE_I is a no-op in QEMU,
              * however we need to end the translation block */
@@ -1787,7 +1786,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
             /* FENCE is a full memory barrier. */
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         }
-#endif
         break;
     case OPC_RISC_SYSTEM:
         gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-- 
2.18.1


