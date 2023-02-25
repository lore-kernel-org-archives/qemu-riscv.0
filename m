Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqdn-0004hM-IT
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdk-0004YF-6X
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:48 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdi-0001Rc-Jw
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:14:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id n6so493226plf.5
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=o/IGM9L8R9w/cR20YlJwuj3hjMu7CFK7fPDBLWcmnzj8xQ8qwlG1r+V3LxloDS7Mf2
 nr7Z7IKKOm5sgssUtZM5TIcQ3Q8/pfxFZtRdsw3pJMYoy4ZkwIxAgv1wgc/rfYWRFIwN
 vgltHgbpXJMCb9hzANcXQ8P1/ansK2X+krVGtmPGxJxqEKIuO/Y9jIFpuhUgrnNbHHyg
 03zBA7zc9tgdqz8EXx0WXJThYR+0DICXHR3lpRh8346l15wqtheQ5qh5UbY6v8k88Cns
 1Tm+pZaO3ppnIBaNCzHAP4HLfOsgpdz1chyD5CoQhUhVmTAkwqnswk99LWjqyK0GJ5Pc
 zoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=XD2XMSd4hFofnLSmqhNbC2PLlRuAh0mLnzwIi6S/jyzA1QQwOk8nzsmFdtrk95NBnG
 GY1gWXj/FeahVgigBRWCyhkltyHcPi83QoGDKYyAHZL8fnuSwtDO3pipxGW2UxmMLPrj
 Kg0WREUSwCGOy0/jSvZp21vuWdZ8PjqKQJHlWLlI7HceMCMTTWCedaLOV8bX2WACNwhu
 GbHv7WvY0Jox4GmTBV+c3kdzb6uIKj0YA+dROghmFBP0ik5ZHYQ8VidLa2Gr65P3UlCi
 f6/+MeS/naJnZaqLzuA+xAgjEcfBpwaGx7/yRsMyFREoVIKu5Bodq8PxrLwG3/FLQhPv
 ++fA==
X-Gm-Message-State: AO0yUKUUwvWCFkxJqDlR5zqwlnJdWn/Ue3m9TGV4o0C4UsZzC3fO4R7p
 adH2L01K3dgB9CTtva6EljV4ng==
X-Google-Smtp-Source: AK7set89ucc1TlILWN1e679ZQoL6h8gswdS2uXepg7sYPcMIwv4nvVjscbIIxZ1k6aKu9804/QIgDQ==
X-Received: by 2002:a17:903:1d2:b0:19a:a815:2868 with SMTP id
 e18-20020a17090301d200b0019aa8152868mr20911873plh.44.1677316485281; 
 Sat, 25 Feb 2023 01:14:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 05/76] target/arm: Remove value_global from DisasCompare
Date: Fri, 24 Feb 2023 23:13:16 -1000
Message-Id: <20230225091427.1817156-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:14:48 -0000

This field was only used to avoid freeing globals.
Since we no longer free any temps, this is dead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 1 -
 target/arm/translate.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 7f52f08c5e..db29e8d799 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -157,7 +157,6 @@ typedef struct DisasContext {
 typedef struct DisasCompare {
     TCGCond cond;
     TCGv_i32 value;
-    bool value_global;
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a0a298f8f7..f76a83b473 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -672,7 +672,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
 {
     TCGv_i32 value;
     TCGCond cond;
-    bool global = true;
 
     switch (cc) {
     case 0: /* eq: Z */
@@ -703,7 +702,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 9: /* ls: !C || Z -> !(C && !Z) */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* CF is 1 for C, so -CF is an all-bits-set mask for C;
            ZF is non-zero for !Z; so AND the two subexpressions.  */
         tcg_gen_neg_i32(value, cpu_CF);
@@ -715,7 +713,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
         /* Since we're only interested in the sign bit, == 0 is >= 0.  */
         cond = TCG_COND_GE;
         value = tcg_temp_new_i32();
-        global = false;
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
         break;
 
@@ -723,7 +720,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 13: /* le: Z || N != V */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* (N == V) is equal to the sign bit of ~(NF ^ VF).  Propagate
          * the sign bit then AND with ZF to yield the result.  */
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
@@ -751,7 +747,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
  no_invert:
     cmp->cond = cond;
     cmp->value = value;
-    cmp->value_global = global;
 }
 
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label)
-- 
2.34.1


