Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B2BC47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:13:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwtQ-0006Rm-Lw; Mon, 22 Jan 2024 11:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtO-0006Qv-9A
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:22 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtM-0005Hx-Ml
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:22 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ce74ea4bf2so2082491a12.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939879; x=1706544679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdZGIPIeOKiZR9PMV7XS4inlMO2XkrOcO/ATQYdynj0=;
 b=dvWrrazt6MNThmcl5Np91FA//dXKNvU29AoeoOMEG5FcVInwQpyfi+u6fTPEsvxet/
 WB3MsG5WdED2xArCtxYeJ7fvHFkWSXIiZkHfSxnAC/hU5h830Jp5jGMfjYapFK6o5OHB
 jGS75eVaGeVX4ImVlAldre/iHDM2wTJBM7W0XFEofF4oFKKa2lWz1hWMktLzVI1GoL/M
 HkhnEBXDc/aSn9jXH5uYJzVHIlx/qie5fzG6jU1wTp+LHWqdVj8pz26oHKZ0v0gOyxeD
 9bteshwwC47/58i4FaAe/rtjDcadYVaII80QqzPoYrGgiXKaQ6vuw6bdMGK1LdpLKn3E
 cbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939879; x=1706544679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdZGIPIeOKiZR9PMV7XS4inlMO2XkrOcO/ATQYdynj0=;
 b=lBrvREKws9MFD9ZeeWzBe1L3eCGFr/Lr0bXk2a2sI2iuSwsi2Jgr5ouGtyaz/1kl37
 OZ0W16TSVkeNdTlnm9acfR2MsmeziHtVFl8BUvOwsKuBo1fBwnDWTuHDO5oIu+Pz2I6X
 qc3aBOhMLBeEoLCnRL9qIkKlm+oWAx3PGTmzcwtyTfybcr3vhS4lZN0EUhJgOFQ2oGFV
 TyNyq2TCbhxtFirUNBEnHkZysGtdaNJ6uFufzCf+5RQHxM52OklRd4P9maQTIrJW4eBZ
 l03WHyvdwpMTRdsxfcZWs1nMTHBdoAsM4t2LmWiUi1gGhtrpgudgOjKUHcDxK2KoBSsl
 m1Dw==
X-Gm-Message-State: AOJu0Yy7KqA4/yP56LuiI/WhbJvUy4jmT5pfpDxlYwwjo8MTHhMboLoE
 fRzfSU/u6tN7cKw+nDaXUY/craSA7ml2QrMASUcG3Os7fRNpBQ774s6c/AUKpqo=
X-Google-Smtp-Source: AGHT+IFUhhrRqGsORbL/ISvyV7gl9yqqOyFvT4c1zpYHlHo1Mteg3ms/PpoJzlsAiTp7YzaiVPaX/Q==
X-Received: by 2002:a17:90a:ac0e:b0:290:1c4d:82da with SMTP id
 o14-20020a17090aac0e00b002901c4d82damr5067083pjq.10.1705939879300; 
 Mon, 22 Jan 2024 08:11:19 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 01/13] target/riscv: add 'vlenb' field in cpu->cfg
Date: Mon, 22 Jan 2024 13:10:55 -0300
Message-ID: <20240122161107.26737-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c     | 4 +++-
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ad1df2318b..89f2349eb4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -852,7 +852,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                              csr_ops[csrno].name, val);
             }
         }
-        uint16_t vlenb = cpu->cfg.vlen >> 3;
+        uint16_t vlenb = cpu->cfg.vlenb;
 
         for (i = 0; i < 32; i++) {
             qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
@@ -1320,6 +1320,7 @@ static void riscv_cpu_init(Object *obj)
     /* Default values for non-bool cpu properties */
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
     cpu->cfg.vlen = 128;
+    cpu->cfg.vlenb = 128 >> 3;
     cpu->cfg.elen = 64;
     cpu->cfg.cbom_blocksize = 64;
     cpu->cfg.cbop_blocksize = 64;
@@ -1819,6 +1820,7 @@ static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
 
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


