Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE38CAC5B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 13:02:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3DVn-0002YS-7r; Mon, 29 Sep 2025 09:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valentin.haudiquet@canonical.com>)
 id 1v3CV1-0002cj-9X
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 07:57:00 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valentin.haudiquet@canonical.com>)
 id 1v3CUo-0000g8-Gb
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 07:56:58 -0400
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B68E3F475
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1759146994;
 bh=SFghgQGJatviRfZ9+87Gkonq1exr2NEeNKOXqr4eExA=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=mBkEqFeUuNp3UM+CiOxwTl0bNfz5ltAZTBKvYxn0Zf4C7lfGed+v2uh58xAF5oQiR
 8T9cmmiXPitw3ArDg9miRfNhwrlH9C/u60dlrtWFNttoIE81T7ch+ofYwiDKnAcO30
 58A8niQuYD7mA2+zrvO3uBhL4VQktJprHubNvDXeBu7yDvsVe+Fl7oEseTlutp2rzV
 HFAlSZoMuJAADS/D7/5osC/OjH1I3GyRA0Bv9GpbYAwSOtAh/KtMBGTv71GtvoiUXT
 i1KhG3xVseOIGzk1ivTI/pV6/oUUMFySCTt7dctaVfBU96Hg9fScCCGsJSi9DhkJte
 PAFGGVkKfFDzg==
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3307af9b595so4153819a91.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 04:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759146992; x=1759751792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFghgQGJatviRfZ9+87Gkonq1exr2NEeNKOXqr4eExA=;
 b=Md7sps6grdJ+YD96NUujFSspv7zoqo/SM8nQTmfFZpXhwVr/8B2Lp7/4rwb5VgZfOx
 +QJq1LuGiQedxAIVbFKlywS1+ENenBdzF+bMmKo6lNbWYJVp+1KoP/Frws8Cb74QK8Ym
 NjFny8jSg6xrbuXLQU74uJ2OJEHuRAi9PrkJ4Zh/Lcqazu/AQbXwYc8IjVJwq4NesJxo
 HvSjiB5qW+NPILDrwhubqnoIvI7q/fx4Y76Gp22c6muSP8ZEdeBNExdf5akUAokNyMFH
 LcR8MoZIiNVArRAHslLOT/sJqNwh9YHypn0MuHZJiYZap4MjxDpcIbtErlWDbNi+u9B3
 NjFQ==
X-Gm-Message-State: AOJu0YzXU2JrDFer666JWnEA4YKueWuF2QS4u16Pn8PasSN6+V+zRRKh
 Vh0r/7bOjrzvlmHD9iTWp1dwHEplICLmHO5krfKtNc6iTlpI/hHKYqWiQZC0g0z+5ZzFDYfCWAs
 5cuQ6J+mrCY97U5oDEgDdvqwNTFCi72hsTODPZPy24fkhyj/VWb9LhTKl8Z/6TjWHUdf6/I24kY
 bqRZ+8IbE=
X-Gm-Gg: ASbGncvrQvAepQfHn4B6Hf2FY175WFplqbC5Ei+AQmi/PyNLzBL2eW27rlSKXkWXBHV
 YF9pTLgkbGmGfBEvsx6bHznTcYEHCWWff6vLlu80SSpv19OXGwN8VFfm4KGWEcB9Q/Pz7QV2buD
 5EPeBUvPLnIg/51a2zf1piTSg/mckG2tusbmQ6zXt+tk2PUeWmMFfcE1Tep8N2bD87RnWqanVes
 4i/dLNY8zHq8LjRkwmuSGb6rBup4Z3cq34pirr21v3thTJPfA0GiPndYbsYi6NvjZuuiC/ADBDN
 iQXJ8eqsIDRMCQa98JgZLUTGg9jr4WAqUYsbDX78L26ErOZdcoopY8CBVDQExaTyCBcnOYSjBsQ
 mwXjeFQChucd1nGQGjp+kCw==
X-Received: by 2002:a17:90b:38cb:b0:32b:ca6f:1245 with SMTP id
 98e67ed59e1d1-3342a2437ffmr16621736a91.5.1759146992384; 
 Mon, 29 Sep 2025 04:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFASDBh8G2c1FURRDxpcfFNRhozl7nqUuj2qICqIVNqXX5nmMxG/DEOjlkpOfcYc3xFqA66xA==
X-Received: by 2002:a17:90b:38cb:b0:32b:ca6f:1245 with SMTP id
 98e67ed59e1d1-3342a2437ffmr16621717a91.5.1759146992037; 
 Mon, 29 Sep 2025 04:56:32 -0700 (PDT)
Received: from k6.lan (atoulon-257-1-167-49.w83-113.abo.wanadoo.fr.
 [83.113.30.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-338387256cdsm1042425a91.20.2025.09.29.04.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 04:56:31 -0700 (PDT)
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 liwei1518@gmail.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 vhaudiquet <vhaudiquet343@hotmail.fr>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: [PATCH] target/riscv: Fix endianness swap on compressed instructions
Date: Mon, 29 Sep 2025 13:55:43 +0200
Message-ID: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=valentin.haudiquet@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Sep 2025 09:01:47 -0400
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

From: vhaudiquet <vhaudiquet343@hotmail.fr>

Three instructions were not using the endianness swap flag, which resulted in a bug on big-endian architectures.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828

Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
---
 target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index c77c2b927b..dd15af0f54 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
 static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
 {
     REQUIRE_ZCB(ctx);
-    return gen_load(ctx, a, MO_UW);
+    return gen_load(ctx, a, MO_TEUW);
 }
 
 static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
 {
     REQUIRE_ZCB(ctx);
-    return gen_load(ctx, a, MO_SW);
+    return gen_load(ctx, a, MO_TESW);
 }
 
 static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
@@ -106,7 +106,7 @@ static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
 static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
 {
     REQUIRE_ZCB(ctx);
-    return gen_store(ctx, a, MO_UW);
+    return gen_store(ctx, a, MO_TEUW);
 }
 
 #define X_S0    8
-- 
2.51.0


