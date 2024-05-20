Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE719C04FFE
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 May 2024 12:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s92VC-0005xs-0a; Mon, 20 May 2024 08:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s92V9-0005wt-NH
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 08:52:28 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1s92Ut-0004QB-Dz
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 08:52:26 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ec92e355bfso83821735ad.3
 for <qemu-riscv@nongnu.org>; Mon, 20 May 2024 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716209529; x=1716814329;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3thsVkbeZ10hLn8Zsk4RYDelVMSTQcDxwIaMc8H6dwI=;
 b=XqS2/dZVQEOg2AcZ5nSgbavdxjWnFp6EjCjyaTamBMVKLoFoh9cgQ3Xll3GIO9vrrY
 xIMYeqR76WsIoYyL2PGHxbwH+e9nkg0z60S9PWQOHkq9jWMEJZ8YD/QUKGZ+LVmp8LOI
 9VrBmJi2gSShLL3DbSusUZzY6plHgv2Az6+Ak9Znwuz9Bo7iJBeIOmzkWdp5Pvxl9Kw3
 CdEQiXHRf8Qcr7yEX3uHSp5wYkGQQ3fYvlDRGemhobJE8EzmNWCR8vWx3FL6yC6dxdr0
 wOB8FnCw63cN0GidBiNsdgeoKjN9JbRv95uae/Nmxzr3NXV69dnJA/eAAR7h7ygv3nzM
 maPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716209529; x=1716814329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3thsVkbeZ10hLn8Zsk4RYDelVMSTQcDxwIaMc8H6dwI=;
 b=HFbzxLIK5ILDAoKNXqcXNexJiGqDfBjI/H9u5L9Whs+FsfnH1dNfYww1e70f8PIXgu
 icKfK3ZiTtx1N7ptVk6YToXLLiqM/e4BL95+jLjJdq2RLzWt0GC2wKw0v5JWexcf9sk4
 GhRQjIMq4SePhj/YjX5G+wXLAG+VBaFmy97cDP1QJ1qHxvgvqpKOowgist7kTN8W1G4J
 SiuugR625Z54zi4+5JR3+pHZqLPUmzPffMob3/iCYY6x0aprzJvwJOLb7NBN48hCUlxO
 UGXsj7PIwAlNpkMjzmo2Vzoy7O9WJahErzPld/zXg5AE3UV1Rra04NkKiX+Mtr+KerVQ
 AyMA==
X-Gm-Message-State: AOJu0Yw7Po/9DvBy1xn92XHg6Sgc0MTYym5mEDy7lDJ9SYxrM7MVbpyu
 3E0z3y5n6xp7NKAicT70nQSAMr2z4r+uwe81Kh3VzmQLAcJg2b5NMCRXI4TBuPgertwfG4rYes+
 LDbU=
X-Google-Smtp-Source: AGHT+IHw4jklGUA5kfc/IiQCXYLxobMxv5z+SVUAKXfBq39OBqcYcySEa8m50VkHAjyyZv+1nmRlkQ==
X-Received: by 2002:a17:902:6ac5:b0:1e8:2c8d:b749 with SMTP id
 d9443c01a7336-1ef43e25e67mr279831485ad.30.1716209529510; 
 Mon, 20 May 2024 05:52:09 -0700 (PDT)
Received: from localhost.localdomain ([51.52.155.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c139465sm202905145ad.269.2024.05.20.05.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:52:09 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com
Subject: [PATCH v2 1/2] target/riscv: Extend virtual irq csrs masks to be 64
 bit wide.
Date: Mon, 20 May 2024 13:51:56 +0100
Message-Id: <20240520125157.311503-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520125157.311503-1-rkanwal@rivosinc.com>
References: <20240520125157.311503-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

AIA extends the width of all IRQ CSRs to 64bit even
in 32bit systems by adding missing half CSRs.

This seems to be missed while adding support for
virtual IRQs. The whole logic seems to be correct
except the width of the masks.

Fixes: 1697837ed9 ("target/riscv: Add M-mode virtual interrupt and IRQ filtering support.")
Fixes: 40336d5b1d ("target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.")

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6b460ee0e8..152796ebc0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1200,18 +1200,18 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
  */
 
 /* Bit STIP can be an alias of mip.STIP that's why it's writable in mvip. */
-static const target_ulong mvip_writable_mask = MIP_SSIP | MIP_STIP | MIP_SEIP |
+static const uint64_t mvip_writable_mask = MIP_SSIP | MIP_STIP | MIP_SEIP |
                                     LOCAL_INTERRUPTS;
-static const target_ulong mvien_writable_mask = MIP_SSIP | MIP_SEIP |
+static const uint64_t mvien_writable_mask = MIP_SSIP | MIP_SEIP |
                                     LOCAL_INTERRUPTS;
 
-static const target_ulong sip_writable_mask = SIP_SSIP | LOCAL_INTERRUPTS;
-static const target_ulong hip_writable_mask = MIP_VSSIP;
-static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
+static const uint64_t sip_writable_mask = SIP_SSIP | LOCAL_INTERRUPTS;
+static const uint64_t hip_writable_mask = MIP_VSSIP;
+static const uint64_t hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
                                     MIP_VSEIP | LOCAL_INTERRUPTS;
-static const target_ulong hvien_writable_mask = LOCAL_INTERRUPTS;
+static const uint64_t hvien_writable_mask = LOCAL_INTERRUPTS;
 
-static const target_ulong vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
+static const uint64_t vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
 
 const bool valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = true,
-- 
2.34.1


