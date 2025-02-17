Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CC4C021A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:20:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwKV-0002Ev-0I; Mon, 17 Feb 2025 03:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwKR-0002AQ-Tp
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:18:11 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwKP-00011h-I2
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:18:10 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6e67d2b9075so6732776d6.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780288; x=1740385088; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CIOoUkbjk51N51acNzDriCfyDC8X79FyXFjaBdinybo=;
 b=aiBprKqODdjpU/ID4k/tbfB7sGFiXmAt2NHzMewPflV7vPQq19n4XpXwC3FXqQt6n6
 dy26IpXxe7a5LlUcS7vn6856ELb7wVpzLOMiTsDp3/h8rj7dSaEzv3/DW/fIT8B35nuV
 sIjPE1iYB3TDoi5WeAE/BhhUQcO/eqeW0uckJKDIWgYciLRWLomzAYqGkpKTV6IfC2Ha
 HRAB04NgfB1mqkt2NoXggJeQPK8IGDlhGSozSg4I4owXahsIY3WwNrCjm9mJCrfy3YcX
 MchC2f13UVpyn80CQtDqZInTJgwSMhY1XdHzZl0fELl7ADbu1C0rD1EVXfcvCIvRM7j0
 bMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780288; x=1740385088;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIOoUkbjk51N51acNzDriCfyDC8X79FyXFjaBdinybo=;
 b=MdjwpbXuKLxoYu3yezUcANbaytYGmVd+FmhsHyMIYM8yTOnuJwFQlsywvZ7PTJksIN
 tP3IjoAUw6wBlY2bSsv+5Em8aJsh8hNuY6axY17g30yVf/6zpeg2ARF8MlC6n0bIJLth
 Srk/HUyzuqdEom75o/nOBjdE1VIzdAFWX9AvSo2JRkvF00Deio2KEzLn/vDcfLJjmFGs
 njMY/x7tmceGBUK4BBQ/7xeG6b3uOLrzSfDRsJZK+Q5z/4sdSha+OTrxtdo0jqbQ3XDZ
 qL3AY7tEj2btu8IzRVO8ZAW6z/wK+VAljlW0tAXKn0/iJwoI0QpA7/v8FT/kto3UgTFv
 5VfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQgWRu0gRt+08LrnSotM7SQ8O0SdooPu84sBkDXeAHeSXsISSVrFQIoLTUabQMJ6bwFh2ZrsAp4tKJ@nongnu.org
X-Gm-Message-State: AOJu0YxKgGqMcNMKvmW9XHjx30Ak+otOfhXF10D//cmeLFR8ceM4LIRq
 EW4HuKLPYBIcv5uMxqxSWtQLp+y2WUC4NhEcQIcGwmLNG+aV87xk4KyuE/62U3A=
X-Gm-Gg: ASbGncsZMuyBpxxWpYsvcWAxK8VCAvB/j7waDUSseN2jCWX33zuBOoUH6biOAm68Xfh
 qTU9zv1gqO6HGyaijlFX2TYhFdnuf3MEwdMLfmSX9b+vTW2uDxjNQxO8FP51BaXld6unN+H0mAh
 OQSqTw8wCBlYJiD9ss8p26pQywPJEMAVIXdLMk+Gbf0ee/W5B5x2xKUAflAMPr+OngxGIzNVzzU
 E+Hm5+zELNy3y2xO0vz0hOn05jdkUnBuNN9yQeqWqmO9mumWUfFvW7vZr2mmKQ+LT7Y03kamhOt
 BqkZjr1Up41yFcwYPIJps03GZzMeJZwEFI9u0ssRG2m1zQ==
X-Google-Smtp-Source: AGHT+IEfZANQhcZDUv0bTis6sSavH9H1aY3LSqVQvrgPQLJ8aH649IbHLwd7nLcMsDV/2jlrYwF8Gw==
X-Received: by 2002:a05:6214:262c:b0:6dd:d317:e0aa with SMTP id
 6a1803df08f44-6e66cc85b7emr143122026d6.8.1739780288589; 
 Mon, 17 Feb 2025 00:18:08 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d9f38absm49673346d6.88.2025.02.17.00.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:18:08 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 4/8] target/riscv: add helper to get CSR name
Date: Mon, 17 Feb 2025 16:17:24 +0800
Message-Id: <20250217081730.9000-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250217081730.9000-1-yongxuan.wang@sifive.com>
References: <20250217081730.9000-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-qv1-xf2c.google.com
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

Add a helper function to get CSR name from CSR number.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 target/riscv/cpu.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 616c3bdc1c24..133d1852ee1e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -920,8 +920,12 @@ extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
-void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
+static inline const char *riscv_get_csr_name(int csr_no)
+{
+    return csr_ops[csr_no & (CSR_TABLE_SIZE - 1)].name;
+}
 
+void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 target_ulong riscv_new_csr_seed(target_ulong new_value,
                                 target_ulong write_mask);
 
-- 
2.17.1


