Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D877C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmQ8-0006zo-T8; Fri, 05 Jan 2024 10:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmP7-0002DE-Ok
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:37 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOo-0003t0-Ee
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:46:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so1322936f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469577; x=1705074377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzfKYNH1/2wbsF3ubLhxzVujUnJw+6X9RP1nI43IQ80=;
 b=ER+J0fYiSRL3gi+24IzzqLi/vohO2TpKTOVS8ZxzSZqC9Ai0Lvseqm8dV9Kb08KJcp
 dYjRgEm1GVRhyi4n6XMmL8INkuwKezBuUIawlv4TubUjXFsSTgJ/DFg4WcnSeoboAMTK
 S+yc4RVCPE4zI4/4tydWnrUyfNWbDUt/gsyoeG+sgYjCylUll4xy5ogWnaE8+jJqNMqc
 nO3UhJexhrOY0FIBb7wXYBO9DaweNrAaVyYzMJ1Bw9HqfBJPSMyE+sMjpLVaFTLmVLbx
 UO/vG7esM3RKdCkk8QRV1KJNRnx9iuIHWcXVWE4cTzyTo1xIqwepADnoYvsOZTHPxjq1
 F79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469577; x=1705074377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzfKYNH1/2wbsF3ubLhxzVujUnJw+6X9RP1nI43IQ80=;
 b=ZCYaaHqgtb2Ue5JKSdivFP73zMhPKW/iqQM9lXqpO2Bc/q9cDsHEo+QCq3ed4gRoK2
 2JFRBVJ+D8+MXjJYxhZc2fq6KwwnmtE7U/NwYZQLRDm9jTFysbcfV0O/z8oom3RXQqoI
 7ZkI/4YZ1SaCsY1rC9jwzbdhr0Qni9yAwBHWXuJrJcE9b4vGW99AEYIDMF3AyCURMuxC
 03afK9xX4LOS9s1mOVNLifqpPSDp7B9zm0mZTsbZuFbkzRpzoNfbBO/pqnIIiSROYSOW
 Vug+vz1ISwzQPfJvpYXa19wlQ8gr2tmo/wsOlQ0Rnn3hFZw6URJR3QwjlfUnbwO70V8Z
 bDzA==
X-Gm-Message-State: AOJu0YysELPKSw3UBss03emveeZcfFTXgVVsogbmH7/6QqBWjjp09uMI
 rYwcLHyewTP5G6a8B0xT8N+pvrBKVhAe2A==
X-Google-Smtp-Source: AGHT+IEhkyu+mJt4ZgaI2HopS0VuCObVFwdS74M/k0bvowJHwD76KBU/9p3O6T1tSG4xTvFzEZ3yWg==
X-Received: by 2002:adf:f552:0:b0:336:b9b3:f554 with SMTP id
 j18-20020adff552000000b00336b9b3f554mr797130wrp.133.1704469577055; 
 Fri, 05 Jan 2024 07:46:17 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b003372befd19bsm1607838wru.104.2024.01.05.07.46.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 28/71] hw/arm/virt: Hide host CPU model for tcg
Date: Fri,  5 Jan 2024 16:42:21 +0100
Message-ID: <20240105154307.21385-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

The 'host' CPU model isn't available until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8' on tcg after the next commit
is applied to check the CPU type in machine_run_board_init().

  ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Aborted (core dumped)

Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
the valid CPU models can be shown.

  qemu-system-aarch64: Invalid CPU type: cortex-a8
  The valid types are: cortex-a7, cortex-a15, cortex-a35, \
  cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
  neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
  cortex-a57, max

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231204004726.483558-6-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8b69aba189..8b060ef1d9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -220,7 +220,9 @@ static const char *valid_cpus[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
 };
 
-- 
2.41.0


