Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C115E77171
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:27:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvxK-0007eJ-4c; Wed, 04 Dec 2024 15:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxI-0007dE-Uj
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:40 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxH-000755-FL
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:26:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so836308f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343998; x=1733948798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcqXxb9hdcFJ7l5TfHoNchwB1oNn7eM/DNMTs0fqYbc=;
 b=huji3LWFMRoMtbSsB44ClNzKogtWW4RICRcnr75VI1gp3u/bmBfB1S/OOZp8J2V7qc
 6Qd+zcA8GJGWSXhynrSp+WF1GSYxx5doiGV0K6HLEoLJnHutfDjVPg05dgrZ77v0kko8
 6FvcmIe6i2nw8f1OhJDrIxnJmMmDq+/QKUKti17I3M+SWa47v7xh5VmToiljB6e0zdDF
 AtyVh/6OEICIYPqIPjTXFlHXeAiLdHGcU5Evvaqaw/k7zVpmYk85gzQOR213EykQOmtn
 2rH0OlwxEflnm1YJSIB0Am3u9BgJtQzZWA1EoTrteKZM91XV9DubHzOnyuaROP78GEwe
 gKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343998; x=1733948798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcqXxb9hdcFJ7l5TfHoNchwB1oNn7eM/DNMTs0fqYbc=;
 b=u47b5EyaxebLQ4DDgn0hCoU4b3amGv34o9QlmZcRuDXkZFr3teWT+rqfOYNsKVb7vM
 8V2TZNPVhrIdflxiERQ4+YqWhfYpAw/s/eloBNVriwzGAFugWatuerMsae0ZVJZ0pZdZ
 1wFxPELdIp4dFyBVqvMh7he6fYUP3HniDd6mNTboB9CiSvuAr+8CyQLchfsjDn+0W3SE
 Yqx/QrgZkMwqQsGBMKb/4GKcdmH5E7IrtBVsLtRmm8XpkA58ItZUJBZFHaLqN2GgCYuw
 yWE/7n1ekRaezbrmtgm774I/Sgr8t8+ie9yQlB2xYUUIsxh/y1EaHrGnMWaIhvCqw24C
 qxww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb+uBt6/PUzoiboEhI7Wny8ynTxN7DNXe7D27X9RlbLhWqLkEdFTDQ9YaVltNsXf4TOXWZQM9sojdZ@nongnu.org
X-Gm-Message-State: AOJu0YxdulmNXB4OOkEtNa3X3BelqvDMMZ/S1w+5OyddBdSpQeZzxPeS
 aAauh1BBN4FPf6HQn74qtSCHVSrFDu6V/Np3QJ5akPD82EzTAGS69UT8e+uwq/Q=
X-Gm-Gg: ASbGncuuhT7vomyyoYMXT4H9hrgZ1s9VLF+p3k3uJHfXMfxZ0HTbbcOEULIPbqunsvQ
 XnM4SWJFD/wMwqty6C2h7XfW7Z/lDwXQ4llpR6hsg/4DJivyVWNWiiwUV5mJVt1uWdLP6xfXS/u
 NnHJDtMSlcTU4xdtX/mSdjeWnomtfMrDZ2wz0XSBjkjC/pspkdXjN/x2sYRPpVjGzwsbh5+2oDe
 PUI0vDDKcHLfvSGam8mP0MFJ8hYSbG/A3v0cdO1u8Ju3zxpgo7aNvKsBhOOS2dup/9UGQgzTJTk
 IYBEoPuyVbfYmRGoMEJnd6sQ
X-Google-Smtp-Source: AGHT+IGzom8YBc2l6q0doPnVLmL9m17aIXaAPwIBHw1YDr4BhvjFN0i1tTry+zE/z0HeVpG+vkxmQA==
X-Received: by 2002:a05:6000:2cc:b0:385:f138:97ac with SMTP id
 ffacd0b85a97d-3861bb5a565mr532650f8f.1.1733343998156; 
 Wed, 04 Dec 2024 12:26:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df74157asm16690526f8f.0.2024.12.04.12.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:37 -0800 (PST)
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
Subject: [PATCH 06/20] target/sparc: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:48 +0100
Message-ID: <20241204202602.58083-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

While the SPARC data endianness can be changed at runtime,
we do not implement that; only big endianness is used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index dd7af86de73..de0386dbf64 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -688,6 +688,20 @@ static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "\n");
 }
 
+static bool sparc_cpu_datapath_is_big_endian(CPUState *cs)
+{
+#if defined(TARGET_SPARC64)
+    /*
+     * SPARCv9 has a couple of PSTATE bits that set the endianness:
+     * Current Little Endian (PS_CLE) and Trap Little Endian (PS_TLE).
+     * We don't implement that yet.
+     */
+    return true;
+#else
+    return true;
+#endif
+}
+
 static void sparc_cpu_set_pc(CPUState *cs, vaddr value)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
@@ -958,6 +972,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
+    cc->datapath_is_big_endian = sparc_cpu_datapath_is_big_endian;
     cc->has_work = sparc_cpu_has_work;
     cc->mmu_index = sparc_cpu_mmu_index;
     cc->dump_state = sparc_cpu_dump_state;
-- 
2.45.2


