Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bh-0004Qm-0e
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6au-0008V3-LM
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aP-0005qV-6F
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:08:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11280465e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTISKKo85DNTfZp4wzvl7urwXJJu/e57aqD8BfD1Ntg=;
 b=cwYHKyOqCC/FeIYGsRxsOxWonMyLlX8UX1ALVk7mWEW9vpJi9ueDnlLMZ7dFFRnWT9
 aC5RBdSq7pT4QXtyYxjgAldqdiBXb3aNBtPSaMRjZ6/bUdvOA7aEWNsBqVJmyHxinszA
 q6Ps8usC5QSzlF8+aCibu2SlGu4IRbnKvCojmDYRsVQblUDlqnmChvhJF0BvRyF3yzkY
 RkWmnxW68S2x0hWi1hmYMPMeNXk2f+Yaz+QtsHLxPBEml89BWwOgxc5O7fY1Q1rIcdoZ
 BArXIkPIclf1/NelPO8ZaHQjae9zlqvZSc/Zc9GfJ302cA/nVG2vBUkuC0GUBEv1adyZ
 OAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTISKKo85DNTfZp4wzvl7urwXJJu/e57aqD8BfD1Ntg=;
 b=RcKEBwjMVSTtNQy+2gGtsHucFkYSWy7NVAkIxIaH+AvXHbG+UEgyrlqFu5lOGxG3zS
 StIHFHepd5eymY6j6MCSskhXBD8xVJdPj5VsL1VVZwID9I1qnY1Uf24S3hmd7Ijwfs77
 ZCTvzK+en//pUGLT8BYkdkplpb1R4ccBDlhZIoq64mcgllM7IlmxsP939LOfPvBnNH7R
 o8OuEHkYd71kuVdr64m18jZTvi/gDCn8TPCYnMkMPki4Ze56UG79vAijytCzvnZ7pS8W
 wq4eLDavr/vgLj3JvhztnlKqcWzqNQmqfvxr5p5CkvUyCd99Yq5ibc3jwIfhg+/tlprW
 gIHg==
X-Gm-Message-State: AC+VfDzgsn/QPPxWf/cKpOW0XfH/omEYM9WT9vNhIu6HpgOW8E7vUgQL
 A8WUBoaHyZ2n1AAxBRuyWKHcLg==
X-Google-Smtp-Source: ACHHUZ4+CkD/vwQ4s0wc+Af/jKib0yooKA8jtensAybGaoTgV73pLN9PH7FZ9aYKzwi/I54g6ozUOQ==
X-Received: by 2002:a5d:56ca:0:b0:303:daff:f1a3 with SMTP id
 m10-20020a5d56ca000000b00303dafff1a3mr786450wrw.1.1683097645455; 
 Wed, 03 May 2023 00:07:25 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 37/57] tcg/loongarch64: Support softmmu unaligned accesses
Date: Wed,  3 May 2023 08:06:36 +0100
Message-Id: <20230503070656.1746170-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:08:14 -0000

Test the final byte of an unaligned access.
Use BSTRINS.D to clear the range of bits, rather than AND.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index ccc13ffdb4..20cb21b264 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -848,7 +848,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    tcg_target_long compare_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -872,14 +871,20 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
                offsetof(CPUTLBEntry, addend));
 
-    /* We don't support unaligned accesses.  */
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
     if (a_bits < s_bits) {
-        a_bits = s_bits;
+        unsigned a_mask = (1u << a_bits) - 1;
+        unsigned s_mask = (1u << s_bits) - 1;
+        tcg_out_addi(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg, s_mask - a_mask);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg);
     }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+    tcg_out_opc_bstrins_d(s, TCG_REG_TMP1, TCG_REG_ZERO,
+                          a_bits, TARGET_PAGE_BITS - 1);
 
     /* Compare masked address with the TLB entry.  */
     ldst->label_ptr[0] = s->code_ptr;
-- 
2.34.1


