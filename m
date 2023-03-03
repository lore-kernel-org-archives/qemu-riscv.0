Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z3-0007nW-79
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z0-0007ZE-Ar
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:42 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yy-0007qD-L5
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:42 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z2so1941884plf.12
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832899;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcuWfVLv90nTH9ge75vXg3yLoUBwSn2SzMUf+lNtxFY=;
 b=oc5hzZGi1tkywwpu9azT+KRWT6ia4ODRsGR63CUJ6UL21FNaWlXbUt1hxb04zhx2HW
 bkAgkmUbctOS8FbaO7neyd1LdHr/qQUeS7Ct9BW9vVTDjLE1e6VxNDVUGwk+yVEZiQ8n
 uyGiHq15q8EonkxD1HdBHjvYlKP+VSgX1BUz2YuJeYXHdzZsDpaKwpJ18XAP5xvbbAYD
 96/wQ/4DZF9ByiqVEtAeKLjjPoT4C05SGW/SsHq2yJE6m3xQawcqFKcqp/dtH3sH7CqE
 A4/Pc9WuuPr0aGEQqBrrrNlBioC3io0DfYB/7uYz9JzmXtiPPQa6dwl2rWtM01i7iqQk
 PZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832899;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcuWfVLv90nTH9ge75vXg3yLoUBwSn2SzMUf+lNtxFY=;
 b=8DG3UDC7bkpID1sZDZLhLAVhI0pCDrU4k+gKBll1SfkgAeFR9HVywfVDtagivTOxMe
 I1Svfk7vw0TXl6lnga5KCJCRJQ8WL/0H+YEtuWJ/30HOsIeVRNBzMI59iliYbUktx9Fe
 cHOpWZJ8L01stDH7NEeGP8Szl7KwwE/n0RvskqukSrKXYLPzi2axqr62xJOc4S1391Wt
 ZYJoOPmcFQWE/zTu8p+xn1xZNpIa1KRdTiQ6DnHbTbPqqZxl5DtNiWB6EBHqCfZSIvvG
 PK4IUvq6Nx+QLwzH2HKs5NNDE4Lsc/u6o9+kKR8dYERIEGEhC3Z10TsmG0TYu6L65UOg
 eZlQ==
X-Gm-Message-State: AO0yUKVL0rKnBbFKnOONiHfwkuoanBO668hBf+fvyytZYpWPd+mN3t7z
 yrMrTs6RxDo3dXiU3e+5Wpw+FfxqxBSXmzoZ
X-Google-Smtp-Source: AK7set9iOf1TU7OPnBW3Y7ncZCnB6jJm/7wp7vTksHtOW5/VHNN8H1bXk30DRhHdt2LY/yMGTKN1NA==
X-Received: by 2002:a05:6a21:9998:b0:cc:d514:62ce with SMTP id
 ve24-20020a056a21999800b000ccd51462cemr1772246pzb.44.1677832899628; 
 Fri, 03 Mar 2023 00:41:39 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 b9-20020aa78109000000b005d72e54a7e1sm1006384pfi.215.2023.03.03.00.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:39 -0800 (PST)
Subject: [PULL 15/59] target/riscv: Fix relationship between V, Zve*, F and D
Date: Fri,  3 Mar 2023 00:36:56 -0800
Message-Id: <20230303083740.12817-16-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:42 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add dependence chain:
*  V => Zve64d => Zve64f => Zve32f => F
*  V => Zve64d => D

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-6-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dcd85f7f27..49912c9174 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -743,12 +743,27 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
-        error_setg(errp, "V extension requires D extension");
+    /* The V vector extension depends on the Zve64d extension */
+    if (cpu->cfg.ext_v) {
+        cpu->cfg.ext_zve64d = true;
+    }
+
+    /* The Zve64d extension depends on the Zve64f extension */
+    if (cpu->cfg.ext_zve64d) {
+        cpu->cfg.ext_zve64f = true;
+    }
+
+    /* The Zve64f extension depends on the Zve32f extension */
+    if (cpu->cfg.ext_zve64f) {
+        cpu->cfg.ext_zve32f = true;
+    }
+
+    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+        error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
 
-    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
-- 
2.39.2


