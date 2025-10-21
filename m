Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F2CCD1A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:59:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBEj4-00014f-Ip; Tue, 21 Oct 2025 11:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEiz-00012k-Uy
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 11:56:38 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEix-0007oW-0K
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 11:56:37 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-33226dc4fc9so5360585a91.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 08:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761062193; x=1761666993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YPyDNhfux04WDvQPtw33/XTRtPeCUZGQEMXAPkmtXk=;
 b=A+9/0P2g0ose+C73yqes+aoYPClWlYRoZLe8ZXOxWZKcfpP/C2GbOzBUgxzzWG5+lj
 S4SUQtJG5ql78wolLzSD68jLM95URg0ghVtWXPBAQoMALz9Q/iBVYlfI2qI1I4v26Xd/
 3GcG1wclrXbY1w/JtQSw74YCwkHLWch78q5LJVwE8QFhbCHQncLKWKqsW3ptWlqgKvD+
 9xkm9XVGwJWcS23TWjDhJRM+qBinCDIakvdT/SEwz08A9sNXcwyKNrgzAFVs9fvYHJ7B
 swYUxICGO2rj+W1NI1vlzgas439FNncWh4hc6zNTAA6DQR/5vi/fEAsKDZRm4EEvgTe+
 KLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761062193; x=1761666993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1YPyDNhfux04WDvQPtw33/XTRtPeCUZGQEMXAPkmtXk=;
 b=Uop/5r1FVgOMvzNacsRDYiUf7r+ht4UmtVcS8zzPv4BUUvj/NxYLQ78mKZAMbyz8F4
 K+OBHx8BbmZ//NmBl7P6Nm8raRVuM+J24YA7MvG/bHYNlb1yoyZcazcvPP9UPErCFEo6
 9XX29XgCiat9nk6reeFBtfrP064TlHEQgSBRIyeTprqKU9fnOIeHlGQk4IkUKi8unLhN
 6PXh58gWF9jT+YgvYdTFO8PAgdOXT2nhuQxr87eUzypVbLx8fMWBkgMuQl+Nx6LOmJj2
 p2q46qx5pT9jfQucrKRoIxY07zlQeenaAMI/x/lLP2zl3t0eKlXD9FWiEfmwaWsS6n/K
 JzHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXDb6eIflWuykBaPqgR4zFINEswhku/8H18G4PV02xP173iwR7d8NHIZjDp+l6z4ezRmrMwRGk1Jm5@nongnu.org
X-Gm-Message-State: AOJu0YyxscD7HnLN4AHH6MMXc5XTUtlSDx+4sZaDBsm0q6XPu9KSgOJl
 JQ9xzalbThgRqKF7GNfu7sLoq2H0XuL9frHHojAw8eWCkm1d/HkZn0/a6n4pwSPVTCs=
X-Gm-Gg: ASbGnctRULQ+9iqoGMH7DlZ4yBFX3flOXuQOwHaM+KnDfW32TbhROOihDucrSKMb/Iy
 ZKFwm0KgSYNtDiULZQa44IUHBjxmE9elK0aZB1RC1j8sgMTSuNDgkq5L3hFwMhciy1rdTEXjiOB
 5UvqeemSN/HXHhhniPFOKIvxYmOkjkZhrdwhmI70ZgMqJkXBVjao/ZBPUpENrc1ZRRYdXK8hQdA
 4IZEi+DJ1w7lR7N0PVz4b9Z++bnE9On4Oj9dJx6gEhzWwQjJuFFhomCPpvlJEy0SgDcOqzzomHI
 Vz8PP90KGyBW8KYAXz09yGRJrUHzSKrjq+hHnWQoVa9uzJGx5+fpnGm6mlkasv56WT32fHLo+MY
 xBEPCY8w1zu6ROa0uag/cFdneDL/B+is/vATw/IS0F7/LbENl3lXFNcXw2fXamYyhtMdVa+IE4l
 51NqfXxe+ucpFoGlAgJXdvrQ==
X-Google-Smtp-Source: AGHT+IEsTGfGISdwoHtefwuOV4DrhpdRTrH6sNO0Biy/c/78idzNfMmzW7N8QYwaPO0rl9vfdaQYUQ==
X-Received: by 2002:a17:90b:1e07:b0:33b:ba40:c3f with SMTP id
 98e67ed59e1d1-33bcf85a834mr22079560a91.5.1761062192678; 
 Tue, 21 Oct 2025 08:56:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5de11392sm11490177a91.7.2025.10.21.08.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 08:56:32 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 06/18] target/riscv: Add CPU options of WorldGuard CPU
 extension
Date: Tue, 21 Oct 2025 23:55:36 +0800
Message-ID: <20251021155548.584543-7-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021155548.584543-1-jim.shu@sifive.com>
References: <20251021155548.584543-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=jim.shu@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We define CPU options for WG CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating WG CSRs.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c                |  3 +++
 target/riscv/cpu_cfg_fields.h.inc |  3 +++
 target/riscv/tcg/tcg-cpu.c        | 11 +++++++++++
 3 files changed, 17 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a877018ab0..03946439f2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -207,6 +207,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_13_0, ext_smmpm),
     ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_13_0, ext_smnpm),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
+    ISA_EXT_DATA_ENTRY(smwg, PRIV_VERSION_1_12_0, ext_smwg),
+    ISA_EXT_DATA_ENTRY(smwgd, PRIV_VERSION_1_12_0, ext_smwgd),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(ssccfg, PRIV_VERSION_1_13_0, ext_ssccfg),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
@@ -222,6 +224,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(ssu64xl, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(sswg, PRIV_VERSION_1_12_0, ext_sswg),
     ISA_EXT_DATA_ENTRY(supm, PRIV_VERSION_1_13_0, ext_supm),
     ISA_EXT_DATA_ENTRY(svade, PRIV_VERSION_1_11_0, ext_svade),
     ISA_EXT_DATA_ENTRY(smctr, PRIV_VERSION_1_12_0, ext_smctr),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index e2d116f0df..44387a8db3 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -112,6 +112,9 @@ BOOL_FIELD(ext_smnpm)
 BOOL_FIELD(ext_smmpm)
 BOOL_FIELD(ext_sspm)
 BOOL_FIELD(ext_supm)
+BOOL_FIELD(ext_smwg)
+BOOL_FIELD(ext_smwgd)
+BOOL_FIELD(ext_sswg)
 BOOL_FIELD(rvv_ta_all_1s)
 BOOL_FIELD(rvv_ma_all_1s)
 BOOL_FIELD(rvv_vl_half_avl)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 1150bd1469..63e0b05f7d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -861,6 +861,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    /* RISC-V WorldGuard */
+    if (cpu->cfg.ext_sswg && !cpu->cfg.ext_smwg) {
+        error_setg(errp, "Sswg extension requires Smwg extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_smwgd != cpu->cfg.ext_sswg) {
+        error_setg(errp, "Smwgd/Sswg extensions should be enabled together");
+        return;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.43.0


