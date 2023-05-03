Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Qs-0007XV-Gb
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qo-0007Tg-Ga
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qh-0001gH-6l
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso25095e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097054; x=1685689054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=zYH75eiNuH+AiV7xV48mbTHPZV7JvMjteYsyM2Q2x5IasI+DeWTxwbWXoa+/sNbkJ2
 ySOX+AjGqEmZwY7penQ9Cl+KZIxL9CmzRNj5nSJJL2q/SrV2PIPxu/0srq89Iod9y4T4
 EaQMWv71+0KuBYjHMlCJVSopMO+awE+wm66t4GdyWOft+tR9L3sAPPlVaNFQXITnwwft
 A5ykygpevGcHtZXiz2rCsGiyRJUAHuOQOwAq3WtUUPUMGC04YxzXQYUPbvFm/QSSa7Se
 nwFEcOF5E7e7AfkaUr81E9g2g0HFcmQJxxNH7B4r82NSoh7PO18rBpyTBB493nuu6aI8
 eSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097054; x=1685689054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=Yv5/7i1miodQ6RcSlGreioUmUphsMDd+u+t4UVAUEm8i0pLalcK8DlNXVFfWu5bWmT
 T4vQQi5pagvAectPkUPpged7E8N01xcdw4qYz4Gjjhx+VV2GgRl2GNlcN0g+Z4JPygPP
 hd90F4I+pjHtDUoJqkejsW+P1f1UF8TPkwZ5XHwEpqVEcDJNCx73GfRO5bNLwUO1Iljy
 +QTyaTO160isg4T9Ls8qjYg/0gONFHIIcTIStqxy1F7+gMl++sbuFBf30Zz/SD2x1lKS
 s5KyqZSyuKaieCMYPqc+7Pekd10VtYqFnCJdSoH55jZE4QjYVejdkzfQHKwhZdd9nebw
 rkyw==
X-Gm-Message-State: AC+VfDxJ/X46LowPnS/FuRpBB8gGuIsipHhCzHArdoEdd0SoHgqtmfUC
 gtvo8H37b3y+KUlVIuLmwF97Jw==
X-Google-Smtp-Source: ACHHUZ6xR6osH13PirE5A7CfiqcmFdZfmNwYANx+3Bk3DCBryNSOsFfLdEIQhp0uPlbSDGYs0iEtJQ==
X-Received: by 2002:adf:fbca:0:b0:306:43a4:86b with SMTP id
 d10-20020adffbca000000b0030643a4086bmr507000wrs.4.1683097053812; 
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 05/54] tcg/i386: Introduce tcg_out_testi
Date: Wed,  3 May 2023 07:56:40 +0100
Message-Id: <20230503065729.1745843-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:57:42 -0000

Split out a helper for choosing testb vs testl.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 78160f453b..aae698121a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1751,6 +1751,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
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
@@ -2051,18 +2068,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
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


