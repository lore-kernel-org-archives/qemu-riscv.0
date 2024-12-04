Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C75E7716D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:30:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvya-0001h8-Ed; Wed, 04 Dec 2024 15:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyM-0000hg-2u
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:27:47 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyJ-0001Kj-CH
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:27:45 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385e5db74d3so125739f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344062; x=1733948862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWutDH14OyliM2KY1fyQJ86hTSYSkrVk4NaKh8Buzj4=;
 b=DqEQNvciOkFoZV4ac9GQYzv3HLZTdD98nipn8uGlH398rnFrXG6IjWmLIWCSI7ck6C
 Tss6W0hSiTw/MC36E24hBHA1iTTdDG/DA5ZSuVa66Z+qRpDsjKnV+fcoCW+xrIM6tnW4
 OJP/ajP07oxDhzVXy9O0Vg2jnARQ+pPbe5jweaV8MLilrUaiY+PtKpkEJ2dPa1Nj9Fj4
 ozQv4bYd1q/miICbXBMEOmUkGNDY5XKhPyJvPCIEIemJkYpRAdUJkcP0Y1RDYs7goXfr
 nBNBLqP/lxmEwczRR8nYpNmL053crbQRC+Mn6Aejyn3++scB8/O3ZXiov46E6umBWQiK
 fBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344062; x=1733948862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWutDH14OyliM2KY1fyQJ86hTSYSkrVk4NaKh8Buzj4=;
 b=UgRDjp/vtIGctI/gP0rwaptU2/yaV2gNqozzAAqaYHJxzuMPd0ijX994yaEgnQRQo5
 CnNFqa+nBsujwxE+9Dkpsb0dt0UvCpzLTLPPgR55MHd0PsUJMmS2DTyXRc4+GvaXs22/
 OW0A5X4wZEvV+BzmkWsGVl15QQ/lJMm20JfVa64lNVz7SqXxPvQ6XBKb4PjgyKjx+Dcc
 9fK9RmajGxpfuD1Zovkn/3Ny+rjOFjy41+vN0I+nDrMD30n6K/9TtrAk9dBtNgzUiK1J
 Ul1vatqLaukqdlLE+kU1HMDeIgBdtIJjKcDsOJAckA+3riae/bVigwP8Nj5QzbX4GLEn
 8fUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLh+18Q3J7sQ+06XlZ0dOL0SB+QH1iscrDJ6kKJMHC3FxQmltdWDZUxDuvR3ZG+X+r3ZiuTDUvbSoy@nongnu.org
X-Gm-Message-State: AOJu0Yww+94lHJfKhbcJ3vUNDTL6QAzXn69Wcp2mXGdUbdbQjnvaJ9Q3
 YmU3utNvcvFtMknQ3gKNETwHyyl3C+k2R1I78fPxQWupEmIwwev/pMy0o8zp1cU=
X-Gm-Gg: ASbGnctMPOS3ejTnxpT1fTouqy+C1KodoGjJB4nH884tBtcTWEqgxvoflQg1MaA3Qz4
 ivDDtyZ47SDFqHYLr+fA1oU/hi5KthM8T6ko80yXA36ql+XsBwJ0f/Irsz2wLvnt7gi8pJ47WrT
 WmysLPu0Lwy/R0I1ByIAON3As/nFcQGjPGM8iuZn91im48TionOG9pc0UFltbypDda1G6Ck9YOu
 NoSEeREkImrZTFG+tbAganIAczt725rF5dprQ8kNGMHtUdwESOz6AWlJVQKYq878XwLjtIWgAvY
 7zjmLKLyH+aZAaXoRHHnIVYa
X-Google-Smtp-Source: AGHT+IERrsgR2EegsKjGUlPd2gxFhYeU+ZCs7pMAENN4A6q2kGfKfkwC+dy29o1+ADoNHMpp5fQ2qA==
X-Received: by 2002:a05:6000:a11:b0:382:4b52:ffcc with SMTP id
 ffacd0b85a97d-385fd370b69mr7242995f8f.0.1733344061965; 
 Wed, 04 Dec 2024 12:27:41 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0dd4sm35612765e9.34.2024.12.04.12.27.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/20] target/mips: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:53 +0100
Message-ID: <20241204202602.58083-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement MIPS datapath_is_big_endian() handler using
the already existing mips_env_is_bigendian() method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d0a43b6d5c7..13d0ceaa8af 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -27,6 +27,7 @@
 #include "internal.h"
 #include "kvm_mips.h"
 #include "qemu/module.h"
+#include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/qtest.h"
 #include "exec/exec-all.h"
@@ -132,6 +133,13 @@ static vaddr mips_cpu_get_pc(CPUState *cs)
     return cpu->env.active_tc.PC;
 }
 
+static bool mips_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    cpu_synchronize_state(cs);
+
+    return mips_env_is_bigendian(cpu_env(cs));
+}
+
 static bool mips_cpu_has_work(CPUState *cs)
 {
     CPUMIPSState *env = cpu_env(cs);
@@ -581,6 +589,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
+    cc->datapath_is_big_endian = mips_cpu_datapath_is_big_endian;
     cc->has_work = mips_cpu_has_work;
     cc->mmu_index = mips_cpu_mmu_index;
     cc->dump_state = mips_cpu_dump_state;
-- 
2.45.2


