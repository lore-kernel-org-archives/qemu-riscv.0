Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0663BC021A2
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:31:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbMe-00050I-8b; Mon, 10 Feb 2025 16:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMH-0004R6-Ei
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMF-0002Uv-UH
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso10888595e9.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223022; x=1739827822; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LstW3Dp8wkhRDMPLlcZPAPERKl2k3gDe4YnYzMJVkXE=;
 b=AHuujSzT/vIc03J7vcPjIbWL5sK+jSW/DyV/WXxknilZ/ltsSpWanjW8c9zmu0k6rr
 A5tptiAOhQA+NTc6adnBnGXQjfbX6T1Qxpo3NxTTCvi3vZZ5RYEb5+7OLNPjeoifoR9x
 /tmPaUg9GL7iDodVE2aK/xCS9FvOVOIJnvseb27QQg0GNEaT6nIfnMpR8mtC9Y8cp4uK
 0hwAPkwX/Gi+VZmJ7OCC70vOkjCJ836+McK03aoOkuk8qjjdYb/d+bjLp45Oo6/v3z3n
 yKtqbG9ensAnuc0nZ7INbPCmImFYJ5juXL+uFcdXQtRIJxF+F8PHGnvsB0f83CgcWu7C
 A3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223022; x=1739827822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LstW3Dp8wkhRDMPLlcZPAPERKl2k3gDe4YnYzMJVkXE=;
 b=LYwuoT3bSHCMjgHa4XI3PugnTnPN95JInYYJFOOSkRVx4TBm3inOs9NZddxq1AXs/6
 38EPfTumlHZ/XMuQJtoIiy9g650hxiIH8rIiH2z7Du7OxTpAie4h4faRkGnL5qxTNEzw
 d+y5gSNe8cQjQtAlubLFUm40fPjPRTDHx6s473Hpnjie6WPM6erU+FUIySI+AEaFyTte
 IpepIgyo8R+4SRPXSXDSvx7DXydNS8Eg3NOJftZzD/RFLCZwdost+sZIyQwhhMsFr4es
 xSC5KObtO0mpWjvGFfPulzzpdtqwf6HwoASNNqE726PGPO7H8LSBB+V1U/m23t/ih1GN
 NwrQ==
X-Gm-Message-State: AOJu0Yy79LZRHhnynENOuVSwkbMrG/ID5xBfTJjCnhigGpJBBa1+vt/Z
 NwVwf2Vm/idDrhZHBLFquK/HPx3x3T1mvLWt+VSO4IF14vxkxxRUY2E9bScbPBQ=
X-Gm-Gg: ASbGnctOSFNApl+GDuZiZUPmGThQ+FJvbja5QP7XZubQTfgZFVV9yKX9uKPZNyCAmQ9
 DpbSVusRWzIYBPzPfWzsyxgF4Lmhuh5mTssU2ACW0lO/OklgoJNtKBNmK1yNy47broFiK6G0VuR
 HWEAoB13ODSHCM4DXiLFgAK3e1Qd55LaovWCZ+p0o7hB9PeBatcCUd4FVYd6nYW3gfoV5Ld/5Tu
 TnTJcQ5//NSf9Sk9KoOIZ3klWqYPOrDaUkwMeO0jVEzVoht2NN7b7kYfR9d84pEHUhVwhZT2R8h
 bqB5wFi7eugUqGdGi/rrUCsYXx6uNXboZvdamaXnFQxRsY6fkH17Xqu+wu7qSbidgA==
X-Google-Smtp-Source: AGHT+IEzTJ44VsNwmKpxj/vB9wEUjYCYpZ/i3rUv4ZNFDQKr/78ZUuyADGycQZ/O10oaiL3ZlWS2BA==
X-Received: by 2002:a5d:47a6:0:b0:38d:d9e4:9ba6 with SMTP id
 ffacd0b85a97d-38dd9e49c91mr6523185f8f.3.1739223021731; 
 Mon, 10 Feb 2025 13:30:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm193931685e9.30.2025.02.10.13.30.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/10] target/xtensa: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:29 +0100
Message-ID: <20250210212931.62401-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/xtensa/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index efbfe73fcfb..bc170dbb5cc 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -159,6 +159,11 @@ static void xtensa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 
     info->private_data = cpu->env.config->isa;
     info->print_insn = print_insn_xtensa;
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
 }
 
 static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1


