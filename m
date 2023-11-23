Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4E7C5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 19:16:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6FBH-0000Fs-7a; Thu, 23 Nov 2023 14:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FBE-0000FM-Cs
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:16:04 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FBB-0003pP-Ky
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:16:03 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cf50cc2f85so9288255ad.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 11:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700766960; x=1701371760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNmsJugvxGfWuNRNrzSMaJR8adV3KPuLw+7r7LQkB+M=;
 b=mTcIkqufVidRCXhyg6Y0/Od6IeuEFfiU/9Oc8QYbgC3eQxClhBdiwuF0E2aLp30dzD
 A9nJDzmsehsucvR9TWLBFLyJSrh5XNtiJ9s3iI/YgcqPvfkKJ57gbO849Y2zvxfK4SQD
 xHJ7NLX6CgD835uNcwh82lQXXxXEw1tJNYcOgoGPaeX0qSwgdG0jFSTpFN4vUfZbBYRE
 NSVTekfQ49XYsScX0Zn0279Kj85pvBcQHqmldYcC2F8zy5QDNC+fwjp/jX2lLWWMnLKx
 M3c+mQBUz534sVD4rJA17EyA0xFJfj1hHrNwZ5E9Ly1AMnkDhbNpW0MUL3WVKT8K9Zcb
 Z3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766960; x=1701371760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNmsJugvxGfWuNRNrzSMaJR8adV3KPuLw+7r7LQkB+M=;
 b=kFT+2ZDMP5842wF0PHD/CdTtLlikiqTLc8GriLQ7TQLAnoy8zjr3mKzxbQpHOs0jz+
 9pFkTVmlG05mAGKndER4M0Y3cK/IcqWBcCXtBdZkNPLfV94+GtY3EYUgfPHVkwCXs097
 OEg9iUSqUv7CSq9xgQPclQ44L4lsO+VOf1R3o04EM6QWI4Lrr/SuJ2P7sp7MWQC0J5My
 zNg/wesAgY8EhOeV2NUkXjw4dxeznPaopRb2fymTgwM+o+VZU6nZl2u8HOaJwSrunX2R
 H4ttYZZbM+xUBfG0Vdd0b0fetaMFyBTkurmlURzHzPoQERFAhIVrKAUQRZ38yVNHpAKf
 0/vQ==
X-Gm-Message-State: AOJu0Yx1eTRprEyx2mgzSFSeg3EbsLuIQmh8HempjorsRloXTTq5im+p
 S5El2a+J0mNKBIJRJvnfXKOt1Q==
X-Google-Smtp-Source: AGHT+IEM2ijHFSXrjft3fS5gZvpQwCiPw/C8ptm2Us9Rf9quIYAn5rxk6xYjSk7E972uLepGn98jOA==
X-Received: by 2002:a17:902:a411:b0:1cf:669b:613c with SMTP id
 p17-20020a170902a41100b001cf669b613cmr406101plq.55.1700766960301; 
 Thu, 23 Nov 2023 11:16:00 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902eed500b001bc21222e34sm1680760plb.285.2023.11.23.11.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 11:15:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 7/7] target/riscv: add rva22s64 cpu
Date: Thu, 23 Nov 2023 16:15:32 -0300
Message-ID: <20231123191532.1101644-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

Add a new profile CPU 'rva22s64' to work as an alias of

-cpu rv64i,rva22s64

Like the existing rva22u64 CPU already does with the RVA22U64 profile.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h | 1 +
 target/riscv/cpu.c     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 12fe78fc52..9219c2fcc3 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -36,6 +36,7 @@
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
 #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
+#define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d00548d164..f6d1d4c7a6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1631,6 +1631,13 @@ static void rva22u64_profile_cpu_init(Object *obj)
 
     RVA22U64.enabled = true;
 }
+
+static void rva22s64_profile_cpu_init(Object *obj)
+{
+    rv64i_bare_cpu_init(obj);
+
+    RVA22S64.enabled = true;
+}
 #endif
 
 static const gchar *riscv_gdb_arch_name(CPUState *cs)
@@ -1975,6 +1982,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_init),
+    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_init),
 #endif
 };
 
-- 
2.41.0


