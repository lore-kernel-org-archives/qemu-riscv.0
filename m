Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE18FC4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 21:38:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOPER-0003oR-1J; Fri, 12 Jan 2024 16:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEO-0003ni-Tm
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:24 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEN-0001Xi-6L
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d4ba539f6cso63882935ad.3
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 13:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705095501; x=1705700301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lT0phRZ9oTpRjBU5KO4G/ql0H7YMEWcTrCKQ7fmArKs=;
 b=fVNan446iL8AMq35720eZM2IvqJIdvx7eN1kF4qA+PnmCdaZPQtzgspdPl8iLEXniv
 C2Qy7kLhTFGsGhvGxkk2B80r6wVWabXQBjoOIUP4n5UxyeKTE2tbIhpm7AKArNQQy/WY
 0ejEMYZulVYwYLzwTF2MFGF3MnGN3z378V5cIe7bv2e5u9aqRk46dMqtA74dJLv6H+TD
 rTRicbMpbvh45eHgxtWmvjI9B41uax8CK2164oTkUC/JkYBG3uZ0dtHzyUShGNPqXJ+p
 oTdCWAm8cTnDXa6BslajDppkTN04hR14bZV6XSX5ChEnVWF6YWFadBdQuy9KfQPFC8Z8
 mGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095501; x=1705700301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lT0phRZ9oTpRjBU5KO4G/ql0H7YMEWcTrCKQ7fmArKs=;
 b=NC1HM2vy59zx6d1bYC0SAPZ7k3XKpYJkl9T7NcgbeVnKbbNp5dswsXF9tdT+eJojvy
 9bhTCra9fSthg71lWS3qIgnaQeZlO3HTql1GZ4gdZj+tm7LRch/77dK412KKcvUVB3dj
 1eG+comOE57Mio1QFRKEE3spAB9sKjKJMMxPayZPsv/lMG4xzP8Dr9MKAC7xzbHyOEOa
 vAFTP7oqYTnsXAL0sI3PXStSxcp3P3rFcBa9MtSxHWSNivQN4me0nNcnxKm3yZP/FPMO
 S6vz6SFemtzurGP2nW4OkGDLUTARzAoAYf2d1SjtRSJplsIn4bF9sCiO1DGfpmi8Sg/h
 4RlQ==
X-Gm-Message-State: AOJu0YySEKxEjDbQJ+r+Vh/PCii8lLd20EKPyXknBALDNPhkr1hdmUpM
 FsMH0JjIh5EAffCm29DM2Tp1BB/Ynpsomg==
X-Google-Smtp-Source: AGHT+IGEqZMVcba7VB6yaSfH+dMKkbb6UugWzE7iA7zy5t9YkDTNOLbFPzUjOzBvehchKjPjF9IGDg==
X-Received: by 2002:a17:902:d4c6:b0:1d5:8cc1:70bf with SMTP id
 o6-20020a170902d4c600b001d58cc170bfmr2139839plg.51.1705095501562; 
 Fri, 12 Jan 2024 13:38:21 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 lf8-20020a170902fb4800b001d5b2967d00sm364727plb.290.2024.01.12.13.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:38:21 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/13] target/riscv: add 'vlenb' field in cpu->cfg
Date: Fri, 12 Jan 2024 18:38:00 -0300
Message-ID: <20240112213812.173521-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112213812.173521-1-dbarboza@ventanamicro.com>
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

Our usage of 'vlenb' is overwhelming superior than the use of 'vlen'.
We're using 'vlenb' most of the time, having to do 'vlen >> 3' or
'vlen / 8' in every instance.

In hindsight we would be better if the 'vlenb' property  was introduced
instead of 'vlen'. That's not what happened, and now we can't easily get
rid of it due to user scripts all around. What we can do, however, is to
change our internal representation to use 'vlenb'.

Add a 'vlenb' field in cpu->cfg. It'll be set via the existing 'vlen'
property, i.e. setting 'vlen' will also set 'vlenb'.

We'll replace all 'vlen >> 3' code to use 'vlenb' directly. Start with
the single instance we have in target/riscv/cpu.c.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c     | 4 +++-
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8d3ec74a1c..f4261d2ffc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -847,7 +847,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                              csr_ops[csrno].name, val);
             }
         }
-        uint16_t vlenb = cpu->cfg.vlen >> 3;
+        uint16_t vlenb = cpu->cfg.vlenb;
 
         for (i = 0; i < 32; i++) {
             qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
@@ -1314,6 +1314,7 @@ static void riscv_cpu_init(Object *obj)
     /* Default values for non-bool cpu properties */
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
     cpu->cfg.vlen = 128;
+    cpu->cfg.vlenb = 128 >> 3;
     cpu->cfg.elen = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
@@ -1810,6 +1811,7 @@ static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
 
     cpu_option_add_user_setting(name, value);
     cpu->cfg.vlen = value;
+    cpu->cfg.vlenb = value >> 3;
 }
 
 static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index fea14c275f..50479dd72f 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -140,6 +140,7 @@ struct RISCVCPUConfig {
 
     uint32_t pmu_mask;
     uint16_t vlen;
+    uint16_t vlenb;
     uint16_t elen;
     uint16_t cbom_blocksize;
     uint16_t cbop_blocksize;
-- 
2.43.0


