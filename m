Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp2e-0002Gm-Kf
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0X-0006Ed-44
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0G-0005J4-VV
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so14856655e9.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315074; x=1684907074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8inodTGUilDAhT6OBmWmJGZ3vieMgwqC5uJSdvFYggQ=;
 b=W0O7piH6cTojnNHmg9vphLYmUshHUW7mBbal/lE4bxxN/DSCC8RJZy/GjhotqbjuIv
 tLwYVJHKBnDdCe456zwq/LsVKs6K620bITX45RCDAFrtTiLxHH6i9uPbujyUDXcw5O3C
 rnS9jxHL8VYl459JT0pE0hrkiy7x4/PTN0j8TQvaBJ/w2PuOpSsJSTIgNhCGyzFP8QVX
 NBR+BpPvKZXE/y24FwovDyFi/9E7QnCHGs6sCrjarDFhjkYnEuJgiAojGOQt/Jls9Cr2
 ZhWe1g26WPDlcHdRZb1zPanHn/FXRm/h4M79W5L+MU9q5tky6kSy1KaXkjQslg5gvUsT
 lmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315074; x=1684907074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8inodTGUilDAhT6OBmWmJGZ3vieMgwqC5uJSdvFYggQ=;
 b=iau+AJdoLKaEeC8NINUo/ZpccayFb9O0hQOtGfvHqfR38N5Pv0JS7Fm3xqY/jYcD5Z
 HeznA/H9gLz4ji/gJukGScvgi6WbdLeJPWavnCX6+GXGiywn/3kjp6E4WxsnjY9DxawZ
 FqdlaneiUGZIjr9B9hJn2MTo1hoL0yS0rkOxuvTI28hLb9ttz1yZhaCchapkNCn+0b2Z
 4BM4tPSpQx94t8zzr2i0yRQe1JtihiLDKx6sFQj76ACEt+mJGyaVBmelkc0a0OWvom44
 fgIcfpNAScVg4ZOaoKUM2n6Pcm1ufwLOuV86+QowHJOdwIKSsrl+cw9xQ+boydzdyWXW
 Zyiw==
X-Gm-Message-State: AAQBX9fOBSjrX1pamaHBdKI8PpDnPvDwn1hLlm47ywE0tuzs/keYAn/W
 /KnlVmpyRpml/ZhjHet1d2WgDw==
X-Google-Smtp-Source: AKy350ZdjAZ//OyKoxTKLx1C7cJScg/jvNfvGBCO51XeLVzckL1DMFSp8Zmcx79ltyg+yYTt4efHLg==
X-Received: by 2002:a1c:f601:0:b0:3f1:7331:38b1 with SMTP id
 w1-20020a1cf601000000b003f1733138b1mr6644941wmc.14.1682315073899; 
 Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 47/57] tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:55 +0100
Message-Id: <20230424054105.1579315-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 24 Apr 2023 05:45:21 -0000

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c3157d22be..dfcf4d9e34 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1718,26 +1718,22 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 #if defined(CONFIG_SOFTMMU)
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
-    tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
@@ -1745,25 +1741,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_R4, lb->type, size, data_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
-- 
2.34.1


