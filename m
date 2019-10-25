Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNtq7-0004wk-CY
	for mharc-qemu-riscv@gnu.org; Fri, 25 Oct 2019 03:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtq0-0004ic-Pv
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 03:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtpz-0007Ex-Gj
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 03:16:44 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtpz-0007ED-9r
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 03:16:43 -0400
Received: by mail-wm1-x32b.google.com with SMTP id g24so856988wmh.5
 for <qemu-riscv@nongnu.org>; Fri, 25 Oct 2019 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6OWosr3vkKtYZuEhZpOOVQK50EP38/6kxdAzEYGV48=;
 b=O0cbxHjU7L9AvD0g3dMSk5Ee9wETctht8caLB2opxTRjFKTAxvHwpKurLzQnpyHCZ9
 eEfJOJnz8cBghbdYpU5B2Xuox9MIkISKsX7N3FXiZkAW7rEVw1Ge7rEaHQJQwCT/l36o
 uPT/vNe4YMPWgV5h2GVAWa0iTLc1HGnWJU2dbKaDUAq5gKKT9eaTKv2fBQEK2EOPX11H
 o8uqZFjaTWFktYY9rO5TbMCxEHj7N/pEtbFUmTBYgOoCt3mXkpAJGh3o3jQNQLDmGvp7
 1cBG4yGE/RcODDOWrqAp3ytUgKZIXkcXtQV7xoZsytXThw2QQ3x5cav8k0/dC34W550K
 TA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6OWosr3vkKtYZuEhZpOOVQK50EP38/6kxdAzEYGV48=;
 b=Vlq1n8YRJbWwfOd9pNcepmz+U5aI5QX9HAjoC4kaIqv/TOiYgjsG/QLg0xqBMiWzD2
 heQeSZX9e+0mfpSH3WF8g1kWKWIHvrw76gM5jCU0T/l4qpXpI2rEtbEkqz+WB2eZA68j
 MX3boJK52+sjfS5iGlThs7cG2283f26pOQgX12LTkEw+kn9HoicvXKIkyI3fX4UH4WUR
 J/lKJaqLpvgyymjmnq9shtc6wbfJtbMyFYrWq/NZ6LCEzDXq6s1oU12yNA7Al6oo41cy
 FBlKrBbSRHYDbpsIu58JR7+qjiCZZpA2c5c4p3shpU5pm8lnC3TkHSSkhBIJXOuI3Por
 y8Rw==
X-Gm-Message-State: APjAAAXKM25CbEsLch0mPtH/GGWtfjFelwp6m/cIpG47HvqDdUUajWdV
 2VHnFjSunwYwH0et+DFZmKnLmQ==
X-Google-Smtp-Source: APXvYqyzDslGrfRHk9Jqdp8fh8HWCByD71g69sMTX9Va0f7CvNLETFTxXnF4epA9/DovNnpy5XyoFg==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr1906939wmc.11.1571987802066; 
 Fri, 25 Oct 2019 00:16:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a17sm1176786wmb.8.2019.10.25.00.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:16:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F5E91FFC7;
 Fri, 25 Oct 2019 07:37:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL v2 47/73] target/riscv: fetch code with translator_ld
Date: Fri, 25 Oct 2019 07:36:47 +0100
Message-Id: <20191025063713.23374-48-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
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
X-List-Received-Date: Fri, 25 Oct 2019 07:16:48 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Palmer Dabbelt <palmer@sifive.com>

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index adeddb85f67..b26533d4fd7 100644
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


