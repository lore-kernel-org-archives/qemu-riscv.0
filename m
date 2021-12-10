Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvao0-0006Bz-Ep
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanr-000660-RS
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:51 -0500
Received: from [2607:f8b0:4864:20::534] (port=39830
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvano-0006ss-Tp
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:50 -0500
Received: by mail-pg1-x534.google.com with SMTP id r5so7387452pgi.6
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQkM/uD8/2L6Yrf+JOvEX7paEGIFda9ZoX2/7ut4A9k=;
 b=SbNlbT/A/nRRd8qnSAgk/Ja2Gmt4qJ1NSedkX3uW5h/BNmVS0Xqcz/72ZwWfg61fd6
 puod2MEONMZ5nRxdsOHErM+4V4tZ+I+P3cRQ/5FX/U9ZOMDFE4UXTDunYMGXs+ec95CJ
 RcgPUyDjxPtD2TFuSlwggSontnUVmrPq1F7gym5wLez/SR9vaCDE8VQgVaFl0VS7Oocb
 5clQsHT/H8hJRca6cSyP8rmUD5N0GoBoWlbnAHjhEsZKh3QjYBy8CUnZvQ4TheHPePeV
 s7HjrOCfjSimkUzK9Bw2yWda4WKONO3/o83XdayyuBlgUeuLxDb0ai8kGCD6ZbuksOEr
 qm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQkM/uD8/2L6Yrf+JOvEX7paEGIFda9ZoX2/7ut4A9k=;
 b=QMCixBOdon8kWlyNaml86+6FbjdLI9onI3EgGU4vm/E47a0VSHHSrchWgs4basi+Hx
 e2vkl+awcxoaWZedonA8FE8gJedjTwUUkeQvmmr2X0Cim986fRiKLqLLHLHm5CcHBXIW
 VYBwpLeu4SDPjaUeux6ghQMLypa8JnpXwyRFOUAjvI+loIdCZzBHeud+ZUXyAPJC90US
 emE5EsdoEbtsw3S+/jyH4bD2q8togfCMyr9tVuTdG72XN3MmxGVgdocR/1tWapLC3jhk
 CfcstcIun4Zh8/G1JdbCNd8JzDtAQsdZJzO/6hE/nG6TxkYNC7o4ggAiicsVoyRdbW34
 W2pA==
X-Gm-Message-State: AOAM531YtKhkD33n5jYkunRR6iu3FKqFf/ZnLXQBdF4Wr0vR3POKI3D/
 puxM6FU89eSaBQ7JtvaJWOl2xQ==
X-Google-Smtp-Source: ABdhPJxFcOXKRrvLhUpv1g90AuM2tw2PgDWUbA4kRViuB3As22fhXa3WVzZQ+SGaciOLJcE5fNNs2A==
X-Received: by 2002:a05:6a00:1389:b0:4ad:528b:bf86 with SMTP id
 t9-20020a056a00138900b004ad528bbf86mr16861099pfg.80.1639123127690; 
 Thu, 09 Dec 2021 23:58:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 29/77] target/riscv: rvv-1.0: count population in mask
 instruction
Date: Fri, 10 Dec 2021 15:56:15 +0800
Message-Id: <20211210075704.23951-30-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b8894d6151..3f30882aec 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1020,7 +1020,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f61eaf7c6b..e748f7ca71 100644
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
index 5c04ac90da..b53cd2e6f3 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2664,8 +2664,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector count population in mask vcpop */
+static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2684,11 +2684,12 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
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
index f9919273dc..9451112b3d 100644
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
2.31.1


