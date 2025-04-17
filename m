Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFCC369C2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:55:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5MsQ-0007a5-P0; Thu, 17 Apr 2025 06:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5MsH-0007Td-EZ
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:42 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5MsE-0003N7-43
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:41 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso521687b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887216; x=1745492016; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q73Ra6NhBnNXysABi6967YWRbV9gsBItuZ0tiWgYmXM=;
 b=f6YvAGNSzHBm3VIGGubNAbkf6tx/5ZEvTjkJ1ImKvdwSe8OyLfK7h4kdzDXMuKDClx
 wXcBR+fFyahEWUHJ3aQotY1NUMGjSh6LtdUAAVoVdW/gO92X91YQnhAk44y4DFoYl5Bv
 qLW86TNjf7/uwu9HKyEBDmKj/aZKZcjqe3oXuGQxVfWimhmRTQ/BWRQ8CuHRAvqo5O/w
 0lX21bgd4YojqpUJNtdVhsD5D009i5uIVKvCA8192+li6NIPDpawdqxx5BXk7NwZbWP1
 VlTLeSBC1tae3tH2/UBVCNOXJfVFrLFS+xCE4csycsjlWfBcDgp7FNe3sA/P3bPxklGY
 mstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887216; x=1745492016;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q73Ra6NhBnNXysABi6967YWRbV9gsBItuZ0tiWgYmXM=;
 b=SSZYBWEXscwTaqH4mceao7YXwPRMy8AVs9mPkZV+NHLh8G0XJ9V/u58Mb1WZqUGWzE
 AI8kJCtfOJHKJX2Mw+RtUm0Xm3aO2HFqrFkRbysd8LCjdx5iDuJLomjAdHp99XeT+s1d
 VBhe6tpOe9K2dD7NmWE1Uwknm9PBYq6shKOx4oq/qpFMEnx/WIF9f7GTrvVdWiVFRdQP
 u4LtP+d9boyHPfkA6TRnVKyB1+bLjmHT5AgmPHELE+rlPOPa3n34+9+FT4Erk6UKrntw
 AF6ttHi/RmB45syKIuLfytAjB1I5T2J7/QzU4/N2xpJd76HJjRvQ+ZwVJeVwp8+TA1gm
 tHww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZseoWOEWR3V98lagg6d8Mti5g4O0tEnpc4L7Ss8B0nufyx9WiJEsAvZ4IdtZNLvZWSq2QKpty/+Hx@nongnu.org
X-Gm-Message-State: AOJu0Yyf0i72M+zTkKOQCW+xZsCHD/ZoxZNuOYBDD2az71oSFMMXbUFD
 5xU+BVc3pHhH53sf9/LZMbK1ZkeEqIZQ5jEc488pJZiTSxS3ElseJ9WhSUq+m8A=
X-Gm-Gg: ASbGncvaMyRNPNtAzX6Rq/n/Z92Eqm75J1uHxHGgmW1mxqfIV07sU4aaZlTUkwR/oZ6
 dLTzZ5p+RHka2C4OQSr/3Trq+7//6jWzTzi9IiFdvlk/HxsMK561aIAy/322mv9IyDXa4fsByEx
 ba0MUgbNtvG/+GMXDVdbifZ6F7m68r2BCvC54OIa1Po9gC3horvFUy0ytJDwxtc3dmSnawmpehS
 znZwjA/4wGj1+5RxsPPFVGpdzqGJ4R65WdI49/VHAqt4BAuCYztfpzyacUUV+u892lGbzIFInp3
 VEPIe7Lj8fcQKicfxhbWJ2mKAQza2sRRikQrkaGGpO/ogMxUpBpS/lBmYzgDmUU=
X-Google-Smtp-Source: AGHT+IG9lIi4y81GtUAS/p2kFe8CuUnY6PtZhntDyHe9dS07v84VZAseI8Cz6apbvILdy6H2Wt/8XQ==
X-Received: by 2002:a05:6a00:26dd:b0:734:26c6:26d3 with SMTP id
 d2e1a72fcca58-73cdbf142f5mr3803664b3a.5.1744887216489; 
 Thu, 17 Apr 2025 03:53:36 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:53:36 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 06/18] target/riscv: Add CPU options of WorldGuard CPU
 extension
Date: Thu, 17 Apr 2025 18:52:37 +0800
Message-Id: <20250417105249.18232-7-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x436.google.com
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
 target/riscv/cpu.c         |  3 +++
 target/riscv/cpu_cfg.h     |  3 +++
 target/riscv/tcg/tcg-cpu.c | 11 +++++++++++
 3 files changed, 17 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 09ded6829a..a182e8c61f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,6 +236,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+    ISA_EXT_DATA_ENTRY(smwg, PRIV_VERSION_1_12_0, ext_smwg),
+    ISA_EXT_DATA_ENTRY(smwgd, PRIV_VERSION_1_12_0, ext_smwgd),
+    ISA_EXT_DATA_ENTRY(sswg, PRIV_VERSION_1_12_0, ext_sswg),
 
     { },
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 8a843482cc..a5b045aa2f 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -143,6 +143,9 @@ struct RISCVCPUConfig {
     bool ext_smmpm;
     bool ext_sspm;
     bool ext_supm;
+    bool ext_smwg;
+    bool ext_smwgd;
+    bool ext_sswg;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
     bool rvv_vl_half_avl;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5aef9eef36..343e46e698 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -694,6 +694,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_ssctr = false;
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
2.17.1


