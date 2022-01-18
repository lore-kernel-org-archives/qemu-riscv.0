Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZ9-00006M-5L
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:45:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ4-0008PX-QB
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:38 -0500
Received: from [2607:f8b0:4864:20::533] (port=35814
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ2-0007RL-Bp
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:37 -0500
Received: by mail-pg1-x533.google.com with SMTP id p125so1276887pga.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLuiFRxCl9GAREYS9eIUmBjZFW4u96x46O22xdwe8ZQ=;
 b=bnV2jI7agoa+mxV7oX4x84LY5DYmA2JJk1gJm92mfPt7mvQbOn7+YZghNCEXhgkOKr
 VY1gSgP0Esg0PJ8xC9ZtKVEyYiYiaHBS6fETwRbPcnYvcH9IqrrxpAOpuM6QRnAqcY6y
 8oDPhmrCM2/xcIhpgcypjURbPmdlAXzKJ0f3q08spaBhk/UhJ0Yz/YhILktE4zteQ+Dp
 D0Bal0lZ0WkFRFEWQF+As6qVI4zZOves5ez8TLIJ7c9o8RNbIBDW+Sv4kOSo+8rHNLHG
 bflwZTiW2YeYuxXK7eneaTD6JmYyioufo0bWf7pw7OfIoZuRGvVQql//EM+eIAHPf9p1
 OrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLuiFRxCl9GAREYS9eIUmBjZFW4u96x46O22xdwe8ZQ=;
 b=7N5GH96+RY1Gyw0wC52sQURkoe3IhgOsNpgq//pLfrwpRV7yxhP1fXIQBc3/Kc8e4Z
 heAt2sTOcnFiLPhUyi399Zf6gWl6HVqnNcihz1DEJ7EJbaxp8JBfPZHtReGESYa8K3MB
 RgAwql4yPMwo4ldlk+JkvwfNqEU0IcRuk+o78qa/YpA/7l2oTlZGjTL387GAOY7VCbvt
 EWCeDeESELdf7qokU0/q7AGEpAJFdE35T/c19IcCcvHChAfbyY2eOt/n5C9psClOyGLZ
 aPN0rNJysp0Gv2ly+jdcdQh+OvkdBHoxpslLZhhEnN/qGMzRfGsX6CeP4dWU7GDCI2oK
 XI0w==
X-Gm-Message-State: AOAM530c6jFhRiZKvnLHCHSCwnl0d4rbpeQL9BiC6q+xkPqGwg0h2zF+
 4dRAym62fQmL7AJnaPgqy56OaQ==
X-Google-Smtp-Source: ABdhPJyHtRCwBT6U4HnMvxlqVNlkZ5aNd8T6yMbQj/tI42ntr6p8AB0B8TqtjcM5RNhWHfTcJ/Z4wg==
X-Received: by 2002:a63:ce4c:: with SMTP id r12mr21414566pgi.21.1642470334293; 
 Mon, 17 Jan 2022 17:45:34 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 02/17] target/riscv: rvv-1.0: Add Zve64f support for
 configuration insns
Date: Tue, 18 Jan 2022 09:45:05 +0800
Message-Id: <20220118014522.13613-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:45:39 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6c285c958b..5b47729a21 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -129,7 +129,8 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
     TCGv s1, dst;
 
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
 
@@ -164,7 +165,8 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 {
     TCGv dst;
 
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
 
-- 
2.31.1


