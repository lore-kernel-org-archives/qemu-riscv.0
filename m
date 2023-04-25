Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOS7-00069W-GD
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORt-0005ja-Lx
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:39 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORZ-0005QX-Gk
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:35 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2a8bb726210so59419111fa.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451316; x=1685043316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTISKKo85DNTfZp4wzvl7urwXJJu/e57aqD8BfD1Ntg=;
 b=msNiZHsQwkL3+7+U2Iq/8mJaLMFCrUEZnfnUJzrNxTtSiS0xbW8K6VYvLs8xR0VuRF
 93grbI7VA7sl2qJogZJ+lJMzM+Kii067MOTWpRexUY+3uhQGaB28ScEIc/YOBr1m7qMt
 ODOPYAAyi4zWfjBfH9B1e0VOZymORCphdd6TndMXf2zZy9aZDMYFYS0ivSUMxmwNhMAu
 Z7Tzx2N8uT4R57krGzya8eGs3LduQnGtKmwGmyGhtI2kLpryRJ9rCRx7lZHj7TCVEWn5
 sbIDqCTvAV4XmEYVN+ny5xjcet6G6p1VFlf5Z8ARKLx+x4b3Zq1YjFKE/Yo+hN7IvDIY
 O4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451316; x=1685043316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTISKKo85DNTfZp4wzvl7urwXJJu/e57aqD8BfD1Ntg=;
 b=gR7qWPm06uIflOy8OMraQIL9DDJcfVkYcH87PbCLJwXdttMIgQOOI7qBEWzJiKbaYd
 prHcKK/rnOzrmVLDWn6nx9tpPMN3e7TYmqBBNaxrz5kQofgi/2FhyrAd2UcMmUZQ6WQC
 HyNou7Uj6e+s90u5OMJv7X9aKTFNotVcC4KxF//FeNUj+hu79XcnooSftcBYcv0PxTou
 2UKQ7X23S1xtonbCNG1WcbCGEIsomHHVe0USL4T34RyjeCBSlM46mbksppM+DnmYIhVR
 uXDgh8YfvZxjivkQX5HhQti3f3SVdrn9zXFM5J89PjWpFDb6yZU8huTofWO2SBLzTGaj
 kPVA==
X-Gm-Message-State: AAQBX9cVfvPjcjsXR9ZUy4zLfGe6Fh9BIY1RshYtaS4YwfMOVcXoTWoo
 PsQAXQ1fTfytE86Uwd4hBHa9XA==
X-Google-Smtp-Source: AKy350aNoi+hXNOC2pLwJoEuPGAoUZJ+QcumPuiD8p5i08hbNgBmHyShXd/rGX0aw94fp5Omo3zz4g==
X-Received: by 2002:a2e:3216:0:b0:2a7:7ff7:9215 with SMTP id
 y22-20020a2e3216000000b002a77ff79215mr3931707ljy.10.1682451315875; 
 Tue, 25 Apr 2023 12:35:15 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 37/57] tcg/loongarch64: Support softmmu unaligned accesses
Date: Tue, 25 Apr 2023 20:31:26 +0100
Message-Id: <20230425193146.2106111-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x235.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:35:41 -0000

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


