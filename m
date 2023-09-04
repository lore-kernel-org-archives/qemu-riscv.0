Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D99C71153
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 16:29:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdCS2-0003MB-MC; Mon, 04 Sep 2023 12:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qdCJI-0005Z8-68; Mon, 04 Sep 2023 12:20:22 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vivahavey@gmail.com>)
 id 1qdCJD-0000lo-BR; Mon, 04 Sep 2023 12:20:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bee82fad0fso8926635ad.2; 
 Mon, 04 Sep 2023 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693844412; x=1694449212; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Q80VNS5mMLiY+2ZB4hkhFDuko3FgyE8q1ZevVSDvMU=;
 b=SvNu6+PCJG+RiWhrkbdmQ6ZWHhOsy2lHk2IBmYka5+CP3HLkbBZu45i4VScZbcTLn4
 SsCx/Fr+stcBuWrDfCn3pPzEbYdUEvbzklDNoLuOwUQyL0mUS3vFErHChG92OxGJu6uo
 ioji5edEb5fj+aAnFw2lWbeRlTG+ncgETPgSd+nUG8HBMxA2DgpH8omEtNzXxhrHkKkE
 9o9e+E8ZiJ9TXdq9xkkQshTAUzkRCQ6EVCRzpR96zptfY549lRILLqqzkode7J+7iJ9s
 95qWsQ5i/Z8HGzRMsO2kGNZSM75hTOqgJtNZ/nh4LpE1vM4NkRjyURyJia+D87cc0zXz
 ncEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844412; x=1694449212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Q80VNS5mMLiY+2ZB4hkhFDuko3FgyE8q1ZevVSDvMU=;
 b=ZJjYfNGE11bvw3ep0yLPcIX/udbi1eVdqbJpagPoDljeQFq/zZ3sGOa1uXDW5X2yM9
 4izVRfnI6KV+uprMXbcKHaTh2ELg0AK6S3CNfOBiT6oVmt0xQvOecbZLd+FKdZLfCSlR
 52VJ7HIpoV6ahDzKZqgS75fLUd9SuheTr76bdkn3uXoBtkamltBbO1WTDzDbOuDRPjQ9
 j1xs/y6rqZYFAcIiO8UaKj++EJjia9+dG2OE8RNxoc3EntXLbhsrx88EPAlfLvtpudou
 cDIlv14ILYvtgtjhJz42ze/eIXq0k9K2DjBfDwtADbBk0bW8hADBbz8BzoQ/jNIeOF/U
 PuHw==
X-Gm-Message-State: AOJu0YyUpWeNGQWRHLoDlJOnaeDSnSvfkx2nUfZ715+SHQ00rTxhBDvi
 Cm361i1AuzGvRfiqovp6ePIDTzlU/Jf9e6Rh
X-Google-Smtp-Source: AGHT+IHP6JSgsfOHYEBohgn2sEQ257KS5+SQZBfYZGxFpqt/YMbkyvFrZzU85LkvIx29bGsnWvZwEg==
X-Received: by 2002:a17:902:cec5:b0:1b7:e49f:1d with SMTP id
 d5-20020a170902cec500b001b7e49f001dmr10121261plg.62.1693844412344; 
 Mon, 04 Sep 2023 09:20:12 -0700 (PDT)
Received: from localhost.localdomain (36-226-199-198.dynamic-ip.hinet.net.
 [36.226.199.198]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170903244600b001b03f208323sm7735361pls.64.2023.09.04.09.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 09:20:12 -0700 (PDT)
From: Alvin Chang <vivahavey@gmail.com>
X-Google-Original-From: Alvin Chang <alvinga@andestech.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com,
	Alvin Chang <alvinga@andestech.com>
Subject: [PATCH] target/riscv: update checks on writing pmpcfg for ePMP to
 version 1.0
Date: Tue,  5 Sep 2023 00:19:59 +0800
Message-Id: <20230904161959.1766-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=vivahavey@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:29:18 -0400
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

Current checks on writing pmpcfg for ePMP follows ePMP version 0.9.1.
However, ePMP specification has already been ratified, and there are
some differences between version 0.9.1 and 1.0. In this commit we update
the checks of writing pmpcfg to follow ePMP version 1.0.

When mseccfg.MML is set, the constraints to modify PMP rules are:
1. Locked rules cannot be removed or modified until a PMP reset, unless
   mseccfg.RLB is set.
2. From Smepmp specification version 1.0, chapter 2 section 4b:
   Adding a rule with executable privileges that either is M-mode-only
   or a locked Shared-Region is not possible and such pmpcfg writes are
   ignored, leaving pmpcfg unchanged.

The commit transfers the value of pmpcfg into the index of the ePMP
truth table, and checks the rules by aforementioned specification
changes.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 target/riscv/pmp.c | 51 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index a08cd95658..c036ca3e70 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -99,16 +99,49 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
                 locked = false;
             }
 
-            /* mseccfg.MML is set */
-            if (MSECCFG_MML_ISSET(env)) {
-                /* not adding execute bit */
-                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
-                    locked = false;
-                }
-                /* shared region and not adding X bit */
-                if ((val & PMP_LOCK) != PMP_LOCK &&
-                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
+            /*
+             * mseccfg.MML is set. Locked rules cannot be removed or modified
+             * until a PMP reset. Besides, from Smepmp specification version 1.0
+             * , chapter 2 section 4b says:
+             * Adding a rule with executable privileges that either is
+             * M-mode-only or a locked Shared-Region is not possible and such
+             * pmpcfg writes are ignored, leaving pmpcfg unchanged.
+             */
+            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
+                /*
+                 * Convert the PMP permissions to match the truth table in the
+                 * ePMP spec.
+                 */
+                const uint8_t epmp_operation =
+                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2) |
+                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
+
+                switch (epmp_operation) {
+                /* pmpcfg.L = 0. Neither M-mode-only nor locked Shared-Region */
+                case 0:
+                case 1:
+                case 2:
+                case 3:
+                case 4:
+                case 5:
+                case 6:
+                case 7:
+                /* pmpcfg.L = 1 and pmpcfg.X = 0 (but case 10 is not allowed) */
+                case 8:
+                case 12:
+                case 14:
+                /* pmpcfg.LRWX = 1111 */
+                case 15:  /* Read-only locked Shared-Region on all modes */
                     locked = false;
+                    break;
+                /* Other rules which add new code regions are not allowed */
+                case 9:
+                case 10:  /* Execute-only locked Shared-Region on all modes */
+                case 11:
+                case 13:
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
             }
         } else {
-- 
2.34.1


