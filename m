Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71446C52D7B
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:09:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbUEk-0002qT-2n; Tue, 06 Aug 2024 20:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbUD5-00034f-1n
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 20:07:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbUD2-0001EG-Q5
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 20:07:22 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1fc5296e214so11807345ad.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Aug 2024 17:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722989239; x=1723594039;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pr/AcYF8z8+IP/7vhXiuKTgBOUJ+TMutbX74doKlSC0=;
 b=t8povXNxxyG6vQSKCoJtOFi3H6AjZOFSPfO7AG1zdSCdDDzfEgYd6OXcaxKCEQYCKx
 XlSd1GGt+J35GvsiY9uPlOU1b6a2GcVqKxZ1bDH5WvzurPmgUws6CJSFxr3tooFLUDtQ
 StAjJgaXxSGRJzNys8fVFQX3LlwPjFyopg5devztQbVw1iVsjtNeKNRSTz4gX+CwXJ+X
 lzzVUAqK1edKeDunM2aG7Izt8oSAfoRZ2IbZGJ+3Cn2EWG4/xnxx/pojUYbZ/XjrHmcW
 oKdVqeNgRkcuKumrbkb9ENaSobyKN5MS3yJcoS32+O9fz93qIayaSARCVjV/ri33GnLX
 //+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722989239; x=1723594039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pr/AcYF8z8+IP/7vhXiuKTgBOUJ+TMutbX74doKlSC0=;
 b=R7yWkhWsMFIcoF7w4tjU2VSpyHnU+qNBUZ7EMVZo7HO9xN57dCAnaLrGgTtvBydlZR
 Z+EwkfyjBg+Y72kLhAxBUYtypbJVwTSc3KDa2G9M0AF+1qqCg5dFK2VQIzcOSYh/+Zia
 zQNfxvsCzE5bfCmhpJ5TW3KzLZWLvvLNkPYVeFKNTcFNVm5WpsjLDVv9xqsPCtoLHK5O
 MASRBt+Gx+lfdMJLnQXF0/vQCzT2Y0639scFxq5fE95gEkgUiW7GZy38UdXiEB0hF1P9
 SMNObgvtGe8mYaLCCCkoo3pd75WcQ3x5WK63omMZw8Ykdeurzc5Za/nUZXpB+tcfu/9q
 xZpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPu6HZ5voorF2E07JO7etopKiaD3IrwQk6yput2Mi5TfxdQRali3F4XH99TXGz5rLLerlOPIuoHxqDIPz89HlSPk7pgvA=
X-Gm-Message-State: AOJu0YwiyfN47qEOag6ZywloISfvPuHrSU8pXIniszeShbWCe5U8y/JL
 Hyr1Q3vKD3no2NlH/8gOLpOL0IdHA3EJ8dlGUiK08e1U/k+5eRVTlyINoQAtTCY=
X-Google-Smtp-Source: AGHT+IES4JmpKsv7CeOiHWvTuaxsHYcYBmghN5pV14p1GedE4xwVJyXxHdpYjgalAn5YzxoVKD6PwA==
X-Received: by 2002:a17:902:d4c3:b0:1fb:1497:c304 with SMTP id
 d9443c01a7336-1ff5710bf56mr262446935ad.0.1722989239403; 
 Tue, 06 Aug 2024 17:07:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f59cc2sm93381845ad.92.2024.08.06.17.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 17:07:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, laurent@vivier.eu, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 19/20] linux-user: permit RISC-V CFI dynamic entry in VDSO
Date: Tue,  6 Aug 2024 17:06:50 -0700
Message-ID: <20240807000652.1417776-20-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240807000652.1417776-1-debug@rivosinc.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x634.google.com
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

RISC-V CFI use new processor-specific dynamic entry in ELF. Permit it in
VDSO post-processing script.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 linux-user/gen-vdso-elfn.c.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux-user/gen-vdso-elfn.c.inc b/linux-user/gen-vdso-elfn.c.inc
index 95856eb839..59c818eb11 100644
--- a/linux-user/gen-vdso-elfn.c.inc
+++ b/linux-user/gen-vdso-elfn.c.inc
@@ -273,6 +273,13 @@ static void elfN(process)(FILE *outf, void *buf, bool need_bswap)
                 errors++;
                 break;
 
+            case PT_LOPROC + 2:
+                /* RISCV_ZICFILP_PLT: for RISC-V zicfilp extension */
+                if (ehdr->e_machine == EM_RISCV) {
+                    break;
+                }
+                goto do_default;
+
             case PT_LOPROC + 3:
                 if (ehdr->e_machine == EM_PPC64) {
                     break;  /* DT_PPC64_OPT: integer bitmask */
-- 
2.44.0


