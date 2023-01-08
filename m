Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELac-0006js-Ks
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaP-0006RK-IO
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:39:02 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZM-0004mK-Kz
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:39:01 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9331569pjt.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysUfy3028xNtsGuGYr8qWgnI9qGNFLlqE8qpo7J/Z/I=;
 b=IhO1d3I6RvHqGRwPireQ8CMiUuJ0gtExvMLDbQpG/F5WIHaRIZYQgxFoLtDe61uBR2
 f8Xc4eSTuH/Wb1VOHbzHUMgQOknaC70Bd5pxvY6F2n1nv+1YOZcl/rCRTROD396jqp8T
 1lqanEtzyH4cZRg2J3c3bT6Qzi4zZs+GpsLW6WWsQAO8OOjtyWjN5/vcrukeIWldxI9Y
 U0ZpGOXde+MFA87n5WW+8jUG0hx0+ExJA9Clb4F3hVBfzByPgZmERTX1UE+fp1wAHq3d
 UvdWCdFViq94uKldUZo9tQ5z1cLC6tOm58EmJ3JDxrGw9XXinQIznLm2K2+iFaznE4PE
 Qjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysUfy3028xNtsGuGYr8qWgnI9qGNFLlqE8qpo7J/Z/I=;
 b=JTJH3TtJg+CXDz7iwNUDHxAaG0eopFS2x43D72xFyQuEINnJIATUu+lwyRMvh4xL20
 vznN8Rfb30o3W8WSzx2U6D2HHsy3UwoRXXGjpKFtiS2RaMzG3C4LJF6K2Kx0LJfBUUhN
 IqjFTvS5snBtxf5aRMC1xB2x4xhHhZBehi20/l4bOneHLQFSARR/WbbyyFHVaCbt30D2
 JOzJ9lRvvYui/4TRjGcDYS5aN8zw9W4+lVZWSsMkEIwdg6RtgIAIGFfKP/LNp+hgOjKu
 GfA6Q7z2ZF0IiSVgrLlx6Jklahdl4L2YRIdP3YoU0OsS/lybXPDafA7Fp8OnygoC2C9Y
 +YQg==
X-Gm-Message-State: AFqh2kriF/RZadbvY7uHyHv5YRBr46KyCewlxyWNh/WKRjMQie+wGUOx
 aYeFcg+JyMLluu9p8qgRfdoK0A==
X-Google-Smtp-Source: AMrXdXtYykO4A8XtP0TKiliypU1JKaSOpCgr3I9LUKFXuSKeDWpK6x6Jfv4GVEL5BUtSi/TSYvi0zA==
X-Received: by 2002:a17:903:2652:b0:192:8e0a:16b with SMTP id
 je18-20020a170903265200b001928e0a016bmr39714950plb.14.1673145475261; 
 Sat, 07 Jan 2023 18:37:55 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 31/36] target/s390x: Use Int128 for passing float128
Date: Sat,  7 Jan 2023 18:37:14 -0800
Message-Id: <20230108023719.2466341-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:39:03 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix SPEC_in1_x1.
---
 target/s390x/helper.h            | 32 ++++++------
 target/s390x/tcg/insn-data.h.inc | 30 +++++------
 target/s390x/tcg/fpu_helper.c    | 88 ++++++++++++++------------------
 target/s390x/tcg/translate.c     | 76 ++++++++++++++++++---------
 4 files changed, 121 insertions(+), 105 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index d40aeb471f..bccd3bfca6 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -41,55 +41,55 @@ DEF_HELPER_4(csst, i32, env, i32, i64, i64)
 DEF_HELPER_4(csst_parallel, i32, env, i32, i64, i64)
 DEF_HELPER_FLAGS_3(aeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(adb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(axb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(axb, TCG_CALL_NO_WG, i128, env, i128, i128)
 DEF_HELPER_FLAGS_3(seb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(sdb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(sxb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(sxb, TCG_CALL_NO_WG, i128, env, i128, i128)
 DEF_HELPER_FLAGS_3(deb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(ddb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(dxb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(dxb, TCG_CALL_NO_WG, i128, env, i128, i128)
 DEF_HELPER_FLAGS_3(meeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(mdeb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(mdb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_5(mxb, TCG_CALL_NO_WG, i128, env, i64, i64, i64, i64)
-DEF_HELPER_FLAGS_4(mxdb, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(mxb, TCG_CALL_NO_WG, i128, env, i128, i128)
+DEF_HELPER_FLAGS_3(mxdb, TCG_CALL_NO_WG, i128, env, i128, i64)
 DEF_HELPER_FLAGS_2(ldeb, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_4(ldxb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
+DEF_HELPER_FLAGS_3(ldxb, TCG_CALL_NO_WG, i64, env, i128, i32)
 DEF_HELPER_FLAGS_2(lxdb, TCG_CALL_NO_WG, i128, env, i64)
 DEF_HELPER_FLAGS_2(lxeb, TCG_CALL_NO_WG, i128, env, i64)
 DEF_HELPER_FLAGS_3(ledb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(lexb, TCG_CALL_NO_WG, i64, env, i64, i64, i32)
+DEF_HELPER_FLAGS_3(lexb, TCG_CALL_NO_WG, i64, env, i128, i32)
 DEF_HELPER_FLAGS_3(ceb, TCG_CALL_NO_WG_SE, i32, env, i64, i64)
 DEF_HELPER_FLAGS_3(cdb, TCG_CALL_NO_WG_SE, i32, env, i64, i64)
-DEF_HELPER_FLAGS_5(cxb, TCG_CALL_NO_WG_SE, i32, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(cxb, TCG_CALL_NO_WG_SE, i32, env, i128, i128)
 DEF_HELPER_FLAGS_3(keb, TCG_CALL_NO_WG, i32, env, i64, i64)
 DEF_HELPER_FLAGS_3(kdb, TCG_CALL_NO_WG, i32, env, i64, i64)
-DEF_HELPER_FLAGS_5(kxb, TCG_CALL_NO_WG, i32, env, i64, i64, i64, i64)
+DEF_HELPER_FLAGS_3(kxb, TCG_CALL_NO_WG, i32, env, i128, i128)
 DEF_HELPER_3(cgeb, i64, env, i64, i32)
 DEF_HELPER_3(cgdb, i64, env, i64, i32)
-DEF_HELPER_4(cgxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(cgxb, i64, env, i128, i32)
 DEF_HELPER_3(cfeb, i64, env, i64, i32)
 DEF_HELPER_3(cfdb, i64, env, i64, i32)
-DEF_HELPER_4(cfxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(cfxb, i64, env, i128, i32)
 DEF_HELPER_3(clgeb, i64, env, i64, i32)
 DEF_HELPER_3(clgdb, i64, env, i64, i32)
-DEF_HELPER_4(clgxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(clgxb, i64, env, i128, i32)
 DEF_HELPER_3(clfeb, i64, env, i64, i32)
 DEF_HELPER_3(clfdb, i64, env, i64, i32)
-DEF_HELPER_4(clfxb, i64, env, i64, i64, i32)
+DEF_HELPER_3(clfxb, i64, env, i128, i32)
 DEF_HELPER_FLAGS_3(fieb, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(fidb, TCG_CALL_NO_WG, i64, env, i64, i32)
-DEF_HELPER_FLAGS_4(fixb, TCG_CALL_NO_WG, i128, env, i64, i64, i32)
+DEF_HELPER_FLAGS_3(fixb, TCG_CALL_NO_WG, i128, env, i128, i32)
 DEF_HELPER_FLAGS_4(maeb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(madb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mseb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(msdb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_3(tceb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
 DEF_HELPER_FLAGS_3(tcdb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
-DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(tcxb, TCG_CALL_NO_RWG_SE, i32, env, i128, i64)
 DEF_HELPER_FLAGS_2(sqeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(sqdb, TCG_CALL_NO_WG, i64, env, i64)
-DEF_HELPER_FLAGS_3(sqxb, TCG_CALL_NO_WG, i128, env, i64, i64)
+DEF_HELPER_FLAGS_2(sqxb, TCG_CALL_NO_WG, i128, env, i128)
 DEF_HELPER_FLAGS_1(cvd, TCG_CALL_NO_RWG_SE, i64, s32)
 DEF_HELPER_FLAGS_4(pack, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(pka, TCG_CALL_NO_WG, void, env, i64, i64, i32)
diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 517a4500ae..893f4b48db 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -34,7 +34,7 @@
     C(0xe318, AGF,     RXY_a, Z,   r1, m2_32s, r1, 0, add, adds64)
     F(0xb30a, AEBR,    RRE,   Z,   e1, e2, new, e1, aeb, f32, IF_BFP)
     F(0xb31a, ADBR,    RRE,   Z,   f1, f2, new, f1, adb, f64, IF_BFP)
-    F(0xb34a, AXBR,    RRE,   Z,   x2h, x2l, x1, x1, axb, f128, IF_BFP)
+    F(0xb34a, AXBR,    RRE,   Z,   x1, x2, new_x, x1, axb, f128, IF_BFP)
     F(0xed0a, AEB,     RXE,   Z,   e1, m2_32u, new, e1, aeb, f32, IF_BFP)
     F(0xed1a, ADB,     RXE,   Z,   f1, m2_64, new, f1, adb, f64, IF_BFP)
 /* ADD HIGH */
@@ -172,13 +172,13 @@
     C(0xe330, CGF,     RXY_a, Z,   r1_o, m2_32s, 0, 0, 0, cmps64)
     F(0xb309, CEBR,    RRE,   Z,   e1, e2, 0, 0, ceb, 0, IF_BFP)
     F(0xb319, CDBR,    RRE,   Z,   f1, f2, 0, 0, cdb, 0, IF_BFP)
-    F(0xb349, CXBR,    RRE,   Z,   x2h, x2l, x1, 0, cxb, 0, IF_BFP)
+    F(0xb349, CXBR,    RRE,   Z,   x1, x2, 0, 0, cxb, 0, IF_BFP)
     F(0xed09, CEB,     RXE,   Z,   e1, m2_32u, 0, 0, ceb, 0, IF_BFP)
     F(0xed19, CDB,     RXE,   Z,   f1, m2_64, 0, 0, cdb, 0, IF_BFP)
 /* COMPARE AND SIGNAL */
     F(0xb308, KEBR,    RRE,   Z,   e1, e2, 0, 0, keb, 0, IF_BFP)
     F(0xb318, KDBR,    RRE,   Z,   f1, f2, 0, 0, kdb, 0, IF_BFP)
-    F(0xb348, KXBR,    RRE,   Z,   x2h, x2l, x1, 0, kxb, 0, IF_BFP)
+    F(0xb348, KXBR,    RRE,   Z,   x1, x2, 0, 0, kxb, 0, IF_BFP)
     F(0xed08, KEB,     RXE,   Z,   e1, m2_32u, 0, 0, keb, 0, IF_BFP)
     F(0xed18, KDB,     RXE,   Z,   f1, m2_64, 0, 0, kdb, 0, IF_BFP)
 /* COMPARE IMMEDIATE */
@@ -299,10 +299,10 @@
 /* CONVERT TO FIXED */
     F(0xb398, CFEBR,   RRF_e, Z,   0, e2, new, r1_32, cfeb, 0, IF_BFP)
     F(0xb399, CFDBR,   RRF_e, Z,   0, f2, new, r1_32, cfdb, 0, IF_BFP)
-    F(0xb39a, CFXBR,   RRF_e, Z,   x2h, x2l, new, r1_32, cfxb, 0, IF_BFP)
+    F(0xb39a, CFXBR,   RRF_e, Z,   0, x2, new, r1_32, cfxb, 0, IF_BFP)
     F(0xb3a8, CGEBR,   RRF_e, Z,   0, e2, r1, 0, cgeb, 0, IF_BFP)
     F(0xb3a9, CGDBR,   RRF_e, Z,   0, f2, r1, 0, cgdb, 0, IF_BFP)
-    F(0xb3aa, CGXBR,   RRF_e, Z,   x2h, x2l, r1, 0, cgxb, 0, IF_BFP)
+    F(0xb3aa, CGXBR,   RRF_e, Z,   0, x2, r1, 0, cgxb, 0, IF_BFP)
 /* CONVERT FROM FIXED */
     F(0xb394, CEFBR,   RRF_e, Z,   0, r2_32s, new, e1, cegb, 0, IF_BFP)
     F(0xb395, CDFBR,   RRF_e, Z,   0, r2_32s, new, f1, cdgb, 0, IF_BFP)
@@ -313,10 +313,10 @@
 /* CONVERT TO LOGICAL */
     F(0xb39c, CLFEBR,  RRF_e, FPE, 0, e2, new, r1_32, clfeb, 0, IF_BFP)
     F(0xb39d, CLFDBR,  RRF_e, FPE, 0, f2, new, r1_32, clfdb, 0, IF_BFP)
-    F(0xb39e, CLFXBR,  RRF_e, FPE, x2h, x2l, new, r1_32, clfxb, 0, IF_BFP)
+    F(0xb39e, CLFXBR,  RRF_e, FPE, 0, x2, new, r1_32, clfxb, 0, IF_BFP)
     F(0xb3ac, CLGEBR,  RRF_e, FPE, 0, e2, r1, 0, clgeb, 0, IF_BFP)
     F(0xb3ad, CLGDBR,  RRF_e, FPE, 0, f2, r1, 0, clgdb, 0, IF_BFP)
-    F(0xb3ae, CLGXBR,  RRF_e, FPE, x2h, x2l, r1, 0, clgxb, 0, IF_BFP)
+    F(0xb3ae, CLGXBR,  RRF_e, FPE, 0, x2, r1, 0, clgxb, 0, IF_BFP)
 /* CONVERT FROM LOGICAL */
     F(0xb390, CELFBR,  RRF_e, FPE, 0, r2_32u, new, e1, celgb, 0, IF_BFP)
     F(0xb391, CDLFBR,  RRF_e, FPE, 0, r2_32u, new, f1, cdlgb, 0, IF_BFP)
@@ -343,7 +343,7 @@
     C(0x5d00, D,       RX_a,  Z,   r1_D32, m2_32s, new_P, r1_P32, divs32, 0)
     F(0xb30d, DEBR,    RRE,   Z,   e1, e2, new, e1, deb, 0, IF_BFP)
     F(0xb31d, DDBR,    RRE,   Z,   f1, f2, new, f1, ddb, 0, IF_BFP)
-    F(0xb34d, DXBR,    RRE,   Z,   x2h, x2l, x1, x1, dxb, 0, IF_BFP)
+    F(0xb34d, DXBR,    RRE,   Z,   x1, x2, new_x, x1, dxb, 0, IF_BFP)
     F(0xed0d, DEB,     RXE,   Z,   e1, m2_32u, new, e1, deb, 0, IF_BFP)
     F(0xed1d, DDB,     RXE,   Z,   f1, m2_64, new, f1, ddb, 0, IF_BFP)
 /* DIVIDE LOGICAL */
@@ -597,7 +597,7 @@
 /* LOAD FP INTEGER */
     F(0xb357, FIEBR,   RRF_e, Z,   0, e2, new, e1, fieb, 0, IF_BFP)
     F(0xb35f, FIDBR,   RRF_e, Z,   0, f2, new, f1, fidb, 0, IF_BFP)
-    F(0xb347, FIXBR,   RRF_e, Z,   x2h, x2l, new_x, x1, fixb, 0, IF_BFP)
+    F(0xb347, FIXBR,   RRF_e, Z,   0, x2, new_x, x1, fixb, 0, IF_BFP)
 
 /* LOAD LENGTHENED */
     F(0xb304, LDEBR,   RRE,   Z,   0, e2, new, f1, ldeb, 0, IF_BFP)
@@ -610,8 +610,8 @@
     F(0xed24, LDE,     RXE,   Z,   0, m2_32u, new, f1, lde, 0, IF_AFP1)
 /* LOAD ROUNDED */
     F(0xb344, LEDBR,   RRF_e, Z,   0, f2, new, e1, ledb, 0, IF_BFP)
-    F(0xb345, LDXBR,   RRF_e, Z,   x2h, x2l, new, f1, ldxb, 0, IF_BFP)
-    F(0xb346, LEXBR,   RRF_e, Z,   x2h, x2l, new, e1, lexb, 0, IF_BFP)
+    F(0xb345, LDXBR,   RRF_e, Z,   0, x2, new, f1, ldxb, 0, IF_BFP)
+    F(0xb346, LEXBR,   RRF_e, Z,   0, x2, new, e1, lexb, 0, IF_BFP)
 
 /* LOAD MULTIPLE */
     C(0x9800, LM,      RS_a,  Z,   0, a2, 0, 0, lm32, 0)
@@ -666,7 +666,7 @@
     C(0xe384, MG,      RXY_a, MIE2,r1p1_o, m2_64, r1_P, 0, muls128, 0)
     F(0xb317, MEEBR,   RRE,   Z,   e1, e2, new, e1, meeb, 0, IF_BFP)
     F(0xb31c, MDBR,    RRE,   Z,   f1, f2, new, f1, mdb, 0, IF_BFP)
-    F(0xb34c, MXBR,    RRE,   Z,   x2h, x2l, x1, x1, mxb, 0, IF_BFP)
+    F(0xb34c, MXBR,    RRE,   Z,   x1, x2, new_x, x1, mxb, 0, IF_BFP)
     F(0xb30c, MDEBR,   RRE,   Z,   f1, e2, new, f1, mdeb, 0, IF_BFP)
     F(0xb307, MXDBR,   RRE,   Z,   0, f2, x1, x1, mxdb, 0, IF_BFP)
     F(0xed17, MEEB,    RXE,   Z,   e1, m2_32u, new, e1, meeb, 0, IF_BFP)
@@ -835,7 +835,7 @@
 /* SQUARE ROOT */
     F(0xb314, SQEBR,   RRE,   Z,   0, e2, new, e1, sqeb, 0, IF_BFP)
     F(0xb315, SQDBR,   RRE,   Z,   0, f2, new, f1, sqdb, 0, IF_BFP)
-    F(0xb316, SQXBR,   RRE,   Z,   x2h, x2l, new_x, x1, sqxb, 0, IF_BFP)
+    F(0xb316, SQXBR,   RRE,   Z,   0, x2, new_x, x1, sqxb, 0, IF_BFP)
     F(0xed14, SQEB,    RXE,   Z,   0, m2_32u, new, e1, sqeb, 0, IF_BFP)
     F(0xed15, SQDB,    RXE,   Z,   0, m2_64, new, f1, sqdb, 0, IF_BFP)
 
@@ -913,7 +913,7 @@
     C(0xe319, SGF,     RXY_a, Z,   r1, m2_32s, r1, 0, sub, subs64)
     F(0xb30b, SEBR,    RRE,   Z,   e1, e2, new, e1, seb, f32, IF_BFP)
     F(0xb31b, SDBR,    RRE,   Z,   f1, f2, new, f1, sdb, f64, IF_BFP)
-    F(0xb34b, SXBR,    RRE,   Z,   x2h, x2l, x1, x1, sxb, f128, IF_BFP)
+    F(0xb34b, SXBR,    RRE,   Z,   x1, x2, new_x, x1, sxb, f128, IF_BFP)
     F(0xed0b, SEB,     RXE,   Z,   e1, m2_32u, new, e1, seb, f32, IF_BFP)
     F(0xed1b, SDB,     RXE,   Z,   f1, m2_64, new, f1, sdb, f64, IF_BFP)
 /* SUBTRACT HALFWORD */
@@ -957,7 +957,7 @@
 /* TEST DATA CLASS */
     F(0xed10, TCEB,    RXE,   Z,   e1, a2, 0, 0, tceb, 0, IF_BFP)
     F(0xed11, TCDB,    RXE,   Z,   f1, a2, 0, 0, tcdb, 0, IF_BFP)
-    F(0xed12, TCXB,    RXE,   Z,   0, a2, x1, 0, tcxb, 0, IF_BFP)
+    F(0xed12, TCXB,    RXE,   Z,   x1, a2, 0, 0, tcxb, 0, IF_BFP)
 
 /* TEST DECIMAL */
     C(0xebc0, TP,      RSL,   E2,  la1, 0, 0, 0, tp, 0)
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index 13be44499b..0bdab5bcf7 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -39,6 +39,11 @@ static inline Int128 RET128(float128 f)
     return int128_make128(f.low, f.high);
 }
 
+static inline float128 ARG128(Int128 i)
+{
+    return make_float128(int128_gethi(i), int128_getlo(i));
+}
+
 uint8_t s390_softfloat_exc_to_ieee(unsigned int exc)
 {
     uint8_t s390_exc = 0;
@@ -227,12 +232,9 @@ uint64_t HELPER(adb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP addition */
-Int128 HELPER(axb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+Int128 HELPER(axb)(CPUS390XState *env, Int128 a, Int128 b)
 {
-    float128 ret = float128_add(make_float128(ah, al),
-                                make_float128(bh, bl),
-                                &env->fpu_status);
+    float128 ret = float128_add(ARG128(a), ARG128(b), &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return RET128(ret);
 }
@@ -254,12 +256,9 @@ uint64_t HELPER(sdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP subtraction */
-Int128 HELPER(sxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+Int128 HELPER(sxb)(CPUS390XState *env, Int128 a, Int128 b)
 {
-    float128 ret = float128_sub(make_float128(ah, al),
-                                make_float128(bh, bl),
-                                &env->fpu_status);
+    float128 ret = float128_sub(ARG128(a), ARG128(b), &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return RET128(ret);
 }
@@ -281,12 +280,9 @@ uint64_t HELPER(ddb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP division */
-Int128 HELPER(dxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+Int128 HELPER(dxb)(CPUS390XState *env, Int128 a, Int128 b)
 {
-    float128 ret = float128_div(make_float128(ah, al),
-                                make_float128(bh, bl),
-                                &env->fpu_status);
+    float128 ret = float128_div(ARG128(a), ARG128(b), &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return RET128(ret);
 }
@@ -317,21 +313,18 @@ uint64_t HELPER(mdeb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP multiplication */
-Int128 HELPER(mxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+Int128 HELPER(mxb)(CPUS390XState *env, Int128 a, Int128 b)
 {
-    float128 ret = float128_mul(make_float128(ah, al),
-                                make_float128(bh, bl),
-                                &env->fpu_status);
+    float128 ret = float128_mul(ARG128(a), ARG128(b), &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return RET128(ret);
 }
 
 /* 128/64-bit FP multiplication */
-Int128 HELPER(mxdb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t f2)
+Int128 HELPER(mxdb)(CPUS390XState *env, Int128 a, uint64_t f2)
 {
     float128 ret = float64_to_float128(f2, &env->fpu_status);
-    ret = float128_mul(make_float128(ah, al), ret, &env->fpu_status);
+    ret = float128_mul(ARG128(a), ret, &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return RET128(ret);
 }
@@ -345,11 +338,10 @@ uint64_t HELPER(ldeb)(CPUS390XState *env, uint64_t f2)
 }
 
 /* convert 128-bit float to 64-bit float */
-uint64_t HELPER(ldxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                      uint32_t m34)
+uint64_t HELPER(ldxb)(CPUS390XState *env, Int128 a, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float64 ret = float128_to_float64(make_float128(ah, al), &env->fpu_status);
+    float64 ret = float128_to_float64(ARG128(a), &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -384,11 +376,10 @@ uint64_t HELPER(ledb)(CPUS390XState *env, uint64_t f2, uint32_t m34)
 }
 
 /* convert 128-bit float to 32-bit float */
-uint64_t HELPER(lexb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                      uint32_t m34)
+uint64_t HELPER(lexb)(CPUS390XState *env, Int128 a, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float32 ret = float128_to_float32(make_float128(ah, al), &env->fpu_status);
+    float32 ret = float128_to_float32(ARG128(a), &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -412,11 +403,9 @@ uint32_t HELPER(cdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP compare */
-uint32_t HELPER(cxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+uint32_t HELPER(cxb)(CPUS390XState *env, Int128 a, Int128 b)
 {
-    FloatRelation cmp = float128_compare_quiet(make_float128(ah, al),
-                                               make_float128(bh, bl),
+    FloatRelation cmp = float128_compare_quiet(ARG128(a), ARG128(b),
                                                &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return float_comp_to_cc(env, cmp);
@@ -564,10 +553,10 @@ uint64_t HELPER(cgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 }
 
 /* convert 128-bit float to 64-bit int */
-uint64_t HELPER(cgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
+uint64_t HELPER(cgxb)(CPUS390XState *env, Int128 i2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float128 v2 = make_float128(h, l);
+    float128 v2 = ARG128(i2);
     int64_t ret = float128_to_int64(v2, &env->fpu_status);
     uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
@@ -613,10 +602,10 @@ uint64_t HELPER(cfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 }
 
 /* convert 128-bit float to 32-bit int */
-uint64_t HELPER(cfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
+uint64_t HELPER(cfxb)(CPUS390XState *env, Int128 i2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float128 v2 = make_float128(h, l);
+    float128 v2 = ARG128(i2);
     int32_t ret = float128_to_int32(v2, &env->fpu_status);
     uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
@@ -662,10 +651,10 @@ uint64_t HELPER(clgdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 }
 
 /* convert 128-bit float to 64-bit uint */
-uint64_t HELPER(clgxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
+uint64_t HELPER(clgxb)(CPUS390XState *env, Int128 i2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float128 v2 = make_float128(h, l);
+    float128 v2 = ARG128(i2);
     uint64_t ret = float128_to_uint64(v2, &env->fpu_status);
     uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
@@ -711,10 +700,10 @@ uint64_t HELPER(clfdb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
 }
 
 /* convert 128-bit float to 32-bit uint */
-uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
+uint64_t HELPER(clfxb)(CPUS390XState *env, Int128 i2, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float128 v2 = make_float128(h, l);
+    float128 v2 = ARG128(i2);
     uint32_t ret = float128_to_uint32(v2, &env->fpu_status);
     uint32_t cc = set_cc_conv_f128(v2, &env->fpu_status);
 
@@ -750,11 +739,10 @@ uint64_t HELPER(fidb)(CPUS390XState *env, uint64_t f2, uint32_t m34)
 }
 
 /* round to integer 128-bit */
-Int128 HELPER(fixb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint32_t m34)
+Int128 HELPER(fixb)(CPUS390XState *env, Int128 a, uint32_t m34)
 {
     int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
-    float128 ret = float128_round_to_int(make_float128(ah, al),
-                                         &env->fpu_status);
+    float128 ret = float128_round_to_int(ARG128(a), &env->fpu_status);
 
     s390_restore_bfp_rounding_mode(env, old_mode);
     handle_exceptions(env, xxc_from_m34(m34), GETPC());
@@ -778,11 +766,9 @@ uint32_t HELPER(kdb)(CPUS390XState *env, uint64_t f1, uint64_t f2)
 }
 
 /* 128-bit FP compare and signal */
-uint32_t HELPER(kxb)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                     uint64_t bh, uint64_t bl)
+uint32_t HELPER(kxb)(CPUS390XState *env, Int128 a, Int128 b)
 {
-    FloatRelation cmp = float128_compare(make_float128(ah, al),
-                                         make_float128(bh, bl),
+    FloatRelation cmp = float128_compare(ARG128(a), ARG128(b),
                                          &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return float_comp_to_cc(env, cmp);
@@ -869,9 +855,9 @@ uint32_t HELPER(tcdb)(CPUS390XState *env, uint64_t v1, uint64_t m2)
 }
 
 /* test data class 128-bit */
-uint32_t HELPER(tcxb)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t m2)
+uint32_t HELPER(tcxb)(CPUS390XState *env, Int128 a, uint64_t m2)
 {
-    return (m2 & float128_dcmask(env, make_float128(ah, al))) != 0;
+    return (m2 & float128_dcmask(env, ARG128(a))) != 0;
 }
 
 /* square root 32-bit */
@@ -891,9 +877,9 @@ uint64_t HELPER(sqdb)(CPUS390XState *env, uint64_t f2)
 }
 
 /* square root 128-bit */
-Int128 HELPER(sqxb)(CPUS390XState *env, uint64_t ah, uint64_t al)
+Int128 HELPER(sqxb)(CPUS390XState *env, Int128 a)
 {
-    float128 ret = float128_sqrt(make_float128(ah, al), &env->fpu_status);
+    float128 ret = float128_sqrt(ARG128(a), &env->fpu_status);
     handle_exceptions(env, false, GETPC());
     return RET128(ret);
 }
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 0a750a5467..d422a1e62b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -305,6 +305,18 @@ static TCGv_i64 load_freg32_i64(int reg)
     return r;
 }
 
+static TCGv_i128 load_freg_128(int reg)
+{
+    TCGv_i64 h = load_freg(reg);
+    TCGv_i64 l = load_freg(reg + 2);
+    TCGv_i128 r = tcg_temp_new_i128();
+
+    tcg_gen_concat_i64_i128(r, l, h);
+    tcg_temp_free_i64(h);
+    tcg_temp_free_i64(l);
+    return r;
+}
+
 static void store_reg(int reg, TCGv_i64 v)
 {
     tcg_gen_mov_i64(regs[reg], v);
@@ -1103,7 +1115,7 @@ typedef struct {
     bool g_out, g_out2, g_in1, g_in2;
     TCGv_i64 out, out2, in1, in2;
     TCGv_i64 addr1;
-    TCGv_i128 out_128;
+    TCGv_i128 out_128, in1_128, in2_128;
 } DisasOps;
 
 /* Instructions can place constraints on their operands, raising specification
@@ -1462,7 +1474,7 @@ static DisasJumpType op_adb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_axb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_axb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_axb(o->out_128, cpu_env, o->in1_128, o->in2_128);
     return DISAS_NEXT;
 }
 
@@ -1778,7 +1790,7 @@ static DisasJumpType op_cdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_cxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_cxb(cc_op, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_cxb(cc_op, cpu_env, o->in1_128, o->in2_128);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -1841,7 +1853,7 @@ static DisasJumpType op_cfxb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_cfxb(o->out, cpu_env, o->in1, o->in2, m34);
+    gen_helper_cfxb(o->out, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -1880,7 +1892,7 @@ static DisasJumpType op_cgxb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_cgxb(o->out, cpu_env, o->in1, o->in2, m34);
+    gen_helper_cgxb(o->out, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -1919,7 +1931,7 @@ static DisasJumpType op_clfxb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_clfxb(o->out, cpu_env, o->in1, o->in2, m34);
+    gen_helper_clfxb(o->out, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -1958,7 +1970,7 @@ static DisasJumpType op_clgxb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_clgxb(o->out, cpu_env, o->in1, o->in2, m34);
+    gen_helper_clgxb(o->out, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     set_cc_static(s);
     return DISAS_NEXT;
@@ -2445,7 +2457,7 @@ static DisasJumpType op_ddb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_dxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_dxb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_dxb(o->out_128, cpu_env, o->in1_128, o->in2_128);
     return DISAS_NEXT;
 }
 
@@ -2550,7 +2562,7 @@ static DisasJumpType op_fixb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_fixb(o->out_128, cpu_env, o->in1, o->in2, m34);
+    gen_helper_fixb(o->out_128, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
@@ -2769,7 +2781,7 @@ static DisasJumpType op_kdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_kxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_kxb(cc_op, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_kxb(cc_op, cpu_env, o->in1_128, o->in2_128);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -2843,7 +2855,7 @@ static DisasJumpType op_ldxb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_ldxb(o->out, cpu_env, o->in1, o->in2, m34);
+    gen_helper_ldxb(o->out, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
@@ -2855,7 +2867,7 @@ static DisasJumpType op_lexb(DisasContext *s, DisasOps *o)
     if (!m34) {
         return DISAS_NORETURN;
     }
-    gen_helper_lexb(o->out, cpu_env, o->in1, o->in2, m34);
+    gen_helper_lexb(o->out, cpu_env, o->in2_128, m34);
     tcg_temp_free_i32(m34);
     return DISAS_NEXT;
 }
@@ -3584,13 +3596,13 @@ static DisasJumpType op_mdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_mxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_mxb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_mxb(o->out_128, cpu_env, o->in1_128, o->in2_128);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_mxdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_mxdb(o->out_128, cpu_env, o->out, o->out2, o->in2);
+    gen_helper_mxdb(o->out_128, cpu_env, o->in1_128, o->in2);
     return DISAS_NEXT;
 }
 
@@ -4055,7 +4067,7 @@ static DisasJumpType op_sdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_sxb(o->out_128, cpu_env, o->out, o->out2, o->in1, o->in2);
+    gen_helper_sxb(o->out_128, cpu_env, o->in1_128, o->in2_128);
     return DISAS_NEXT;
 }
 
@@ -4073,7 +4085,7 @@ static DisasJumpType op_sqdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_sqxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_sqxb(o->out_128, cpu_env, o->in1, o->in2);
+    gen_helper_sqxb(o->out_128, cpu_env, o->in2_128);
     return DISAS_NEXT;
 }
 
@@ -4852,7 +4864,7 @@ static DisasJumpType op_tcdb(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_tcxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tcxb(cc_op, cpu_env, o->out, o->out2, o->in2);
+    gen_helper_tcxb(cc_op, cpu_env, o->in1_128, o->in2);
     set_cc_static(s);
     return DISAS_NEXT;
 }
@@ -5387,8 +5399,6 @@ static void prep_new_P(DisasContext *s, DisasOps *o)
 
 static void prep_new_x(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_temp_new_i64();
-    o->out2 = tcg_temp_new_i64();
     o->out_128 = tcg_temp_new_i128();
 }
 #define SPEC_prep_new_x 0
@@ -5411,10 +5421,7 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
 
 static void prep_x1(DisasContext *s, DisasOps *o)
 {
-    o->out = load_freg(get_field(s, r1));
-    o->out2 = load_freg(get_field(s, r1) + 2);
-    o->out_128 = tcg_temp_new_i128();
-    tcg_gen_concat_i64_i128(o->out_128, o->out2, o->out);
+    o->out_128 = load_freg_128(get_field(s, r1));
 }
 #define SPEC_prep_x1 SPEC_r1_f128
 
@@ -5513,6 +5520,11 @@ static void wout_x1(DisasContext *s, DisasOps *o)
 {
     int f1 = get_field(s, r1);
 
+    /* Split out_128 into out+out2 for cout_f128. */
+    tcg_debug_assert(o->out == NULL);
+    o->out = tcg_temp_new_i64();
+    o->out2 = tcg_temp_new_i64();
+
     tcg_gen_extr_i128_i64(o->out2, o->out, o->out_128);
     store_freg(f1, o->out);
     store_freg(f1 + 2, o->out2);
@@ -5755,6 +5767,12 @@ static void in1_f1(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in1_f1 0
 
+static void in1_x1(DisasContext *s, DisasOps *o)
+{
+    o->in1_128 = load_freg_128(get_field(s, r1));
+}
+#define SPEC_in1_x1 SPEC_r1_f128
+
 /* Load the high double word of an extended (128-bit) format FP number */
 static void in1_x2h(DisasContext *s, DisasOps *o)
 {
@@ -5964,6 +5982,12 @@ static void in2_f2(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_f2 0
 
+static void in2_x2(DisasContext *s, DisasOps *o)
+{
+    o->in2_128 = load_freg_128(get_field(s, r2));
+}
+#define SPEC_in2_x2 SPEC_r2_f128
+
 /* Load the low double word of an extended (128-bit) format FP number */
 static void in2_x2l(DisasContext *s, DisasOps *o)
 {
@@ -6592,6 +6616,12 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (o.out_128) {
         tcg_temp_free_i128(o.out_128);
     }
+    if (o.in1_128) {
+        tcg_temp_free_i128(o.in1_128);
+    }
+    if (o.in2_128) {
+        tcg_temp_free_i128(o.in2_128);
+    }
     /* io should be the last instruction in tb when icount is enabled */
     if (unlikely(icount && ret == DISAS_NEXT)) {
         ret = DISAS_TOO_MANY;
-- 
2.34.1


