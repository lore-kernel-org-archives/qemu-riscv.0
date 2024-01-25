Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6872C48286
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 19:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rT5nJ-0004hd-Tz; Thu, 25 Jan 2024 14:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rT5nG-0004gO-PO
 for qemu-riscv@nongnu.org; Thu, 25 Jan 2024 14:53:46 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rT5nF-0001bb-6T
 for qemu-riscv@nongnu.org; Thu, 25 Jan 2024 14:53:46 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5cec32dedf3so3955345a12.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jan 2024 11:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706212424; x=1706817224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XskUeql9uVyd/MNKiXou2+W/uTtdrDCIW2uzgKAjUxY=;
 b=Y8lWmgIjNnrCupnBW7ml3WJ4PWuf8pcV7Cdp3Ojq7sPc7GJLOrkLTXkbcp6RMkufku
 TSmHW3vliAyuPSyf7FN8EzOduCmRuhqFIEdjB4CkUZCfoQmPaOX2lgZwXy1Pzf58wyKn
 QK5/pz10cx4w7swvHReGd267bFViDCE5P/9RLM/0+lD9mo+x0b0Tzu5hHMTYKo4F/Sk0
 pOdO+WflroNcvHbVWLYI3/99MQjtZLMllmJnRJkamhsYQyKYSjMbghrtikFs/Fx3PLh7
 ymfPI+8a4jcLzzEIJyHYuV5QEbsBTwwi6gFqrXU+oquzHG6GKLxNDs9SyTEJERvLqWla
 1RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706212424; x=1706817224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XskUeql9uVyd/MNKiXou2+W/uTtdrDCIW2uzgKAjUxY=;
 b=kVNfel40gKyyXev+g8CWaDMFMWDlZiI5bnRkXqkJmBa/79X2K0BTSq2G43MEVYpA0v
 oXh6Cr5S6KHIEKEOPkBNNxFsY/8QOzBxa33r9Ht8bRqt97YymB0pHYLUuY81eoEdZtA0
 TzrYYXPY/SF2nZ1POFtvCMaNOvPR2hqUNnWgqTvIeDv+a7rw7A+N1/J/SefDamgye4ra
 NDrfDZ+tejPQ5jNnbpyCl1e7C9ThIas/IUVjlDhHtD1irpExfcAu8oaJ3aL+dpYOPKuR
 wGOCo0Fg3mkwdKeX2XSTi4r2QMGZOWbs3bDg/RtTrLeX6T58lEMb6ohMO1bce765uqEk
 zU1g==
X-Gm-Message-State: AOJu0YyBGakttYyhSkAVv208VvsDvEzMtlnh6522cCQQ4E7A2b4bvxlm
 VSFored/UgCSXEVkwt7ZZ7NdtkyZSh/AorsnZC1w3JsdIppj1wD9pDCHZlc0GKk=
X-Google-Smtp-Source: AGHT+IEZNcE20xtE8XlkLRtot80FQblCg/zfVaVxf576W/aLdHVmo6pIZaDD5mQm5CTqLM6Q49U/iQ==
X-Received: by 2002:a17:90a:5785:b0:28c:fb86:23ce with SMTP id
 g5-20020a17090a578500b0028cfb8623cemr125892pji.44.1706212424015; 
 Thu, 25 Jan 2024 11:53:44 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a17090ad40700b0028b6759d8c1sm1958613pju.29.2024.01.25.11.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 11:53:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 6/6] target/riscv: Promote svade to a normal extension
Date: Thu, 25 Jan 2024 16:53:19 -0300
Message-ID: <20240125195319.329181-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125195319.329181-1-dbarboza@ventanamicro.com>
References: <20240125195319.329181-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x530.google.com
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

From: Andrew Jones <ajones@ventanamicro.com>

Named features are extensions which don't make sense for users to
control and are therefore not exposed on the command line. However,
svade is an extension which makes sense for users to control, so treat
it like a "normal" extension. The default is false, since QEMU has
always implemented hardware A/D PTE bit updating, so users must opt into
svade (or get it from a CPU type which enables it by default).

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a56c2ff91d..4ddde25412 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1421,6 +1421,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
+    MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
@@ -1528,7 +1529,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
  * and priv_ver like regular extensions.
  */
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
-    MULTI_EXT_CFG_BOOL("svade", ext_svade, true),
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
 
     /*
@@ -2175,8 +2175,6 @@ static RISCVCPUProfile RVA22U64 = {
  * Other named features that we already implement: Sstvecd, Sstvala,
  * Sscounterenw
  *
- * Named features that we need to enable: svade
- *
  * The remaining features/extensions comes from RVA22U64.
  */
 static RISCVCPUProfile RVA22S64 = {
@@ -2188,11 +2186,11 @@ static RISCVCPUProfile RVA22S64 = {
     .ext_offsets = {
         /* rva22s64 exts */
         CPU_CFG_OFFSET(ext_zifencei), CPU_CFG_OFFSET(ext_svpbmt),
-        CPU_CFG_OFFSET(ext_svinval),
+        CPU_CFG_OFFSET(ext_svinval), CPU_CFG_OFFSET(ext_svade),
 
         /* rva22s64 named features */
         CPU_CFG_OFFSET(ext_sstvecd), CPU_CFG_OFFSET(ext_sstvala),
-        CPU_CFG_OFFSET(ext_sscounterenw), CPU_CFG_OFFSET(ext_svade),
+        CPU_CFG_OFFSET(ext_sscounterenw),
 
         RISCV_PROFILE_EXT_LIST_END
     }
-- 
2.43.0


