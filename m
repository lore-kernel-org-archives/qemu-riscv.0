Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D53C61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cjG-00026F-Uf; Fri, 24 Nov 2023 15:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cjF-00025U-AL
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:45 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cjD-0005NK-Sc
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:45 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ce3084c2d1so18045525ad.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857481; x=1701462281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPXXV9bkY2OSq9AnfDFrJZbtoSfi0+GO4F9KAkwaxAQ=;
 b=NyCiGnpnNCthmHL4D0s2j8pR9kvP6peIIATCHhUzKwi0Dgc2HpFDKj31Far3FtYs1B
 OKqQ8BfYZu2V4quwP/T5+tUmZq9zwSR1YH2uRQW5OkLfxPZcMAjGCVJt/QHrvJwtxDs+
 kgOERP++BzNwz+/4uAeNs4Yea/2y+qHMexzTURMdGaz9yYcxQpagmWsqccx1BIwesXD9
 ZUyWhkEM2W5LhHe8UTgtn559K7NTIRlAa+In/uMyIPKAGBAq240QhLHTmE0bx0KBf52y
 OZSh2sj9L4VDdF/2OLjz1gPpU11AKPR+Hs4+Q8UO7WuKW+Vr3j0JnNSsVUJz9lxzO+DP
 qzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857481; x=1701462281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPXXV9bkY2OSq9AnfDFrJZbtoSfi0+GO4F9KAkwaxAQ=;
 b=eqDHJchRBRhKiXmFiha5QcoP5mVcaUk/adAhSbTJC3wto65BL3arglQtVc5rEIIsOm
 46xdy+DzjfFr7vU3zR23S6vE7AbFmjR5CGIjcQ3pj/lwPUZ/FtM1ZiOqRtzEJtIDI3/y
 saEc4vEHhjpqlMT6O802QWgXafDqjFL+j8NHMKIniTX4i7OBrVYenfavjoGiekCtLf8M
 rxfJyuTZhn/i7/bjfCrYxMJIPrx4fZVq0JHySZ3BARZDWibnqaDgBBbUwF5sxDCLSDK8
 J/ZNOIAtHN3jLQwf7SGChjJT/ICc/CRz3CRz+hgGAXi/yxKHtelG5HIXc5tqpcZWotoz
 MqrQ==
X-Gm-Message-State: AOJu0YxuYZbAj1h5KUNiDsG1nx84E9AnOJ/5FvxjzYxDrPWdWHecjtGl
 eOyKjBARkD22S4giwbmQooiP0w==
X-Google-Smtp-Source: AGHT+IG5Q3qNUC//xfLEYNtr9rZKbeBxVCVBeK76+ueT4iIQf6YlMf/HWXsZ9EchRsGmGB6yz25tCg==
X-Received: by 2002:a17:902:ea84:b0:1cf:5c99:75f8 with SMTP id
 x4-20020a170902ea8400b001cf5c9975f8mr4446574plb.65.1700857481721; 
 Fri, 24 Nov 2023 12:24:41 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:41 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 13/18] target/riscv/tcg: handle profile MISA bits
Date: Fri, 24 Nov 2023 17:23:48 -0300
Message-ID: <20231124202353.1187814-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
References: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The profile support is handling multi-letter extensions only. Let's add
support for MISA bits as well.

We'll go through every known MISA bit. If the profile doesn't declare
the bit as mandatory, ignore it. Otherwise, set the bit in env->misa_ext
and env->misa_ext_mask.

Now that we're setting profile MISA bits, one can use the rv64i CPU to boot
Linux using the following options:

-cpu rv64i,rva22u64=true,rv39=true,s=true,zifencei=true

In the near future, when rva22s64 (where, 's', 'zifencei' and sv39 are
mandatory), is implemented, rv64i will be able to boot Linux loading
rva22s64 and no additional flags.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f8c35ba060..f2e0ce0f3d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -941,6 +941,27 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if  (!(profile->misa_ext & bit)) {
+            continue;
+        }
+
+        if (bit == RVI && !profile->enabled) {
+            /*
+             * Disabling profiles will not disable the base
+             * ISA RV64I.
+             */
+            continue;
+        }
+
+        g_hash_table_insert(misa_ext_user_opts,
+                            GUINT_TO_POINTER(bit),
+                            (gpointer)value);
+        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
+    }
+
     for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
         ext_offset = profile->ext_offsets[i];
 
-- 
2.41.0


