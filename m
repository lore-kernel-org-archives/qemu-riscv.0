Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BBC47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:00:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqVz-0004ZP-Pz; Tue, 16 Jan 2024 15:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqVy-0004YX-67
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:30 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqVw-0007ZQ-Il
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:58:29 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso4899928a12.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438707; x=1706043507; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOWLB2x4xfDecgWD2qHtPR5sj/No/b3PuDL+cAM0xow=;
 b=NKjRH/Diyc6onKWIGJ8oQvMFQFwcOsewqUdQ4LanS2xCKoK6PjIPno765wHKeI60+H
 vKGwfHZv6i312q0PEuqgzrBLYo2BO7mlbMPS6pYWbSxa/UMaA4tvNhWvwSr8CKAevF8J
 ofqIH6DcLCWmWoh9Kva9EuATyNJ3UCZ3WHPMJf/YJHjI2ZLVl49gsNCLMdibmQeWYpau
 E4FaUI1PLTSFDqjNum162gd2BQg3apsRw3SyKZUvUQO4GFNKdass2WBnc8pjVqrRFNOx
 fBec0x1PI7tNx0Qh2fc0T5IJbF5UnKlWenEZS6sEgVPafu312yG8cRetBuwntZWrhfnU
 ftpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438707; x=1706043507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOWLB2x4xfDecgWD2qHtPR5sj/No/b3PuDL+cAM0xow=;
 b=q7trG2uK6zDvTAJleg0v5zrangGKQCOmKfnoTs04NjGLIOZWVr1RkauOCQhqM/MAl6
 y1YlhN/WKUU6FpL5OHD+OjrzIewV+WfiA+B7UJvOfApCLmGCKt43aeSyC2V60yysYqXR
 hYm+FCzdAbG5uz3pAgwlnm1oLkvSXEHWxxgZv745ov3+F/mNcIywf1A/FE12h6p/4Rxl
 RvE7t3lEW526+RtAx7SddTVKhVGGClfHTXQVWoZw7rzlpjqfzv6L7uJoYElB80DjWRYW
 4KBTyCwIKrZISQYufUw7PgBWlaQ7uEj3sIx+WptnsA1zmvwB4znjZZBy/HDtCu+3WRtv
 NTRw==
X-Gm-Message-State: AOJu0YxWoLlQIaZQiMXb7zliMgswlPkU/FQyLrkL4o0Tnj6t9RKJ2Br8
 7yjJ46slyVwwksN3qKeenRda5B6m8QSbUA==
X-Google-Smtp-Source: AGHT+IFzsDNsMJmFojb4WsMcdxUqJrj0juHNS2ONrfXulPFEGRDFVXrOl2JpYLHpa8GCLLy7RSyagw==
X-Received: by 2002:a17:90b:3586:b0:28b:16b0:55a4 with SMTP id
 mm6-20020a17090b358600b0028b16b055a4mr4071241pjb.38.1705438707228; 
 Tue, 16 Jan 2024 12:58:27 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:26 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 01/13] target/riscv: add 'vlenb' field in cpu->cfg
Date: Tue, 16 Jan 2024 17:58:05 -0300
Message-ID: <20240116205817.344178-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52d.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


