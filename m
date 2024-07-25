Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5802AC3DA7F
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 23:49:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sX8Am-0001cX-96; Thu, 25 Jul 2024 19:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sX8Ah-0001HX-DK
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 19:46:55 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sX8Af-0005QU-MU
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 19:46:55 -0400
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-396675b83afso5227895ab.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2024 16:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721951212; x=1722556012;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pr/AcYF8z8+IP/7vhXiuKTgBOUJ+TMutbX74doKlSC0=;
 b=ntDSUzG6MmYG6OUg8KNM7WlxM2nia6knEiqj1ulzgwa1+AX/28E5NX/jjfUFFHxDM+
 LCONJ/Ao44JhgcGkCakF4kEhynuGL6ChHJE/gf5WJhgduf66KDuoiT1QbTJUVwpO4ytJ
 tjToCrqnIKROnIFgMNn4gKdz8KtlJR1iSD0IQVOjZbKDasmb0n5vjlvDKGqTEV230Ftq
 2ATCaC8qZGOiBxGRttcXUVWlm5KHkMXexn2U/+jzbw4KT9Xdc4F4ZjpHNTkLIjTaWWNU
 INVpPoszi2d+rxX/KvfgKb9jrgTtqmgBLSQPp0wKzfB1GrPoj2YF1PCsnQAYMsT1+MaR
 wK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721951212; x=1722556012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pr/AcYF8z8+IP/7vhXiuKTgBOUJ+TMutbX74doKlSC0=;
 b=r70+DsMLxs1ihyrG6icC8BJ8yyOeW70wXX7F1jKrYKDG6iF+s8eGhV9KRkVeoo+i0V
 XCcigvMBl5pydKqYtoUebD164vnYkyuyQnpcaT00exn9E4D4gAO0cWZDpXEUC6Vjb84c
 yhIxDCr4x/77X9rXpfStkMWABHFFcXpdQjMcGGVVsjznqwTHxB8YGTClkUoGuso3WAp4
 rewGodmj8V64jdGsJ4W10mcjE7UzZFFm/pIESiVQdu+I9UPzYE2b96XNx7ojTHFAQeq4
 dLfgBS/0gA+JgJ/VScQklfSr4rQNPlRO2xfhrcB2xUmbmkbj0DGrupq6UIlsmoRDKnc0
 W/tg==
X-Gm-Message-State: AOJu0YzQ6W9hU54QUDHA0213KGRhtxd0d8GUhCxM+yreJ1b6GHSEKWWi
 awRqxyAHsJ2JuRX5cN/3E48SJKMU/45792CUxeJu3j5sjrygA2IszL1kqI3RSS6jR/NCUSxeRFr
 1
X-Google-Smtp-Source: AGHT+IGcdW1SVlYT8aaYuRJ2NT56u847S4tWBxqF8BhuvmVsaEhXUSDkqYTW7Bh4Yox8c5xv4purew==
X-Received: by 2002:a92:c562:0:b0:383:5520:cc48 with SMTP id
 e9e14a558f8ab-39a23aed069mr45058685ab.0.1721951212300; 
 Thu, 25 Jul 2024 16:46:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead8128d0sm1647565b3a.118.2024.07.25.16.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 16:46:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, jim.shu@sifive.com,
 andy.chiu@sifive.com, jesse.huang@sifive.com, kito.cheng@sifive.com
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 22/24] linux-user: permit RISC-V CFI dynamic entry in VDSO
Date: Thu, 25 Jul 2024 16:46:11 -0700
Message-ID: <20240725234614.3850142-23-debug@rivosinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725234614.3850142-1-debug@rivosinc.com>
References: <20240725234614.3850142-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=debug@rivosinc.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


