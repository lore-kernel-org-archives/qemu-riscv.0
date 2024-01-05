Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D80C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:07:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGw-0002Rs-Cz; Fri, 05 Jan 2024 18:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGu-0002R2-Jh
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:36 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGp-0002Le-Lj
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:36 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d9bba6d773so86344b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495990; x=1705100790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHjSVPH3zELlQZx/b1MXn2WTcPRqIP9cMFriGvW6sbQ=;
 b=AIOd58DS+SsMgdD/Q5pYuPLMI7ISzpa634Zzau1bXwObznolPpiGJdWx+yqZqnBcQo
 DqU6SsPvePD0zJIehymKVnpG3ugzkmbPiOZg+6TqM1lkzMQC3Z83NhzHjpdTsdmjFEEJ
 78a7lZm/9aDjo4OufyseZBvhwjiLEN79OTStEKmZGzObjb1Y2JlZiTb0N1oxpYyWaPgQ
 o0IHrPCzucxy6M7oB4ksDbpFdJEMSor9CNztg5BSV73pejXk5Np6wBb6Oh7uPIa0i71v
 1SOztePT457k5TTkAlHCpZqwSTn1qG0DL/tRd5xwlxWyxKwEu/snPLje9IW1P1DCVojo
 qghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495990; x=1705100790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHjSVPH3zELlQZx/b1MXn2WTcPRqIP9cMFriGvW6sbQ=;
 b=umhmrFsswJs2SToCy3uI5JuvlWkraJRZwKexRIbGh7bdhg6sQ2+dQkXK30B2y2IJHD
 eCTFLC6LnY6cGcJJXz5smbzZI+e+cI3zrdBjDHLodW04RqU3BM/nIGO6Fef6KjCkHqFt
 ihwCggKW1oo2wFCs9iJ8B6tl6u5I0C2ai/+q7gl/U3eROgNB50f2Qo/GKc+2nMv6+sdQ
 h/sjoZR8XRhL+KU48NSRY4sPrMGDqTF89S41EzGcmL5yJEsrWRl/zEX7l82W+1t4VLq/
 IEbb3glVDXX1m2dHk79gb6QybZn/ChJSrT+I1uk84vwCaUvo9QORgOV0v5NmRBrFlsVE
 ZzAQ==
X-Gm-Message-State: AOJu0YzKb73WLqJVt/JWqVisdEcBzJk0zBZNpf4D87lH8QU72BLlHIsC
 xfmzNme4uAHeSOTW01DIop33yVB4rcOWCA==
X-Google-Smtp-Source: AGHT+IETcKpumKTAzFJV4Grkl72V62Rlua0ZK2ZArRyG5w/7wFXkU8fCIt8nflkRlFFE9bcu4c+2dg==
X-Received: by 2002:aa7:908d:0:b0:6d9:bce7:d8e3 with SMTP id
 i13-20020aa7908d000000b006d9bce7d8e3mr80953pfa.24.1704495990306; 
 Fri, 05 Jan 2024 15:06:30 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:06:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 12/17] target/riscv: move 'cbop_blocksize' to
 riscv_cpu_properties[]
Date: Fri,  5 Jan 2024 20:05:41 -0300
Message-ID: <20240105230546.265053-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Do the same we did with 'cbom_blocksize' in the previous patch.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b77d26231c..e3cbe9b1b6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1317,6 +1317,7 @@ static void riscv_cpu_init(Object *obj)
     cpu->cfg.vlen = 128;
     cpu->cfg.elen = 64;
     cpu->cfg.cbom_blocksize = 64;
+    cpu->cfg.cbop_blocksize = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
@@ -1902,8 +1903,42 @@ static const PropertyInfo prop_cbom_blksize = {
     .set = prop_cbom_blksize_set,
 };
 
+static void prop_cbop_blksize_set(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value != cpu->cfg.cbop_blocksize && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.cbop_blocksize);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.cbop_blocksize = value;
+}
+
+static void prop_cbop_blksize_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.cbop_blocksize;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_cbop_blksize = {
+    .name = "cbop_blocksize",
+    .get = prop_cbop_blksize_get,
+    .set = prop_cbop_blksize_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_END_OF_LIST(),
@@ -1992,6 +2027,7 @@ static Property riscv_cpu_properties[] = {
     {.name = "elen", .info = &prop_elen},
 
     {.name = "cbom_blocksize", .info = &prop_cbom_blksize},
+    {.name = "cbop_blocksize", .info = &prop_cbop_blksize},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
-- 
2.43.0


