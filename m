Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWHo-0001wy-SF
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHn-0001mM-FO
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:55 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHl-0004nO-Pv
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:55 -0500
Received: by mail-pf1-x429.google.com with SMTP id z11so2805757pfh.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WSSf76yO4ky84ChGadZWB86T9ItD/RboRX03rlB3p8=;
 b=W/MAG9BRHJ/aNWhr0Ig2EdraVGHK4+Q4hMBfcKI8k/KX+Hy7UGUpxkVnaBKCwmJ8Br
 fxeiysALdypYmh8E0V1Z53PYkHJQ0sMTKiS+JxgCP2z++ZNou1dDC1SCTrSOYd4no8BO
 pmDz6VVmghL+XJrSwvIscP0x9iJyGW1pel6gKZdYTRbmERavBLwaJR3rounfc4/VYgZ3
 ZSaMURboA3lgJfx2bCpZWKEzyBwbhZmXN3/K+XMCVNCLxa83vuIGEmH0tAGBa/J2wERF
 3Iu1VtJct1IUzKBlc0BysouKk2EfzKlKPwNvlqjftetNCL456gQjXxB4Mm/qnVBDo5df
 gcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WSSf76yO4ky84ChGadZWB86T9ItD/RboRX03rlB3p8=;
 b=MhglBSX9txEiDB3hzrR/2khirjqON1hryJf+bOs8ZAFbDdVN+WrotJJHaLJuk+pnzT
 7nq+s9N79qCEL+s8n9QjZLRqCPVwuyPs1uovzCHdMbvUyWqcMHnW2UYkjEncrFCfxiA2
 RQxhnBc6jTUGkdjmvE6D0471nMUXbrjPTAEMBSAFcyKAfl2dJOVIuw+IzI3aBvIuHOap
 4WqU4fks+Rm7Ak3gqpgwI5EXkcbVoMs32OiV+MhhLF/j0ulSmDh7AfpiO1+gDp4xWiLG
 lCYwywBpb2SN4ewrWNg2w0FQG4m4fPSmi95c3Q6O2iRx/zv5FScYUbYJ0aU4YI65VgTW
 P14g==
X-Gm-Message-State: AO0yUKVweRT/cRN7uT+X9W9zmMV4r57EEDLoApbxc4RBkuhOmeWGpqxg
 NAtFGFR/+lBf1cl4XJw3VBmAvw==
X-Google-Smtp-Source: AK7set/XdSmzPNU9/8dDucICWS3jbXUxuiXc6kq2dVS7xYh4EK37+VHsKe87VLB0B7rTLXUgWY8atQ==
X-Received: by 2002:a62:1a49:0:b0:5a8:ae60:eb4a with SMTP id
 a70-20020a621a49000000b005a8ae60eb4amr19138845pfa.28.1677476572237; 
 Sun, 26 Feb 2023 21:42:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 03/70] target/arm: Improve arm_rmode_to_sf
Date: Sun, 26 Feb 2023 19:41:26 -1000
Message-Id: <20230227054233.390271-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:42:55 -0000

Use proper enumeration types for input and output.
Use a const array to perform the mapping, with an
assert that the input is valid.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 12 +++++++++---
 target/arm/translate-mve.c |  2 +-
 target/arm/vfp_helper.c    | 33 ++++++++-------------------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 759b70c646..47d3c32825 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -193,16 +193,22 @@ void arm_restore_state_to_opc(CPUState *cs,
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-enum arm_fprounding {
+typedef enum ARMFPRounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
     FPROUNDING_NEGINF,
     FPROUNDING_ZERO,
     FPROUNDING_TIEAWAY,
     FPROUNDING_ODD
-};
+} ARMFPRounding;
 
-int arm_rmode_to_sf(int rmode);
+extern const FloatRoundMode arm_rmode_to_sf_map[6];
+
+static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
+{
+    assert((unsigned)rmode < ARRAY_SIZE(arm_rmode_to_sf_map));
+    return arm_rmode_to_sf_map[rmode];
+}
 
 static inline void aarch64_save_sp(CPUARMState *env, int el)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 798b4fddfe..9744bf3de0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -588,7 +588,7 @@ DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
 DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
 
 static bool do_vcvt_rmode(DisasContext *s, arg_1op *a,
-                          enum arm_fprounding rmode, bool u)
+                          ARMFPRounding rmode, bool u)
 {
     /*
      * Handle VCVT fp to int with specified rounding mode.
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 90cc324f71..36906db8e0 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1104,31 +1104,14 @@ float64 HELPER(rintd)(float64 x, void *fp_status)
 }
 
 /* Convert ARM rounding mode to softfloat */
-int arm_rmode_to_sf(int rmode)
-{
-    switch (rmode) {
-    case FPROUNDING_TIEAWAY:
-        rmode = float_round_ties_away;
-        break;
-    case FPROUNDING_ODD:
-        rmode = float_round_to_odd;
-        break;
-    case FPROUNDING_TIEEVEN:
-    default:
-        rmode = float_round_nearest_even;
-        break;
-    case FPROUNDING_POSINF:
-        rmode = float_round_up;
-        break;
-    case FPROUNDING_NEGINF:
-        rmode = float_round_down;
-        break;
-    case FPROUNDING_ZERO:
-        rmode = float_round_to_zero;
-        break;
-    }
-    return rmode;
-}
+const FloatRoundMode arm_rmode_to_sf_map[] = {
+    [FPROUNDING_TIEEVEN] = float_round_nearest_even,
+    [FPROUNDING_POSINF] = float_round_up,
+    [FPROUNDING_NEGINF] = float_round_down,
+    [FPROUNDING_ZERO] = float_round_to_zero,
+    [FPROUNDING_TIEAWAY] = float_round_ties_away,
+    [FPROUNDING_ODD] = float_round_to_odd,
+};
 
 /*
  * Implement float64 to int32_t conversion without saturation;
-- 
2.34.1


