Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94553C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:42:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyI2k-0002a3-Ad; Wed, 01 Nov 2023 16:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2i-0002WX-Cf
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:24 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2g-0000ef-Sl
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d9c7bba32beso199264276.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 13:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698871342; x=1699476142; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/A81MfmHSii2g9wXL7wLzUzIse0LpnaxjmFzQl496fY=;
 b=pU8H5I/cgMSAplIt403QlmJSX4KVNx4nOhtGxDqM2MnRwm9qg4oax8L0ZKMrDzUuH3
 ShTo4MhNidIgzlXISx7QiHnNk3Yyi9cjOdi5GgSrRIoapKHZ4f/GdM4RC9Mx1NQ+cMFz
 PmGITvr1am6uxIJWp+KB7Q1TPoXe7f24g3OcSzM6Mz2yNvVsG396JeXIgzwDlGjWZgY1
 NIPWZOe2nU2ejnyVaPuRDsOZKt1Dyu62DzTv80RNkU5p24embTDrMYzcLDgt4Xm5uPot
 6hE0RCoAnx01lH8ZMr3E+8FAyzuXoT/cbRuNUCfCgmRiop0tZP59Lsmilbz3JOazVJ/z
 1Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698871342; x=1699476142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/A81MfmHSii2g9wXL7wLzUzIse0LpnaxjmFzQl496fY=;
 b=OyUxEeZznlUfbZhVz7qyWUri9i01KrfmEGnXUsyfDUAbStUWlO4cNcSTwoB+D8GVPE
 eGx2caKDZ3GCAzbLwixNJ/b4bsXT5467+It3S7VwAP+cg7ZfbhwhCltqdFIYQwCdxtrp
 kG13b89Ag9hZuTRTWvGrdJ4oPCfHXjyux2BtzM1xQSKGHaAjay2iPPlhr7rsBTCIv1sJ
 /ayKGRmp9zsvFHD0nIW2q0dX4n/Bmw4XV9FQPSYJBRFRadmyE1dudAmGTLaWPeESkh/8
 1TEJZ9TevBbp8Y4tGFpTq3qjURXLd6a6JsgdzDrkQsEZjhpZKu/O5UtN7SyOe4nbGYy7
 8iUg==
X-Gm-Message-State: AOJu0YznJOCMAGrtCtAkrAfs+/KSdzCsEH/Nq/Kq25UGpq3IUlyfI87V
 jQFhttw0Z8kJ80R7KpUxQ8mKmQ==
X-Google-Smtp-Source: AGHT+IENqMhtKJdqSEYs5OQBjapzS6n0sc4WcNofbV17gAyS5L5sqDD7cdKSqf9DsiA4g+fufbRkHw==
X-Received: by 2002:a25:d7cb:0:b0:da0:4aaa:b480 with SMTP id
 o194-20020a25d7cb000000b00da04aaab480mr18248956ybg.19.1698871341974; 
 Wed, 01 Nov 2023 13:42:21 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 z187-20020a2533c4000000b00d9cc49edae9sm329724ybz.63.2023.11.01.13.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 13:42:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 04/19] target/riscv/cpu.c: set satp_mode_max MBARE during
 satp_finalize()
Date: Wed,  1 Nov 2023 17:41:49 -0300
Message-ID: <20231101204204.345470-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101204204.345470-1-dbarboza@ventanamicro.com>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2d.google.com
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

KVM CPUs can handle "cpu->cfg.satp_mode.supported == 0" because KVM will
make it do internally, not requiring the current SATP support from TCG.

But other TCG CPUs doesn't deal well with it. We'll assert out before
OpenSBI if the CPU doesn't set a default:

ERROR:../target/riscv/cpu.c:317:satp_mode_max_from_map: assertion failed: (map > 0)
Bail out! ERROR:../target/riscv/cpu.c:317:satp_mode_max_from_map: assertion failed: (map > 0)

This will be thrown by target/riscv/csr.c, write_satp(), when stepping
in validate_vm().

There's no current CPUs affected by it, but next patch will add a new
CPU that doesn't have defaults and this assert will be hit.

Change riscv_cpu_satp_mode_finalize() to set satp_mode_max_supported()
to MBARE if the CPU happens to not have a max mode set yet.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9f6837ecb7..f7c1989d14 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -942,9 +942,19 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
     bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
     uint8_t satp_mode_map_max, satp_mode_supported_max;
 
-    /* The CPU wants the OS to decide which satp mode to use */
     if (cpu->cfg.satp_mode.supported == 0) {
-        return;
+        if (kvm_enabled()) {
+            /* The CPU wants the OS to decide which satp mode to use */
+            return;
+        }
+
+        /*
+         * We do not handle cpu->cfg.satp_mode.supported == 0
+         * with TCG yet. Set to MBARE.
+         */
+        if (tcg_enabled()) {
+            set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
+        }
     }
 
     satp_mode_supported_max =
-- 
2.41.0


