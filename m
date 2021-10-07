Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYXUh-0004Df-Kl
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 13:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUX-00043m-7Y
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUS-0006tU-10
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:35 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso5842102pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D7b+ydnd4zMrVyDCywxRov6Sf650NgZr4E9SJVFsXBA=;
 b=FHV9yYFJPv4guJVXkntYu4zWE5YrpuTZUSgZ9nJEVFHqqVzW0MTA57t0yv4XAF7VJ1
 iUML6/Jo37U961AYGE+wl9CabLdUOGiolI17jD1cnQ5ABACrnXoakg1V78J++4m1V0tP
 NI4k2uexqwjFgLhnoVGqgZFLFzhiGVpo4fVXtJacv4rBAvNYMIVcf+RuzPXpDkXNIuF/
 WT3gE9gkmI13SKPRnIzmEUmACWDkRQZntH4+nerOylWYAM0Sw61+niS0VBBN9b1qnEhu
 wZPmetJdlV82I2FP15kD7MYwvooSVdnYGsqeThsa8pViDd0MrnkI5uWC22b9KpKA8aRW
 TlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7b+ydnd4zMrVyDCywxRov6Sf650NgZr4E9SJVFsXBA=;
 b=PYAsx1Pl1BZMkh1dfVx1hkF7l9qH7Dx1LUy019yZ1Xi1NixPrZL/lBnTySjdgy8vdM
 n6AqCFW9bkAMVeDluwb6vxg4MZW4NO/ssC3gOgI8rmxxMuuJdZUjiA7WIVQPqQRnGVx/
 8MOUJ+d29L6Qv+/cxRPuHrm5ivkwOzj8+mHS0+yikyYQCX94quV55mqS3/wB0ijNHdqU
 KyZEjKY96KWXcSGYK/05pzPHXDESYylK3zseZtP4Iet7IU8ajfqxbAhKugytyToTwLx6
 1fOynvmylFGebhVsBfsd4M1BxIUl60ah6N/+XzymIrhsY3I+ry0UdnVqtmi3HmsKGUo4
 gYTg==
X-Gm-Message-State: AOAM533/UCk2Re85rdbLfe+mKjm8T1Zp2rHssNxs5T2AoUA3dKUZbNzu
 L9JwHfCRCFWSUmQt0CrVV8XTjA==
X-Google-Smtp-Source: ABdhPJxEHihclvpBRpiEUTQj7OsT53YWwd9dI0gT3PHSlC7tYL0NZTQQK/BK/EuuhlT4YYLFYYtreA==
X-Received: by 2002:a17:903:2403:b0:13d:cef7:61f1 with SMTP id
 e3-20020a170903240300b0013dcef761f1mr5209951plo.48.1633628849388; 
 Thu, 07 Oct 2021 10:47:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
Subject: [PATCH 07/13] target/riscv: Properly check SEW in amo_op
Date: Thu,  7 Oct 2021 10:47:16 -0700
Message-Id: <20211007174722.929993-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Thu, 07 Oct 2021 17:47:44 -0000

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


