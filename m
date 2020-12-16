Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpM9V-0006pP-Qx
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9U-0006lh-4w
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:52 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9P-0000wR-3y
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:51 -0500
Received: by mail-pf1-x42a.google.com with SMTP id h186so5150517pfe.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xANIL9U+q7VdaNhhAev9PcT5i/fCcTrRk81O4BPTh6g=;
 b=UilA1OcnOajy4PQmYxm7BEu/4uDCWbkBrAJFEsQdrrN3J9fPKu5NrBh4RxzuvOnDJF
 1dRB4O30VL6H2yOVh+gJi6pqYkiyUqpR2rnSMVrKGtwL4uCalhErSEq1AvKGG0XTRbvH
 IPfNip9/Z5XTiHwyhW6+7W8p9vikVB8AgfI0RJH4vbYbEvivmgq4HshqPjHSmIFrR6e7
 8Zqq8ggLA4/lTZnN60wbOcyVVPRTS958LF0esa3oWaXm4VipjmFFjpzFTj6P8YUCQ02W
 C+hADvjl+9kq/Wt0TCD+NGwegaoYv54Hc+MAxurQLXnuGC7K9Ibv2z+1o7mxyckMMveN
 DkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xANIL9U+q7VdaNhhAev9PcT5i/fCcTrRk81O4BPTh6g=;
 b=m5WhdeAFmA8a+b7qEPqpgbUT47rSeojrcKUl75/D1aJKKKvE1SCc9CP79SsPKUdqSm
 L21Vt8ftEcaBvIk4/KZ8Epq4v7Y+6Hgf0LqOTWZTku9pKzcXVDVSFesZEIJMkZFFHiMY
 VLy4RULeQysdMEVS6V4hPhKx5F41N4ypTYwgwBVrBIdX40O/Rf9FP3ZcPKIpa9b2KEVl
 8qQYqZxI0n1eLXoPHpGn25pH0tNP5IL2dorWt7FVMGvK2dTCmSTikWKOJ6p+F39Vpyqv
 l5eline5jNEp6+S8zhWfCa9LmANsW0ELZSdGVBJEflJl6gz4HVzxzjyHcG0yHjzDhqJQ
 Wj+A==
X-Gm-Message-State: AOAM530SWNtV0dLnTdHOt/M/h7Tzhqsl7opKc2YK2kO7KsedDDnBzniQ
 LYh/CbHK3P+xrK1zVufgvMnpCA==
X-Google-Smtp-Source: ABdhPJyc39VeUpWJF+7G+/jbt+4nSP7zkMKZa0miJTujccRlLYckguZ5ZRr/j6P4enz/orYaPtA6/g==
X-Received: by 2002:a63:c908:: with SMTP id o8mr8485628pgg.124.1608084165906; 
 Tue, 15 Dec 2020 18:02:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 06/15] target/riscv: rvb: min/max instructions
Date: Wed, 16 Dec 2020 10:01:31 +0800
Message-Id: <20201216020150.3157-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 02:02:52 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c337aed8ca3..0d6a8a1c0a5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -605,3 +605,7 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 3da233047a9..bd66c2ad84d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -71,6 +71,30 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
     return gen_arith(ctx, a, &gen_packh);
 }
 
+static bool trans_min(DisasContext *ctx, arg_min *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_smin_tl);
+}
+
+static bool trans_max(DisasContext *ctx, arg_max *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_smax_tl);
+}
+
+static bool trans_minu(DisasContext *ctx, arg_minu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_umin_tl);
+}
+
+static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &tcg_gen_umax_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


