Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbd-0002oT-To
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqP-0002jP-QF; Sat, 18 Sep 2021 02:29:03 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqN-0003Jx-RA; Sat, 18 Sep 2021 02:29:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id u18so11854129pgf.0;
 Fri, 17 Sep 2021 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QRXDXMQwweCgm64SVcBNIxVx0nsRm+SoC8VmDFySHHw=;
 b=h0csdlSQX+pMSACNqBvXgwU8mrqNUVymPs4kJufSav+jGV2R+k5P1GlsrRrpScztdz
 CDEFN2p5tSQpE7g5E5eilVFadhdnjosjhvZlDTMeuwd9hXNWEjfLCzpB072cvJm0IrLa
 FkP38iqhB50JiOaxxTr17hDr7zVetyckKChafAopQD12tGXbjoZUHp8m95gUComGuHFY
 NyQ7QcMduhLjTzsdQlNxe4lhBc+rEq71kG0VnV/jD8GLYYUvVzjjAmw7KsYrWG+CiisX
 5+pTc/D7zW1AyFX2W1enm2xU4Jk6d0HCugSg0SVxej6hwZX69624c8v9mRAIOAozreMC
 X5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QRXDXMQwweCgm64SVcBNIxVx0nsRm+SoC8VmDFySHHw=;
 b=mtS9P1c273ABjfPHzpyRPcPhcYMQCNBc73NNr+A/JfJiSzLE5vnIYYymHPdo0Ja4EN
 I/xKsL+ExwnywouzUkoh1rEFeSk2omVj+gS9esEkgfTTLRH1Olr/98zr6FCXJ8VgHrtQ
 z9UPTSWqELBr8F1SxIZadPdxlnWeLP0JQRSRMF8E5xjc87U289btNm5kA0J3GWd5SHYq
 3U+RlL1GYBT7xS9AfcL65zXH83jzQBaypyXjx4CS3tjpXjMA3qh3dNI8/9uRffamu4aH
 6QFYL/pijlOoSi0jNO2LHFNCM3mcVwCbnmNvluue9mdr6RuDlt+KTe17vAuWipWTHWCF
 SN7Q==
X-Gm-Message-State: AOAM531ipAXkBxZBDGp64o7OkJ8qj5TrALZx96sfChKlQQKOGgu6dSSu
 5eUHbcss9Fz3sW4CfldZRVxSMIBC8AlViAJT
X-Google-Smtp-Source: ABdhPJxEBq1KJ5z0k2akN3Tn2k46amuQyD1Ww2SdPB9+5PSMl3jNlUTYtPSFc1XSpli8peVL8t9Nvw==
X-Received: by 2002:a62:76c8:0:b0:3f2:6a5:b8eb with SMTP id
 r191-20020a6276c8000000b003f206a5b8ebmr14307558pfc.58.1631946538120; 
 Fri, 17 Sep 2021 23:28:58 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:28:57 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 03/10] target/riscv: rvb: add cmix/cmov instructions
Date: Sat, 18 Sep 2021 14:28:09 +0800
Message-Id: <20210918062816.7546-4-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:49 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Sep 2021 06:29:03 -0000

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9eff9d5f5c..989ea3c602 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -43,6 +43,7 @@
 &r    rd rs1 rs2
 &r2   rd rs1
 &r2_s rs1 rs2
+&r4   rd rs1 rs2 rs3
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -82,6 +83,7 @@
 @r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
 @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
+@r4      ..... ..  ..... ..... ... ..... ....... &r4 %rs3 %rs2 %rs1 %rd
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @hfence_vvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -693,6 +695,8 @@ sh3add     0010000 .......... 110 ..... 0110011 @r
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
 clmulr     0000101 .......... 010 ..... 0110011 @r
+cmix       .....11 .......... 001 ..... 0110011 @r4
+cmov       .....11 .......... 101 ..... 0110011 @r4
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 1d999929de..ebcbb341cb 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -332,6 +332,32 @@ GEN_TRANS_CLMUL(clmul)
 GEN_TRANS_CLMUL(clmulh)
 GEN_TRANS_CLMUL(clmulr)
 
+static void gen_cmix(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3)
+{
+    tcg_gen_and_tl(arg1, arg1, arg2);
+    tcg_gen_not_tl(arg2, arg2);
+    tcg_gen_and_tl(arg3, arg3, arg2);
+    tcg_gen_or_tl(ret, arg1, arg3);
+}
+
+static void gen_cmov(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3)
+{
+    TCGv zero = tcg_const_tl(0);
+    tcg_gen_movcond_tl(TCG_COND_NE, ret, arg2, zero, arg1, arg3);
+}
+
+static bool trans_cmix(DisasContext *ctx, arg_cmix *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_quat(ctx, a, EXT_NONE, gen_cmix);
+}
+
+static bool trans_cmov(DisasContext *ctx, arg_cmov *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_quat(ctx, a, EXT_NONE, gen_cmov);
+}
+
 #define GEN_SHADD(SHAMT)                                       \
 static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                              \
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74b33fa3c9..0a62666ce7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -395,6 +395,20 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
     return true;
 }
 
+static bool gen_quat(DisasContext *ctx, arg_r4 *a, DisasExtend ext,
+                     void (*func)(TCGv, TCGv, TCGv, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, ext);
+    TCGv src3 = get_gpr(ctx, a->rs3, ext);
+
+    func(dest, src1, src2, src3);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
-- 
2.17.1


