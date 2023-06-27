Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F38EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 16:36:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEBcf-0003mO-JO; Tue, 27 Jun 2023 12:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcW-0003dJ-Rh
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:32:49 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcU-0004t2-KB
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:32:48 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1b0605d4d11so730601fac.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687883565; x=1690475565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9ZyFl+Qr39+h4sTEYsjjQIPZ2uoHg8GO4lNDOMrVM0=;
 b=WSUDZjRHJ/uX63pEiNYKarAAidJQzUphAF45eYjoB3zX5V4Iojlhf5R9KFgKInI6pG
 yRY+5wnVQGauDAVgumBmY9smy6PsvjkZe2+4u4e6+CKZXYIA9ct1u+cKxaF9Ag0qaRhv
 hHduxRnvxKeLAAkSywtVxxNYT+6SRJqkEsXDrTXe/FY9xJXyuBYGZIInDtxZZmtfSm/H
 PaZpQOkZPaIyTmkv+eWsWs0HjM3bDnN4pJBYzDcKiTQoadOq1yxdGqMMXXVQ/7uUN2/w
 nPtr1lSQoFokqLjN545D4/3J5farWNm+QY08OW6OFXr0JskUPrF7Gxm4tg+McF2g9ovH
 UZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687883565; x=1690475565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9ZyFl+Qr39+h4sTEYsjjQIPZ2uoHg8GO4lNDOMrVM0=;
 b=k9OzUgkq+ijyx21TTWWOLSistf6TIXpWWghxa/5D8ez8upDIarTfpDO0LkShG6mHWg
 T/1Onji+5dgiQZm1BRHyNoiarRtZFKFKL5mHf+0SGmfjtxfUscXB2lPgZVc1q0ZwTQuo
 88vSPcvwAdyH+fe+HDxje0kyTkIX7Rw/U19UjXuTS5OO6sMNC6pGbtfswz3afmv9nXMS
 9U6huXC1TXJ2LwgH3lL9AgZbi7Ds97Pj7ljHYi39ImeVhRiys1bwSBlZa0trbRGi3EBD
 I+lddO3ZLJ5Oti5NIiA4BNw623N12f8W7s9qb/jVh9geHTzU4ao4KWRwtmcBm6QYIN+v
 XQ7Q==
X-Gm-Message-State: AC+VfDwVWAp8icYT6kxiQmPtcelyoyXwI7X05duCxuUKxyxT3uyVbf8W
 GVI770geuGcWGk1hl7l4YFVjbiFJsMEJ21HL4zU=
X-Google-Smtp-Source: ACHHUZ7+4nzMYlaDrn7rVFFD+Q5mDNEtrZZmfI4a3156T3Myin3s2fmiHjiZyWksx+rXGSJ/l7q88A==
X-Received: by 2002:a05:6870:346:b0:1b0:4e0f:3822 with SMTP id
 n6-20020a056870034600b001b04e0f3822mr4030639oaf.18.1687883565590; 
 Tue, 27 Jun 2023 09:32:45 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 gu17-20020a056870ab1100b001a3093ec23fsm5254134oab.32.2023.06.27.09.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:32:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 11/19] target/riscv/cpu: add misa_ext_info_arr[]
Date: Tue, 27 Jun 2023 13:31:55 -0300
Message-ID: <20230627163203.49422-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627163203.49422-1-dbarboza@ventanamicro.com>
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Next patch will add KVM specific user properties for both MISA and
multi-letter extensions. For MISA extensions we want to make use of what
is already available in misa_ext_cfgs[] to avoid code repetition.

misa_ext_info_arr[] array will hold name and description for each MISA
extension that misa_ext_cfgs[] is declaring. We'll then use this new
array in KVM code to avoid duplicating strings.

There's nothing holding us back from doing the same with multi-letter
extensions. For now doing just with MISA extensions is enough.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++--------------------
 target/riscv/cpu.h | 11 ++++++++-
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 641bec3573..0e5d8b05a2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1566,33 +1566,41 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
+const MISAExtInfo misa_ext_info_arr[] = {
+    [RVA] = {"a", "Atomic instructions"},
+    [RVC] = {"c", "Compressed instructions"},
+    [RVD] = {"d", "Double-precision float point"},
+    [RVF] = {"f", "Single-precision float point"},
+    [RVI] = {"i", "Base integer instruction set"},
+    [RVE] = {"e", "Base integer instruction set (embedded)"},
+    [RVM] = {"m", "Integer multiplication and division"},
+    [RVS] = {"s", "Supervisor-level instructions"},
+    [RVU] = {"u", "User-level instructions"},
+    [RVH] = {"h", "Hypervisor"},
+    [RVJ] = {"x-j", "Dynamic translated languages"},
+    [RVV] = {"v", "Vector operations"},
+    [RVG] = {"g", "General purpose (IMAFD_Zicsr_Zifencei)"},
+};
+
+#define MISA_CFG(_bit, _enabled) \
+    {.name = misa_ext_info_arr[_bit].name, \
+     .description = misa_ext_info_arr[_bit].description, \
+     .misa_bit = _bit, .enabled = _enabled}
+
 static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
-    {.name = "a", .description = "Atomic instructions",
-     .misa_bit = RVA, .enabled = true},
-    {.name = "c", .description = "Compressed instructions",
-     .misa_bit = RVC, .enabled = true},
-    {.name = "d", .description = "Double-precision float point",
-     .misa_bit = RVD, .enabled = true},
-    {.name = "f", .description = "Single-precision float point",
-     .misa_bit = RVF, .enabled = true},
-    {.name = "i", .description = "Base integer instruction set",
-     .misa_bit = RVI, .enabled = true},
-    {.name = "e", .description = "Base integer instruction set (embedded)",
-     .misa_bit = RVE, .enabled = false},
-    {.name = "m", .description = "Integer multiplication and division",
-     .misa_bit = RVM, .enabled = true},
-    {.name = "s", .description = "Supervisor-level instructions",
-     .misa_bit = RVS, .enabled = true},
-    {.name = "u", .description = "User-level instructions",
-     .misa_bit = RVU, .enabled = true},
-    {.name = "h", .description = "Hypervisor",
-     .misa_bit = RVH, .enabled = true},
-    {.name = "x-j", .description = "Dynamic translated languages",
-     .misa_bit = RVJ, .enabled = false},
-    {.name = "v", .description = "Vector operations",
-     .misa_bit = RVV, .enabled = false},
-    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
-     .misa_bit = RVG, .enabled = false},
+    MISA_CFG(RVA, true),
+    MISA_CFG(RVC, true),
+    MISA_CFG(RVD, true),
+    MISA_CFG(RVF, true),
+    MISA_CFG(RVI, true),
+    MISA_CFG(RVE, false),
+    MISA_CFG(RVM, true),
+    MISA_CFG(RVS, true),
+    MISA_CFG(RVU, true),
+    MISA_CFG(RVH, true),
+    MISA_CFG(RVJ, false),
+    MISA_CFG(RVV, false),
+    MISA_CFG(RVG, false),
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cc20ee25a7..d4cab2722b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -41,7 +41,10 @@
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
-/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
+/*
+ * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
+ * when adding new MISA bits here.
+ */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
@@ -56,6 +59,12 @@
 #define RVJ RV('J')
 #define RVG RV('G')
 
+typedef struct misa_ext_info {
+    const char *name;
+    const char *description;
+} MISAExtInfo;
+
+extern const MISAExtInfo misa_ext_info_arr[];
 
 /* Privileged specification version */
 enum {
-- 
2.41.0


