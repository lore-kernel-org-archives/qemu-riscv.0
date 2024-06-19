Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F1C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:27:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJxDg-0005Tk-Um; Wed, 19 Jun 2024 11:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1sJxDf-0005TC-OF
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 11:27:31 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1sJxDd-0005sK-7B
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 11:27:31 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1f44b441b08so50044655ad.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718810847; x=1719415647;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4zo0azd7SK8aXAoyhVwEVAffGLv7WzISIu4DpYYYJc=;
 b=nSvPiH+b3hmuX9+/oxeRW1ImI832kVOEX6JiEx7bXR2eQ+fjo6cNCJOtgKWpd3Pv5Z
 CgpX/FnnPo6hX4MQyaq0EOPVLlLRyklhwf5wV/0C+m+i907n2NVqp26XWA6HEzaivPtW
 kw1AnfLkf4z+Bn1ioJ8+yf66k2ehhhbVMhm6q0YgAfKWUkt1Mt+2I79phXbz/JhwAjZq
 1pOOgz/49zFUT90u6vxs96FL1EE2zmqfHCAEliI3p4DKWHb51ls5/qCkRfICYelw2g0B
 qIV2jvWNZySCOz/xdTCyTKCcxXRBC1/Tw93KMXcnjPh2UZVGJwXWdYz6eht+D/T9yvqp
 OfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718810847; x=1719415647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4zo0azd7SK8aXAoyhVwEVAffGLv7WzISIu4DpYYYJc=;
 b=oDNi3ZGwk+AKf7K+JJczo5EvBzOnDL7YMiN/EhwAAZjNxfl5C0HhvieHmJDi3PYUY0
 A0VhbtYW3jhhf7O0PXiRj3XjPt79KjWJ5k1n2ZdzHnIuKLWncqhVqy9AUYZpo4v/CrYd
 8RN33rQTAklXfwWiZtNIKosOi6KBoF1NcX7dAd/RU6NJ1+c3g/dwvmSXVFGpVoMue7aw
 HWRUlaTe4gIj5C6d8J8aHavY3RFLs7Y7/dkBbTy3o9aKD9T+Zvp+Q5rcIszhsDr2tDRE
 fXZ6AcSRFEa2ipVP2VZPHB7HqhS8jb5R7yxT3TfXQUJg4nEnbd0GByWej2wpecfQWFtJ
 3GtQ==
X-Gm-Message-State: AOJu0Yx2AH89ziyWy3g87fbAlbSSzu2CPE7mjbddy9esOChXezm/tG6A
 fGm1LL2qxbhP6vdpAHzq1IY+cJG0jr+/NZqkN8FAB8dmF6vPGdm/DK7RaPgqb3v88Prg5E+lo5w
 G
X-Google-Smtp-Source: AGHT+IEZQOkdI2PN9LU84rPRsO0RJbo3IC2PuPyboU+kGe5q26RicDSZ8MVGMVGK3yH7bjSGIWVFSA==
X-Received: by 2002:a17:902:c412:b0:1f2:f090:b2c1 with SMTP id
 d9443c01a7336-1f9aa3ecd30mr30343325ad.14.1718810846636; 
 Wed, 19 Jun 2024 08:27:26 -0700 (PDT)
Received: from localhost.localdomain ([51.52.155.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9afada50dsm15956865ad.166.2024.06.19.08.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:27:26 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, rkanwal@rivosinc.com,
 beeman@rivosinc.com, tech-control-transfer-records@lists.riscv.org,
 jason.chien@sifive.com
Subject: [PATCH v2 1/6] target/riscv: Remove obsolete sfence.vm instruction
Date: Wed, 19 Jun 2024 16:27:03 +0100
Message-Id: <20240619152708.135991-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619152708.135991-1-rkanwal@rivosinc.com>
References: <20240619152708.135991-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode                     | 1 -
 target/riscv/insn_trans/trans_privileged.c.inc | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f22df04cfd..9cb1a1b4ec 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -112,7 +112,6 @@ sret        0001000    00010 00000 000 00000 1110011
 mret        0011000    00010 00000 000 00000 1110011
 wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
-sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index bc5263a4e0..4eccdddeaa 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -127,8 +127,3 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 #endif
     return false;
 }
-
-static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
-{
-    return false;
-}
-- 
2.34.1


