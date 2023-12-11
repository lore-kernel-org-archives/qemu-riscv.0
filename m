Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB4C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:08:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCjlP-0000SU-4w; Mon, 11 Dec 2023 12:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rCjlN-0000SG-7O
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 12:08:13 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rCjkt-0000Hd-W6
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 12:08:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d05199f34dso27670075ad.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 09:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702314462; x=1702919262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=su+2FCyrz66PAr2bdXzt4MrXwyJEhravdAvsltVQ32E=;
 b=XPauoGTfG/R47Ootaq0/EUlGUOQ3dfyYTmzfQCsxLxA3LinTDI6enlFDy2lkAA6C2C
 NU6sYm9SP2IfT5tTovaf6mDQmHV40h/z1jxeBp4puaMbgDRLVP9ctr5ObI5mJDSvyE5Q
 2EAC5Vqbejposo83J2lRmFFQUSw1ngGj7KxpxQPXu6uyugOh/j3a7KhV+GeOA7BZnJpq
 a53sQNHw4CuNkpzbpQfXvFROMAEsxWU3KnJglczZQuOpMkjcf4q8SKfE7pSjVxGHFPRQ
 Ba+cJ8YBySF2yQGTR3ZIHAErabwsPS+ifl1PRWK8rjTzJGSEPRJbrxoNSimMZ3A0oyEN
 vM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702314462; x=1702919262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=su+2FCyrz66PAr2bdXzt4MrXwyJEhravdAvsltVQ32E=;
 b=Wd3DjjHAqXNhzI2C6BdxkJ0VMB4w5nX8ogiibPwKBZEXShaEs7T5qUW+Iz4FIw+2aO
 NizpHQdcsWjAgd0JDV6OxHzlfq57u1gWaPJCmlBuDWkwOXNSApTejgR//qtmNHYej+l4
 fIXhMAatLqc93pYXUfQbHTfu9W2U4MaAlX/GqnWhvf8OOm4iA7+AnEfdy9W8QNUULm+4
 kHRaSPijQYDXxCTI6I/kc6LKLyZ/mJKK+1w/PgfXkJR1G1p7iUStQ3qU0AE/FZ7np7J6
 uXvZkBOe0qyjbSUcrNoQHPvEEvmB3YJ8mrXTK7q1OYAD94hZSqjEZhLX3eZ5R3/O0sPF
 Et/w==
X-Gm-Message-State: AOJu0Yw6UUQwGpCIof9sQT8AzE92ZBkHdCjwuOOpg1sp9blHunWxGm5y
 GZIs7s2SIbKFJf6DFJ0iIgiOLA==
X-Google-Smtp-Source: AGHT+IEaL6c/4FQIjOs77jAg6M2ZFuhFwoNgj7UGOfM/Xz65hlA2b92rFN7jFPU4RvnO7ynRIq8ZGQ==
X-Received: by 2002:a17:903:32c5:b0:1cf:c9c3:e79d with SMTP id
 i5-20020a17090332c500b001cfc9c3e79dmr2285242plr.59.1702314462056; 
 Mon, 11 Dec 2023 09:07:42 -0800 (PST)
Received: from grind.. ([152.234.124.8]) by smtp.gmail.com with ESMTPSA id
 k9-20020a170902c40900b001bc676df6a9sm6901845plk.132.2023.12.11.09.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 09:07:38 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0] target/riscv/cpu.c: fix machine IDs getters
Date: Mon, 11 Dec 2023 14:07:32 -0300
Message-ID: <20231211170732.2541368-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

mvendorid is an uint32 property, mimpid/marchid are uint64 properties.
But their getters are returning bools. The reason this went under the
radar for this long is because we have no code using the getters.

The problem can be seem via the 'qom-get' API though. Launching QEMU
with the 'veyron-v1' CPU, a model with:

VEYRON_V1_MVENDORID: 0x61f (1567)
VEYRON_V1_MIMPID: 0x111 (273)
VEYRON_V1_MARCHID: 0x8000000000010000 (9223372036854841344)

This is what the API returns when retrieving these properties:

(qemu) qom-get /machine/soc0/harts[0] mvendorid
true
(qemu) qom-get /machine/soc0/harts[0] mimpid
true
(qemu) qom-get /machine/soc0/harts[0] marchid
true

After this patch:

(qemu) qom-get /machine/soc0/harts[0] mvendorid
1567
(qemu) qom-get /machine/soc0/harts[0] mimpid
273
(qemu) qom-get /machine/soc0/harts[0] marchid
9223372036854841344

Fixes: 1e34150045 ("target/riscv/cpu.c: restrict 'mvendorid' value")
Fixes: a1863ad368 ("target/riscv/cpu.c: restrict 'mimpid' value")
Fixes: d6a427e2c0 ("target/riscv/cpu.c: restrict 'marchid' value")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..70bf10aa7c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1573,9 +1573,9 @@ static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
 static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    bool value = RISCV_CPU(obj)->cfg.mvendorid;
+    uint32_t value = RISCV_CPU(obj)->cfg.mvendorid;
 
-    visit_type_bool(v, name, &value, errp);
+    visit_type_uint32(v, name, &value, errp);
 }
 
 static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
@@ -1602,9 +1602,9 @@ static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
 static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
-    bool value = RISCV_CPU(obj)->cfg.mimpid;
+    uint64_t value = RISCV_CPU(obj)->cfg.mimpid;
 
-    visit_type_bool(v, name, &value, errp);
+    visit_type_uint64(v, name, &value, errp);
 }
 
 static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
@@ -1652,9 +1652,9 @@ static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
 static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
-    bool value = RISCV_CPU(obj)->cfg.marchid;
+    uint64_t value = RISCV_CPU(obj)->cfg.marchid;
 
-    visit_type_bool(v, name, &value, errp);
+    visit_type_uint64(v, name, &value, errp);
 }
 
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
-- 
2.41.0


