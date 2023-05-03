Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6SJ-0001JM-K1
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rk-00009m-D9
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qz-0001iD-TX
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29132515e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097073; x=1685689073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=hR7LDUWjjoAZKm3sWKBp9w+OBdrqFzC0817vWjPQUfUKDWFeReoJZTrExxPnY3UIte
 2m8PKr+XxW8gMawUgGd21WObgIJrliGx/t0VCxwDfPFXy9/yzpaPX/63csKJAe+Du1mq
 Is3Z1Eus37L13/1/CVuzmVmQesh0hTAkU5zM0pXcMqo/Jj7cAPwG8WYzG7CILdhdWGpC
 DaHxHkN7A/xehb3wuDWVYwhE9krmKnqgmrQxX/fYiC1nOHCJneyqvut2ywTpGSriR+19
 gRlJKTGlqOxoXBLzoqbGhQ356tE7pAUkIqMx3Bg51xGhZ6S436BXcK1rT7dxz19R+y+b
 wy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097073; x=1685689073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq2h9X5UNDb637fCQb6pFT3eLaF1A8JaUegXUakX2qE=;
 b=RmLc7qdHaMjoNlYLycI9VhXU/1rsv3jV5/bOyGN3YW0GYjrNUfkNRknFGdWyTl9u4P
 0k3ZJBPSkHbTPMDqt3c7vnOXXcbyWlcrybj5hYCODtpgInPida0K3FC+8cukV0b95QHO
 LaODK+JiosXFlLtkNyxvUPxIGfR/8qO9ofgs4VBa5TsEnPAzr7zyjnsq5yWrk8w7ImwD
 l4a/L0HSVNf+GIoxkUq6mRUiEjDTBkw4KQ3EfkUnLHOHclavhrEq9VvQrxAIIF7u9wGc
 tl6J/82+htq1tZ4IgB2Yq52x3X4ov2DAGnjZRMI3BHgQOBOQtx64Z31UeNXw9h/aoI7x
 dsEg==
X-Gm-Message-State: AC+VfDzuXrnEVQBeIyR2YDWDPcumI+XdclmXnRIi6I48DYgMdiQ5qLRF
 jZEcdfO0NKfLa3oOTWPyLRxi2A==
X-Google-Smtp-Source: ACHHUZ7tzwdkXh08fuCCnPaPIe5AlYllLbQ7zqHUwgFuXgbJ5y4tzvhQHmb25wSKl53d92C382vYtg==
X-Received: by 2002:a5d:474f:0:b0:306:2aa0:ce81 with SMTP id
 o15-20020a5d474f000000b003062aa0ce81mr6509556wrs.30.1683097073091; 
 Tue, 02 May 2023 23:57:53 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 29/54] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Wed,  3 May 2023 07:57:04 +0100
Message-Id: <20230503065729.1745843-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 May 2023 06:58:54 -0000

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index dbe4bf96b9..7e6466d3b6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1636,10 +1636,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
-- 
2.34.1


