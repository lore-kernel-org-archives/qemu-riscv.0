Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omBHY-0004Zz-6F
	for mharc-qemu-riscv@gnu.org; Sat, 22 Oct 2022 05:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omBHV-0004Zo-VS
 for qemu-riscv@nongnu.org; Sat, 22 Oct 2022 05:59:05 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omBHU-0008FB-Cp
 for qemu-riscv@nongnu.org; Sat, 22 Oct 2022 05:59:05 -0400
Received: by mail-pf1-x435.google.com with SMTP id y13so306899pfp.7
 for <qemu-riscv@nongnu.org>; Sat, 22 Oct 2022 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RU8/5HTo8+baKMeHrUEQiBWbmsr/936MisDwlU3iBGk=;
 b=m+HclE7BndO+171z9rIM5f+KdAsuQQwcekZv5h0GAIUIYxV1BvJndK+zpQZPe4T7sa
 o4LdYXvgfBlEduVXcPXw8z0G7MAkDMTXkonGjlM1uL5YC1CmJ9GBnfx4Jsc8wjpCFeKh
 5rZiy9WR0936WanKNzwHeudWvmwBdswwKVxnJhdB/HoNqIxjgfmP24lDPgrZxEIdmpM0
 rvx7ZM32MWjhn/TgBFOEXr1BQZGYWPJ7/8WvX8AdWplTzcjPbRXllTATwrzhPAEEgvMa
 xeUomqcp10JpVUIXfygszLOXgpQWOFb1EoGEGhuSosK1+vQ0FUO68gtcCI+OVwc40TiH
 glIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RU8/5HTo8+baKMeHrUEQiBWbmsr/936MisDwlU3iBGk=;
 b=cxxmpPWH5vWs8dX/TARFKnxYr5asOjIG4wHORKokSS/mQ7PId7R2kpgHbDnOsp2gc5
 YPiXfHW9Hrd6yYzTh2G+3fRB26euqJghBpkR9DLARXEQd4KXx5Mpot/HTtnjEqIadXN9
 EnkOUHeuu4imLENsoorzbggrMwqt8a/QBJf4t+XwMZ0633z5sO30d7oYQGLGc/ryjpZ3
 J2VjGSqdOKkLXV1uey4CDa4AHNpq/Eu3d0IjGLZUBDdmg1tKWe+2yY57+OQKFheQIg2H
 FyNagKP2DXeUglcc59SU/kjyd/H0TCLuOt/i7rlCgJN3vMFwDaxLHkzVggRVn9odg0LA
 ytdQ==
X-Gm-Message-State: ACrzQf0/SlJa8RjdpiQq7V9fJ9hGrAVCx17tXyiKaEmlmDDgTEmr/xYD
 vTfEXReD+RYwT4DvT0sLUBloVQ==
X-Google-Smtp-Source: AMsMyM7wpT23k+x74M/B8jO4WigDRTCxoZaYInGTBWeodb80VqIvB7Iq+88z3waJiUVBEua9mpZc+A==
X-Received: by 2002:a05:6a00:174c:b0:565:c73a:9117 with SMTP id
 j12-20020a056a00174c00b00565c73a9117mr23288425pfc.23.1666432741344; 
 Sat, 22 Oct 2022 02:59:01 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 129-20020a621987000000b0056b3c863950sm2021564pfz.8.2022.10.22.02.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 02:59:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
Date: Sat, 22 Oct 2022 19:58:21 +1000
Message-Id: <20221022095821.2441874-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Sat, 22 Oct 2022 09:59:06 -0000

We were matching a signed 13-bit range, not a 12-bit range.
Expand the commentary within the function and be explicit
about all of the ranges.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1cdaf7b57b..2a84c57bec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits: [-0x800, 0x7ff].
+     * Used for most arithmetic, as this is the isa field.
+     */
+    if ((ct & TCG_CT_CONST_S12) && val >= -0x800 && val <= 0x7ff) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
+     * Used for subtraction, where a constant must be handled by ADDI.
+     */
+    if ((ct & TCG_CT_CONST_N12) && val >= -0x7ff && val <= 0x800) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_M12) && val >= -0xfff && val <= 0xfff) {
+    /*
+     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
+     * Used by addsub2, which may need the negative operation,
+     * and requires the modified constant to be representable.
+     */
+    if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
         return 1;
     }
     return 0;
-- 
2.34.1


