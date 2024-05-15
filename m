Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA8C25B77
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 07:48:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s79N2-0006eC-Bz; Wed, 15 May 2024 03:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79N1-0006d4-00
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 03:48:15 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79Mz-0000G8-6P
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 03:48:14 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6f449ea8e37so5623156b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 00:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715759292; x=1716364092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7O3me2A3EyGgD+KWkf98RQrX1/WsA8xiG3u+UiJbo1c=;
 b=ImzzoIZX+MtUoeK1Kq4DHUj+980yLaisE2DIQe/C6VLBESOKZdR+M3fRmpKr4g+4FK
 lDG4G6OoK3fRqiMtdvN23nvLeQf8/diZ8r2/RLnkeWeucMzs2m0mJ7Sn/YZm2Ma+WbGX
 X4BJJqB6eIonZBZl4YPvnFE94iZPwh4CFMZHzHzN1zn6NeOHepRAzMMMdAC7aMqoduS7
 6dcNK6v/i0ovF7hh9tncdKH/lklHrBundIhqjAF0P9ps8cROh4bY6OS9912ogsuwHQVK
 lrTF4MS9XksX1SiaB30wShId4LyBW7T3EYAkSkWvFMPBW4jBp+S3IdSLkKt2XoB3nz+d
 jm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715759292; x=1716364092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7O3me2A3EyGgD+KWkf98RQrX1/WsA8xiG3u+UiJbo1c=;
 b=fBqr/2461rboJzSozsdNgXIf2JJ8bGhF1b8p4YSfqLN9jVHj2nIoN4AssdrqLTl+Gj
 umJ4a5+dzmrKOE6wdHqZ0LxUDtDKzwyW2u3OMUIQhaC6IMWfAspo9C9Ti7Nq99Pinb++
 6NINkko1qZ7tOENjJsl3AMsCaoROLJZaX9xRMTLwWx1VxpnuC0aHDZLOrQVK1J09N3bm
 xsMpnwIwb3/SQVcKay1ip1OCLVZkyKPrqEH3RU1vFSLjAP427kSCOyTX3xy3CVzIMA4Q
 xQa1sGQ2/z5BJIWjmx4k8rB1Cs40nYXb0WHn2txCTYLVBqwXVftCTqYjVGWxL3iLmFCg
 iyKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+LfxnJRaJk8sRw8xCFAIdqdqsFBW7Yl7GXyEVXjKYnMT7I3bK+EXahqhcKJCmGvsfHwCQsP+64Q+sgi8srKpoPMIfPkk=
X-Gm-Message-State: AOJu0YylsHI/yuUMWJ1X9fK93TADhm2IspJkWsV1l3jznzguyHFUMQHp
 IPPMb7n4UWaEkKxaJrCg2z2p+8nhpc/OnWDX2MgCvKYEvyqdLlWbJJnVk+fJdrs=
X-Google-Smtp-Source: AGHT+IFPBW0SUoc0wVgjfqyyMaxv3KF/v7IooigdCtyi6t6VYyi89I/GWWIhMNxRcfWjZIVC2IYdnQ==
X-Received: by 2002:a05:6a00:391a:b0:6f3:876a:c029 with SMTP id
 d2e1a72fcca58-6f4e02ac99bmr21451343b3a.10.1715759291651; 
 Wed, 15 May 2024 00:48:11 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2af2bafsm10389060b3a.162.2024.05.15.00.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 00:48:11 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, "Fea . Wang" <fea.wang@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH 1/5] target/riscv: Reuse the conversion function of priv_spec
Date: Wed, 15 May 2024 15:53:32 +0800
Message-Id: <20240515075340.2675136-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515075340.2675136-1-fea.wang@sifive.com>
References: <20240515075340.2675136-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x42f.google.com
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

From: Jim Shu <jim.shu@sifive.com>

Public the conversion function of priv_spec in cpu.h, so that tcg-cpu.c
could also use it.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c         |  2 +-
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 13 ++++---------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2946ac298a..6dd3d7f4a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1786,7 +1786,7 @@ static int priv_spec_from_str(const char *priv_spec_str)
     return priv_version;
 }
 
-static const char *priv_spec_to_str(int priv_version)
+const char *priv_spec_to_str(int priv_version)
 {
     switch (priv_version) {
     case PRIV_VERSION_1_10_0:
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1501868008..140eb43fcb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -833,4 +833,5 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
 /* Implemented in th_csr.c */
 void th_register_custom_csrs(RISCVCPU *cpu);
 
+const char *priv_spec_to_str(int priv_version);
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f59b5d7f2d..fa186093fb 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -76,16 +76,11 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
 
 static const char *cpu_priv_ver_to_str(int priv_ver)
 {
-    switch (priv_ver) {
-    case PRIV_VERSION_1_10_0:
-        return "v1.10.0";
-    case PRIV_VERSION_1_11_0:
-        return "v1.11.0";
-    case PRIV_VERSION_1_12_0:
-        return "v1.12.0";
-    }
+    const char *priv_spec_str = priv_spec_to_str(priv_ver);
 
-    g_assert_not_reached();
+    g_assert(priv_spec_str);
+
+    return priv_spec_str;
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
-- 
2.34.1


