Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvZ-0003VS-UG
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvY-0003S1-8M
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:40 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvW-0005pK-B8
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:39 -0400
Received: by mail-pf1-x441.google.com with SMTP id m9so880205pfh.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JuRgjPtCOsLpIolUZl6gtqC4JRe4rAh5K9WEhSEkR1o=;
 b=WCs8HflbE5pzpfdq3qJ6ogzhJgceaZZWH8/TsFbyFy8dwlKS+YKNXapnFn/6YvPQ2p
 EwjbvBP8uxM2cIozsOTrfMAG2H84sZZF8FCEaKIB6yB9veaqeabRHr6dxLQGZzfrzl/m
 UzqptjlxZ+ca2BrLxuNIIWHMMt5fzBaP5QUAi7Jhbhxai+rkabLC109uFPatiCohzEem
 eOMDpFPOrFmll+v6DN08sjisK4jlyEddEHthLuYMVYI816p4kubm+OhwAsfm6KZHYo3h
 hMACme1KEsiQn8bbA9n749dM1t3D5SfajxjYy5TUOxxEhhVLSeFnvveTDl7ILaeiJPhI
 pvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JuRgjPtCOsLpIolUZl6gtqC4JRe4rAh5K9WEhSEkR1o=;
 b=lnE9EUS4w8tnThyCNZ0HYYao8SskSb3AzZL3aolIosjeacxDsnzoNlQDiQ0Ktm+7SP
 fHJxIpiHU45I2kf8VGKN4tTT2eJCx1ITVvP1JRGYIS9S2IeILucMZyIfo8aCAjosb/pp
 BZ23SOanRNI5rJj8XWvZNkQUcC90xKJH5Aw1ZsULxxErJdF4CJv+DcMXXKKW0gZ432k2
 txDLApuI6UhMjQ3bkzfRouoP33TaHrz9Rn2UlbrTNF5+nDLvekcOb3ruP/RAf0DWNu4S
 TZGfkGLS+7eWwhATtUjo5wOltFN3dxv/kXfi85I5m8zaCO+h6zghoIUoJnDFZK4t808U
 +lpg==
X-Gm-Message-State: AOAM533nBj1DqT6GtcTf1ZjfuI96vkSV8ZGTMhMbrIKCyiAVAKc5xapl
 1SrHHRbSXvwC+vC5+qJsCQrhlg==
X-Google-Smtp-Source: ABdhPJzSPMS/U7lUYSz5935s92fdL9F6shs0vCiaeYxzsCczf6x1O9D2UM6tBb5gIz29nx8r25UjQQ==
X-Received: by 2002:a65:5c08:: with SMTP id u8mr27176937pgr.184.1595409637209; 
 Wed, 22 Jul 2020 02:20:37 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:36 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 42/76] target/riscv: rvv-0.9: whole register move instructions
Date: Wed, 22 Jul 2020 17:16:05 +0800
Message-Id: <20200722091641.8834-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:40 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.inc.c | 27 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4be1b88e2d..0e1d6b3ead 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -595,6 +595,10 @@ vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
+vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
+vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
+vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 56cd7444f2..85f22a1495 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3527,3 +3527,30 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 17.6)
+ */
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                    \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a) \
+{                                                         \
+    if (require_rvv(s) &&                                 \
+        ((a->rd & ((LEN) - 1)) == 0) &&                   \
+        ((a->rs2 & ((LEN) - 1)) == 0)) {                  \
+        for (int i = 0; i < LEN; ++i) {                   \
+            /* EEW = 8 */                                 \
+            tcg_gen_gvec_mov(8, vreg_ofs(s, a->rd + i),   \
+                             vreg_ofs(s, a->rs2 + i),     \
+                             s->vlen / 8, s->vlen / 8);   \
+        }                                                 \
+        mark_vs_dirty(s);                                 \
+        return true;                                      \
+    }                                                     \
+    return false;                                         \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
-- 
2.17.1


