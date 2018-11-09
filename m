Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gLCKg-0002cI-Gi
	for mharc-qemu-riscv@gnu.org; Fri, 09 Nov 2018 14:20:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gLCKX-0002XU-3c
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:20:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gLCKO-0001iK-Hx
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:20:27 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gLCKK-0001ZY-Rw
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:20:24 -0500
Received: by mail-pl1-x641.google.com with SMTP id p4-v6so1360068plo.5
	for <qemu-riscv@nongnu.org>; Fri, 09 Nov 2018 11:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=PIrU5TXJVpuoBGAJ5WMK/veUeOQU9F1BWjTRGr4Sy5g=;
	b=jXnuX2CPKDNxIysm0gbm8YRY3FK9m09I+mS3VOoY0G+Ox8tscZx8ZGtGK9IjwzbogD
	rjo8w4fe8sbjUNKgpOcElki0XZu06hzUckj5eCe2OKtquU5x/38R9qd/cQXd1AsS4OI5
	WJUtuY1O6a2i5wf5ykhogtbWuDsPkvp8PcV0xcMr8kB1wAlme96SHLL01joJ+CI4Tae4
	TLDwgJb9Sf0UFiDCuG7FazWWNPJ5oDM6Aa3q/ki+oG3gq/vH/7UUtys8KcKx5aanJogF
	2IuLxg0mALuCHMi1HQuNMMBzWi/Y51MM+vyh4iXv6KF0JE15WYwNNVp6uiCSf3FoWWOx
	edJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=PIrU5TXJVpuoBGAJ5WMK/veUeOQU9F1BWjTRGr4Sy5g=;
	b=td9at1ZX1kA/LpGrv7BmE20jstwY5mDH6lQ+OUjfu5lWCO051pWqspFL50eEJQi9T6
	w4AywkfwDWWAjwQunVuOUSMiEGtt5FPNup9EYCWeDXai0NiYzwBf7r9ZD1eTe6N/6htH
	jVCO0a5UNrHh5XX1rrX7fZdaN/g1JQQ9XPQOWPuJhmMZfwDio4yBNDmuTInBzLPkGFqQ
	yHTiklsL1FTTmNUujQE+jPh5K0ZlFkAJE3/KJ/Sc40nnqDN9Pb84Sy2ttlDyWbbVG/Rq
	cqi7l7Mv8jsHbvomk6gHnOLDSWfHQKm4GTYKFVm/K/oyvCfhXst+4WgErGu1Cxycn8vo
	JI+Q==
X-Gm-Message-State: AGRZ1gKwx4nHNIGhfWTMx6Y+V2LV4EYH11oWyO6biwv/eBt3V/zhKm/J
	l5nH5WePZdMTloWTr/zKgCkmeA==
X-Google-Smtp-Source: AJdET5ceQdrcnYK9baihWebpAa9noCzoIRvBslNwCtMFOy2ZiN242ZUTiYSD5uTqRCaHXeJizol5ZA==
X-Received: by 2002:a17:902:15a8:: with SMTP id
	m37-v6mr10064383pla.256.1541791216759; 
	Fri, 09 Nov 2018 11:20:16 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm10355007pfg.128.2018.11.09.11.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 11:20:16 -0800 (PST)
Date: Fri,  9 Nov 2018 11:19:34 -0800
Message-Id: <20181109191933.6641-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181109191933.6641-1-palmer@sifive.com>
References: <20181109191933.6641-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org, richard.henderson@linaro.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH for 3.1] RISC-V: Respect fences for user-only
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
X-List-Received-Date: Fri, 09 Nov 2018 19:20:39 -0000

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
---
 target/riscv/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18d7b6d1471d..624d1c679a84 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1766,7 +1766,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
                      GET_RM(ctx->opcode));
         break;
     case OPC_RISC_FENCE:
-#ifndef CONFIG_USER_ONLY
         if (ctx->opcode & 0x1000) {
             /* FENCE_I is a no-op in QEMU,
              * however we need to end the translation block */
@@ -1777,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
             /* FENCE is a full memory barrier. */
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         }
-#endif
         break;
     case OPC_RISC_SYSTEM:
         gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-- 
2.18.1


