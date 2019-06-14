Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hbpr4-0005mj-5P
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jun 2019 13:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58537)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqg-0005aT-4C
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 13:18:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqd-00075b-Te
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 13:18:45 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37661)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbpqd-0006hk-Iq
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 13:18:43 -0400
Received: by mail-wm1-x344.google.com with SMTP id f17so547629wme.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Jun 2019 10:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qBxTdhQNZtrN8TCgxYqVNYuvZXvpIW53Hq/nYGE1p+s=;
 b=M1DmIUjJySM8HeXdTGllOAnCV5BQWwrV1ZQFtLnDqxSe2LLP/N+uoi7AKRg70JDFSJ
 oaPMDLXPqfdBoiN2qTzSdyo9HkxQbKz3psNqrDLueGza2A5702DY+6pfV2by6zN+ksVP
 8LNHPNSNEF2dKg9M71LyVkLbHN/3FGYzfouiDnEcWwWmmRappMgfb3EIC6ryJL8Mr8Nq
 IBWf+blPzV7TKFV+e6rYxhAnMFfjBv7HzzC5q6HtwDy4TXrkm+vr01IK1ep6vOgr/jkE
 9wvXj4Rxd0C0sYh1G8L7uf3iAO1OTW2z96pfBTT+nTbpauxHivoN4HDFKn2df36b+UeI
 ymgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBxTdhQNZtrN8TCgxYqVNYuvZXvpIW53Hq/nYGE1p+s=;
 b=R/jO1R7Ll/ua1Gu8Ujsx8PO26Nqv3cXeJzyAuQoC4ZFJ4CYaPN4tJPZBDxp7fgwSDt
 DwJn8zXxGcpNq5vj+Wk45u3lSX7iOPVolj6HVvtQOnQiFD3EZB75pWlyeymz6B3SqX3k
 LPJNLQKdbHuaVDxzBUX5N8jAKzfvQXoYFgT/DPDm+wKu2/0F6iG8HH7No0k+3kTehwSt
 5+OFfjnpaEQtDfVGsbY8BlAvcYjUwjdDf8m3n0lnXwTibXVTsCiFj6Az9nQnobkixaDy
 hPV98JvJs+LIAQ7peIwVwiKeWn5Vzjw4tyn179lFiz5GJ+SmlTyadkUsJFIXsA6qLxJF
 aheg==
X-Gm-Message-State: APjAAAVAi44xG6/7ew0+YVp9RL/XqiGcpOzu2E0Bmg+vubqYTme8C4KT
 XtG10mkozqj1zzObr9c+CTvK6g==
X-Google-Smtp-Source: APXvYqzVzcy/lNHpdyTqDBQUqPXBwnbG4otD543eQwqA42aI8vWZ7Xz/YgCZ6NYSB2WR8ltP7bX9mQ==
X-Received: by 2002:a1c:c549:: with SMTP id v70mr8517710wmf.135.1560532711546; 
 Fri, 14 Jun 2019 10:18:31 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id s188sm4164408wmf.40.2019.06.14.10.18.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:18:29 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 697DA1FFB8;
 Fri, 14 Jun 2019 18:12:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Fri, 14 Jun 2019 18:11:43 +0100
Message-Id: <20190614171200.21078-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-riscv] [PATCH v3 33/50] target/riscv: fetch code with
 translator_ld
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
X-List-Received-Date: Fri, 14 Jun 2019 17:18:49 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 313c27b700..899abf41fa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -793,7 +793,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-- 
2.20.1


