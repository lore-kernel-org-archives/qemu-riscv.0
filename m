Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03781CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDfMh-0004OZ-DS; Tue, 28 Oct 2025 04:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vDfLp-0004CQ-Kb
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:46:45 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vDfLi-0006Su-Og
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:46:45 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-33d962c0e9aso4799077a91.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761641194; x=1762245994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NcmS5eSVVHZBTH578A5sV7MzSCEtEH7mlQHouzUnnQ8=;
 b=XhL/jBhPNCmAzEqMnLAjCLUejbr4KfDY757oYrZxVzlS/1L0LFfa02w42PNG1IaUNW
 a2huHAT7Ut8EGmHnO4e1M8cwUQpRT2l4ullqkqsAAA/5i+bwuQ5JnLxU/E5YYUqDf4hr
 O+ocuyRQqoCplnueJWTBuYbTvISOg/3aaV5q8KGtgXm/xdu9k27akGMLkqC+dM/kJ94M
 T9QppWEO0EVzs9KsOdN2sDFqGkJdDZWoHH1L36UEmiCsZIvyrovOdmgzF5WMQGqWiXMc
 +3GnKhyCZhlEUSQgqO0A4mauIBnOPfV1f4Mt+pBg991YPF1BXHGOI8ZaUhptXkzosfKE
 AKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761641194; x=1762245994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NcmS5eSVVHZBTH578A5sV7MzSCEtEH7mlQHouzUnnQ8=;
 b=e3JYNu3SSdNWef++DM8dFCOZq10ZIjDP6TvylF3Uw30lgKHvJUiLGkgiLMhxgWcMGo
 UBtHjsiBnHQTy4J3U/Mx/kyhYtoSHUdvTU7eE1q1ZH2kFZyzkT/PEuwo6KNrCq9GFj0R
 1MrG0RWmi3baYp+rUchPwdc2JFTzKDUoGfEw55qZ+fM2DnMPLETkF7CyiWbxgGZWOlYS
 W5p35IvbAl2/FzFYKuYdSVI8V+iDmpupQsF8MjG8FKkn0vSe8/S1az9EfYao3lauvpSS
 zjNsyydWq/NGoOvFNubKY7v1jT2me9m8VM8npxeG53w988gcw4pyaouX/gdYuifcchd7
 +uCA==
X-Gm-Message-State: AOJu0YxLG/HGJEb3nqtdd//c1LTEZ8FbfJhmHI59ZVfcHQ3G/SoHUIE6
 GHeY8GRXVqxFcLijbbbadaCiM4+D+2c5W3yJnK1dmxvpTH4QlypfjSofHxKBQrtDJWg=
X-Gm-Gg: ASbGncvA+30nOiizqJlLO6L3V/a/Eam7nrfNOW2S/mjr79A23EU2CZkTEfGgyUdLUZn
 VN3ELkveNUSpuV2xzONEg3HdgC/3v8ApZoXf+MQnVgnpFdDjTuOytMyc36/RcsAHweOWO1gy8M7
 SD+nuYpLkLorWkD0aDQKxZaMMthq0NfvH4UeNNQZeuT4GN9MMEdZ1RpOLL/Wv9ZBUSjfGh7QSTz
 R9BsvuX7GzyhxJfA0Y70rE8aFvc0h5GfFzIinY2ejwoCBEWV8kcGekjFpS3vxgFaYrqT8QnHgiH
 aDvHQwnLTuzVAyK+SRHqBxJ5rSm91D29pg7uFVEqM0Aluwnm7rhQLDFDwkMVpD9etzBzhLkJmXE
 +0D09OjbrAvyuBjjkVn02xFLFLaMz5Mi9NjMskQS4ZIuc3miKB7R7z55fzS3ycEY9dzEkCK7lf4
 GqspeH3MSCOPiQQc4xq0xv8csycw==
X-Google-Smtp-Source: AGHT+IG/3xDOEkCqPLEful9dpkqv84BRHwAiR1n0BvreEcJXi0pCvJnT+DBV3hrwyuT2NkBo6IWd5w==
X-Received: by 2002:a17:90b:38cf:b0:33d:a6a6:2e26 with SMTP id
 98e67ed59e1d1-34028989872mr3220349a91.13.1761641194289; 
 Tue, 28 Oct 2025 01:46:34 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([189.38.141.22])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed81c8e0sm11343909a91.18.2025.10.28.01.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 01:46:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] docs/specs/riscv-aia.rst: add 'riscv-aia' accel prop info
Date: Tue, 28 Oct 2025 05:46:22 -0300
Message-ID: <20251028084622.1177574-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

Add a small section talking about the 'riscv-aia' KVM setting we
implement and how it affects the provisioning of the IMSIC s-mode
in-kernel controller.

While we're at it, fix the formatting of the AIA bullet list.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/specs/riscv-aia.rst | 43 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/docs/specs/riscv-aia.rst b/docs/specs/riscv-aia.rst
index 8097e2f897..f3c6ab7fcb 100644
--- a/docs/specs/riscv-aia.rst
+++ b/docs/specs/riscv-aia.rst
@@ -8,10 +8,8 @@ RISC-V machine for TCG and KVM accelerators.
 
 The support consists of two main modes:
 
-- "aia=aplic": adds one or more APLIC (Advanced Platform Level Interrupt Controller)
-  devices
-- "aia=aplic-imsic": adds one or more APLIC device and an IMSIC (Incoming MSI
-   Controller) device for each CPU
+- *aia=aplic*: adds one or more APLIC (Advanced Platform Level Interrupt Controller) devices
+- *aia=aplic-imsic*: adds one or more APLIC device and an IMSIC (Incoming MSI Controller) device for each CPU
 
 From an user standpoint, these modes will behave the same regardless of the accelerator
 used.  From a developer standpoint the accelerator settings will change what it being
@@ -81,3 +79,40 @@ we will emulate in userspace:
      - n/a
      - emul
      - in-kernel
+
+
+KVM accel option 'riscv-aia'
+----------------------------
+
+The KVM accelerator property 'riscv-aia' interacts with the "aia=aplic-imsic"
+to determine how the host KVM module will provide the in-kernel IMSIC s-mode
+controller.  The 'kernel-irqchip' setting has no impact in 'riscv-aia' given
+that any available 'kernel-irqchip' setting will always have an in-kernel
+IMSIC s-mode.  'riscv-aia' has no impact in APLIC m-mode/s-mode and
+IMSIC m-mode settings.
+
+
+.. list-table:: How 'riscv-aia' changes in-kernel IMSIC s-mode provisioning
+   :widths: 25 25 25 25
+   :header-rows: 1
+
+   * - Accel
+     - KVM riscv-aia
+     - AIA type
+     - IMSIC s-mode
+   * - kvm
+     - none
+     - aplic-imsic
+     - in-kernel, default to 'auto'
+   * - kvm
+     - auto
+     - aplic-imsic
+     - in-kernel, hwaccel if available, emul otherwise
+   * - kvm
+     - hwaccel
+     - aplic-imsic
+     - in-kernel, use IMSIC controller from guest hardware
+   * - kvm
+     - emul
+     - aplic-imsic
+     - in-kernel, IMSIC is emulated by KVM
-- 
2.51.0


