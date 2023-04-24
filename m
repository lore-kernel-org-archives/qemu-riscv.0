Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqozh-00036m-5x
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxr-00060y-VJ
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox5-0004F3-LR
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2fa36231b1cso2287928f8f.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1e3+3125R6Ll+hm5X+IbfdxFrIfgl7VB8JipCIcUQ7c=;
 b=ikCqUS/ewX2b7dhjuRKsfh56WF/nCP5QStoXznFXE0hxBDCdpPoBsRNoNjcIaTdrE+
 Fuvkog7wbtif0V5/Z6/gLGMbaNdErOdnUDZgHgGqiIO0VmKTsFvDLyd7/ggF3Qd1u6nB
 jEB8pAHlYVt3MrKc0fIVlMnCKnuLMkdFPUGF0KVoqr4DY0jqJ9/bVgkBleA2fbCM8UbQ
 H2DzUS59md2n3x2m4XzfR3CImzcDvhQLmbgW7pZh114ZMOJW+pTiN+nB03qutuPy3Kpx
 FkRXCsdkDjiya9s7bpV3SCmeaE2uYyxpk7Bz7wZZAFjsuKJwBGsMAjFb8/xmn2mBvdJv
 VcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1e3+3125R6Ll+hm5X+IbfdxFrIfgl7VB8JipCIcUQ7c=;
 b=ErWHr7wDT4fyjYqll6rto/kYg5tgIF3W4z7jJkWBclnnMCPJNkCIxpJEyyMLzocoUl
 Kzi8M8Ir46hpbvlHO3hNtUrr1uDWKo737aktRdQsm/FwNjiH+u1Tne/kUoRiUcu3ECGn
 0CEMeQugl130wIj65e8FrMH3TaofCFW3I+iGcT/f3gVegLQUZjr/pNSRVLC825BnofLn
 zpmY/9JSbL6Jcy8Is/jusSwAy2/N5QqS/y/3xFt70WPGX6fvqfo9h3gY3cnXINQZ3W1G
 LtBaPwbcjmIXkQ7p1pgztzOvMik+ZtY1BzfB6+vwqCebSGCShiN/bErA/zhDqzdz7/l4
 mn5g==
X-Gm-Message-State: AAQBX9cpJiEwrhezjxkUqnawmiKMSI5mGgz0vHTd3x/C73BQp0Jnl/8L
 rVy+KQT5tvdx7HX+Nwm7q+BVGA==
X-Google-Smtp-Source: AKy350be0c6ejJRFp2k8qkwiO18gxTleIaDah2z6PQekgqYgrbuffdYhvEURk1hHrZlAu2yjCWuWIg==
X-Received: by 2002:a5d:6182:0:b0:303:2702:6d66 with SMTP id
 j2-20020a5d6182000000b0030327026d66mr7170455wru.63.1682314886134; 
 Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 34/57] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Mon, 24 Apr 2023 06:40:42 +0100
Message-Id: <20230424054105.1579315-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:42:47 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..6f5daaee5f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1


