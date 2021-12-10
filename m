Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvap9-0007xG-E9
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvap6-0007pz-K7
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:08 -0500
Received: from [2607:f8b0:4864:20::1036] (port=46895
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvap4-00078F-HK
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so6841041pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABltglpPEiSV0bMZSNNCypN7MRIwuKTdJ/bRF4U97UM=;
 b=a4r6+CcU//S8uYYmMGNpJJTu0C4OPYHfFIsrRRrHy96aA4ulmwX9p3MEW1i4XtJE+c
 FhvFwFDfzb0xhD7CfUjVwoTDvGPvLFAcWQ2+aCCfeYeCwMYlzCdE7XaBrXkQip5ezt6X
 6ytofarXPxuQaSm/464avh4ayWG1+G+cyaLzskCFFEu4IHLLnQqzgG0v2JSq8HQxL8OS
 ZReCvp0hnWoziDCRt0fblP/CRxQ7v4MaPbDrA4tIRhmNU8PPlKTIgLbLKGLpN/T+75Sy
 M3QiIg9rENyWpkQQB60sm1RS0TgNIHGbUuXTKXrVfwKQ9FbJEN3BcTRZyVN8vNAQMMDn
 P80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABltglpPEiSV0bMZSNNCypN7MRIwuKTdJ/bRF4U97UM=;
 b=pLBDKJW4RN/eG4VC17BRUL4AlmowLanDkBkN8SwqWt8b7WQiVJ9pj7y6tEUVh7j5p9
 sRFFMPvGhzmHG7LEZx5x8zvYzwFpXtIddDFjpFJ/uSvPWmTtYLTmYmdGwRROsbEK5D39
 sCMIi5zjKUZYPNjFmcHtmgS2ggRLeOP4EPK3HtEQ50QKkVx1wZaXZ2sDScXCcHXPC+4Y
 L3k21T0O+jkbmukRrZJDNOZncVsNjKERH+gKxNqlg46vN2zDZmPCi+M+QtU0tibxSXSv
 4jv/dT3JOC7TUVmFNTeFZRVClawvoHlgoEZWijL4646cfHd+3pYqo7U7uU0tmeDmHYNL
 u5hA==
X-Gm-Message-State: AOAM530fvh+ABcc3qRkRoW7G+Yt1zMZ/aAD7JUYwL4F1y9IK8HtsOjx4
 dZKEUk5LpBAZPPjQJtfjeF5irA==
X-Google-Smtp-Source: ABdhPJzJjTl924qx8kgOdfZHOKxYHjhpwIInHA5q8V3502oHGX6523KR56n9YRt7CQiighEE37ZdSg==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr21765912pjq.128.1639123204701; 
 Fri, 10 Dec 2021 00:00:04 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 58/77] target/riscv: rvv-1.0: remove integer extract
 instruction
Date: Fri, 10 Dec 2021 15:56:44 +0800
Message-Id: <20211210075704.23951-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:08 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 82484fda75..20b3095f56 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,6 @@ viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
 vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
-vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4c5f813ccf..1ce5a10b6a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2840,8 +2840,6 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
  *** Vector Permutation Instructions
  */
 
-/* Integer Extract Instruction */
-
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
                          int ofs, int sew, bool sign)
 {
@@ -2941,27 +2939,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
     load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
-static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-{
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    TCGv dest = dest_gpr(s, a->rd);
-
-    if (a->rs1 == 0) {
-        /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0, false);
-    } else {
-        /* This instruction ignores LMUL and vector register groups */
-        int vlmax = s->vlen >> (3 + s->sew);
-        vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
-    }
-
-    tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(s, a->rd, dest);
-
-    tcg_temp_free_i64(tmp);
-    return true;
-}
-
 /* Integer Scalar Move Instruction */
 
 static void store_element(TCGv_i64 val, TCGv_ptr base,
-- 
2.31.1


