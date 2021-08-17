Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6TR-00011w-I1
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TP-0000xU-Qt
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:15 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TM-00011F-0o
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:15 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so999072pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Xc3Px5ShBpZaeyehmX8yBaiKpHgzNYihXevPMdNzj8=;
 b=IIC04dDz4BEnCGXCfZTBuDM9mXne/xrtXazzb+WEi87GFK7XhWmYpi+Fv5RjcU806m
 OJoxM8uMX4O3WLHh0VOhC3Ls06eDBoGLRPEL5bilINJ/mE4Ac+0wYojpOAuizZj6+A17
 +S+jnFY1RrY2qp8gxRGWC6l1YS57gnfLXOXQc/HoYpJAmeH8uUpg0BqJ3WmXwuFlZLwD
 w1w2HT+pDf5ZJtazdp+seQsN5btb7n8ph7xoX3Rb6+QCKB8/SH0EfsLRyQ9NAPq3d2xb
 smecWiEtNgqMQWwJ4pkLTKOnf32yg0KKHqVvVWtFKBsXIke/Ehb6/CbV6yeXJpjt/UPG
 Pw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Xc3Px5ShBpZaeyehmX8yBaiKpHgzNYihXevPMdNzj8=;
 b=AXxX4+p0zCtdz/sQPdczzny5kXGcNvd3NyL55N2JHfGsr9thfY2zBxxCrxeJ2K1SGY
 quCgLd76hZg36SVZaNSOR0GKHLEj81XA8glx7Jvbv5C43R/TyjR1UvZfM0CoapSB52h+
 DH9JAvlYkcpMc6R81NHJ2DsR8OZdfTlAHoM5Wl+bpntb8vyqzBzH/oO6L+ICASdCscgL
 NctBCo5fYniFHCAHHevX17bvkBS6VgwgHwpesMpNF1XuhAMI+fcuAXSIsO08Pm8nD2fJ
 O0S66bfjqFotSOVj31yNOKP4E2la2HSSucnOeeT2JjVi7SjsM+zuorlSnkEREqrJMkwl
 gX0w==
X-Gm-Message-State: AOAM533gNMcgvHmkYf6QE6iU0MAJH8WeA6Elk+Gl7VQwtfunlvqeMrP3
 bGwCs1zz9Ccoail1mKWPUAINJilAPWe82Q==
X-Google-Smtp-Source: ABdhPJxnvqu3jRGO9P4bjRnZ7lj37W49kqnL7agDbE8wuqKpo4IJiqCaM0KVMzcHX5izzEoprtrKZQ==
X-Received: by 2002:a17:903:1cb:b0:12d:b9c8:4e22 with SMTP id
 e11-20020a17090301cb00b0012db9c84e22mr4335930plh.42.1629235090599; 
 Tue, 17 Aug 2021 14:18:10 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 02/21] target/riscv: Clean up division helpers
Date: Tue, 17 Aug 2021 11:17:44 -1000
Message-Id: <20210817211803.283639-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:16 -0000

Utilize the condition in the movcond more; this allows some of
the setcond that were feeding into movcond to be removed.
Do not write into source1 and source2.  Re-name "condN" to "tempN"
and use the temporaries for more than holding conditions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 137 +++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 72 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 20a55c92fb..6ae7e140d0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -213,106 +213,99 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv temp1, temp2, zero, one, mone, min;
+
     /*
      * Handle by altering args to tcg_gen_div to produce req'd results:
-     * For overflow: want source1 in source1 and 1 in source2
-     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result
+     * For overflow: want source1 in temp1 and 1 in temp2
+     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
      */
-    cond1 = tcg_temp_new();
-    cond2 = tcg_temp_new();
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
 
-    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
-    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
     /* if div by zero, set source1 to -1, otherwise don't change */
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
-            resultopt1);
-    /* if overflow or div by zero, set source2 to 1, else don't change */
-    tcg_gen_or_tl(cond1, cond1, cond2);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_div_tl(ret, source1, source2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
+
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
-    cond1 = tcg_temp_new();
+    TCGv temp1, temp2, zero, one, mone;
 
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
 
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
-            resultopt1);
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_divu_tl(ret, source1, source2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, source2, zero, source2, one);
+    tcg_gen_divu_tl(ret, temp1, temp2);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, cond2, zeroreg, resultopt1;
+    TCGv temp1, temp2, zero, one, mone, min;
 
-    cond1 = tcg_temp_new();
-    cond2 = tcg_temp_new();
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, temp2, source2, 0); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
 
-    tcg_gen_movi_tl(resultopt1, 1L);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
-    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
     /* if overflow or div by zero, set source2 to 1, else don't change */
-    tcg_gen_or_tl(cond2, cond1, cond2);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
-            resultopt1);
-    tcg_gen_rem_tl(resultopt1, source1, source2);
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
+    tcg_gen_rem_tl(temp1, temp1, temp2);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(cond2);
-    tcg_temp_free(resultopt1);
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp1, source1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 {
-    TCGv cond1, zeroreg, resultopt1;
-    cond1 = tcg_temp_new();
-    zeroreg = tcg_constant_tl(0);
-    resultopt1 = tcg_temp_new();
+    TCGv temp2, zero, one;
+
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, source2, one);
+    tcg_gen_remu_tl(temp2, source1, temp2);
 
-    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-            resultopt1);
-    tcg_gen_remu_tl(resultopt1, source1, source2);
     /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
-            source1);
+    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp2, source1);
 
-    tcg_temp_free(cond1);
-    tcg_temp_free(resultopt1);
+    tcg_temp_free(temp2);
 }
 
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
-- 
2.25.1


