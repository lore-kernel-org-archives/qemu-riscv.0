Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1G-00071C-Tb
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0z-0006hx-1E
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:35 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0r-0007F6-6V
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:28 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8832619pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=uY91TEymIvOROqCyc3f8T5/iDb+AgW5yzmpq+9/HL2VXkgh3cD2xHCIis+l9+xfnaw
 Y64FURVLiTm5hHKD3cvRUqdCcaK/Zku2JnD/VsmedcyosKTxeT6exqFyjp04Fu8itJdB
 IEiTFo/fS6NXoHrFxnx/lTlZW0XXQFPievCIi0i8Om9LXWjT1nexRIJldLei7SLHa/2v
 LXhKzPKjpK7iIhdjTPRMXBhzKVIMmxZJBFGkZWBHoAPFikomtDkVpHL6qgKkqwVF/GdQ
 dvR7sR3xDAoIEBtyhKg4QU8J8FmjcgR5PBQMBdd4GDtUN17jNKg4HGJnLphUsLynx9pY
 1wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=fFuca7BlroeqHgQr7l0RioD60DOm2UEiYyHltDTVUU4RUsqnCBu1iLk6M/37MTULfo
 KpfLVOmDN27iSzhiyWSZyupDNQFyUx/DRe3xjKiWGu+xJcY2lbAfdC0YScEk0W/iM7fs
 l+PZxwfBZuLWe3sVJFfEHmuDNhJYODCz6PiJBEHytiZ76SMQkvoSsL4OBHSlWixLS3G0
 pNWEp0sQCsO+yaRNKh2Np2cgreQ6oeMYKy9uxvYgsn458EDydvGnzqro9JsV9xGfHIaH
 UULWPH3kdaqKusXMINOzN22wtXsycVaokK4Q3SbUuRRjHl+jZ2bEp6v4Iqlji62urHVb
 xcKg==
X-Gm-Message-State: AO0yUKWDNHRh4jD+h8zap6O9kzdxHo+ZmpVb/xL6Y7aUUaSfG251Cp2d
 u5Y50Xxfgsrk0JywNybxGBwnfQ==
X-Google-Smtp-Source: AK7set/y1BBtrakPcby2yR6CU/5kaabXAxGWQzu8nNV1L7mzQrq5BArhAzW0mpkDIPhM44kdERmMyQ==
X-Received: by 2002:a17:902:db08:b0:19c:da7f:a234 with SMTP id
 m8-20020a170902db0800b0019cda7fa234mr11843415plx.67.1677475523774; 
 Sun, 26 Feb 2023 21:25:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 05/76] target/arm: Remove value_global from DisasCompare
Date: Sun, 26 Feb 2023 19:23:54 -1000
Message-Id: <20230227052505.352889-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:36 -0000

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


