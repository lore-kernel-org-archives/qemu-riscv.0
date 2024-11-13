Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C4D637A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 17:18:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBH0k-0000Ec-6M; Wed, 13 Nov 2024 12:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0Y-0000Bv-CZ
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:22 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0W-0003m1-Vz
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:22 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-71e8235f0b6so6118590b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 09:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731518299; x=1732123099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDSyRePK0ZioZyeNhXDT45o3z8pIP1oRwjHKVCbyFfc=;
 b=SprwXX6lTL12KO1fwZTVrWORfDqGC0pThz1qRVbfr91UXlzyKbwQIdTnXua8ZdH6Oe
 rtgXSyBHrEktbcpTkPiFw1QxizCAN1fT1b1xq5f8I/tzMMQX5SXajzP5oL002oduSJf9
 0w+QtvT8q89z9KCq7xGCaKT1Hk0JrDNUa0p6SURAyDS7kFk/pPmuZsJdhQNsawyYpwfU
 2inKL/GM7AjwCcGtFZ8RhLtr5zHOr1iqBfsC0y/o/h+KO7jqzRUBZwmB0glVf3bS9Ogl
 2+z6DEaT+pAzskW2Ghiz4x/YjRjs89inv9msi7s5MrJdcMEtX6v+zP4L97yXHErrea0O
 TePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731518299; x=1732123099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDSyRePK0ZioZyeNhXDT45o3z8pIP1oRwjHKVCbyFfc=;
 b=dimp6XCZfc2SbJXxQUhRqNMZig+utmgz9nR1nWQosIyk5gsuviIaY4BcAwE2i4CMBQ
 p1Kpe+WvQyBjm1cTxQIcZA/vUub8z1UBTY9r9XrinO6yimYPO7+vxO/QsvQTfwk8IWoM
 u45uYsG8ADQ0CEAFdJF4ecgSJvpPeLGK2k7I1Wwom55kShHs9gOH8KDh9yTCu/FjLvVq
 oJkCUglRJukYkS4Cs5ty30rsgD0XAnp/4naNMCLCI54Lj8++g9av4jPUnGNURv7Y8hdt
 Cg7KXiC/y2sLiyGMNaromgM/Tp6GcnGVdsl2L/ZPzTXz2B0TZJnRphMI/UtExm2aUye1
 ex9A==
X-Gm-Message-State: AOJu0YzJibpD5yLsoH7+NS7WvnGIcVIrfntSVnB5ykyllOSHnwg0jq24
 tE6TCPz45Q+e2p1nyArjxFoiPSFxq0KZRTEl2dgZ8FbxoszOrkWEqjDOi57xMT4=
X-Google-Smtp-Source: AGHT+IHJb0RtUnogiD3Wf4efT62Rwq4GmsCPMhd464qj9dPqTkGPhHxvfC787jAErNqllYGVzzZDAg==
X-Received: by 2002:a05:6a00:398a:b0:71e:59d2:9c99 with SMTP id
 d2e1a72fcca58-7245796a1ebmr4371542b3a.4.1731518298988; 
 Wed, 13 Nov 2024 09:18:18 -0800 (PST)
Received: from grind.. ([187.101.65.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a9063sm13392889b3a.75.2024.11.13.09.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 09:18:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 5/9] target/riscv: add shtvala
Date: Wed, 13 Nov 2024 14:17:51 -0300
Message-ID: <20241113171755.978109-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113171755.978109-1-dbarboza@ventanamicro.com>
References: <20241113171755.978109-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
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

shtvala is described in RVA22 as:

"htval must be written with the faulting guest physical address
in all circumstances permitted by the ISA."

This is the case since commit 3067553993, so claim support for shtvala.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 11a0d2d04a..7b54c50794 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -184,6 +184,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(shtvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shvstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
-- 
2.47.0


