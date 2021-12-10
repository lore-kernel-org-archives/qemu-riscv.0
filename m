Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvao0-0006BV-7c
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvant-00067G-EF
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:55 -0500
Received: from [2607:f8b0:4864:20::62e] (port=34467
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanr-0006tD-Id
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:53 -0500
Received: by mail-pl1-x62e.google.com with SMTP id y8so5765299plg.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YA+Tz4Gp110HWOnmLA9oky397q/lFm93irn5hgY54A=;
 b=bRFptObG9qasVP9dsqRxUdb5lJsbYA9KSIlhpGX/1tClXdFZWl4z4MM72SJGf4MSr3
 3k7B7M7jHI5u0mhF2c9MItZ/HuHSxffQNIJOfid1LArLbK3xKhiXNq74pAxteNQU+JME
 Y9RSL0cxPyTUaFFFXt/ziY6aGU6rtXqWPQ7IHPHy8eZoqdjiuh46R7tIUsJXVCN+p83R
 v6v72yaXyrrV1s8VkkGMmPVPsJEVmk7z9/iU0ZC8AoaiNjInDKq6T3wA0kIibQRYUVzr
 qwP4b/12nAEEA/7C6o7Ov0OMvVxSMFEXhcquq1a+gCa+H0Q5x/Bby4gqo3D7GnGib4i0
 2Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YA+Tz4Gp110HWOnmLA9oky397q/lFm93irn5hgY54A=;
 b=h9iQPLgnYcjq3DSqxE5Nq28x0DSVRQbbKJjEuS82at5SWIehaeU9VlxI5dxUU9lWuo
 Z1UEL40P0ABxTZ3URZmQMJZVdvwi8pVP9NKGhksC9uURAqqTMaYquh0Y5MSMDToIQQdk
 7blxGWQkIE5flS1ugLAe6xe94soTDXChwwWzWUQJjNgXiWewYdYDSO2f5Ugq9x2/rDwv
 pJaa58cIocYjUQX+8T6vRbRxYNBjm8/O2TC+Enx54PBKE5lxA6LwBtoUlHme91se4jHb
 kA9OwNrfn3J59npuXRVyRU0Gsd+9wiyX6+LjIXyNFCRvIW17Ey9FxvI23ylhoO1Q2ILl
 1oFg==
X-Gm-Message-State: AOAM530b7FxT+8L7LsS5uOlDIKHdfmGp0Ip0wVoyHHDRmvhzdxDwAPrO
 rSANiiic//ehfo2YmDit23C7Xg==
X-Google-Smtp-Source: ABdhPJxsfTYwGxmpy6pq93y45c0XZ0oYH1zKg9oJt0u4CFAoVUG+qGsWLtf8ZWuh2wMFUXSWUzy9jw==
X-Received: by 2002:a17:902:da85:b0:142:11b4:b5c0 with SMTP id
 j5-20020a170902da8500b0014211b4b5c0mr73994357plx.53.1639123130168; 
 Thu, 09 Dec 2021 23:58:50 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 30/77] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Fri, 10 Dec 2021 15:56:16 +0800
Message-Id: <20211210075704.23951-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3f30882aec..7646567eb2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1022,7 +1022,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e748f7ca71..4df2aa9cdd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -628,7 +628,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b53cd2e6f3..3645bb9635 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2696,7 +2696,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2715,7 +2715,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9451112b3d..f97783acf0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4233,9 +4233,9 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
     return cnt;
 }
 
-/* vmfirst find-first-set mask bit*/
-target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
-                               uint32_t desc)
+/* vfirst find-first-set mask bit*/
+target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
+                              uint32_t desc)
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-- 
2.31.1


