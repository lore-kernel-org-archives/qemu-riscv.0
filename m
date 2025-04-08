Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA1C3600C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:43:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u26Nm-0005LL-Hk; Tue, 08 Apr 2025 06:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26NB-000567-9O
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26N7-00088x-FF
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:03 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so4495722b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744108799; x=1744713599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuCSkAVlyRfO0GUKzpryx736tOWCITpgLMeGl17+N2Y=;
 b=CS3PCPl2PZPUlfHdk5g/Epj6PBH7k5WWdBFzzs7HVilo9iIRXx4lvdVPzk5MQH8S+O
 crYvmdSn7iFtVsFk73Eor78rlzKBojZzq5HM7mUz5jabPkDH0QDcKFlZd4GECLFpqNzg
 /+CDO9vXUt5fKpsnHCe/a2qyCAWeSEib1J2aStZXt8agJmyX3bCmej+vT/9hVlRFYMCz
 yaiU6xQQjWZXjiZ1X3MC3LGufIkHZEC2Pk+xG9jTjXEhkZFYEReEoZ7VqM4k8Z2CmXbw
 TC4KG6wCjE7GKpioZUP2htGjX4rAtmSW9lu7ke+GO/W30Qz96LCmTeFtnWI1VXCBpAHd
 io0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744108799; x=1744713599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuCSkAVlyRfO0GUKzpryx736tOWCITpgLMeGl17+N2Y=;
 b=CKP64Qv255iU5bOsQCkbW5dplG1rdUnwmy5rZ2qDFn+YUGJAjxwxte1Fk8sAnv4viV
 MmscVVA/zk2vzXkRcTseoWclVLCdg5QiuxsnYOKhPOWprzshqYRK4wdfzwZUMSdshSMA
 wMxvLz44JWHTwH+GCre0BTCW54nyig1speJSBfNZUy8bmnSxDXaUUEXL4E92ug9/cnQ2
 mbTi1cc8fun7e87wr1u7k/bGR67DBSADNYb59tIpqlbKYjl5ZrUVDjpE6uDRhvTqb2of
 5YJXChQIMJmwOQvsJHv1kVeFWnB12t1QUeidKOjV73steVJ5vk1tJCpGflUYeRmbNBlw
 zMng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNX1a4hY3ArJBVnTQv10BDh8Xf6qLRXODlB4WKVzzLkkSPXYXpcl2hScMd2QVA/qOlexG9BkPl9dd+@nongnu.org
X-Gm-Message-State: AOJu0Yz/S0COQczfKLH30PIXLTABmV2kr5Cjk0ozZNo0q4m1RmwWy7SV
 a24/xWt3AnJVCtj9e/bnUOojvM2b0ZmY0j0XWZuRgkUrpdJWzi97id2QIQ+9vO4=
X-Gm-Gg: ASbGnct6l9RuEjxquQMFnihbgVlmBY6L6WchCzEn/UtqTjvqTduicTJghdQc63fdN09
 Cju066rNULUZvM5V3VoaFk/hjUlo2fkUSXPVNnznVKAS+cqnhoJ9X7ur5maV4VB8zpjmFExGObe
 thbCewl/KzkVO2mcbwhO0VANKdJcZX9TGkMOA3vTcxkslqxAnc3+K5rA1P2+Nn2pK/rCA3n9rBJ
 egyq8Nqb5FT3n5xQ+68yS9XpZtsdzxloSzGKoN4wgfgQEn+OI9SdMZSc8PZCSfr7MoYvGDO4ifM
 iByuaAxfRQ6HSfU0CWko5n7kAP3KIlr0Chfwi0CuJGO5ycXm+Zzcn2f/Ob2CG6MoT3RCwWv6fU0
 6v1wHYsEe6szUHw==
X-Google-Smtp-Source: AGHT+IE5cZ5VoB4K2ygbunq1G6DXE9+3RfIGKooDLs5OFNOTefKBLYrHAkQnsIzq44+dfnNUJILVZg==
X-Received: by 2002:a05:6a00:3e15:b0:736:5f75:4a44 with SMTP id
 d2e1a72fcca58-739e4b7aee2mr17015942b3a.22.1744108799501; 
 Tue, 08 Apr 2025 03:39:59 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e3734sm10532380b3a.179.2025.04.08.03.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:39:59 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 03/10] target/riscv: rvv: Apply vext_check_input_eew to
 vrgather instructions to check mismatched input EEWs encoding constraint
Date: Tue,  8 Apr 2025 18:39:31 +0800
Message-ID: <20250408103938.3623486-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408103938.3623486-1-max.chou@sifive.com>
References: <20250408103938.3623486-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

According to the v spec, a vector register cannot be used to provide source
operands with more than one EEW for a single instruction.
The vs1 EEW of vrgatherei16.vv is 16.

Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e630f8661e1..4a0c9fbeff3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -379,6 +379,35 @@ static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
     return ret;
 }
 
+/*
+ * Check whether a vector register is used to provide source operands with
+ * more than one EEW for the vector instruction.
+ * Returns true if the instruction has valid encoding
+ * Returns false if encoding violates the mismatched input EEWs constraint
+ */
+static bool vext_check_input_eew(DisasContext *s, int vs1, uint8_t eew_vs1,
+                                 int vs2, uint8_t eew_vs2, int vm)
+{
+    bool is_valid = true;
+    int8_t emul_vs1 = eew_vs1 - s->sew + s->lmul;
+    int8_t emul_vs2 = eew_vs2 - s->sew + s->lmul;
+
+    /* When vm is 0, vs1 & vs2(EEW!=1) group can't overlap v0 (EEW=1) */
+    if ((vs1 != -1 && !require_vm(vm, vs1)) ||
+        (vs2 != -1 && !require_vm(vm, vs2))) {
+        is_valid = false;
+    }
+
+    /* When eew_vs1 != eew_vs2, check whether vs1 and vs2 are overlapped */
+    if ((vs1 != -1 && vs2 != -1) && (eew_vs1 != eew_vs2) &&
+        is_overlapped(vs1, 1 << MAX(emul_vs1, 0),
+                      vs2, 1 << MAX(emul_vs2, 0))) {
+        is_valid = false;
+    }
+
+    return is_valid;
+}
+
 static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 {
     return require_vm(vm, vd) &&
@@ -3449,6 +3478,7 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
+           vext_check_input_eew(s, a->rs1, s->sew, a->rs2, s->sew, a->vm) &&
            require_align(a->rd, s->lmul) &&
            require_align(a->rs1, s->lmul) &&
            require_align(a->rs2, s->lmul) &&
@@ -3461,6 +3491,7 @@ static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
     int8_t emul = MO_16 - s->sew + s->lmul;
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
+           vext_check_input_eew(s, a->rs1, MO_16, a->rs2, s->sew, a->vm) &&
            (emul >= -3 && emul <= 3) &&
            require_align(a->rd, s->lmul) &&
            require_align(a->rs1, emul) &&
@@ -3480,6 +3511,7 @@ static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
+           vext_check_input_eew(s, -1, MO_64, a->rs2, s->sew, a->vm) &&
            require_align(a->rd, s->lmul) &&
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
-- 
2.43.0


