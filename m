Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC2C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:41:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNRy-0005tS-0r; Mon, 27 Jan 2025 06:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRr-0005q2-8V
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRp-0005At-90
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso46111345e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977911; x=1738582711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+P4muHO2/Kjut6DQxBAs5VxofoUUFgPuTxOuR706kfs=;
 b=HE4ChrrW92g4g4APx2TtzUmoai3+KElocaEWRvUhgHSv34AU2p3jmImS1AZ8Bi9UzL
 Y/EyINX2xzf5x5p538Y+wNABNlHQfrvAxCpv+Z0fHUMnfLKeUaZafY2t3sLUzHdRmWLy
 ltQbvINmXs5M/3bXumTMV9kqp5WJlLkeDg4xWuTA+IaBe4XVE0Ia5SDwVQBatLFa8CkK
 tYHYnvF9MsAKVWE1hFiRvKS6eSFIrVED3Hvk5CteHN/Jck3/r+j2ad5J7PBLCm23UCD6
 Y3V2ftp9DUwcLFkGTVwIG0x+0Juy9/TpUDTtyd0hlkC+0cltmK3QJ0XE+ReSq/gDxWcX
 BKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977911; x=1738582711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+P4muHO2/Kjut6DQxBAs5VxofoUUFgPuTxOuR706kfs=;
 b=meENj8/LzltD92BBNusTL8oF2JjBeTmplXpwVg4yhukgC0jzXP259akLXSr14MMttZ
 T0SkxZi3AI7eYeFzTZaCq8HV6zrXfw5mzU8NGeyWK2mw2le5whfhHxgcyr7xhoKRqqpZ
 7VM1HYqBHOQmEHak5nive8NlgMkSVkC+nA3vlZ4olSmTdaYqrRwBWApW26PPU2VKBrx9
 sm7somwIy2ggHC49/VfidXjPz17GTaoTMMOwi3DRecXO+J9towCiCVARp95nzPp7SNRk
 mG2ZjvS7+tOTNhJAQdfWOLID9aNQQkk9wEuHkpnNjQuUuTE8VV0skYYU66FgoXTi1bY0
 t52g==
X-Gm-Message-State: AOJu0YzXi4aGrn1Fh85Qt2Hpc2tMV7ML9KmDjcRjmz2t2V59KbLWtjkx
 KRjhPRRyHiPwMaOQJuf1MzhsIEcxORHZRXLD6MlDc/2jAfSas1ERaJ+gb8DttiU=
X-Gm-Gg: ASbGncuY99GfFxpG7+wiU9R3q+LWwtHNTGCZipTUvpHAjl4Rw9K8w4+2JMsrrE2Yzhq
 ZLtAvpelxCLArGufJRO6zBBDfsqA2syfI2tXSrXbvKYJq5dlBCHBEi/Mwv8dvynLk47uRIbZsZx
 eYUg3OUwE9iUYPy+6gkqJIWk9Dsumkz2/cIsqkbzb5x4S6RlEa7OrKBWVCw2hrzXKPJgDKGKd+f
 IYPXBe1n8sgFnMV6x0JuAdvBKqb3QLe23gk/38f6w20JkYfwTcYPp91T07IWEzZ1ozKExhPYVQ8
 y7SA9I0qL+vHpYzwdf0ISwh3fh6kltn+0hOn8Ih+yScvQ/GCFHm1ZTI=
X-Google-Smtp-Source: AGHT+IFMabTEygkDgDAxNo71GBhcflnfQBvRle4xq7KePigqZWdlmTWom8ZKJrQMh9uySXLq+Qh4vQ==
X-Received: by 2002:a05:6000:4022:b0:38b:dbeb:63a2 with SMTP id
 ffacd0b85a97d-38bf57d2dc0mr34279427f8f.55.1737977911246; 
 Mon, 27 Jan 2025 03:38:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb040sm10899923f8f.67.2025.01.27.03.38.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/6] hw/avr/boot: Replace load_elf_ram_sym() -> load_elf_as()
Date: Mon, 27 Jan 2025 12:38:19 +0100
Message-ID: <20250127113824.50177-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

load_elf_ram_sym() with load_rom=true, sym_cb=NULL is
equivalent to load_elf_as(). Replace by the latter to
simplify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/avr/boot.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index 617f3a144c8..6a91dcd12d0 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -71,11 +71,9 @@ bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
         return false;
     }
 
-    bytes_loaded = load_elf_ram_sym(filename,
-                                    NULL, NULL, NULL,
-                                    &entry, NULL, NULL,
-                                    &e_flags, 0, EM_AVR, 0, 0,
-                                    NULL, true, NULL);
+    bytes_loaded = load_elf_as(filename, NULL, NULL, NULL,
+                               &entry, NULL, NULL,
+                               &e_flags, 0, EM_AVR, 0, 0, NULL);
     if (bytes_loaded >= 0) {
         /* If ELF file is provided, determine CPU type reading ELF e_flags. */
         const char *elf_cpu = avr_elf_e_flags_to_cpu_type(e_flags);
-- 
2.47.1


