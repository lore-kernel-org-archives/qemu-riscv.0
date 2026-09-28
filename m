Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52CCCA5FA1
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3oJ-0003gy-Qh; Mon, 28 Sep 2026 01:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oH-0003fO-FT
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:21:53 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oF-0007sU-Rr
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:21:53 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd04edb5so4395683c88.2
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572910; x=1791177710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wGGpYIGUwqf5eEqjLL692CNUimMFgXlpwa4vAy3AFKs=;
 b=f1qDJ6sDvT6RCiFBNKzW1gj+wAqdDr9eZFb8wUVkY38cOguf6fxZXPtGhpinKQNlC6
 yxsmYEUOrzDhSIlCSiLzdxL/5TRBERn0T8YOUPW7BfoHXwolulyYYe7AtJ95Cl950Yo6
 z0tQPmxwBsP+g9arjHVnZmt8cgqvQmnszhGdttbswGOCfp28GpOFLb8yDT4RBKIAClP1
 OBliImBCa99qEMk+N2fP/TILWsvyNxkVomkL3Bvh/5bN89w+ZWM+z3kWe3Y0WqL3s+Hu
 U7ZgINozF+NLvXju6IRGPuR04FIVNXjhFwlBJVFFXxEOim5faoiF5pU/3jsxqvgv7Qc4
 I9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572910; x=1791177710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wGGpYIGUwqf5eEqjLL692CNUimMFgXlpwa4vAy3AFKs=;
 b=rOH59DgFngrhKz7ALk2EgvdgT5PMjzY0Z7uBCxTPkBTHxgPiUTvfFuLArKiXVDBFGK
 Rn34eth2cEKE7lq8qePTLgqt8eHatDQ8ekiqOJOUbuMmhF4F7e8x12omf/UIl1f1ca9p
 rZCf7phwtc2/iT5q+P6uJ6QKbIWgNhn0od62cA/9AIwTIe+dKgx8C05rYroHKKFQotKo
 CfzZfY2Aq/2VtWcPEErqzUM6G4rcmeiHuwbQG3mX1ufQUFrGFAKXsQ1MYLi+QRNtshWw
 0sIjLi7Kp20zUGIlGw598UFJABlni2x+Ptnw6CpwmvMXDM5LJi0d+MpLAdZj8vY5v2nx
 pxFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBylwS7rEndnzB4MkvXl59NPAEwn15bRyaD+lcnZYHpC7BEsRG80eh8tgNxQUW9rSwVS5sZ4BeB8nDWo@nongnu.org
X-Gm-Message-State: AFuF++nmV7j307L7svIvAdIUthPULRZibQwU4H3yMJugT/II5VjjaqM0
 +qL5S2n9K8sXoge16NwANds/iagjVjoc4ceplvttCKwc25hXMIQ42fFw
X-Gm-Gg: AYBFou3mC9fbL5a9/9LVYxiJYggIOmq7bGWK+VQpQYTKdIp2gACaaLOeX+rPFAn7GZE
 9AMtHvqAAPXbjGpCkbLzJhnHSFmlSJotAPx5LrBAYUi8MPC2ltUUEy2qvXCTWgtr5ZkPA7/d0GF
 ERHWO1Jfw/1MzNFclfWyB32grDD5WPphl4V0asShagS7deqmzPRLP4tWUFfuXETNsy9pO5LTGKr
 RDAPGq27E/Q1GyUQXbqW7pSFswBzV5bFbZdLCKq1jFdxgF6JxH+uDQ+Ir9iXCCIk7aEORMwy/fJ
 B5et8OpEml61UfxIl1FAW7cc6FNesOkZ2zJ13YjCP1quU2v8LDMmvcl9zUguzWlzNpbRFcGPe7I
 RjxBTZrhT4HEzO7viQ9mb7r28TlXMYs8yeMkiBRAbdl1ROLrysCzMzEtd5iDubVNIRwr+UU9BqM
 HZcTyUYG3Xc74Ip9f01SdHBVlOvFunrH+GKK7TIhqhfjQKIAKOAbgWg9orI+JzCLV+K0isZQmFy
 wQ6r/HbSdti0H0+rQufqRvJKBAw2s8=
X-Received: by 2002:a05:701b:281c:b0:143:7330:7fbc with SMTP id
 a92af1059eb24-146cee37b69mr8056469c88.21.1790572910280; 
 Sun, 27 Sep 2026 22:21:50 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 06/24] target/sh4: name guest trap numbers SH4_EXCP_*
Date: Mon, 28 Sep 2026 13:20:32 +0800
Message-ID: <20260928052051.251-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add SH4_EXCP_* in cpu.h for the guest trap numbers stored in
cs->exception_index.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/sh4/cpu.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 6984bb462fb..a1e9049b7be 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -135,6 +135,27 @@ typedef struct memory_content {
     struct memory_content *next;
 } memory_content;
 
+/* Guest trap numbers. */
+enum {
+    SH4_EXCP_RESET = 0x000,
+    SH4_EXCP_MANUAL_RESET = 0x020,
+    SH4_EXCP_TLB_MISS = 0x040,
+    SH4_EXCP_DTLB_MISS_WRITE = 0x060,
+    SH4_EXCP_INITIAL_PAGE_WRITE = 0x080,
+    SH4_EXCP_TLB_VIOLATION = 0x0a0,
+    SH4_EXCP_DTLB_VIOLATION_WRITE = 0x0c0,
+    SH4_EXCP_ADDR_ERROR = 0x0e0,
+    SH4_EXCP_DATA_WRITE = 0x100,
+    SH4_EXCP_FPU = 0x120,
+    SH4_EXCP_TLB_MULTIPLE = 0x140,
+    SH4_EXCP_TRAPA = 0x160,
+    SH4_EXCP_ILLEGAL_INSTRUCTION = 0x180,
+    SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION = 0x1a0,
+    SH4_EXCP_USER_BREAK = 0x1e0,
+    SH4_EXCP_FPU_DISABLE = 0x800,
+    SH4_EXCP_SLOT_FPU_DISABLE = 0x820,
+};
+
 typedef struct CPUArchState {
     uint32_t flags;             /* general execution flags */
     uint32_t gregs[24];         /* general registers */
-- 
2.52.0.windows.1


