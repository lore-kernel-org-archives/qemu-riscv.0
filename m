Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AD1C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVOo-0000VO-Pj; Mon, 15 Jan 2024 17:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVOn-0000UL-CW
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:41 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVOl-00061q-Ky
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:41 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6daa822be30so3882170b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705357538; x=1705962338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lT0phRZ9oTpRjBU5KO4G/ql0H7YMEWcTrCKQ7fmArKs=;
 b=gCezON85c9HX6I5MQDAjp/ywFGzDOMIe9g9D3O8sk4EdrSPuBsNyUE2PJHv7kF+7lE
 E/p6b0FxALniEdrOStPLuF7RhESot2sTYPqDSQtNAMCph2dueWcE2QEVkO3KcdXOMmtI
 sB1zA035QD1tfPn9FOKa4mQRclU+Wy1//ond4FPRdrb3OKfwRf5t/foVF2BTNgJzK+sR
 GaGDRTOqggEGtYiUi8PQ0tfr271Vay7IAuKPMPBDGD0GoQb6WCbS72SDvcdNOX2cO57V
 3hzQbojlWbrQqC/isAxUlqOZRL6gxVkFSse5xdxY2W1o4l8ifflXpSARPTq4YHtkfdGs
 M3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705357538; x=1705962338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lT0phRZ9oTpRjBU5KO4G/ql0H7YMEWcTrCKQ7fmArKs=;
 b=ogjJPWRHN9mc1QgNiZIGno0W+wjB96+hBBueQyTO+cbgZsjhxf8n0Tzn+IZu9TRGib
 lajuLFYL7eNu8Vkl+CK4LB1yegdCnY9kSlB11l1MNzeLYdFCNsws4Rp3USj3aqk8jOro
 iAQAsVvbgeY3kq5sxlT7RMlSmKWVRITKDuRScJpNVTciSPQrEyxSNV0bx4YIJ6RqOEU0
 4dGzNZ9qBsGi0WUYAKaxux/KqbePjSp+6OXC1+y38lwUzzetpDrzF8YRWQBuhA5lNdDd
 xtGKU4QJ0CCq4AtpzO4A6MRB6nA+6GM564Bfwbb44sICNZyXaQ/CLKD7uKzuzkfTJKhy
 eWuw==
X-Gm-Message-State: AOJu0Yxoyg+Wtqz2ThHiYtW4eJmzemXrgp92+WRzDNwuAbJRsRNu6YS0
 J9Extl19mxy5xuPXy6k1SL0XfEKXU3GhsA==
X-Google-Smtp-Source: AGHT+IGFVkq97h4Uq4VPs7S3+tVQu+cFlK84JEOGBRDZ9+W2Z3Hxq06Ez5sz5mJWY7B3S8mVO1YC2Q==
X-Received: by 2002:a62:c106:0:b0:6d9:b385:26f9 with SMTP id
 i6-20020a62c106000000b006d9b38526f9mr2971007pfg.2.1705357538040; 
 Mon, 15 Jan 2024 14:25:38 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a056a004b9300b006d977f70cd5sm8125940pfb.23.2024.01.15.14.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:25:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/12] target/riscv: add 'vlenb' field in cpu->cfg
Date: Mon, 15 Jan 2024 19:25:17 -0300
Message-ID: <20240115222528.257342-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115222528.257342-1-dbarboza@ventanamicro.com>
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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


