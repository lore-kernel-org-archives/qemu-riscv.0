Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFBAC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:48:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRg-00076Z-PI; Thu, 02 Nov 2023 18:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRL-0006Uf-Qm
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:32 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRI-0003RJ-Ow
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:26 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5b499b18b28so18292417b3.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965124; x=1699569924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dc09ZWXewoK9XGzWZ1MU4cJ4OfCofqhMYJBOlXbdT0I=;
 b=BaMZo+/120SXWHeliMS8maXWPmMDiYsIzvLPnxmvf/LA9pjaCb+jz1OwAD2TC48gFH
 BGOgwCTrZu0sVm/tpNVt7YSdDUJwZalFvTljez2ugWlw3UnSm3NjlblSHOhMVHW9CJZ1
 uR5IW5v+WQ4KFP/+v9g1i0Qt7fJk5F6JshS7Pp7Rt8dDJjwe94UJ6V0HWojeLemfSW2s
 dUFFNIaMTnhK4VZ92/16gvWingdYWsMaAgN3lEJbptGpkoLpW21eNVbK5dKhB1QUBR3C
 /vEszsW0MlMuHRybmlh63EgVl9qcl2W+/UcgRkZ5AwWJNzK2NO0b0owkIy567iyh61V2
 GP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965124; x=1699569924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dc09ZWXewoK9XGzWZ1MU4cJ4OfCofqhMYJBOlXbdT0I=;
 b=lswN1o5bleho8UKutfTdZyaLRtOPDrx/9ZzS/37Nkqz/+kF21nSBiy1XG97IAVjKnO
 2tfHx3pd748ALi/VBEmgt5HituwRHuRTLXNTZXku/bKt2tzxkaoUtzk967HfacwczQr1
 0mUvgKmD1CpAaFp2dWXQSYpgXegspO69Obea7hNZELBiDBqeKogzhCRS1tabXqQ12WBu
 M9ryBS6/vV0YmydOiX5+hdSYBMM4FJGYogtuqpnMZJV01IDgKsLT/WKBkLXXO767W0uD
 JuoDKAYaR5d2xe7VggkkB8ugMcecQTRn6t6LoUTZjGzhVZmpZe02TQm7QVCDUGycnqDK
 TaVA==
X-Gm-Message-State: AOJu0YzpyRdxm4SLqt+6Lqcun2TJoH7g5npbAjarCvuMpAqEvmbuAnWO
 szC+Qf91UJB2zU2mb9EG7mNoNA==
X-Google-Smtp-Source: AGHT+IHEZ66J7k70Zusc18RIlqfnmnQhgHaD9htBayA1gC5P8juIXCYP/cITOhTRRxbJlRTbpsKeWw==
X-Received: by 2002:a81:6e07:0:b0:5a8:72ee:463d with SMTP id
 j7-20020a816e07000000b005a872ee463dmr1210406ywc.49.1698965123933; 
 Thu, 02 Nov 2023 15:45:23 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 13/19] target/riscv/tcg: handle profile MISA bits
Date: Thu,  2 Nov 2023 19:44:39 -0300
Message-ID: <20231102224445.527355-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1136.google.com
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
index d80f72a9da..f5a71b38f6 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -914,6 +914,27 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
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


