Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOWh-0001ZL-Uo
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOWg-0001Yy-LW
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:40:34 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOWZ-00070j-PJ
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:40:33 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so6515300e87.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451626; x=1685043626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMwAK8+LCKklM46g5obMNkVRLVOSMtjwgv/TpGWw4pA=;
 b=tquWj1KNSzdJtzVyD+tXUp087E/gXkeNrl7YMB8IFduqjUiaJ5UevvSNJ6Wkio0Lp5
 DAp4CtE78V+J4VGO6x7+U0Mqo7WwwjOeHUz4ZBj3ToRugXRYMz/iYEq8FiB6Yt8UNKuf
 16FptZlCLpWaoSM25UUsbNkhwfBvmZbw06i92vPpjWX6xLAmE95Fc54sidss/21+xOnh
 2fw68Y317o6muUqaNIcsnip9gqfA4vlaADSmDQ0Zsti02kZv866WKcJEH5T6wHwe/3rM
 0v2MFEiaznJ25m97oL0i7nSeFS2bkRr0SX8xAU1YJ+P8UY2THwXGhrhhGFEcRD/IxuYd
 5v6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451626; x=1685043626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMwAK8+LCKklM46g5obMNkVRLVOSMtjwgv/TpGWw4pA=;
 b=XbpjdHNavxCODPg/I5/JBXnV2bjQd8vB86uIZs4m9AsvbNoe4KmgCZRZ15bUR4xPrM
 5+RaTq9SgAePVAM1adeJEFhv4EX4vO4iyZ53QzftoIUkmdvzUO0zKetX2xJQiKqwo1pY
 OfBFu5LRNu6VEDIovpgNOoNuIZsXdmVQCnj8pieeejTlj5GSQq+t3qAQY8k7Hneon7zn
 lwS+yIeh6qGSKJVx76tg7Un7SoxdLCw3S2ncDDg93LkwBoPWJgdLt1vNeIPR+7LupoZO
 HDvm/LDoxu8pwEJP7Z6zheSa4UmDKLix+FUX/Zlab2LUP+iprxekIApieJp2esDgH4n5
 ApVg==
X-Gm-Message-State: AAQBX9eUjyL7FU7ZGMRRzKRhOEPsdoAEOJKq/EnKWOUKLuQgRLWBnYL6
 j2SyUUyi/7ZI7UFPc4j+D3p33g==
X-Google-Smtp-Source: AKy350aMtoFcF2EkS9h/RL63jwtS+Lti6FYTc9kGFbFoWCrGRWjMaD7If1o2Tf3iSPR0JpiwFSrNuQ==
X-Received: by 2002:ac2:596b:0:b0:4dd:91a6:fe50 with SMTP id
 h11-20020ac2596b000000b004dd91a6fe50mr5435823lfp.28.1682451626091; 
 Tue, 25 Apr 2023 12:40:26 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:40:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 42/57] tcg: Introduce atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:31 +0100
Message-Id: <20230425193146.2106111-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:40:34 -0000

Examine MemOp for atomicity and alignment, adjusting alignment
as required to implement atomicity on the host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c5a0cfd846..d7ff96fd1d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -220,6 +220,11 @@ static void * const qemu_st_helpers[MO_SIZE + 1] __attribute__((unused)) = {
 #endif
 };
 
+static MemOp atom_and_align_for_opc(TCGContext *s, MemOp *p_atom_a,
+                                    MemOp *p_atom_u, MemOp opc,
+                                    MemOp host_atom, bool allow_two_ops)
+    __attribute__((unused));
+
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 
@@ -5123,6 +5128,70 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 }
 
+/*
+ * Return the alignment and atomicity to use for the inline fast path
+ * for the given memory operation.  The alignment may be larger than
+ * that specified in @opc, and the correct alignment will be diagnosed
+ * by the slow path helper.
+ */
+static MemOp atom_and_align_for_opc(TCGContext *s, MemOp *p_atom_a,
+                                    MemOp *p_atom_u, MemOp opc,
+                                    MemOp host_atom, bool allow_two_ops)
+{
+    MemOp align = get_alignment_bits(opc);
+    MemOp atom, atmax, atmin, size = opc & MO_SIZE;
+
+    /* When serialized, no further atomicity required.  */
+    if (s->gen_tb->cflags & CF_PARALLEL) {
+        atom = opc & MO_ATOM_MASK;
+    } else {
+        atom = MO_ATOM_NONE;
+    }
+
+    atmax = opc & MO_ATMAX_MASK;
+    if (atmax == MO_ATMAX_SIZE) {
+        atmax = size;
+    } else {
+        atmax = atmax >> MO_ATMAX_SHIFT;
+    }
+
+    switch (atom) {
+    case MO_ATOM_NONE:
+        /* The operation requires no specific atomicity. */
+        atmax = atmin = MO_8;
+        break;
+    case MO_ATOM_IFALIGN:
+        /* If unaligned, the subobjects are bytes. */
+        atmin = MO_8;
+        break;
+    case MO_ATOM_WITHIN16:
+        /* If unaligned, there are subobjects if atmax < size. */
+        atmin = (atmax < size ? atmax : MO_8);
+        atmax = size;
+        break;
+    case MO_ATOM_SUBALIGN:
+        /* If unaligned but not odd, there are subobjects up to atmax - 1. */
+        atmin = (atmax == MO_8 ? MO_8 : atmax - 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * If there are subobjects, and the host model does not match, then we
+     * need to raise the initial alignment check.  If the backend is prepared
+     * to double-check alignment and issue two half size ops, we need not
+     * raise initial alignment beyond half.
+     */
+    if (atmin > MO_8 && host_atom != atom) {
+        align = MAX(align, size - allow_two_ops);
+    }
+
+    *p_atom_a = atmax;
+    *p_atom_u = atmin;
+    return align;
+}
+
 /*
  * Similarly for qemu_ld/st slow path helpers.
  * We must re-implement tcg_gen_callN and tcg_reg_alloc_call simultaneously,
-- 
2.34.1


