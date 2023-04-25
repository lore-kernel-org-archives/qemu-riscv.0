Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORQ-0004oS-MH
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQr-0003mC-4n
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:35 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQj-0004rp-Sh
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:32 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8a6602171so59399831fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451263; x=1685043263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9XjeSNeXS5Zbmd8g+CH15v6ygPNvoJcpM3DeEPFM4Y=;
 b=VeZrJKWbqt1v2tq7WBTkORWe/bPwYoLDgzQF4EZrFLzH/H/NHwlZeJBlFeZRpE1TEZ
 MxIyWxI2eN69eE7PEUYwFbxe7bsqO95BU3Bd+OgjBDUBRu+eCwJXpxboernQngiMjk4q
 7+hsm/W/KK615pNR7+JIS+w4IIHffg5tLDJLa1zDYtFGWKockZ2EKU3SSGizA5Djt+5q
 WjLQOC54ZsF6iPMlLCTB92cTJSONySg4e58Pq24ic41I3fOoWuII3Ost056L0AxLWR+0
 thYu4Lv1HvGASiLjgQBOKBABnEXZlc564szMppmw1bj7oUZ7WHBjLKAiur+GLekP2TI3
 H0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451263; x=1685043263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9XjeSNeXS5Zbmd8g+CH15v6ygPNvoJcpM3DeEPFM4Y=;
 b=Y4/BJmI0t9SZWK3oPOTQoN7yZnHuH9nzG9FFUbt5OvqZYhnSPjTOj4hICy++nFS8BP
 EDrIW9KhEjRWjyk2Dx4Y2TziexjHB3HUvbGd/Fi5h6+Y7znGtf9BvhoFVN6bkragXYX8
 P1FjgK8BvDWr2IiDev/pp4H43HzKegJ8z9RIRO9thtrR0j/KlyJ+lS0GxE4KHd7bcTQX
 BEubivjSMP2T8V8rvJRt5SJoLoNeZDBzp6JRVE/qFm0vl39yP9iY4k0vhWy+lXuyuxa8
 hBUckKbJ84TJiXYMNigrVNRh+JFa1cieyHCETcLhblDcVl2G+GTQ0RGiwAdFhNJnvFQm
 9+dQ==
X-Gm-Message-State: AAQBX9c+zaODA5kvpHjUuF9c83v9XIlzkc3JSLEXhIZDgKN/pQXblcb8
 EzHc3VH+wq9dTNeuX7kbhUbhQQ==
X-Google-Smtp-Source: AKy350ae6QrJrBiW43czOEEt/zT2Dvnm0WSVvfiYSfhr80c4loDQUhwVvuY9O5Y+EIouAWx21svKJQ==
X-Received: by 2002:a2e:9686:0:b0:2a8:c759:af08 with SMTP id
 q6-20020a2e9686000000b002a8c759af08mr4263534lji.32.1682451263295; 
 Tue, 25 Apr 2023 12:34:23 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 23/57] tcg/ppc: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:12 +0100
Message-Id: <20230425193146.2106111-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x229.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:39 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 86343ea410..94a9f70e17 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1965,7 +1965,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_BSWAP | MO_UQ] = STDBRX,
 };
 
-#if defined (CONFIG_SOFTMMU)
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     if (arg < 0) {
@@ -2015,49 +2014,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_b(s, 0, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc14(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        TCGReg arg = TCG_REG_R4;
-
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        if (l->addrlo_reg != arg) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-        } else if (l->addrhi_reg != arg + 1) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R0, arg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, arg + 1);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, TCG_REG_R0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R4, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_call_int(s, 0, (const void *)(l->is_ld ? helper_unaligned_ld
-                                          : helper_unaligned_st));
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
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


