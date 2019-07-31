Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hsrPn-000528-OI
	for mharc-qemu-riscv@gnu.org; Wed, 31 Jul 2019 12:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPh-0004kC-48
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 12:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPf-0000Fb-5K
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 12:25:17 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrPe-0000Ea-VQ
 for qemu-riscv@nongnu.org; Wed, 31 Jul 2019 12:25:15 -0400
Received: by mail-wr1-x443.google.com with SMTP id x1so20467772wrr.9
 for <qemu-riscv@nongnu.org>; Wed, 31 Jul 2019 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KilUfW5qE8/qCyjKP1J8YJaC2amH5E2ZqjPJpVHgBQ=;
 b=tj7Eo6sqm2GcI0DJtEVG85i84SqjoykzrrEnT52+0xcOKzYKLkz+AB0JBDVKDoMI9v
 TGxYf1c25rKALLef4Tn3KF6jLEI9vEd1gZCdMP60aWR22I6M2yTES8+6AfVXOyHUAhpx
 bNJ5eCJoTUpEr7lzQ6Yc2n9VBC++ROgAjaDC+NE6Oy1GwhsA+4EMX9rQbqa0VbWh+Koz
 2ot0fA2FwuAg+07dlc56oOsW4jr9UeOc+rHMcBuMnvLcEWBFzW2lnt+82p2pGdQ01D12
 q4N8HdEL+zYdAlGmcrmDj3oi2S5oxaskz5E6x1svlmeLpL0XvwYu8lMpH5kfylQm1nt9
 n2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KilUfW5qE8/qCyjKP1J8YJaC2amH5E2ZqjPJpVHgBQ=;
 b=txEsVYkV779Srock/6UsWiM8St3D4F7Awfbah7guMSsPkIKhbnjXEVj9Q1M9kldk19
 XpuJ7U95o6wXNbkOvhoRNo5VV+wgn47Xo3nUXg8Qhk/k1tv7ILfflyNhIYCi5rqZ2Bpw
 7YZ/gxc99HKqPd06hjS3J5bO850z+yID9phMf5Nfxcz874rMTPvvPX1OBblV1pcX/0GD
 xiXdOnkHi8uu9gUsMYyg/nukHXFhk+NK2zFkTBMs4ohfahYRwVYgT+xXU6L4ryspTw2C
 bdAtMh+aYtiHCs+yEKY5kiWuCqaHhWBR4K8XdsAu1XdUOUS62x18rSZmTY/B0MNqDCFL
 bDDw==
X-Gm-Message-State: APjAAAVMaPAR1E5bITgEa7QSCrS4K8+AI09XRZAi3M+zyDLrmCBmX7UY
 uq1xKduAJpben5owMys7DMuJ+Q==
X-Google-Smtp-Source: APXvYqyJIUlDhKfWYo4qh3ESjQp2QpEacFk9TGgyRsVeGYmH/zJEx7DsSB3+mNkFcdRbLOWfi59z4w==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr54233807wrt.336.1564590313436; 
 Wed, 31 Jul 2019 09:25:13 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id w67sm89785102wma.24.2019.07.31.09.25.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:25:12 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A82C1FF91;
 Wed, 31 Jul 2019 17:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, bobby.prani@gmail.com, aaron@os.amperecomputing.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Date: Wed, 31 Jul 2019 17:07:03 +0100
Message-Id: <20190731160719.11396-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-riscv] [PATCH v4 38/54] target/riscv: fetch code with
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
X-List-Received-Date: Wed, 31 Jul 2019 16:25:21 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8d6ab732588..73cea63e4a2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -796,7 +796,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-- 
2.20.1


