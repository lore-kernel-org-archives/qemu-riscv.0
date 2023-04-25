Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOX0-0001cy-ES
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOWy-0001bH-Cm
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:40:52 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOWw-000783-4O
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:40:52 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ec8133c59eso6399202e87.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451648; x=1685043648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voYrBLtybOoDO/WS2tn3zAHmuD0tWE6cjSLyscFlUk8=;
 b=hbpbm7l8FBjy1K758QuNNVHEKXsL1nabgLzYA57tRM0q3g1vsGSuvHRiH7LAcxiGw2
 vh9WTJP+4hNm73hvM0GjcLj74JBSAifGP4jH9M3jtlmoZVh0naXf0D1Gltu1YqlyJGiQ
 1sRua6T5IJkn/11Za7+wGdFnOTQHvqUH5QhJ17Jlsur1CjvVc4SuUFK2ShJB5kqcv+fH
 WNycysEA3Pw1rLoOLYSe+0Jwa+sMUfejH8kKIOkYhCGrkETAGN7C94VU1TKmxfaiTS48
 WWp4K/By84q5krWYzk3NhgH92CdZLRcuAFTmQ5J9q27hNMOqdmTpXODCCibcHPL4en8M
 y4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451648; x=1685043648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voYrBLtybOoDO/WS2tn3zAHmuD0tWE6cjSLyscFlUk8=;
 b=b0BbMKOw1UOi5ocwWw+eQi3whYWCYuqYyccJj8MyUWbz94WhctA6GqZvLgAx/aujIX
 gvjw9DhdCmft0zyBdWY3vEEJ0uhUonei5ZdfBxfIMdIMTwj4P5DtcSaHjhPcc7hyQ6Md
 3O4SPSMWaii/snTkCTdiHwS4uiq/vE9MO1/Xo+7UQ9T4AwlI1INN1sn/iZNvM/j31G+u
 Lz302gm33x3Jg0UFnRP1wGkrKezQv6/KKfo8c3qdTF+6/IYiJOI53s1tdE8pJfY7QhcW
 B6navHbOM7Tmgt0d/kCgFlrqRNj4/bbRQvwrTxLdI+71BdiYeZVyhcNEdFUy9iC+Azdf
 xQ1Q==
X-Gm-Message-State: AAQBX9exaekkZ+31qkIs0k3cgqV+rIfuN7g95I0MlJhZUK7HiokWOXIi
 ywZiuGgR25fW1WQxk1WkJ14YRA==
X-Google-Smtp-Source: AKy350a/1VcrT5JprDcIPTCVehj7eAF7+zCrcFhUOAXk5OcrLIEzReoArz8BrBqnF7PCAPPCZfP8Tg==
X-Received: by 2002:ac2:43d3:0:b0:4ec:883a:6664 with SMTP id
 u19-20020ac243d3000000b004ec883a6664mr5390838lfl.16.1682451648443; 
 Tue, 25 Apr 2023 12:40:48 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:40:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 43/57] tcg/i386: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:32 +0100
Message-Id: <20230425193146.2106111-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12b.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:40:52 -0000

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 8c0902844a..6a492bb9e7 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1776,6 +1776,8 @@ typedef struct {
     int index;
     int ofs;
     int seg;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1897,8 +1899,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int cmp_ofs = is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -1943,10 +1949,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, table));
 
-    /* If the required alignment is at least as large as the access, simply
-       copy the address and mask.  For lesser alignments, check that we don't
-       cross pages for the complete access.  */
-    if (a_bits >= s_bits) {
+    /*
+     * If the required alignment is at least as large as the access, simply
+     * copy the address and mask.  For lesser alignments, check that we don't
+     * cross pages for the complete access.
+     */
+    if (a_mask >= s_mask) {
         tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
@@ -1978,12 +1986,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
                offsetof(CPUTLBEntry, addend));
 
-    *h = (HostAddress) {
-        .base = addrlo,
-        .index = TCG_REG_L0,
-    };
+    h->base = addrlo;
+    h->index = TCG_REG_L0;
+    h->ofs = 0;
+    h->seg = 0;
 #else
-    if (a_bits) {
+    if (a_mask) {
         ldst = new_ldst_label(s);
 
         ldst->is_ld = is_ld;
@@ -1998,8 +2006,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         s->code_ptr += 4;
     }
 
-    *h = x86_guest_base;
     h->base = addrlo;
+    h->index = x86_guest_base.index;
+    h->ofs = x86_guest_base.ofs;
+    h->seg = x86_guest_base.seg;
 #endif
 
     return ldst;
-- 
2.34.1


