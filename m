Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4C3CCD1A7
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:14:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBEzf-0004Ej-CV; Tue, 21 Oct 2025 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzW-0004D8-Uh
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:13:45 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEzT-0001aL-Lu
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 12:13:42 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-782023ca359so5735430b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761063214; x=1761668014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Y13V29TyEhcjAwL5nFeY1ayHUoKW0GaN/z1B8E1GJk=;
 b=BH2s6czxmEeJpK+RvLMufp5M45SjCcoVqlxEVbrevUxCBvIVOu7rL+0kEso4G/DB6F
 wbIzl13Y1z729JOs5PXZtYeLzKyGprrPZSDL8dioU40nsgCs4BVM0m0W54Z00coCIQ6T
 cwEK55zy7vYk8r4/OTQ0le1u/i04NShM5LpPqQijUYvFv/HZuWc6Nm4gY/AAb2oG5V50
 bc8WrNSkVH/W9PeRl3s2R0rr4pYP+iQZrf0Sj9nlQkfpCiwVUNFX8FkxRFwcMqQkE2hA
 yKVaVKEpnEuCJu85plNdFSZfAIlxuVmaYHycVHiUfu0n68aVR/XkaspVfz871+AqRuRk
 s7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761063214; x=1761668014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Y13V29TyEhcjAwL5nFeY1ayHUoKW0GaN/z1B8E1GJk=;
 b=L/4bR452QSfjWP8ztihH6K8UMZ0FE0CIev+cKXGLsx+mVHxENBWAk0RUQTpte5b1C8
 iHGke0zzsD1eLp0YoE5wnph/waUXixYvjwvYdAzQ9xIcTqD8pR3zU8S6GXiwdovX75y0
 39Q2zYAV4+hcFI8ZRP0UqKiZCz9kxrO/Nf92vJkQxwOTC7QTQRBWgSJO1EnD4eB1pmnd
 DverU6IfrMQplI6yB93TMCFEF4zAfjRH5zz6mVblGCpEwOdd9tY6pX89rjU5NFV7vGLM
 SYSgtkWSB3s+BAl+ek58mzG8HPMauCqRz+LM3VzgjGtnmF0wAyn7+sswFWFVNkMG27tr
 GHKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2kYCPbdObjBL+H4hyHJZdVEEEaTjaiORMaWvj85TdST3ZhjlmpGi0ux7bqedsCoarM9WxOcxe6SPe@nongnu.org
X-Gm-Message-State: AOJu0Yx8oHQj2jkf91AUWBr/cDfQoCJnDXdrUzqqB5i4nB1dAZQ7o3XM
 SHDOvZdQAgVp46y/DuC0qQ19Drr+ly30K67ek0yPqT7nqA1/53FMV1LyZrwuRextJaM=
X-Gm-Gg: ASbGncsB86cmn3vpMUjRxtAbwMM9CrCtzSuMimAHSS5O6b87wGi4HZYa34mEXgiZwul
 Cmhd+l+LFejEyEGu0SBcI073PSsPsxBEV7ab/7frRKKAq9L0Jm+CH9gSyf5my0YrrYGgjoi0npJ
 pt8kxHBe1Y/FWNf3FRImWNO5EZrjcxhnVHb47cUPqJ6UrbK4geAQ8x9a7di6AYwk4543nrp2emu
 TrQZ4Gf8Ty8kjzIUkxxHo+vvVyL3jUqmMMqZsBXwlauvUGvAyLaZWiqVk4BnJvZygUw5UFTi0Df
 vubz6jkfva3+FBHlHNTaagjamhUymlR4n1kV6z7YUj+wOwE6DFGmvhJKt43Km0+GzO/YwOI1q1r
 PDjUHyhhvNuv0FZ2Rd7OvkxLvVyoRc2JaBDHA8pBO1gSmwYuh4guu3BCFTn4qQjulL7J3fcwygg
 T56tOCnF8U582UHfxPHAin1g==
X-Google-Smtp-Source: AGHT+IESq+Wree+qpeUxnR7Xwrl5wv4lQYZ/VsJBAAZNIYY2fKNL9WpYZZTIkByfOojT6r4EGL3dvw==
X-Received: by 2002:a05:6a00:94c2:b0:79a:f5eb:3dce with SMTP id
 d2e1a72fcca58-7a220d5792amr20550258b3a.31.1761063214459; 
 Tue, 21 Oct 2025 09:13:34 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010f7c7sm11731157b3a.54.2025.10.21.09.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:13:34 -0700 (PDT)
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
Subject: [PATCH v3 08/18] target/riscv: Add defines for WorldGuard CSRs
Date: Wed, 22 Oct 2025 00:13:14 +0800
Message-ID: <20251021161325.585278-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021155548.584543-1-jim.shu@sifive.com>
References: <20251021155548.584543-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42e.google.com
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

Add CSRs for 3 WG extensions: Smwg, Smwgd, and Sswg.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_bits.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b62dd82fe7..a546545ff3 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -468,6 +468,11 @@
 #define CSR_DPC             0x7b1
 #define CSR_DSCRATCH        0x7b2
 
+/* RISC-V WorldGuard */
+#define CSR_MLWID           0x390
+#define CSR_SLWID           0x190
+#define CSR_MWIDDELEG       0x748
+
 /* Performance Counters */
 #define CSR_MHPMCOUNTER3    0xb03
 #define CSR_MHPMCOUNTER4    0xb04
-- 
2.43.0


