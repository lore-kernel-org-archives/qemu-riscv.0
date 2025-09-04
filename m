Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6366CCA1013
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu59l-0005r6-C8; Thu, 04 Sep 2025 04:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55P-0006n1-3t
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:12:57 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54k-0004GW-05
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:12:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so103953666b.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973526; x=1757578326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3igMVo/0Jk0/NNNrfQhFH8hc6okngEKnzdXk+lVC71M=;
 b=o+qIycifBkI9/H82jwqhOYKUvGbLLjz5P1Q6pyv8ClDCRewP/gAhOm6JY10IqgJSre
 LmJv8QZJdTa03VBCO77LmOWtzl9MhNPM9NV7kWB5hUwC3aofcKPGsy9huX6J72ajqGcy
 IdawaSmRs4lC2n1e12rb8MxcMJkNLfsAnACp9V2CYiDwgMMdAZZl8+g8ksDnlJAEhreM
 0ojEIlEOuBNvkmvoEaPMw+PToWECx8jvlRqeqpnLvqoFv1am4pd/m4LHlha0bEyZdmKs
 5+0DJfA4WAshDJqF0h2B1dE+kKIROXZWnoJApDnOlf97XAnO0D9e/41WS0eHChioQ8bC
 rZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973526; x=1757578326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3igMVo/0Jk0/NNNrfQhFH8hc6okngEKnzdXk+lVC71M=;
 b=Knd9dGSLq6xFSurjZlUQjXUyh27/bJOgFpoGYMLDyc3GGO4JhCG5prytwbAroUdwLg
 69OsAJ+cv8QNVHRXZpvfBWoiQGje93RR/68E47VOyl9sVHaje2y2VQcoHkkOes1mhV4m
 mAPD2Bv//9FGmdJktDaT+Y8cvNpAG/jPdtVvQdj5hu1H+eyEPyKM+IF4lBUYR1nrHD6q
 veliNENNfpqYBuMnL1RbkYcc4GMLmFOQy10c8+fOuTp1j1HPOJdAURl8HYbAb7pM71Zj
 iJA5hn7abmZsC3LCNgffMUbOPzNg8zHDR7DClzDrNclxYf7A6Ban/SVtUAthOisU3KZC
 PU9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7MssFmHxNBPk7NN9fRG0r+7TxJPRTaqs/oVKyS+LmZYNlun/u5zEqPaJRnyd16Ac0D6F5GJ8nwkvf@nongnu.org
X-Gm-Message-State: AOJu0Yx2aW7tzNtkYiB65+KqkHaJSaVbQbWd50Q8L41++UH5m7aqs/L7
 aqh6tGlXc4kJc6jLOWQ4hi1TZ1cO8h4ygxe8xrqGDwD14NJXe/DaMz/vnSJFemV9oIk=
X-Gm-Gg: ASbGnctSgGtt6C4DRBLd/MNFxJkGg8w5iW7IfOJoPCyXPjzOv84yBik4nIHTLVFiJ52
 kYoQV1F7bvgi8+gt+6mk2A14jwgET2hMqBRQx39G5Mxe9ukhLZ85JgJCBgWJlIdU9ANPLiUj/v3
 nFea+5X26FoEiyuiS3LRQWhl1vuo0J6wlNorRi1ErwbvZy4wKT8+SMXinyJDNUT6sBkLZIaKI9A
 +YE0ix8TDLnl3KtOAEnDdqXadGh15yEBakFH4gjbtTP2uK5RSQVoKHS03z5AwJUSKxM6zYG64AO
 Ifd89BU4mlKEdsp+GbjSzd0bEh4hWI8M6fV8zxvovk+bS7AaCrOHsS8NV1RoaORiL03OLTznObS
 QBhn+BFcNIiqzSjv90NgyQWic2UqzYl5Gsw==
X-Google-Smtp-Source: AGHT+IFBeYdGfWRJI/K+rgayz8OQ6j9nasTrUeDkKNPhr0lTLkj3JNN2B5iyPDqJVVGSAcD8I8KKGQ==
X-Received: by 2002:a17:907:2d24:b0:b04:74d1:a561 with SMTP id
 a640c23a62f3a-b0474d1af73mr412166966b.25.1756973525652; 
 Thu, 04 Sep 2025 01:12:05 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04241b2e7esm979865566b.43.2025.09.04.01.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DF9806045A;
 Thu, 04 Sep 2025 09:11:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 059/281] linux-user: Move get_elf_hwcap to sh4/elfload.c
Date: Thu,  4 Sep 2025 09:07:33 +0100
Message-ID: <20250904081128.1942269-60-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Change the return type to abi_ulong, and pass in the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loader.h         |  3 ++-
 linux-user/sh4/target_elf.h |  2 ++
 linux-user/elfload.c        | 29 +----------------------------
 linux-user/sh4/elfload.c    | 27 +++++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/linux-user/loader.h b/linux-user/loader.h
index 04457737dd4..d8a93998076 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -103,7 +103,8 @@ const char *get_elf_cpu_model(uint32_t eflags);
 
 #if defined(TARGET_I386) || defined(TARGET_X86_64) || defined(TARGET_ARM) \
     || defined(TARGET_SPARC) || defined(TARGET_PPC) \
-    || defined(TARGET_LOONGARCH64) || defined(TARGET_MIPS)
+    || defined(TARGET_LOONGARCH64) || defined(TARGET_MIPS) \
+    || defined(TARGET_SH4)
 abi_ulong get_elf_hwcap(CPUState *cs);
 abi_ulong get_elf_hwcap2(CPUState *cs);
 #endif
diff --git a/linux-user/sh4/target_elf.h b/linux-user/sh4/target_elf.h
index d17011bd752..badd0f5371f 100644
--- a/linux-user/sh4/target_elf.h
+++ b/linux-user/sh4/target_elf.h
@@ -8,4 +8,6 @@
 #ifndef SH4_TARGET_ELF_H
 #define SH4_TARGET_ELF_H
 
+#define HAVE_ELF_HWCAP          1
+
 #endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index dc3f502277a..7e1c11c39f2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -963,34 +963,7 @@ static inline void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE        4096
 
-enum {
-    SH_CPU_HAS_FPU            = 0x0001, /* Hardware FPU support */
-    SH_CPU_HAS_P2_FLUSH_BUG   = 0x0002, /* Need to flush the cache in P2 area */
-    SH_CPU_HAS_MMU_PAGE_ASSOC = 0x0004, /* SH3: TLB way selection bit support */
-    SH_CPU_HAS_DSP            = 0x0008, /* SH-DSP: DSP support */
-    SH_CPU_HAS_PERF_COUNTER   = 0x0010, /* Hardware performance counters */
-    SH_CPU_HAS_PTEA           = 0x0020, /* PTEA register */
-    SH_CPU_HAS_LLSC           = 0x0040, /* movli.l/movco.l */
-    SH_CPU_HAS_L2_CACHE       = 0x0080, /* Secondary cache / URAM */
-    SH_CPU_HAS_OP32           = 0x0100, /* 32-bit instruction support */
-    SH_CPU_HAS_PTEAEX         = 0x0200, /* PTE ASID Extension support */
-};
-
-#define ELF_HWCAP get_elf_hwcap()
-
-static uint32_t get_elf_hwcap(void)
-{
-    SuperHCPU *cpu = SUPERH_CPU(thread_cpu);
-    uint32_t hwcap = 0;
-
-    hwcap |= SH_CPU_HAS_FPU;
-
-    if (cpu->env.features & SH_FEATURE_SH4A) {
-        hwcap |= SH_CPU_HAS_LLSC;
-    }
-
-    return hwcap;
-}
+#define ELF_HWCAP get_elf_hwcap(thread_cpu)
 
 #endif
 
diff --git a/linux-user/sh4/elfload.c b/linux-user/sh4/elfload.c
index 546034ec07e..99ad4f6334c 100644
--- a/linux-user/sh4/elfload.c
+++ b/linux-user/sh4/elfload.c
@@ -9,3 +9,30 @@ const char *get_elf_cpu_model(uint32_t eflags)
 {
     return "sh7785";
 }
+
+enum {
+    SH_CPU_HAS_FPU            = 0x0001, /* Hardware FPU support */
+    SH_CPU_HAS_P2_FLUSH_BUG   = 0x0002, /* Need to flush the cache in P2 area */
+    SH_CPU_HAS_MMU_PAGE_ASSOC = 0x0004, /* SH3: TLB way selection bit support */
+    SH_CPU_HAS_DSP            = 0x0008, /* SH-DSP: DSP support */
+    SH_CPU_HAS_PERF_COUNTER   = 0x0010, /* Hardware performance counters */
+    SH_CPU_HAS_PTEA           = 0x0020, /* PTEA register */
+    SH_CPU_HAS_LLSC           = 0x0040, /* movli.l/movco.l */
+    SH_CPU_HAS_L2_CACHE       = 0x0080, /* Secondary cache / URAM */
+    SH_CPU_HAS_OP32           = 0x0100, /* 32-bit instruction support */
+    SH_CPU_HAS_PTEAEX         = 0x0200, /* PTE ASID Extension support */
+};
+
+abi_ulong get_elf_hwcap(CPUState *cs)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+    abi_ulong hwcap = 0;
+
+    hwcap |= SH_CPU_HAS_FPU;
+
+    if (cpu->env.features & SH_FEATURE_SH4A) {
+        hwcap |= SH_CPU_HAS_LLSC;
+    }
+
+    return hwcap;
+}
-- 
2.47.2


