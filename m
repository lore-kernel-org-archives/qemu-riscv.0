Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YO-00069x-RK
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YJ-00063m-BY
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:35 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YD-00041u-1Q
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k24so9894018pgh.8
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NB34SlP+DwlZtT+3/++bIyVI3EtNwzmeBqj9HTXD30s=;
 b=s1GEMSRQsE/16UYST35LfowXzoDy52TpEKz1UaS1RvNhZoZJMyRvH9hhnB4hcOFrLn
 KrXw+fl2hEDPh1CQloWdgeFxMOI7z/xCXwv1AZGY6ThzR5YvZ3gi18NP7AoNTF9tV9a6
 WOHSTJxP8p9QMeahBueNCIRlQSkT0Go4CcjsonvXmfNHrQ9f8lRMZU/Kxu0YYUAYQFRf
 NzdP+X6GBGr805agktPVD19EWWDfLf7uUzVy6D8plWmnUkM6n+b6K+rL0Qu0F0JrbjXe
 FAONtHx5nsccoxNqOLU0ZK3fubSGkk5I3cI4yA2P92Te6fNUJj/WLm/oCYhdhEV3l0O4
 ggPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NB34SlP+DwlZtT+3/++bIyVI3EtNwzmeBqj9HTXD30s=;
 b=Ap1Y/vQ3JLrZGCHgSgf2behJv4O8ZV+QY/RVZHi95qY/UMHlmsuG2P8TeQxw0LuSL7
 qUpTAg5GXe9ddGk7OoH/ZrBxU/FZ5uiL1RNb6/tlE4gTIyOfFNvJAiS8DELx2VOrWs7R
 tXusbciQnJ4TlljtAlq3qBWQND07KrRFjZ6cnMW46TGiXn1qLT+2SZPE4moVTf8ef4P2
 26oM9GxHq0s47b6rLM7vf3Q+LM8vS6gd3r4/BPSDZnAAs4ypM0h+Jd/jW0XsLZr39odX
 uMi0I0b9ruE1Aj3wAMITZ9PrhMz5JH0h+mbJhcoSkq2wWrNey9feHeX0PO3fRpR8dROE
 flDw==
X-Gm-Message-State: AOAM532SuLKcmVTA4dPiSjLVYy8cbo5qUI+8fnCLDF9PzYZy50lkjiHd
 ilC0GDBxXn2gN9ojeA8fXvnf7Q==
X-Google-Smtp-Source: ABdhPJzIw554ptSrE3lA7SMmHuPIJqKdFrXEcYL0mdlMft2XTN3FhA7qb0IprcZ/iYsfqIVngyekWQ==
X-Received: by 2002:a63:cd4e:: with SMTP id a14mr19529878pgj.429.1629481407593; 
 Fri, 20 Aug 2021 10:43:27 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v4 17/21] target/riscv: Use gen_shift_imm_fn for slli_uw
Date: Fri, 20 Aug 2021 07:42:53 -1000
Message-Id: <20210820174257.548286-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:35 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b97c3ca5da..74cb93a2db 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -635,21 +635,18 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
 
+static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
+{
+    if (shamt < 32) {
+        tcg_gen_deposit_z_tl(dest, src, shamt, 32);
+    } else {
+        tcg_gen_shli_tl(dest, src, shamt);
+    }
+}
+
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
-- 
2.25.1


