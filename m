Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89200C624DE
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 08:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2Ph2-0005JX-4J; Fri, 04 Sep 2026 04:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2Ph0-0005Ig-Iv
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 04:54:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2Pgz-0007Xc-1I
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 04:54:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so608626a91.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788512075; x=1789116875; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cKiuKxyyWJSuIyXVWzlv/wqmaebtjtdx2ZKx6moBL3s=;
 b=ay7J7zsul7AsmlPxQdsVzu1APh6D9VjhIEaFflUcbDKuR4Svmk4X4UqYxnO37EfBNS
 vIrsYwh7OR3QRjYSpauEygCvYGCWguIxvOI/BGWdQ3SOAD0Sxda8BUOIg/hDXdCk2coC
 gqpc7XOG3VDRhdOcn2yRHYhLyIPfnL3ZoAMBPxaOKlu+lbcYKH22u3GR4oL3FY2BuMzr
 W7qZKOlAuAhcXs1O4EthULMWys1PFAihmQBxFQKrp1TMQThsfUYvhXiY18LGJaH0wWpp
 tJ8RfEzvr7FzSQU02YXUug/46tvIUqg3+C97p/x/l8lEcDiftcpBuQNuH9P6YLoo5c/X
 iHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788512075; x=1789116875;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cKiuKxyyWJSuIyXVWzlv/wqmaebtjtdx2ZKx6moBL3s=;
 b=GQncQDXfQKfptqfdhp88lITkT4UYvlE3/lgHqmJVFmqd8S/Jm2xG2pSVIAvwmHhv0t
 gag7iysCSTkpD9ujIt+jAWkTLvfxSDwqtQeAPWt5l+O5GQe565pm1pcm+95oRl6/Hhk8
 4qwgxp0QpgMJHsbkw2ilOwRoaFNs84hTEDCMaa0i8Wg9RMJMd5bVnU2/n7ZfDM+TGOCM
 2zBsvMH+NoAjv75iMZGdH8mS+/vBJMnAI33XM57KQVSWylRmQl9NS42EH+kiTFa4IWMJ
 R30QeoLw6jAe2dPY1zTv6c46YAZGy4Tr3UjIm4zwwBKFyASUw0Kn5b1rBoZrKbceoaF3
 vwfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwJOyI3FU8qA6IqqXhIm7nRcrqe8ae7/r69Hab/NNZxUGMd08dBSaBA8sdA/1OE0ahJokHsWvAxHlrC@nongnu.org
X-Gm-Message-State: AFuF++lL7EYfVNh1ZhaqT0wB90E4kLwgtQB95K+WDO0hQQY0GVhXHEqA
 dRPgvJDuTeZkoHlnbZKdEW+x+lI+c2oOMp568raTr7jedjMh41+32e/iLp/Q529veWM=
X-Gm-Gg: AYBFou01urohBH9slqGsyibhZIYt+AqtAUB7kcatz01Z2ShMpFsGWnL3FNtz5uDocmm
 7BrP1NsAJymZSquJAIppLEsLOp7yHMhJRJGWYYteUjvXrdiYPl5CJ3/92bK3K1qb7P1i8VC81dU
 T0T/bOtvoWSrCYAuaaB1q6J6QHi/gd7PaOpHCe7yaRkgwN9zLA3nFUrQANtwLj71sw/zUty5pcK
 cHd7rFsjrofHTfhOuN40REyKEBhCWUFTQ0rKI691xKTx7m9eARTYm5DvNddy77S3Xh6dJmKm8Dy
 N2ogyXu33gPtay1r4D1sAG0C3Umzh7621a+77sdXskx1fgHg+obT7IFZ2e5r7jisTw7SIpMuUlj
 1aY0IIHRG90RNlOZLJf+jRtc/pqXdO8njujNar6Ab5bPsAGWseyAkVl00yVdz13boTEzYF28z8A
 0Q2Cc5gIRV3e5eit1NTEywjEuDjLZP/ej/WLZt3QDUR7cndAlbKFsajDdB9Oqku31LjbZ+qMoM3
 iF830LVjy08BfJYcv1x3aLDhrwCHnH9yJ0u2iu4V+HByLn+CYLKXKmm3nO+rVw=
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id
 98e67ed59e1d1-39b262aaf32mr7108644a91.19.1788512075489; 
 Fri, 04 Sep 2026 01:54:35 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39ae8f1448esm4782912a91.4.2026.09.04.01.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 01:54:35 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Chou <max.chou@sifive.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 1/2] tcg/riscv64: Validate AUIPC relocation range
Date: Fri,  4 Sep 2026 16:54:25 +0800
Message-ID: <20260904085426.3686492-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904085426.3686492-1-max.chou@sifive.com>
References: <20260904085426.3686492-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

reloc_call splits a PC-relative offset into a signed 12-bit low
immediate and an AUIPC contribution. When the low immediate carries into
bit 31, the existing 32-bit arithmetic can accept an unencodable
positive 0x80000000 AUIPC contribution.

Keep the split in pointer-width arithmetic and reject it unless the
rounded upper contribution is representable as signed 32-bit. Factor
this validation into split_auipc_offset so reloc_call retains its
existing failure contract.

Fixes: dfa8e74f9463 ("tcg/riscv: Add the relocation functions")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tcg/riscv64/tcg-target.c.inc | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 2ce9d47a633..76db0de94c3 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -641,14 +641,31 @@ static bool reloc_jimm20(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
     return false;
 }
 
-static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+static bool split_auipc_offset(tcg_insn_unit *src_rw,
+                               const tcg_insn_unit *target,
+                               uint32_t *hi, uint32_t *lo)
 {
     const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
     intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
-    int32_t lo = sextreg(offset, 0, 12);
-    int32_t hi = offset - lo;
+    intptr_t low = sextreg(offset, 0, 12);
+    intptr_t high = offset - low;
+
+    /* AUIPC sign-extends its 20-bit immediate after shifting by 12. */
+    if (high != sextreg(high, 0, 32)) {
+        return false;
+    }
+
+    *hi = (uint32_t)high;
+    *lo = (uint32_t)low;
+
+    return true;
+}
+
+static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    uint32_t hi, lo;
 
-    if (offset == hi + lo) {
+    if (split_auipc_offset(src_rw, target, &hi, &lo)) {
         src_rw[0] |= encode_uimm20(hi);
         src_rw[1] |= encode_imm12(lo);
         return true;
-- 
2.43.0


