Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6dl-0004GS-Cj
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-0002qN-O3
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dH-00073T-OC
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso29229875e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
 b=UvG4Kq09uplNadGTc8PJAfzwYnX9k6t1vOVCKn/OyHdSAr4drcDpMFLfbQScZpbAw7
 xkTr/mUzcldVFwMvk+bj0jlwGO0/toFV9eu638UsOxTUDSBnp5PteLU92Mj1Pz7F/LDd
 dqy/OK7Avr+pqceaEdrjOuWaanQAMVcMfbQ/PWxCk3rc+fys1W6R+Ah5rpXwHGIECNV0
 RJ+jxq97rYCkSIIk3L6/MPo8xR9ipsoF87ygHL/ykD74Ob6dLueXNr0+x0JVvxAuec2c
 a1ioth2rGJKJ6NyA0oNlAKlNGE4mpouLHL/yyvRoOLsyb5DGC84hx4DpdCKbX+F/m/M5
 JRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNYQj2Zg5TENytieXxeMxebRkQ90woYbMY4x/xns2OM=;
 b=MHiLiewZ95EY/2PuIOkTVXzAq/CRNLj5Ylo2enO36DXBGzwT0ziXOdqicQEWaNGIIm
 XOySNl+dL69FzJDpbTwB3ajNoE9spe7QFZwLDvylb46lFfqBn0r3SgLNVqBu1muCTt7L
 xjJl9Ozg27lZq0jq+BQAPP2qjI+OhfQXXYA1NNj8WG14GarSPYXJqxHw7H4OcEsG4P22
 1BKRILhEq1Kpa3gAAGUu6p88qmTsFP0i42lHXHD3KRjPNYbDlV5TUrgpzLd9yzdxPPN1
 9067sRA1cF2NiY5Ba7r6b2G6mE7VE7ZdBhbRPoQaa12RUV/V/xRUq1/PumWuKSn3GSwu
 Ey/g==
X-Gm-Message-State: AC+VfDy2m1DHI28I8MWNGK9GAYbwXx29OZ2MdK/u2ML1KjEvtYvUfaSH
 ya82Qobj7y/N9hLaZ3t+/m//SwSdWx6DSWr9PBDkjA==
X-Google-Smtp-Source: ACHHUZ7r3Y3wlrskEwfV82uQsu82Bbk+DTpawm36bcTzT4CvqKm7fULqie0zXOkiRsxiISNYT3sePQ==
X-Received: by 2002:a7b:c856:0:b0:3f1:7288:1912 with SMTP id
 c22-20020a7bc856000000b003f172881912mr13430836wml.33.1683097832005; 
 Wed, 03 May 2023 00:10:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 45/57] tcg/arm: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:44 +0100
Message-Id: <20230503070656.1746170-46-richard.henderson@linaro.org>
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
X-List-Received-Date: Wed, 03 May 2023 07:10:48 -0000

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e5aed03247..edd995e04f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1323,6 +1323,8 @@ typedef struct {
     TCGReg base;
     int index;
     bool index_scratch;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1379,8 +1381,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1 << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -1498,6 +1504,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     };
 #endif
 
+    h->align = a_bits;
+    h->atom = atom_a;
+
     return ldst;
 }
 
-- 
2.34.1


