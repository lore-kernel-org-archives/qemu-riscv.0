Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iL5wR-0006G8-82
	for mharc-qemu-riscv@gnu.org; Thu, 17 Oct 2019 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5wD-00061p-5R
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2019 09:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5wB-0004T6-0o
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2019 09:35:32 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36065)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iL5w9-0004Rg-05
 for qemu-riscv@nongnu.org; Thu, 17 Oct 2019 09:35:29 -0400
Received: by mail-wm1-x342.google.com with SMTP id m18so2582796wmc.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Oct 2019 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zINIjrg5CEtICP7WAjfJ/LHNMUKajz/cR/8/N/SNqEo=;
 b=UvRjCgLv76Ez7h3mX1zaGutHoDWjvqpwZUin/S2MygvBlEUKForsqAfZ/f2RXEfO0w
 mF1Icgl9QQjLj6p9NNfs10lAwdah1+P3faAmRwldEKgvsvo0Rr6vKl3mpPA/NgzWtimQ
 926cudjLIrirkxuO6Eo/aHibeGUBGgLkEffjBsmzyOJtAm41MQ7ED7BVyQ7FuTRLvKIm
 t54YtM9D6VU7IuNX+wpK5cEJdSkvPX4NTbHn4JSemv3pqvly1Gw05wNc+nnjMk/dixa6
 1tvffZHcsNQlR6u6m7CTCz0V37ByUQq9Vy68kioZ1XDic+M7Q9Aa3xA6jZBiWvL1W4Ou
 XCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zINIjrg5CEtICP7WAjfJ/LHNMUKajz/cR/8/N/SNqEo=;
 b=fPVOgQqjH5czDHW//+v69GRo1zAqeG3yvi80uUeVcn7whyzCbXmoNfwdF4tTjVqYAI
 tZfrAlJYlnP4wXTxoyHLqRZ/m1oj0hJorBZ0fsLvvl52J1ztyTc6KSmc6OxEKuGxCR2n
 ail3uGnRhSVVIib5I4vQyE3OZWsoL/17TNbwYtX0CE6E+MzE5mSaduABd3oPu85gKw7n
 f+wHbmcKvv80AkvuK+FbUHQLuhw2RCgCsUgD1msr/U3sFYj7YH9ww8Ricx3/VpQZZn24
 54Q2Yqf+X+UVAoCzBg4JhTUJN1cWIf9QogQCzO9AKBhNIJT+R9eSoVXqhfBEjv3I1Yio
 9shw==
X-Gm-Message-State: APjAAAXmA+wjjQMsGsaf2dZDKZAfIZCAifqZFP3KoPS1c5y83FmpN/o3
 NLKmeGmgq5FJUJlIuUXTN2dWxQ==
X-Google-Smtp-Source: APXvYqz3Yi8ec4OhaPCDeDa0Y3o7bPbClaInG4PhBnDTZClQxp9D9lAaQBtTHQ31EduWCApeuTWUHw==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr3035756wmc.130.1571319326697; 
 Thu, 17 Oct 2019 06:35:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm2215623wrq.58.2019.10.17.06.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:35:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B39581FFB4;
 Thu, 17 Oct 2019 14:16:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, aaron@os.amperecomputing.com, peter.puhov@futurewei.com,
 robert.foley@futurewei.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v6 30/54] target/riscv: fetch code with translator_ld
Date: Thu, 17 Oct 2019 14:15:51 +0100
Message-Id: <20191017131615.19660-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017131615.19660-1-alex.bennee@linaro.org>
References: <20191017131615.19660-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Oct 2019 13:35:35 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index adeddb85f6..b26533d4fd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -779,7 +779,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-- 
2.20.1


