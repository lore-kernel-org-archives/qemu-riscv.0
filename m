Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqz5-0005N3-J8
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyx-0004vj-Sy
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyr-0007XF-Qc
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id np13so196470pjb.4
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfu2QZ3gpRQ8C8fsN7554x8wxijvHESDqJdXEHq27p8=;
 b=a1YR+2BJtRX9o6BMOYcBV+wrw+PCXiamdbTRbPfuwMVFaTTxWYGRUp1aYeXqPs2IjY
 4lKPGb+2/jDEU84sSnPK/a4Dls38eD8gECwRsVKeYMwYD4e686/NUtn4dGVLm1dApfIM
 p4jqWHtXP+kbj43Dwf2xc6aOgi7vAt7h+DJ+Sour9uCsmGJmKH2hyDdwAD699XRFH6XI
 IAMGIAIpDruqbHMVtMNt8zd0624C4FMq5WPnhSc0jDA4sNRNVzfWJDRv8as1S/eA19Ta
 XRlXsFwVyMG0VSxCRgtz8NBwRHJwaycMxjPKetQxZtgDhpAoV1nzMZ4z0FqBWAEg9ek8
 9Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfu2QZ3gpRQ8C8fsN7554x8wxijvHESDqJdXEHq27p8=;
 b=Cg3RSjObWr3XUSMq55BREws5NqkLOgNyMH6u4UH5DI5ZtWuSfdS37LU878aZYW0y/F
 ea9sqI1sL6DxMmGvr/CWDUdpda8TKumnJmbZuKWNjZdsmJjkOspNp3ipYsd3fCTplARr
 FaItaPueEGnsMJwdBZSGOd6iT/qr4JCGlsVeZB37U4Rz1dvAnk37ySiTVwcqZ23z0ZOX
 FrZxt+y6I0Q+bJS+SMuDCSZdjxvr0yEakuTblJ3EYQmMcnabMCLA73D+SWvEplRsvaDL
 jq58uRSgS9el6RAXOHXNkDLCOKvNQA6j6ieqTL57OmldiXZgPjLoeYHrjby9Rfu2kCZo
 FRMg==
X-Gm-Message-State: AOAM5325zoKujHYvuUzvxZo9zIah+oZ777/gnUxtcs02Yay60RSf9KpM
 r3oqgix3QuR0LqDTWY6EE0Lpfg==
X-Google-Smtp-Source: ABdhPJwA8If2BMlgsJBNUtc7xyC28fK74XJFeFCQcGGG7eYwcdOpgBm+BXUJuQhvKBxlDH2tCx38cg==
X-Received: by 2002:a17:90b:1283:: with SMTP id
 fw3mr589113pjb.99.1634657084471; 
 Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 07/16] target/riscv: Properly check SEW in amo_op
Date: Tue, 19 Oct 2021 08:24:29 -0700
Message-Id: <20211019152438.269077-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:52 -0000

We're currently assuming SEW <= 3, and the "else" from
the SEW == 3 must be less.  Use a switch and explicitly
bound both SEW and SEQ for all cases.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d60279b295..d16446d3bb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -704,18 +704,20 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         gen_helper_exit_atomic(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         return true;
-    } else {
-        if (s->sew == 3) {
-            if (!is_32bit(s)) {
-                fn = fnsd[seq];
-            } else {
-                /* Check done in amo_check(). */
-                g_assert_not_reached();
-            }
-        } else {
-            assert(seq < ARRAY_SIZE(fnsw));
-            fn = fnsw[seq];
-        }
+    }
+
+    switch (s->sew) {
+    case 0 ... 2:
+        assert(seq < ARRAY_SIZE(fnsw));
+        fn = fnsw[seq];
+        break;
+    case 3:
+        /* XLEN check done in amo_check(). */
+        assert(seq < ARRAY_SIZE(fnsd));
+        fn = fnsd[seq];
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
-- 
2.25.1


