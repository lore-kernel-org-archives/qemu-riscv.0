Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1BDC0219E
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:31:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbLg-0003fw-T7; Mon, 10 Feb 2025 16:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLe-0003dH-Fv
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:29:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLc-0002AC-RE
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:29:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso2544252f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222983; x=1739827783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcxWKPPyBgEMSe447dc/9VeQiSKl/TYrx71q+3sl0Qs=;
 b=YGCGHjw1oU8pzBHCsyn13IzV3jCBNcFtL9Bh9SEMEqiNn2gjcVqhCw+gPAYzMyw8+8
 9Hzc461zgTADb3ny9xFsZHLKteDQWXI3jdXgoWQRTjipIt5FVd3MFhdxqMPKN2N3ua4Q
 TvLzEeefOUB77jz+FtM7fN7t6PvOf8vTz11g7oBV9m2fMwVVYPhYycapxrogtL1vLIOj
 pjwaKKkPAQFnmf83ZndZ7a5Yi80/9lqQBp0tR7SGu//oPGJ0mksnJR7Isq16i2xKYBRE
 i5qwvWOZVpTa+R4Hpsb/FRrtuBxzlg8ZJzns+SH0aIIivvDFNJetmq2aTONrKFFUsXoR
 ww4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222983; x=1739827783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcxWKPPyBgEMSe447dc/9VeQiSKl/TYrx71q+3sl0Qs=;
 b=lNDgRS0TJLX1V4BVq4SVFByUqL5L6V9HO9BVNEa2WoLg4WluhcxIOduMCEMnoLrCh7
 TAC2dVv0bwcfp+NIo9jc8+XZQ4+COLzcm772UxDs7vXIKBhuV9KH3rdyA6jcY8gsbZNU
 gNF6OXoP3c0mt1ThfyvVG0sbjAXBNbvl7+x+54S46NIZYekXhRqujF/MRPG8U08Yk8wb
 pHDSiHuxyiEp/XsbBr3DStx/J4XozXJ6g2qKaATqnHOQKBIznEuH+Zx9nIG1chDfreka
 317uyXiarjUv0Dx9jS3ptZI50DXlx+ky8baTP0VJzwNZoaR8VKkLRUp9lz1qVGSiH/le
 eCHg==
X-Gm-Message-State: AOJu0Yz/eJbuSrxkqtB+YkTyfimMvQFOuGjE0CHCPhxp0dOyx/PPpI+R
 ZB6A+umgO15Q2Wd2O2vsWLN2glQzWoVSMRsWDM5SZSYLsQK+AR798Wt8QNrJHuI=
X-Gm-Gg: ASbGncs1WZ8WNCQsN6u2jTD/SDy35khqOB7KKFRAe11ivYSidB3OHTC5OQ4hSuGE8A4
 5pDDvSyypsr1/J8Ho2iiXQZrivSnvSy3hh600MukUVqmrQZqa0hBs0exyA23U1qUvqqQtvCU0A1
 PxycGkqRHM1aVG/jobumFJwIFq3XngU8N2Ye/UQpgeRj9F9110YtitZHzHunB1Y6OVAuEO3lG3H
 1/0YMLBSGI46fgT9xYZJUwyQAYbxgy4r6eTkZ9m0jcCyDTf+T1b3UGD6WhGWoR31YAKwC0hJ2jN
 e1QkLllmA3Urs3v2olBjSpjoxTyjJEFOxLKaq+tltusdpw6Y3gXFV+0XwmqAyuGB+w==
X-Google-Smtp-Source: AGHT+IG9sOCggVsyvCCWYgOg/TYuduXm7u+D50RbCiZfn7Hgcp79cdnO+6SaHHoTlwbTEbixjTyADw==
X-Received: by 2002:a5d:670a:0:b0:38b:f44b:8663 with SMTP id
 ffacd0b85a97d-38dc93623b2mr8575658f8f.55.1739222983333; 
 Mon, 10 Feb 2025 13:29:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd8dee385sm6091870f8f.61.2025.02.10.13.29.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/10] target: Set disassemble_info::endian value for
 big-endian targets
Date: Mon, 10 Feb 2025 22:29:22 +0100
Message-ID: <20250210212931.62401-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for big-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/hppa/cpu.c     | 1 +
 target/m68k/cpu.c     | 1 +
 target/openrisc/cpu.c | 1 +
 target/s390x/cpu.c    | 1 +
 target/sparc/cpu.c    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 4bb5cff624e..d15f8c9c217 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -150,6 +150,7 @@ static int hppa_cpu_mmu_index(CPUState *cs, bool ifetch)
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     info->mach = bfd_mach_hppa20;
+    info->endian = BFD_ENDIAN_BIG;
     info->print_insn = print_insn_hppa;
 }
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5eac4a38c62..ff167aaea71 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -122,6 +122,7 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
 static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     info->print_insn = print_insn_m68k;
+    info->endian = BFD_ENDIAN_BIG;
     info->mach = 0;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index a74fab43a91..33c81928370 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -83,6 +83,7 @@ static int openrisc_cpu_mmu_index(CPUState *cs, bool ifetch)
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_BIG;
     info->print_insn = print_insn_or1k;
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3bea014f9ee..972d265478d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -243,6 +243,7 @@ static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_mach_s390_64;
     info->cap_arch = CS_ARCH_SYSZ;
+    info->endian = BFD_ENDIAN_BIG;
     info->cap_insn_unit = 2;
     info->cap_insn_split = 6;
 }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index e3b46137178..9fd222e4c82 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -106,6 +106,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->print_insn = print_insn_sparc;
+    info->endian = BFD_ENDIAN_BIG;
 #ifdef TARGET_SPARC64
     info->mach = bfd_mach_sparc_v9b;
 #endif
-- 
2.47.1


