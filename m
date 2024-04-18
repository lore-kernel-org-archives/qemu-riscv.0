Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB99C04FF8
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:40:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxRz7-00051m-7q; Thu, 18 Apr 2024 09:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1rxRz5-00050t-L7
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 09:39:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1rxRz2-000254-Rd
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 09:39:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343d32aba7eso174271f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713447563; x=1714052363;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjHQJQZNZICF88PlAwO3VUB5/lIfOhrUFroeeBB9BBQ=;
 b=GKDe6AB7VJxpaYpHNF+VNL3pP5KfQ2ARMJPb3gDqPcuLszJGirHWZODV1M2Q6suowQ
 rUZ3TWbvJoDUY8kHs426C4G8LJ7CdTSyqG0H7IQc5QCjyOgSp+iBPQonAjHJHuLHGUnc
 QOByURWFSqpOCZ5vEEk2A9W1BcEdus51YRyxUFdE4CrT2wmsgVQTWslYhZnEsvHxNJji
 piOtBHmbswrwja9N/NFj/kbFwCgrAnY+GZezQY7UWTiW/z7n0+8tD6bqoH3o670KkA8F
 HzwU58diR4FolbqPlPE6jUbVF0VM0RAFAqqt6bwqbC1RcCE0JaMsZwVDzWqWl58jnnu4
 7PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713447563; x=1714052363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WjHQJQZNZICF88PlAwO3VUB5/lIfOhrUFroeeBB9BBQ=;
 b=wVpLhXuC5+sdPyYbVMbeHWU45RtdlFRLfd37FEXk6+DdowG76JdCPP5BebMBg2j6EW
 7XmGif4Uh9eu25cao0J+nk+xtZouU/y4onscKGb0a1esENz6hfJ3sDMgQDlhNOt5/v1H
 kDSEKF7oK3Ipne8kebhllzK1+WlaK5vXh0zURw6+JNI0cetw2gYVOjzpMNFnKfDec+Ed
 64krxftlRz9m5K+Ykf3kGPxLFIs30P8NH4Dv/v/FUEW1aCs4WM/03ZbxMYi2ddZt19iC
 NZJrLOgPJCWBqmn88h4A75SK+OvCWj++uipysPgiQdtK1tgemeC76qEn3W8Kcige7GQE
 QOqg==
X-Gm-Message-State: AOJu0Yy7Mcg9Xva7nDObv5FagqsoJY44I42N9M2oJpSAAQskt+ZRWTy3
 uI7FXCGR31HZOpEoBUBk5FZgikzcOQguIEEJMVNCcY24s8t8+3e7EvzAH0E4dxlOgc9sCk71VIJ
 dxX0=
X-Google-Smtp-Source: AGHT+IFMasossRnBNIpG7q9He62WzWqQA+ovDN9S+Rmn63CTuQuCjAVP3ID6znvNQfztRaVWtPFGjQ==
X-Received: by 2002:a05:600c:474b:b0:416:ac21:9666 with SMTP id
 w11-20020a05600c474b00b00416ac219666mr1963016wmo.4.1713447563084; 
 Thu, 18 Apr 2024 06:39:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a05600c1f8c00b004183edc31adsm6554015wmb.44.2024.04.18.06.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 06:39:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] target/riscv: change RISCV_EXCP_SEMIHOST exception
 number
Date: Thu, 18 Apr 2024 15:39:13 +0200
Message-ID: <20240418133916.1442471-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418133916.1442471-1-cleger@rivosinc.com>
References: <20240418133916.1442471-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x430.google.com
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

The double trap specification defines the double trap exception number
to be 16 which is actually used by the internal semihosting one. Change
it to some other value.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu_bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fc2068ee4d..9ade72ff31 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -670,7 +670,7 @@ typedef enum RISCVException {
     RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
     RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
     RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
-    RISCV_EXCP_SEMIHOST = 0x10,
+    RISCV_EXCP_SEMIHOST = 0x11,
     RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
     RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
     RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
-- 
2.43.0


