Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCY-0002hA-Eb
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCX-0002ZV-5V
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:29 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCV-0002aE-8j
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:28 -0500
Received: by mail-pg1-x52a.google.com with SMTP id s18so2855914pgq.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2yx2ICVs1zB6ngtjHL2Am0/1UDD6BkdCpu6nOfJ5a4=;
 b=y99zt4oaIdGSFxgTnRbqMaQNSMHu3V9TkK4/lrhBhyM9ixnNM7WLXvwqkP9v2Z1ip/
 GqngGiSAjitx4fbgTDzL2d1HBjWMjR9IrRBnTuHpw98gpR2tYE0oLkf+RfkE5YNxQdzW
 oj/9zwOtWnryCwsRh2TaJRImktZC5IC3C7SKE74nFfUqslYEpqwU9/YRhvMhyYa4zx7Z
 arerNif6+5Fxl92NPcuQbOY3Zt6OxG0LIo4Mwy06nX3LDh19OpR/TX6BGdCXR+o6TFRE
 ajoA1XtzwnRQsYHtODhYoF5wx+WBoSNeSHavq7ceYQfGp6jJHzn4lAEsAN7itLWC/nRX
 HxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2yx2ICVs1zB6ngtjHL2Am0/1UDD6BkdCpu6nOfJ5a4=;
 b=HynyEOeSCuTsQHu+UpHm3JhxzgS5LiibZjaS9vduuPUpMKu3GGzWlmfkmQr21lt4eA
 uWx2MForMHf2miy+OpMAPNJ52t6vj9QPu1mkCi1HEg1VeQu8oy7RvaF8YkzCr88jDlkz
 7UxCNLR37XZRlXF5pSA83kBfBmHzt30j8sFWSXQCndnEkKa+Qr1UT6vzS4mCXDyYm2vn
 0JlFfmRTXtK929xL7kkcEKOWAjCCK4YGFf5p89sagEPp1DgSho8ijFdUQtA5P9j1Gk/W
 Z90u/D4biiiYbV2ZpuocB1A3x2ip+h+P1eBXA7gHWJs2g+RIsTxRZsQp0ZZdFdw9rPqQ
 SENQ==
X-Gm-Message-State: AO0yUKVpWVi/ri1D58V1NSxY/FCzeZXR/CYwsQlapjeekPNlTKfLp0Sw
 5tDQKy9l4+QY4W6avDP31eCSNg==
X-Google-Smtp-Source: AK7set9I0oPNr+2dSXzXrqx2AIX03HdrMSqTFwqKLfgD1t8s58t4S4SiDayXAqZADoyc6erCBTDyAA==
X-Received: by 2002:a05:6a00:47:b0:5cd:d766:8a2b with SMTP id
 i7-20020a056a00004700b005cdd7668a2bmr18687656pfk.6.1677476245649; 
 Sun, 26 Feb 2023 21:37:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 07/31] tcg: Add liveness_pass_0
Date: Sun, 26 Feb 2023 19:36:37 -1000
Message-Id: <20230227053701.368744-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:29 -0000

Attempt to reduce the lifetime of TEMP_TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7ee935701a..6646770268 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2858,6 +2858,75 @@ static void la_cross_call(TCGContext *s, int nt)
     }
 }
 
+/*
+ * Liveness analysis: Verify the lifetime of TEMP_TB, and reduce
+ * to TEMP_EBB, if possible.
+ */
+static void __attribute__((noinline))
+liveness_pass_0(TCGContext *s)
+{
+    void * const multiple_ebb = (void *)(uintptr_t)-1;
+    int nb_temps = s->nb_temps;
+    TCGOp *op, *ebb;
+
+    for (int i = s->nb_globals; i < nb_temps; ++i) {
+        s->temps[i].state_ptr = NULL;
+    }
+
+    /*
+     * Represent each EBB by the op at which it begins.  In the case of
+     * the first EBB, this is the first op, otherwise it is a label.
+     * Collect the uses of each TEMP_TB: NULL for unused, EBB for use
+     * within a single EBB, else MULTIPLE_EBB.
+     */
+    ebb = QTAILQ_FIRST(&s->ops);
+    QTAILQ_FOREACH(op, &s->ops, link) {
+        const TCGOpDef *def;
+        int nb_oargs, nb_iargs;
+
+        switch (op->opc) {
+        case INDEX_op_set_label:
+            ebb = op;
+            continue;
+        case INDEX_op_discard:
+            continue;
+        case INDEX_op_call:
+            nb_oargs = TCGOP_CALLO(op);
+            nb_iargs = TCGOP_CALLI(op);
+            break;
+        default:
+            def = &tcg_op_defs[op->opc];
+            nb_oargs = def->nb_oargs;
+            nb_iargs = def->nb_iargs;
+            break;
+        }
+
+        for (int i = 0; i < nb_oargs + nb_iargs; ++i) {
+            TCGTemp *ts = arg_temp(op->args[i]);
+
+            if (ts->kind != TEMP_TB) {
+                continue;
+            }
+            if (ts->state_ptr == NULL) {
+                ts->state_ptr = ebb;
+            } else if (ts->state_ptr != ebb) {
+                ts->state_ptr = multiple_ebb;
+            }
+        }
+    }
+
+    /*
+     * For TEMP_TB that turned out not to be used beyond one EBB,
+     * reduce the liveness to TEMP_EBB.
+     */
+    for (int i = s->nb_globals; i < nb_temps; ++i) {
+        TCGTemp *ts = &s->temps[i];
+        if (ts->kind == TEMP_TB && ts->state_ptr != multiple_ebb) {
+            ts->kind = TEMP_EBB;
+        }
+    }
+}
+
 /* Liveness analysis : update the opc_arg_life array to tell if a
    given input arguments is dead. Instructions updating dead
    temporaries are removed. */
@@ -4873,6 +4942,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 #endif
 
     reachable_code_pass(s);
+    liveness_pass_0(s);
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
-- 
2.34.1


