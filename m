Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD3C61DD3
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 17:12:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2Aya-0005lp-1M; Thu, 03 Sep 2026 13:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2AyM-0005dH-Cn
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:11:34 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2AyC-0002Y9-DQ
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:11:31 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-6b132a5009eso42399eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788455483; x=1789060283; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Yr1xuAHbIhRQR2HquIZ+fNcRwi6DyU7KLH9171HGnOo=;
 b=LNUSCkHNJVipCJvPiJbkJP63Sc9dH+hrKc5iizsQV6Z4yaeGgLvSBsk4JAqzpX24t3
 Lwd4PE9QxyWpc896RvYbAIsohr4zXNS1iJUtpdsFgQN35He/C047tq6NT4zTHu9uFOoJ
 VreSAjQ9aJmcex0m9YznXqoxLwJO/nTmfYDTKdFXCOw/GPy+0uVuEEm3BwP5MG56radp
 d+4gF0R97/OG00af3NBfdH476fNs2iLVB892wCdHYZQNjFX0uA0xVW8tu6b3VTfk7R9q
 YaAuxbglMQSsWB4wdKrdMFsr/8OAacb3en5GfRs2/JK4BTSkb3wBqt1rkOT5D75HnXzH
 BTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788455483; x=1789060283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Yr1xuAHbIhRQR2HquIZ+fNcRwi6DyU7KLH9171HGnOo=;
 b=BIyJ2kjJOXK9LqIMWnHna7lyeLiYViiDu1RXnfG5Bu+VLDWf2WdYDONFyJgpM77EPt
 wbEDcouCbu3c6uiJ8N1a6DPITszcBHkU3ZUQX8pyOPcwFEylGFIQr8pIJrtXu5nZcZvj
 jcd6eD5eCMFWYopgAdLsxsQfmvLaoiLzH6Vy8AXjpV4k7NV8WhEhpM5xm7VbfYEdK/N3
 Rdcwg95RojOfE6wPGf8qMq987BXb1zqMpmHYBn8Q8VyLZU9XaODahTWrYfKqltyU68Pz
 7gHElX78XZUEElswyUFqjBIyALwvCqxEICSFnURRNJQwu3NSWIxseSd6keKU9uTZW8mW
 Z6AA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx3bFZW3PFQPEyPM8vVUTKn1BeJfTl4lBiLghbMBaXkr9NfQt9T7QnoeFlghagSLC1iJNv2qoDsRzZ5@nongnu.org
X-Gm-Message-State: AFuF++mWd/hc3sg4JT0AKYYIlSuvN3Z/etL+iMtK9puqgigGtia8XC7k
 EXM71m4eB7SrBhgHH66Tg0V95HSALvcLQwcJaAL5LnBXaGXwMpsPQmVFSWZpaQiRAXMxMszJ2YS
 eigokzVw=
X-Gm-Gg: AYBFou0N8d9h3auSyBWMuVS7O82JSeemsMId72FFcnTVETgRDQs4ZrGNOAfa/WJBURI
 8OLKkmHbhWSiL3ettPST9BSQj9rJAqdseEl5Oucyq6Yqf6nneCJBPY3+XUzSUHJXlH7Q7bbhMbz
 1tpSlyu9WjlIp6OSJRC2N/ACKxMd7S0h6K2pGhHP3lriG0Z9N9AdneJtFS1Qxmmni0z973Te1Mm
 Hck8QO6koi2AfrgWgSqBUR/21gAESt9yUpmPhl61K0ffsMYljIEykkZj6jSsap5z/MFA4aGqGho
 efoU2F1JVAuYhHvL+VriQaIGNgJAcMqrJDnZLtweFP4ttZ+o2kmuAecWGH/iQhtvmEzcSKpew7t
 3eA1+GzUuci3xChOSPSDOTme/m/wdrZDzuJzFGTntgDsk2+uNGwBg9gKDZt33HBhfVtrT59nIhL
 gupJAjMlggVLU9SCVVi1q7mUuG8Db03NzqFkLuYeFgCM/u8fwAGVLXrkSqwrm8c9Gtva3z+IVcp
 XVWhEKQKsEuij+r2qNeNXooGmkVPYO7wiTZpuvhrUXRmBJOQwAgRlBBRGdniTw=
X-Received: by 2002:a05:6a20:2d22:b0:3d3:aec2:4dcb with SMTP id
 adf61e73a8af0-3d9b051aa7dmr24391920637.23.1788455053803; 
 Thu, 03 Sep 2026 10:04:13 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc43d39e4ddsm1227860a12.5.2026.09.03.10.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 10:04:13 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH 1/2] tcg/riscv64: Validate AUIPC relocation range
Date: Fri,  4 Sep 2026 01:04:04 +0800
Message-ID: <20260903170405.3632015-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903170405.3632015-1-max.chou@sifive.com>
References: <20260903170405.3632015-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=max.chou@sifive.com; helo=mail-oo1-xc2f.google.com
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
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tcg/riscv64/tcg-target.c.inc | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index a439ba5c20e..1c41f8ffade 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -634,14 +634,31 @@ static bool reloc_jimm20(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
     return false;
 }
 
-static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+static bool split_auipc_offset(tcg_insn_unit *src_rw,
+                               const tcg_insn_unit *target,
+                               intptr_t *hi, intptr_t *lo)
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
+    *hi = high;
+    *lo = low;
+
+    return true;
+}
+
+static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    intptr_t hi, lo;
 
-    if (offset == hi + lo) {
+    if (split_auipc_offset(src_rw, target, &hi, &lo)) {
         src_rw[0] |= encode_uimm20(hi);
         src_rw[1] |= encode_imm12(lo);
         return true;
-- 
2.43.7


