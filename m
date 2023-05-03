Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bM-0002Hw-6f
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ae-0007rq-Cs
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:52 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a6-0005bb-UM
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f4000ec74aso81045e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097638; x=1685689638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xpq7kVqaR8GJII9yFdioUA+mHFs0Vvahpm47qCN+m6U=;
 b=knoefAvhROr7EPY6f4Hwq1RDQEx+Ix9wY74EEMUmm3japJhdr90P728D+Z87AWxpNj
 m1Mt2pXXQpcNDu1qUDgr+ID3B6y3uWh3n62QxArws5ZIokThji5AsYFt1YoAt9MZ6WdK
 eR0qqUPBB6iVFf31SdC3IRhP10Juy2G1qowRYMis1TsW1jX1eEtwM0JsAEVEaoea2Rmf
 nnQtYM/z3jLGbCIBMPfGoQZJp7xrw16Je1b+UyHv7YhYWuojJPzOKCKvR+WrpjTpWlQg
 HLDaumaGXY2y1Ij1g2PZ2A77/uh4CzLqjNWL8YgQ2CAFCGniwTKwya9L3VZIs/z9QTRI
 XMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097638; x=1685689638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xpq7kVqaR8GJII9yFdioUA+mHFs0Vvahpm47qCN+m6U=;
 b=OeuJVUtb0yn+LVNPvG46QqhRjqfFVdneKkl7F5KvewCQi/bYYsd31mBr6zYOTQ8jJ5
 U5uxUEgI0mnl01qHwOF8gdYAyeyf8dRYke8dxuux3KTOab2eIoRtlWGEGi/jmUuXU1SV
 RKGbmOJ9qfk37JBV1pH4IRKtBiGmzAQcF8vXeVgc8EfNCQsJr9tWDGtpeFmToXKR1dpy
 86Lqn7tDyC+cZQwIucab6Z2wZKmEAP1Mkgunlw4Eym8PS0840TAWZlLqiX7bLFUFcLP7
 dNVm55JKQvpx6+VdaME3vjOcqEU5IL5/FemNyW2U8o7TPL44DyOsvNZGftbDXHuAHXTA
 u6oQ==
X-Gm-Message-State: AC+VfDy1IodyN5I+kbChIZkQGtQuTboTPoUFL1aMLA4z+1hD5XNxYHw/
 2ntY34XUZJ2xJmWsSQrJegKWmg==
X-Google-Smtp-Source: ACHHUZ6Vatl23CB/vGlyUoYY71FfLvv7cfArOckLLIMENXT+b7nKawd18q8MPwq7GYpa48zpqvvSzw==
X-Received: by 2002:a7b:c408:0:b0:3f1:75b6:8c7 with SMTP id
 k8-20020a7bc408000000b003f175b608c7mr13318615wmi.37.1683097637959; 
 Wed, 03 May 2023 00:07:17 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 27/57] tcg/arm: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:26 +0100
Message-Id: <20230503070656.1746170-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:53 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 45 ----------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a02804dd69..eb0542f32e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1325,7 +1325,6 @@ typedef struct {
     bool index_scratch;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
@@ -1368,50 +1367,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TARGET_LONG_BITS == 64) {
-        /* 64-bit target address is aligned into R2:R3. */
-        TCGMovExtend ext[2] = {
-            { .dst = TCG_REG_R2, .dst_type = TCG_TYPE_I32,
-              .src = l->addrlo_reg,
-              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = TCG_REG_R3, .dst_type = TCG_TYPE_I32,
-              .src = l->addrhi_reg,
-              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_AREG0);
-
-    /*
-     * Tail call to the helper, with the return address back inline,
-     * just for the clarity of the debugging traceback -- the helper
-     * cannot return.  We have used BLNE to arrive here, so LR is
-     * already set.
-     */
-    tcg_out_goto(s, COND_AL, (const void *)
-                 (l->is_ld ? helper_unaligned_ld : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* SOFTMMU */
 
 static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addrlo, TCGReg addrhi,
-- 
2.34.1


