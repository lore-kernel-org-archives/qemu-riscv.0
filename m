Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36029C5AD56
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:34:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQD-0000Jq-Am; Sat, 08 Aug 2026 21:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQB-0000Hi-Ew
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:51 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQ9-0002Ii-11
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:51 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-383b4a3755fso802158a91.3
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239227; x=1786844027; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=24nbi+Yp05sHv97Lvb7bmm3DBsKexstLCmuszK87+YI=;
 b=O3BzhbMvpJ/kTAvazx6tY7+5FsnqVAO9Wx6Xn+WVbYM/y69qMP4AgEp7dtu7OgwxOl
 WeaJx1ZA/94erz13Hobuzby1T96v+EiLJwkSBZ9E+K99+mN329B43hgJjijGv9Y0guX+
 v6ITxZPHpc1cUqJKGG5EEecBHXlffYX2YgaLRHGeQlmxD3e8COZWqFLcgVFgK3d3y5ZY
 o4DY3HE80sTEXMIHtMnLjDvpltG8oj3WSygrnTNNySWjvWWXo23pVQijr90A/Mw+MoYW
 vw9e3a9hm+XT8Y8yyJD1OtBJQcNR1njj3QrjtzDSmQaMfL6eIg5JosldEQs3ZpUV3Qvb
 0DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239227; x=1786844027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=24nbi+Yp05sHv97Lvb7bmm3DBsKexstLCmuszK87+YI=;
 b=cAFIXi4HSAh7miA65SZXYwHfJ08++w8TlSCeqz5LU2ethtaG4LhXUgewdKJ0nw/6ta
 iQdw6ZJ9nPj8ci5WEk5nmA62o0BjQp1hdVnWOWsCMRb+cgt/ZdnTPMmiyLLehjtXtU/r
 148eS97jtFzYC6e8R6tM6qIl3V/Nw1fcvCfvNl6WAxy+dngVedoO5T5TlVKzuaqOf+tF
 FQaXTxiH8qMf2OwiJU4xgWSoD4ZZaePKRVS6G8CB3Etr5HpzMyEuog2OIcRRicVA6nkN
 wBgIuAOObfmqDrdjt2glsKJH1fPay92WIlNuZMCDfdCinRCIfVSpeUi1nIuGiZlxUwbE
 hMSA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYxmetAnHnVHaeKfXBIstMxGRn94gnWyU618s7p5tWxW1PyVE4o+KWlNGfNsAffQ3FS6JOTGE+hv2d@nongnu.org
X-Gm-Message-State: AOJu0YykNHgsXW3Fanf0sJinzF3eJ0KxfTAFwIkh75p0g1YRnOM8+2Lg
 DXJpPeu/IXR9RyEGDWBwoYx6R+9NS/+M6d+q36jHOzYw69BOIRkZ+NAp45gA+8nrMvQ=
X-Gm-Gg: AR+sD12B3IW/y1OExFanCVUvmRsv5PYX6HQoTUAmec9avpG1L05+S+aqDCjkev1aZKZ
 ckaTJ8JCgbmm82QNVgIJcrMl/2MUhQj1yldnbu3YF8BAUE/YOnIKhg6dTLsE/NXx40HmnHdlyOa
 t3Fs0IuL1qL6VWoWjWrDltwxx9S0I1uzR4dEQvTbZD3SNaTCqTaN3VlvsqkAMCaE0zGUcGlLm7a
 KitMQPbmUKzU48BGTh2la1S/u5plxBk+oaAa0riPojNK7XSPaVuQP+ZauWQ+Y1g1Qowi82lX98j
 dcWBVqUp1Ryo6u22/EIbdsLGLPl2JNTtvemhw9W5GLylMtd4oVcQpaBCbQJjrjUpgBJYQB8Cokg
 2NEBgfGRQiRX6qnie8a27krCq3ARbJvFi4hhFflC+x0wDzMbU6Ju+R7cjIZcMgymZX68GNedRpN
 3xTlDIAQoEg/2SQdVMlv57Eg2hsnE4nu2OR13vB1nQe4vcCqoO6Rmk1eBNdfc0T69PQ3DE706AH
 YqKhwJg0iu0o/HEd7VR
X-Received: by 2002:a17:90b:2dc7:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-392620e6e25mr16119106a91.13.1786239227423; 
 Sat, 08 Aug 2026 18:33:47 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 2/9] disas/capstone: Allow for cap_insn_unit > length
Date: Sat,  8 Aug 2026 18:33:36 -0700
Message-ID: <20260809013343.664966-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809013343.664966-1-richard.henderson@linaro.org>
References: <20260809013343.664966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

cap_insn_unit is designed for targets like arm thumb2
and s390x where 4 and 6-byte insns are displayed in
2-byte chunks.

For riscv, we prefer 4-byte insns to display as one
4-byte unit, rather than 2x 2-byte units.  So we will
want to set cap_insn_unit to 4, but allow for insns
that are smaller than 4.  Emit padding to match.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/capstone.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/disas/capstone.c b/disas/capstone.c
index fe3efb0d3c..8fb8d0724c 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -107,8 +107,9 @@ static void cap_dump_insn_units(disassemble_info *info, cs_insn *insn,
 {
     fprintf_function print = info->fprintf_func;
     FILE *stream = info->stream;
+    int unit = MIN(info->cap_insn_unit, n - i);
 
-    switch (info->cap_insn_unit) {
+    switch (unit) {
     case 4:
         if (info->endian == BFD_ENDIAN_BIG) {
             for (; i < n; i += 4) {
@@ -140,6 +141,11 @@ static void cap_dump_insn_units(disassemble_info *info, cs_insn *insn,
         }
         break;
     }
+
+    if (unit < info->cap_insn_unit) {
+        int width = (info->cap_insn_unit - unit) * 2;
+        print(stream, "%*s", width, "");
+    }
 }
 
 static void cap_dump_insn(disassemble_info *info, cs_insn *insn)
-- 
2.43.0


