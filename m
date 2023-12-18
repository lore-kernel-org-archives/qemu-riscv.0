Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D183C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:59:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD9M-0003iZ-B8; Mon, 18 Dec 2023 07:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD9K-0003hQ-OW
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:55:10 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD9J-0005Ee-1l
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:55:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d3aa0321b5so11419475ad.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904105; x=1703508905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g03lZDc12seGiVgZq3tCtdjLnA9oKi81LqdCJ6mMy1c=;
 b=JdRpzON3ehGTN31nzaJ0lrtQYTEFrlSnsd4QOG8VyruFmSTVissboVcQ1J3hA4CdXH
 soO8eIvfevoDOd3vUlwF4z3cMQ6pzdfhqFhXRNUJHuy66fnvoobvneQeLHlRVlzcnkXp
 8Hpebx16c1P9/XjzaT4cMiSiYx0DTwHXdevRW90+HdVKufJX79Bbvgfwcshb5UtrtZqM
 SNv1Y7dk2yaquvDjcNCLbjaCfYURK0oM5blQhXhQ5mz2A0nFPK+OnpQJUnW3ws9TrlAh
 kLOvRyZ6hVnPjC600LaxtbEQVDHe5sdSeyRbdTXq+nLzc6i4f/0+kUs1zI8fFzfWLd/M
 5cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904105; x=1703508905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g03lZDc12seGiVgZq3tCtdjLnA9oKi81LqdCJ6mMy1c=;
 b=m7UNok9D8syy5EVWWxT9FWQnmX5fd9g+Mfz0wt2BPbkaIGqbnteE0a+Agcm4W/waik
 mwemAXkpAAIMSD3a7yKgkf8PAN05ig3WW/lu/6kHIUI231KeylJddXC0gA7me24XXYms
 78MeWzNMjLMYC9HyqMTbNEydJgD6WWc9OwvBDSQOqc3+9B7879SGJCtn5HdcoiD7quhQ
 jcohBokdCrPuAhYdFnzUAvYP7hDP7if2pKol5qCILOi/8KhaRXFuz0uv39vm0viQ/qx3
 WU3HpKm/jZqfXfoPjfHoS/afYXldCZOw0O6MydlsgJpz7+rXVcKuG6nqneG52nOLUAhl
 OKhQ==
X-Gm-Message-State: AOJu0Yw62nskozyn2optL2YhadI/cy0/kXX5nFnpAa0C9qmMKDnhVQGZ
 LYbTK8SA8GLMoFMpc1ZxFpB+CDtxAvQh1Y1pPy8=
X-Google-Smtp-Source: AGHT+IGd1HarlvwvgvjMC7styw8wDyRrR+cPIDynUW9kqFKFCqWDzDE+NSVpOtNS31YjBvSiNpaadA==
X-Received: by 2002:a17:903:32ce:b0:1d3:bedd:ad with SMTP id
 i14-20020a17090332ce00b001d3bedd00admr1458354plr.35.1702904105537; 
 Mon, 18 Dec 2023 04:55:05 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:55:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 26/26] target/riscv: add rva22s64 cpu
Date: Mon, 18 Dec 2023 09:53:34 -0300
Message-ID: <20231218125334.37184-27-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
index f57a9ee298..959c97c869 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1624,6 +1624,13 @@ static void rva22u64_profile_cpu_init(Object *obj)
 
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
@@ -1968,6 +1975,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_init),
+    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_init),
 #endif
 };
 
-- 
2.43.0


