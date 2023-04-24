Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoxl-0005uR-76
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxC-0005QI-U7
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowt-0004Gq-5d
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso2315280f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJnzORJY4nHB2qHgbe1wyr1FPPmEsXDzn2QzLUICVbI=;
 b=wsrYLo/zEiJ1a2FC+B4pAjorUgO1McKdllwK3A6Rrxz5alsIwaKMGSVQxjZPbSxlrc
 1GcnzLeWh2wXA1WCBterba4Bz5K/9jeBG6R0wy+aaegGwV/f/I1Kxz3y53vsBVyY0ZOd
 YYPJw/urf3rwLn81rTLuO340cBPCkaEXLOoWblgnccdaAOZPvDlnN1S1yc7HHEXpnSvM
 df6JCt/SYGTueFDS9IMWUmNe/UaXhE6DZwZXhrJ3FW/6f9dUeH3u3nNMoSf+LQUW5Xvc
 A4hCBcwfpIjKI7/1MCoiUy7QQLN58UX1L+0WquD8vkuk6ppUv/UPh/aTxsOv58vREtZQ
 99lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJnzORJY4nHB2qHgbe1wyr1FPPmEsXDzn2QzLUICVbI=;
 b=GX3VdpJ8wGVbi25kiDS3GozjXRSHk69Tbzuu6Z4XtRLmzUk/l+Hx3oXIshGTEdw64s
 pKJeW1TSxt5ErPIUJctHmwocLiIIpm8OBRP2BINIyH0wo27o5BiW8NpkavtjT5jo+VTs
 U1WtrJLtpT875Zjt8XrxS/jzxmfY31Luav5DRF9F7Xmm9J/3MkY1YCVBg7bbAjU4Ntuo
 xrN18yNkpR0E/OuY6dqZzwpHqhXw4AlgF2rMlL8vAPAR9OJjbeEPCcQEG4jrL+mBvNZD
 2Se7RAlGtq3C8DSddvBf8RjhyMIqbMHfAEhTIu2DJPkL0wpfzY+d+FlFPtmyI4ATR5eJ
 Bg9A==
X-Gm-Message-State: AAQBX9cBls5klYsuEWk9R2ZcKGs6szk/J1sdv0VkesEjhv9yWo5t3f6D
 ttRfL9oKPtDd1QT+1o8OJzDNsg==
X-Google-Smtp-Source: AKy350buJEKr5Eebv4vwR1RO40mHBA1DTr3gNjE7iOknmahnJH4s4QirOxIuWNGuc4C+jPmuVqxs4A==
X-Received: by 2002:adf:fa85:0:b0:2fa:6929:eb81 with SMTP id
 h5-20020adffa85000000b002fa6929eb81mr7889175wrr.31.1682314871540; 
 Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/57] tcg/i386: Introduce tcg_out_testi
Date: Mon, 24 Apr 2023 06:40:17 +0100
Message-Id: <20230424054105.1579315-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:38 -0000

Split out a helper for choosing testb vs testl.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7a02f79f1b..19625a7c75 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1753,6 +1753,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
+/* Test register R vs immediate bits I, setting Z flag for EQ/NE. */
+static void __attribute__((unused))
+tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
+{
+    /*
+     * This is used for testing alignment, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (i <= 0xff && (TCG_TARGET_REG_BITS == 64 || r < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, r);
+        tcg_out8(s, i);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, r);
+        tcg_out32(s, i);
+    }
+}
+
 typedef struct {
     TCGReg base;
     int index;
@@ -2053,18 +2070,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
     unsigned a_mask = (1 << a_bits) - 1;
     TCGLabelQemuLdst *label;
 
-    /*
-     * We are expecting a_bits to max out at 7, so we can usually use testb.
-     * For i686, we have to use testl for %esi/%edi.
-     */
-    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
-        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
-        tcg_out8(s, a_mask);
-    } else {
-        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
-        tcg_out32(s, a_mask);
-    }
-
+    tcg_out_testi(s, addrlo, a_mask);
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
 
-- 
2.34.1


