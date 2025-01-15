Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDF5C02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 13:52:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY3mj-0005uT-6t; Wed, 15 Jan 2025 08:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY3mg-0005u4-LQ
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 08:50:14 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY3mf-0007qY-2a
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 08:50:14 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71e1e051e50so1797764a34.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736949011; x=1737553811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LFfXCjqMoPK4O+ptGX63fRnmxQjg5+dlAqXaV80UpeI=;
 b=E1VmD37hXzfN8HsT4VcWX6b0ZMtpfpMvQ4EeeX7SS/vdeZx5Akko+xW85HTN9NlWL2
 BkHhz+U/DcEO0TagcA4en6QuvTaExAdtn3eFVK1VMoTHsr0FHTxmfFl+pBxzlyRD/XFn
 PB8MziQX1EXtkZWWFgS2sZ5E753vBkqFbCB6xVR+36CsmNBb5pOF0Lyo1y2HyoKzbzh7
 Otwa7NaX8YxgcuvSGXByWlS0MyRlUvPd9EssxhU2tARKUj9JHcnu3c6hRf5kGOJsYE5i
 OPcFCrj2loRIBnQFwWTfpO//JkDc16SXQcdGClXdK4au+X/ZS4GNkHzPjh2N9XB+9O4A
 hIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736949011; x=1737553811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LFfXCjqMoPK4O+ptGX63fRnmxQjg5+dlAqXaV80UpeI=;
 b=CShL/gueuYvYYtiz/lCLqAegjrjkBP1s7X7SQoZz2cXvkX2BF50SE8IDaoaZTXWeh4
 nIYc2tmiPNCKljarnSWk7zyOdImj4TLaoOdAt0gDzoZ4lk7eDRzPIBK36otN2pyVbVXr
 6sz0v9kmEdrlhdCed3d6D++k8nrXWyEGHYzrDqHA9W0lNKMzok9acsyfYAyy1p4C2qRB
 gHBx13mhMYyBAXgoo6aVHnwstqv03cEZUVvN7GuCqrUe9rZpjNUgnpUGum2dBcyZWOWZ
 q2Eo8LAfKb6I4njqUQrMV+gesz5JUqLZhWQYBMjAtldIFBNazEMcqqc6udYfFc69YxY0
 K11w==
X-Gm-Message-State: AOJu0YyCbIubF8OyF1H8u+PvOsCRG0n7OD9WoAVkIEPxWAIpLC+8Z8Zb
 5ukDqni4snKoUZ0KsJFLLxZLtjLpUU1/Zs5pCffmWIsOQoARZnw5xgMT2LCJrls=
X-Gm-Gg: ASbGncutTpdiNG/gu0P28dLq3FhiYf3TxSn+Juec+9wGkpnynkZwOceeEfmDlmYXQud
 s/0/6dZotyl3cap1cQf99tFJgb4g0jtc/nnbr8l68lnYviF6ecjZ4dTSKEl/i56kQamhArap5lS
 2TExIRMR2wX4iLR1L+WS7GNxr7Z25WzJL/TSaCtTUcObsVoWEvg9L9cyfzerySL7reX6aupQg1J
 9N727MT0GwFx3hXXqxwAO2MNrSFoe4kWy/I1tpHswaghPkfgZyJ6aEy5KU=
X-Google-Smtp-Source: AGHT+IEgpto5qo6/yTG4/kYwJJ9b2L1ywboxmVR1O5wJR51Ecs33TMuzjm8V6y9j8uEfttEk0b06/A==
X-Received: by 2002:a05:6808:180b:b0:3ef:27fe:e984 with SMTP id
 5614622812f47-3ef2ec17b07mr16982635b6e.12.1736949011690; 
 Wed, 15 Jan 2025 05:50:11 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f0379eff69sm4952177b6e.41.2025.01.15.05.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 05:50:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/6] target/riscv: add ssu64xl
Date: Wed, 15 Jan 2025 10:49:52 -0300
Message-ID: <20250115134957.2179085-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115134957.2179085-1-dbarboza@ventanamicro.com>
References: <20250115134957.2179085-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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

ssu64xl is defined in RVA22 as:

"sstatus.UXL must be capable of holding the value 2 (i.e., UXLEN=64 must
be supported)."

This is always true in TCG and it's mandatory for RVA23, so claim
support for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c                |   1 +
 tests/data/acpi/riscv64/virt/RHCT | Bin 390 -> 398 bytes
 2 files changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2..b187ef2e4b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -213,6 +213,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssu64xl, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(supm, PRIV_VERSION_1_13_0, ext_supm),
     ISA_EXT_DATA_ENTRY(svade, PRIV_VERSION_1_11_0, ext_svade),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 695022d56c4ac16607d4c622955ad339fbbfe997..b14ec15e553200760a63aad65586913d31ea2edc 100644
GIT binary patch
delta 48
zcmZo;?qlW(@^B96V`N}pOqj@Jz^cQ@$e^;(o|BQSxYW#~B4@H2qXkC_BLhPoBLf2f
D`wIz-

delta 41
wcmeBUZe!*O@^B7mV`N}poG_8gfK`Q&kwIpoJtyPj07f&87)Az$G)4vn0JA^`U;qFB

-- 
2.47.1


