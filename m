Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwQ-0005fr-8j
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwO-0005ap-6b
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwM-00064Q-9A
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id l63so861856pge.12
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y2KhL2jx26SA0fTdqwK4kIep/hAoNdtUzmiGc3hCqv0=;
 b=fBSVIFt8M+1vCfA5AkeAlSY7H3yfNI3CYuRBLR19toJ85X7JXkeMQLBqV3TLYBmaJa
 8PJohVgPvNGppJQ+PRrY6WEQfrgQmGpKjta0QRL5C7KcFVljxUta+lD+IsDDU9CMeveV
 5Nh6d4x8O933PY3JwQecSMhNntwdviXcaDGBZWRc0UmW0bdx3Lv3tru2M1/ocTzlHpk3
 YXw42Q3zT2tg/ZyzUSTw2V8rKlErXaakMWGZTRyzGsPNoGnpwS5xdsXbZMdD3JIn2mGE
 hd9yJkacr41bheLJnx3me1ploDXjz8/qqx9+rEG/UAzpFjs/KgHHYGhHf+s1s0WC1kjj
 hU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y2KhL2jx26SA0fTdqwK4kIep/hAoNdtUzmiGc3hCqv0=;
 b=Eu9yrMbniOpznRMoih4KimoedBiJL6iriuuAozFyxdvKWTdPq0LoU4D2VtyRqw3Ol5
 ODJGJB2kk9WlmhKqHTeCyACbOcybeJKwpjyBn2QC6QR1pIUhhGjcQUZ7di1iKySTvXtv
 mdACRdpbo3pK+iJdBZKh5Wiy0DuKjqiVHJ73qdA9eH8+bMTmbVQL3PKlxt/9qYtY95id
 uW4yMbKx58P5jyLbYQ4O3Hc/E8xvEczMlmC/sa8gxbPNDzTdmIccn6SF69Ouj8FhyjLa
 dLiB9sE5iP6vTv9M/oZ8KkFVX/2ctJUOwgAQwKb2e5sp0useD8HWuO7DppUzs3zPUqd0
 Xo5Q==
X-Gm-Message-State: AOAM530fMWnHYXeoL5lWGIcJ/ZB5I9fxCzUtc9DnVE3vqPOCteMP2F/O
 SzXO3gYJWTOzYPgfp5K4P6erwA==
X-Google-Smtp-Source: ABdhPJx3KaHP5GqEREd1cWksd+w4MxzRbEVM1BS1JpjUOJ46Be6xvW3A5+SPDEzAB5ZUANE7tbHNyA==
X-Received: by 2002:a62:52cd:: with SMTP id
 g196mr27987915pfb.178.1595409689032; 
 Wed, 22 Jul 2020 02:21:29 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 55/76] target/riscv: rvv-0.9: single-width integer reduction
 instructions
Date: Wed, 22 Jul 2020 17:16:18 +0800
Message-Id: <20200722091641.8834-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x542.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:32 -0000

From: Frank Chang <frank.chang@sifive.com>

Remove clear function from helper function as the tail elements
are unchanged in RVV 0.9.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 69 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8dccec4e04..39245b5ac8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4565,15 +4565,13 @@ GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)
  *** Vector Reduction Operations
  */
 /* Vector Single-Width Integer Reduction Instructions */
-#define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
+#define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP)          \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
     uint32_t vm = vext_vm(desc);                          \
-    uint32_t vta = vext_vm(desc);                         \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
-    uint32_t tot = env_archcpu(env)->cfg.vlen / 8;        \
     TD s1 =  *((TD *)vs1 + HD(0));                        \
                                                           \
     for (i = 0; i < vl; i++) {                            \
@@ -4584,56 +4582,55 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         s1 = OP(s1, (TD)s2);                              \
     }                                                     \
     *((TD *)vd + HD(0)) = s1;                             \
-    CLEAR_FN(vd, vta, 1, sizeof(TD), tot);                \
 }
 
 /* vd[0] = sum(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredsum_vs_b, int8_t, int8_t, H1, H1, DO_ADD, clearb)
-GEN_VEXT_RED(vredsum_vs_h, int16_t, int16_t, H2, H2, DO_ADD, clearh)
-GEN_VEXT_RED(vredsum_vs_w, int32_t, int32_t, H4, H4, DO_ADD, clearl)
-GEN_VEXT_RED(vredsum_vs_d, int64_t, int64_t, H8, H8, DO_ADD, clearq)
+GEN_VEXT_RED(vredsum_vs_b, int8_t,  int8_t,  H1, H1, DO_ADD)
+GEN_VEXT_RED(vredsum_vs_h, int16_t, int16_t, H2, H2, DO_ADD)
+GEN_VEXT_RED(vredsum_vs_w, int32_t, int32_t, H4, H4, DO_ADD)
+GEN_VEXT_RED(vredsum_vs_d, int64_t, int64_t, H8, H8, DO_ADD)
 
 /* vd[0] = maxu(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredmaxu_vs_b, uint8_t, uint8_t, H1, H1, DO_MAX, clearb)
-GEN_VEXT_RED(vredmaxu_vs_h, uint16_t, uint16_t, H2, H2, DO_MAX, clearh)
-GEN_VEXT_RED(vredmaxu_vs_w, uint32_t, uint32_t, H4, H4, DO_MAX, clearl)
-GEN_VEXT_RED(vredmaxu_vs_d, uint64_t, uint64_t, H8, H8, DO_MAX, clearq)
+GEN_VEXT_RED(vredmaxu_vs_b, uint8_t,  uint8_t,  H1, H1, DO_MAX)
+GEN_VEXT_RED(vredmaxu_vs_h, uint16_t, uint16_t, H2, H2, DO_MAX)
+GEN_VEXT_RED(vredmaxu_vs_w, uint32_t, uint32_t, H4, H4, DO_MAX)
+GEN_VEXT_RED(vredmaxu_vs_d, uint64_t, uint64_t, H8, H8, DO_MAX)
 
 /* vd[0] = max(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredmax_vs_b, int8_t, int8_t, H1, H1, DO_MAX, clearb)
-GEN_VEXT_RED(vredmax_vs_h, int16_t, int16_t, H2, H2, DO_MAX, clearh)
-GEN_VEXT_RED(vredmax_vs_w, int32_t, int32_t, H4, H4, DO_MAX, clearl)
-GEN_VEXT_RED(vredmax_vs_d, int64_t, int64_t, H8, H8, DO_MAX, clearq)
+GEN_VEXT_RED(vredmax_vs_b, int8_t,  int8_t,  H1, H1, DO_MAX)
+GEN_VEXT_RED(vredmax_vs_h, int16_t, int16_t, H2, H2, DO_MAX)
+GEN_VEXT_RED(vredmax_vs_w, int32_t, int32_t, H4, H4, DO_MAX)
+GEN_VEXT_RED(vredmax_vs_d, int64_t, int64_t, H8, H8, DO_MAX)
 
 /* vd[0] = minu(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredminu_vs_b, uint8_t, uint8_t, H1, H1, DO_MIN, clearb)
-GEN_VEXT_RED(vredminu_vs_h, uint16_t, uint16_t, H2, H2, DO_MIN, clearh)
-GEN_VEXT_RED(vredminu_vs_w, uint32_t, uint32_t, H4, H4, DO_MIN, clearl)
-GEN_VEXT_RED(vredminu_vs_d, uint64_t, uint64_t, H8, H8, DO_MIN, clearq)
+GEN_VEXT_RED(vredminu_vs_b, uint8_t,  uint8_t,  H1, H1, DO_MIN)
+GEN_VEXT_RED(vredminu_vs_h, uint16_t, uint16_t, H2, H2, DO_MIN)
+GEN_VEXT_RED(vredminu_vs_w, uint32_t, uint32_t, H4, H4, DO_MIN)
+GEN_VEXT_RED(vredminu_vs_d, uint64_t, uint64_t, H8, H8, DO_MIN)
 
 /* vd[0] = min(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredmin_vs_b, int8_t, int8_t, H1, H1, DO_MIN, clearb)
-GEN_VEXT_RED(vredmin_vs_h, int16_t, int16_t, H2, H2, DO_MIN, clearh)
-GEN_VEXT_RED(vredmin_vs_w, int32_t, int32_t, H4, H4, DO_MIN, clearl)
-GEN_VEXT_RED(vredmin_vs_d, int64_t, int64_t, H8, H8, DO_MIN, clearq)
+GEN_VEXT_RED(vredmin_vs_b, int8_t,  int8_t,  H1, H1, DO_MIN)
+GEN_VEXT_RED(vredmin_vs_h, int16_t, int16_t, H2, H2, DO_MIN)
+GEN_VEXT_RED(vredmin_vs_w, int32_t, int32_t, H4, H4, DO_MIN)
+GEN_VEXT_RED(vredmin_vs_d, int64_t, int64_t, H8, H8, DO_MIN)
 
 /* vd[0] = and(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredand_vs_b, int8_t, int8_t, H1, H1, DO_AND, clearb)
-GEN_VEXT_RED(vredand_vs_h, int16_t, int16_t, H2, H2, DO_AND, clearh)
-GEN_VEXT_RED(vredand_vs_w, int32_t, int32_t, H4, H4, DO_AND, clearl)
-GEN_VEXT_RED(vredand_vs_d, int64_t, int64_t, H8, H8, DO_AND, clearq)
+GEN_VEXT_RED(vredand_vs_b, int8_t,  int8_t,  H1, H1, DO_AND)
+GEN_VEXT_RED(vredand_vs_h, int16_t, int16_t, H2, H2, DO_AND)
+GEN_VEXT_RED(vredand_vs_w, int32_t, int32_t, H4, H4, DO_AND)
+GEN_VEXT_RED(vredand_vs_d, int64_t, int64_t, H8, H8, DO_AND)
 
 /* vd[0] = or(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredor_vs_b, int8_t, int8_t, H1, H1, DO_OR, clearb)
-GEN_VEXT_RED(vredor_vs_h, int16_t, int16_t, H2, H2, DO_OR, clearh)
-GEN_VEXT_RED(vredor_vs_w, int32_t, int32_t, H4, H4, DO_OR, clearl)
-GEN_VEXT_RED(vredor_vs_d, int64_t, int64_t, H8, H8, DO_OR, clearq)
+GEN_VEXT_RED(vredor_vs_b, int8_t,  int8_t,  H1, H1, DO_OR)
+GEN_VEXT_RED(vredor_vs_h, int16_t, int16_t, H2, H2, DO_OR)
+GEN_VEXT_RED(vredor_vs_w, int32_t, int32_t, H4, H4, DO_OR)
+GEN_VEXT_RED(vredor_vs_d, int64_t, int64_t, H8, H8, DO_OR)
 
 /* vd[0] = xor(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredxor_vs_b, int8_t, int8_t, H1, H1, DO_XOR, clearb)
-GEN_VEXT_RED(vredxor_vs_h, int16_t, int16_t, H2, H2, DO_XOR, clearh)
-GEN_VEXT_RED(vredxor_vs_w, int32_t, int32_t, H4, H4, DO_XOR, clearl)
-GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR, clearq)
+GEN_VEXT_RED(vredxor_vs_b, int8_t,  int8_t,  H1, H1, DO_XOR)
+GEN_VEXT_RED(vredxor_vs_h, int16_t, int16_t, H2, H2, DO_XOR)
+GEN_VEXT_RED(vredxor_vs_w, int32_t, int32_t, H4, H4, DO_XOR)
+GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR)
 
 /* Vector Widening Integer Reduction Instructions */
 /* signed sum reduction into double-width accumulator */
-- 
2.17.1


