Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md26V-0006wV-U1
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26U-0006qK-3u
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Q-00012C-Lp
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:17:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so1415592pjb.4
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UakmtpX/ULO2Fxh/+VRPEmYBUzLO6qfGKR5m4Cqlo1Y=;
 b=DmA2mxyA655Ycr+H014vUT4DEXePkf0xbHXfa/VlZTFOfcmzHAUZKwgdy1116FBQOX
 KF+Fd8SlEElIb88rAyI0l2AHv9hapnfZUNx9Gn2zcXHMY5VLgWrDDD1ODfpR+Z7JLgv/
 orVav7pQoaDcZmc2pgpmxzy3WdaVA94NBJ5ykGC6bzTZWu47rlvQJkrQ2belmHApM8IZ
 JhktCnzl1cSfQCte0RO+FvgXuDXHhNusd/9/VBXnd1k9EnArjJZgTq7kU2AKMi54ZJXN
 EZmZmDucNf3NUtbLfSBrpnTa4f5SwuqLDQe/HKbpMjq8QfjEVjVnDILyiMK7EIKpIRs3
 sXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UakmtpX/ULO2Fxh/+VRPEmYBUzLO6qfGKR5m4Cqlo1Y=;
 b=utruMvBSSV5n4+vamUJRgLzl5HH7NysKUrsaEatn8ubnWzNpq8I76cJ/J16Qh9mzmS
 N2kNpCdJb1rTbJZYwKpiwLmM2svDFS0BU7nLZoYly8wHlcSsv1PteUE4eKmVE6LS+UDj
 zx80tqZZ6lkHzYvrpjBuQtM3uZy7jnPGscAymQL1tZZO/6+XMQ6ESFZSUdN0/8eY3jYv
 crv2HgpU9u80cGmM2cIZE0N+tb74yf+skzClOOPaqPWBrcg2Cq+VlmsGC1jkC7Iv3e7M
 Npr/nhL2/mOQeKWzA0UjasqN42xUOVG314/pLY/EPzv4Hl0lDcuus7dfutYXI6482nmj
 Xe6g==
X-Gm-Message-State: AOAM5317RrkWuo5YpNXdnEVamJJ+qpwsZtHhKouhbwiTW2gOOpTnT3G7
 pf6/AEccDKkMzWMKx/LEP9oSbocI1dEz8g==
X-Google-Smtp-Source: ABdhPJyukr8eexkohQjfU7mZof4Yna+Vm3H0WyAKryQzSxnhn7/znsYVkzB9uIvxczZfZfQxc1cc/g==
X-Received: by 2002:a17:90b:1e49:: with SMTP id
 pi9mr4413311pjb.144.1634699836020; 
 Tue, 19 Oct 2021 20:17:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v6 07/15] target/riscv: Properly check SEW in amo_op
Date: Tue, 19 Oct 2021 20:17:01 -0700
Message-Id: <20211020031709.359469-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:17:22 -0000

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
index 61fd82d41a..a102c3687e 100644
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


