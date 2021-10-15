Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxL-000050-12
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxJ-0008SF-Q3
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxH-0003Pf-15
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:41 -0400
Received: by mail-pf1-x436.google.com with SMTP id o133so7681627pfg.7
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiNuck6sE2PzaZKsERUCUN1/xfjnCJ9/PYIciR88Jw4=;
 b=C3ZsW+bt10/7Ad1fD9Et57TEI2YuV/4/QQDPEiHS4uzjEDSB6Xc6X9ym0tuRC10/V7
 UlLHDvurxNLL21ZbyQX9bHhArQvptxpHmU0SNQx/mnDavnoakftEHHxx73WoDA3uyvWW
 uZ/dkACxDgiwGcWt54qXWIzM7z8vXesozuou3/uW2Oeq67GGVt84QGLpmR/KNryLvSrK
 o706eWOP42C6fg52sF3W3RZKAGUd2kVtbwPk78YD6TKLdgMqi5pau2XgooQbFhBn4s7F
 qXbi6bxW7wp1Mwjd683h0wZlAbvIGqMAWN6AoMGl/mqD97vbHx/8s6b84k8b2OQgCxtC
 CSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CiNuck6sE2PzaZKsERUCUN1/xfjnCJ9/PYIciR88Jw4=;
 b=wcYjvJY56zdvIRy4Dja5bB/GoApj82GArNYlspJSdIHcuek4wArG4D4NJp2T6K9Ahn
 DUWlEQAT0EIDbmOgo0TS0NZfqzqwfZXBgrKC/XVoJm6hOJKqsQekVLyGfjldQq/hppWA
 i5ql9uWHg5DEJX5+6hzNAzs/gW6yVfrQ1XByCr1ovKdVXIN2LNkQNne1T4ucSvZVX2eL
 eNFFHrT4EyBsfQG58CVME0XrzUX6iZl43ykAjIrP4ZiBtIO3ciuwdVunHcdey3IJ5k/D
 ZhaENKrVKv9on5GpP1eL5vgIge+KddVlQRaOLCscpf+tfyQvz2fxvq9JluJ8F1MnAsej
 2FcA==
X-Gm-Message-State: AOAM5307b9IRVnr6bcd1tnO3ClnJYdDAgmWr6oCfl+xsV19bE+lp17js
 HlQ4esGz+rfG639ZrgWrcgvBhg==
X-Google-Smtp-Source: ABdhPJy7Bupl5q/pEQqt9wRzQMzU4x6Nq8RUBRHtAHU+T+QvTN5ceq25C5tD0VeHh8JDRLYAu9FgVQ==
X-Received: by 2002:a05:6a00:1693:b0:44c:64a3:d318 with SMTP id
 k19-20020a056a00169300b0044c64a3d318mr10357917pfc.81.1634284117732; 
 Fri, 15 Oct 2021 00:48:37 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 29/78] target/riscv: rvv-1.0: count population in mask
 instruction
Date: Fri, 15 Oct 2021 15:45:36 +0800
Message-Id: <20211015074627.3957162-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b8894d61510..3f30882aec4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1020,7 +1020,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f61eaf7c6ba..e748f7ca714 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -627,7 +627,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3ba74cdc403..fc17e57d0f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2663,8 +2663,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector count population in mask vcpop */
+static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2683,11 +2683,12 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vcpop_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
+
         return true;
     }
     return false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f9919273dca..9451112b3da 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4214,9 +4214,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector count population in mask vcpop */
+target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.25.1


