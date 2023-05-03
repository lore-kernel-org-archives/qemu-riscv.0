Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6e0-0005Qc-U1
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dU-0002ys-Kv
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00075W-7K
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso102905e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=Zn+HHXznZSvz5DjBkYn6ROVwfncn8g31Uo41M6h+iNHj5AMhje8ixZChoxeSYMW6XA
 qFZeGWLgknDIL9ZAc/i3nIivffL+BuLhLRWYCUJSk5r8O8d5ayetP82CCQPRyEBjHuFA
 BC4qHd5PKJcPCVwL2ww7dEtMX90YTcvYnTzPsg8HbvZMNFkchW8kduuqbZEKMMo2vLje
 hgIJff9SzOrUAB3pGgFDYeLm/QEocF7yHO+Lf1q437uRecqtr+ma46ifD5S0vz4fG/Wh
 vgqPl0PnMNmYIHR7qwq/Nemr2a8Bh+DKvkTao1ZwCZ9egs+0KOkEv6cnOdoxBQZXrmWo
 uDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=fk+jWvFBHB4/KL7fYx1yaWrVb6jTA2e+rHa1De8bZTh8nhp/+UTKvUnTR3i121IExE
 mDbuRAUep0A+nvIvi40EnQqyORihy8om4hNMuMLD0pk4jvtXjDaWHqUO8gkzNE8YutSJ
 VAo2UMzDT1GURCS3NS3burVWTqB0Afjc4PNUZf7MVvA2PQeJ32VZQLokSBp9dNc7xfc4
 blrds3R9wp91zZ/0jzl+qxZREGf0qpGdXKHlngAfvSoOrjjW8zD/f0e6NOCHNbJZIpqm
 2R08xFfvO1iBV6Ejzhh7daGdSYdEZY27/3qb3VQJ5PGhL/BoMmu8HkxqnXAlBstanI6d
 if9w==
X-Gm-Message-State: AC+VfDzVkEgkmh4jmfm/+W9r4mlMgeG9B/4m3ddeYXMuMvEjdjQucJ5n
 U9BZpQXnOqBRyIb1Vd4Ou2Uj3Q==
X-Google-Smtp-Source: ACHHUZ5EBoVUg9DNbIN7hM9whjtyTxHFpBmiZuiunCKtKCW6bsmPgz3xYu3BM2Za3n1zzKUYG5ziDA==
X-Received: by 2002:a1c:f019:0:b0:3f1:78a7:6bd2 with SMTP id
 a25-20020a1cf019000000b003f178a76bd2mr14151889wmb.27.1683097835587; 
 Wed, 03 May 2023 00:10:35 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 50/57] tcg/s390x: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:49 +0100
Message-Id: <20230503070656.1746170-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:10:56 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 22f0206b5a..ddd9860a6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1572,6 +1572,8 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     int disp;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1733,8 +1735,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1764,7 +1770,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    a_off = (a_mask >= s_mask ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
     if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
@@ -1806,7 +1812,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addr_reg;
 
         /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-        tcg_debug_assert(a_bits < 16);
+        tcg_debug_assert(a_mask <= 0xffff);
         tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
 
         tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-- 
2.34.1


