Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A0ECED611
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 23:10:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1syfnr-0006nB-3x; Wed, 09 Oct 2024 19:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1syfno-0006lq-EC
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2024 19:09:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1syfnl-0000h8-Tl
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2024 19:09:08 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2e09f67bc39so323822a91.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Oct 2024 16:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728515344; x=1729120144;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yMm+6BJb3kQ8HPrBwJmfhR57aUSbaoBGaVkzanXciBM=;
 b=r3euKVz946kkibuPw1riHc6BlnMY3zOm6BTBiI2qSHhR2y/2em3/puxxVO5ASVAB+/
 68G3vnb227SNsOI3LGy91LVFrbdyZM6rKyAGg6CEsLBc7VvVA+kxLr8EbR4sS1lPJ5a2
 hMeJWZjJ55Y7uCBadqzRz8IZ4HhRwl9s2wHGE4BLI7mX+n2+PX0t3wuo4hdvufgLige4
 TmZQg/cbcjQfLPBb4LxuP5POgiYTlqagdFRbUC1NulEx0UOffKwpcXiK06SrcUnsWjKn
 2sAHgjMUoZa5+jxlC0/UhU/Rf+ohpDV2Ug1/uQBOgOhqtz2Jn9vO7CqHULia1xYAytAn
 RU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728515344; x=1729120144;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMm+6BJb3kQ8HPrBwJmfhR57aUSbaoBGaVkzanXciBM=;
 b=DxdMH6BEEsXGqmfs4gyFdGRk5x1YR8T1CXnJpanjCqZWcIEH9PpM2/tp0rHj2HtoKh
 0OFg/ywauwXC2hvtH8vc2Z+DNc1z/0bgNbx8iyGoUpZ+t6lsgmtkYWmwf53kWAvU4pQd
 NGjzBdII8hFSp1e07TboWAg0t8rAqYK/tl16k5bx31+k/jClSh0gynVozSsIcTEuEJ9S
 Jmfy1VmA3VplC0+MMcI9wuI2uSGTtRhf9jzE1Ll/a4BdfD2my/5l1UNhEosqavBWYeQf
 kU6eifF0/8kGIDiY53mu8Mg7MMEqD0SyRqY0OJIAEou7PQerik+zh/0HIl3Ih7LORe0P
 w2Og==
X-Gm-Message-State: AOJu0Yx7i+QO0eAPsq8i2m3xH14kaBQuzXY3enlGDfxucfi4OyV0f/uV
 uSrkdSdDa7vo//lXgBiw2CWu4AXJAU4rp6n1iRnwGQqjBwbz5O1EU0iIZBrBxkOTrFi7Z5T9cZh
 s
X-Google-Smtp-Source: AGHT+IEwhht0tOazN++Z41ozpzPHdOSVC0VnK0SnNAhXv/Z/RBo8b7VntGFkunIhodp3etq0/fZCcg==
X-Received: by 2002:a17:90a:fb46:b0:2e2:af6c:79b2 with SMTP id
 98e67ed59e1d1-2e2af6c7a14mr3826699a91.29.1728515344507; 
 Wed, 09 Oct 2024 16:09:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2a55f9855sm2271902a91.2.2024.10.09.16.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 16:09:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 09 Oct 2024 16:08:59 -0700
Subject: [PATCH RFC 01/10] target/riscv: Fix the hpmevent mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-pmu_event_machine-v1-1-dcbd7a60e3ba@rivosinc.com>
References: <20241009-pmu_event_machine-v1-0-dcbd7a60e3ba@rivosinc.com>
In-Reply-To: <20241009-pmu_event_machine-v1-0-dcbd7a60e3ba@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: alexei.filippov@syntacore.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As per the latest privilege specification v1.13[1], the sscofpmf
only reserves first 8 bits of hpmeventX. Update the corresponding
masks accordingly.

[1]https://github.com/riscv/riscv-isa-manual/issues/1578

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_bits.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7e3f629356ba..a7b8bcbd0148 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -938,8 +938,8 @@ typedef enum RISCVException {
                                             MHPMEVENTH_BIT_VSINH | \
                                             MHPMEVENTH_BIT_VUINH)
 
-#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
-#define MHPMEVENT_IDX_MASK                 0xFFFFF
+#define MHPMEVENT_SSCOF_MASK               0xFF00000000000000ULL
+#define MHPMEVENT_IDX_MASK                 (~MHPMEVENT_SSCOF_MASK)
 #define MHPMEVENT_SSCOF_RESVD              16
 
 /* JVT CSR bits */

-- 
2.34.1


