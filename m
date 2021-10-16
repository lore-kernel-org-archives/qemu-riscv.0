Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGe-0001OY-G1
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGM-00012T-07
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGJ-0006Cf-FD
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id g184so11679066pgc.6
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sefFRWXuAIwA9Hn9aMW9zKhBMiydf7kE/zMEjZquoTs=;
 b=FinqihW5F838ZFLUFQXSASvcn4kgsAE233XQSszP7T8g07v7J2OuLhq70Wn+G3rr0G
 FZerP1aDK4OYppbSaX4mp3Rgc3IWJ0fz+XwcKC6a07PMqc0D3mKUIYhMudGKma0BHIIw
 e3poNEMilyJxRwYxgtvV9DZnUvgMENiJA3A8IygfcIVPrbdueRWxn5u5DHAqs2OnD/j/
 sVv1SFWoZm+EEpYnsPCW+ia2z/BL3cekWXXW0EJG8w4mAfv93vdVvjCLoVFceyjbX8xw
 bJnpPcJqxD+sb9TpH4ktYl/RZVHwzVpv+BWXdMAuPtvCjDuwepvbZa9ybHK7vN9WI5s6
 f8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sefFRWXuAIwA9Hn9aMW9zKhBMiydf7kE/zMEjZquoTs=;
 b=hZ7UbbEMKbkwt5jEyDI+2ZdOai2z3yXWzEaSU/1vvbwiaG4vOtFfnj6vFhdRkYd9/0
 flAsoTbvToM2IhzpyvNnUiSHMjQf2iT4FmkIXJU6qOCMrGeu1MF0Mb23Xqx6HgkjD3W0
 crCj8jqr9KeNmAX5SD4M5XLNeUtsTerCXoJRjfwSvxgZKLzoq40sT7LvKNGWJ84H8yS4
 GcRD+q3CTUZpknQ669Pf9bJLEjI3FKrhH5t8+5He0nh0UQlKMmgAO79/3uYqhHzRIS/Z
 7VtCk3iHNojAnqTzLwluqRhIFiOFczt/0SzWQRkqT+ClR9w0QwoAZGO5r68En0nQ9b0k
 yGmw==
X-Gm-Message-State: AOAM530qnyZTkoMAl1XaVntPGY8PZVsDsCuLpdKVshqwhejsvtVSakav
 8ubims4scCJHoH6ryRdjgbWo/w==
X-Google-Smtp-Source: ABdhPJytipreVyb9xVymZdp06ulsQoSugUFsDDvJIR5XEIPoKDkdyqq45v+aLQtYD2PutXL9kphxbg==
X-Received: by 2002:a63:b006:: with SMTP id h6mr6913792pgf.366.1634404461409; 
 Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 07/14] target/riscv: Properly check SEW in amo_op
Date: Sat, 16 Oct 2021 10:14:05 -0700
Message-Id: <20211016171412.3163784-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:27 -0000

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


