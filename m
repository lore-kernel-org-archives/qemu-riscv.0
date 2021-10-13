Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1malE9-0007um-28
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 16:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDh-0007cZ-74
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:25 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDW-00088g-Ut
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id m21so3454071pgu.13
 for <qemu-riscv@nongnu.org>; Wed, 13 Oct 2021 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D7b+ydnd4zMrVyDCywxRov6Sf650NgZr4E9SJVFsXBA=;
 b=dXbDW0NIE255Ziv7RFBPFNjsyhlhjaaNb0LuR4itErhnaWOUQEzx8iHH1oQ2CMBOHH
 afJQRy5B4oSw+R9yPFe6jl1LAzEzw713gMt/RRR7J9wWeyKBQE9ohEAih3t//CAMps74
 tkruXm3kb/j+5sGGXgXcWk1qn71LXlvmqdJ59HyhpHqjaTSAp4OIEXEIDMYVHd6At1k2
 ps4MF9B9i9IKSfhGxyo43qgYC3QVxkleYfSV5tvUrjck01hI33DUUN+vAZQ9nIl7R6uQ
 lFdmbkSi5eju6vgrJuDXU2bq8G5kgSV8ghA20OBaS1brzN2nSGms6YvJnG9WJAJenW1v
 2LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7b+ydnd4zMrVyDCywxRov6Sf650NgZr4E9SJVFsXBA=;
 b=D2idsqJuXo4QHbuNF0Tac1mZWf8IbwiuiMpD/v7Zj+ZM2y7fZqHcSH8X6Lj2QWUD4T
 oFEdAAssk8gjkREAcEyIUntHJo4t0JzxsiUcdFHlNL39asW0aodS00e6wxnIM5Vn2cfu
 TVXjI6W2jYLKvHlYV7q7yhT3Cbxz5dfGXWg6RSWu/0G/RZWcYnTr8nr5sWgHlzswzxq8
 tyW0fXMUP9GzBj6i8D1ZQ9mrSb8UlfK6cahGNXc/W98sGlg2T1MVr8sW3g2v8xNhkqld
 VCwuGE6Hf/l4R0QJ3Y/TEd9vV72AmCGiIpJt+EaEbdwwtTi8ExPNAPVaTRAdBSKa+pwB
 fkVA==
X-Gm-Message-State: AOAM530hB3H2T5gxQfsf/9tbYQd7Xc02Tef+LgGqKRI9JtGmALe9rYrF
 rHaMT7kliqNHNwsTU6+emfRlaQ==
X-Google-Smtp-Source: ABdhPJztp8wFqQ6j+yBm3WuhCo1sVbzc9VEpQ9sJ9fHAETBXvixS3qyA9/66JS3p7TYtXSTl4j5h3A==
X-Received: by 2002:a63:9542:: with SMTP id t2mr1128771pgn.428.1634158273387; 
 Wed, 13 Oct 2021 13:51:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 07/13] target/riscv: Properly check SEW in amo_op
Date: Wed, 13 Oct 2021 13:50:58 -0700
Message-Id: <20211013205104.1031679-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Wed, 13 Oct 2021 20:51:25 -0000

We're currently assuming SEW <= 3, and the "else" from
the SEW == 3 must be less.  Use a switch and explicitly
bound both SEW and SEQ for all cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bbc5c93ef1..91fca4a2d1 100644
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


