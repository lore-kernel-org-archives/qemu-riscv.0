Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6dv-0004la-1b
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dP-0002vh-7d
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00074Q-6H
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so2894511f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097833; x=1685689833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naApWSmi65k1gRAeLMa4iVYTmTT0eNi8LAPHTVnKRRQ=;
 b=Cozna/z3vEy8KdOLgrqsl6EX/BGC2ZOsrTPy5wQbRqmzfmFMhPU9A6Hm76MtVqWzk6
 otQ7+GCxa12CDoihSNRlfQcd2iYEFVMEXQ6+bDDgBLUFCwzEBgEHLDWfIzIPYKvp0GJK
 fYmpDzX7A5gg6FifOmEkPpV0AystCG1rYeBNXb05oMz8Rlq6oaFIj0V38AeevM8jQ6Z9
 jV8o3pT10/5hpUnyhHe4Gqe1g8M9v7YqN+ZMPgLSP1NoyiNk8DmHBPdEmZJo6Ihr/sKL
 jRVu/lPSSpyIt1kvBQYbywITtiyC8bTNnafO85nKfdi4DYcr1p6f88xdPQc7RMq41CJu
 iuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097833; x=1685689833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=naApWSmi65k1gRAeLMa4iVYTmTT0eNi8LAPHTVnKRRQ=;
 b=lnu+x5S4x12a+XKHRVuz3c0R0ecKu3ae6TeSdU5lb9uZiqzB4Qb1gLcvRkCwfvHxDd
 3BVLv3wkSO+NkUzPaBdvVxoqQkfSdyAgtdUQ7U1Ri25BKjhSAgaXdWMjrhxa6eCNJrqX
 738ywVVDj846ujsElcXlVadPZWng4npDMBsWdrLmnK0228LWLATl29pJuhB9HKxbzKlr
 fzq031waHLIJxJ5N6r0WyhbDv9GCuqBe4R3XP0LDcvK7jdUdL/toSRmQHsKNUNPH7sqg
 idPQ9Hh1AwRYAUb5zbK1Jxc5am6pzT90C3M7TY1fv1ZFgFDSE2uSCcD9xUXhEoajg0lF
 mrfw==
X-Gm-Message-State: AC+VfDxmFOnXZ33+9NFWp+VOBe4nqo1b61rPtwDMan8VJ5dKu089XGnC
 zULGAg0rrEK8rRRI1ckxL/weug==
X-Google-Smtp-Source: ACHHUZ5AS0Uyzk70wzHW+mZP6uSMg4jh9IG9Ppk0bQywQS5prc/YiD5lyrJGHHSfqm1r3B5GUF4TOw==
X-Received: by 2002:a5d:4a0f:0:b0:304:6d32:d589 with SMTP id
 m15-20020a5d4a0f000000b003046d32d589mr14614726wrq.18.1683097833345; 
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 47/57] tcg/mips: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:46 +0100
Message-Id: <20230503070656.1746170-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:10:50 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index cd0254a0d7..43a8ffac17 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1139,6 +1139,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1158,11 +1159,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
     unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
     TCGReg base;
 
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
+    a_mask = (1 << a_bits) - 1;
+
 #ifdef CONFIG_SOFTMMU
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
@@ -1281,7 +1287,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #endif
 
     h->base = base;
-    h->align = a_bits;
     return ldst;
 }
 
-- 
2.34.1


