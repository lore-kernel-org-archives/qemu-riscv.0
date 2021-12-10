Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaou-0007R6-LX
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaos-0007La-G0
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:54 -0500
Received: from [2607:f8b0:4864:20::52d] (port=44842
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoq-00073s-Jt
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:54 -0500
Received: by mail-pg1-x52d.google.com with SMTP id m15so7362269pgu.11
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HUITZUaAtwEvNo+/MfIxPGZXXw2xNVmN7q/6tDHlwU=;
 b=ZETR0f0BRGt4wHuWbzcAuN0wg5kZC1VFjAAn54p5MKzTNn9uF0wjsbOkHH3V2vKlj1
 +5D0Q6FMEXOLvx2CwaFdPouSCtOPy2CIWAIFkO+ZCLM+UTHLdKsGnnnBDQnVCrPvYGrR
 mHbhHMhvtdK9mwg5tU3Mor1sEcdTk9pQkw2ZWydK2XQyABME5CIGFpZdQe1+lfWqmAie
 Sq5Q+G2yBxQ7Ftdz3O5eLeUWNX/UBkRsh0eta9KGiQFQeeMMhQ2uzO264oJW/K0ni7cw
 J32WLJSMFscwU+NTakcJBSD41Ptq5ZhzRAaP2KJscPVIThXgfIUkWh5wv0kKjcBYXR1V
 ayfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HUITZUaAtwEvNo+/MfIxPGZXXw2xNVmN7q/6tDHlwU=;
 b=ztIP5lSuc3ll+W/k/UD5kEXRCBtdPB9wikczsCYJezbCswB2H4+prUHrYA5pf65iwn
 bZKQ3tJO6KfzYFEil9h7G+divyze3Mxg+uoH+9YV6c8xTrUwx5XJYQeuqfXmtqfaZlzm
 MS3MChDW92VTitrjhu8D8P6EkHxLnw0yxt2S10uXLN8IkBCi3xBYAmCD5pUNnFBhj61f
 sswRa6HJV/pkAlyWbDIfP0jJKxqAPk+EC41mkYFFRfUDE3VxA/UJlkFjVgVyD3k+jhQm
 YQ4W0baJKeVe6YSYo0nIbNDaO2BSBIsRsBKfkSYaUKJDKwwGnmMON1f/j8FILF1imGNr
 k7VQ==
X-Gm-Message-State: AOAM533IY9XRheCpLcsAkbW3OBqUvleOzxImEkE4onjRFmXxDtdc10XB
 Cl0WHAlxM1rY27gJ781njWQY0QW9axU4Ldao
X-Google-Smtp-Source: ABdhPJz/4yxxKiei2o+D7fu4TQ8Db7kvZWmesSZ7JCtyOX/OibRsMBSEntTZy4N2mpBwiw8ZgawLIw==
X-Received: by 2002:a05:6a00:ad0:b0:4ac:3d49:d8d with SMTP id
 c16-20020a056a000ad000b004ac3d490d8dmr16691767pfl.25.1639123191435; 
 Thu, 09 Dec 2021 23:59:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 53/77] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Fri, 10 Dec 2021 15:56:39 +0800
Message-Id: <20211210075704.23951-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:54 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 target/riscv/vector_helper.c            | 12 ++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f5588d9832..998247d71d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2637,9 +2637,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
-GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
+static bool freduction_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_check(s, a) &&
+           require_rvf(s);
+}
+
+GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c95c8bd9db..79a2c3ff3a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4173,14 +4173,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum_number)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-- 
2.31.1


