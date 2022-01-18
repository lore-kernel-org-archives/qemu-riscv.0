Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dam-0000vP-Im
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9daJ-0000sR-9Q
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:59 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44867
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZb-0007bH-Vx
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 l6-20020a17090a4d4600b001b44bb75a8bso1359035pjh.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUyO5s8ENw2LP2qrVziOGLZWVALkqMJ2OuVxDBZjPqU=;
 b=QFYApEnIp0unUWejFD6kofcxESR6ePuDQL5WzHz1eUuOwhd25oum0fIS0bVX9stTMg
 9D7fP0ovj2bAaSLAuKQbpfHdrXuSfIHts78kjPjK5rFTel95tu221HuEnJLbzE52Uz4Z
 VZrdKzj3fxmnSRVDcRpB4mabVhR9hz69W8T+tjjrRC1H2TJwBxqVTEWHk8DIre4TUvBO
 PmZJy6Yt2wCHBd7cFwFh4KloME1wZR21atci5GkGhWDmq87w3YaNqmfG3qMTgO+BiHDF
 SJEYbHbgVNRYn74fns7liciAq6CFr3wLXa/wrNmLruITZzzEvt2c9u3T0RWY2L3WaM5o
 EbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUyO5s8ENw2LP2qrVziOGLZWVALkqMJ2OuVxDBZjPqU=;
 b=yeCZZEfvV9JXh2oVTGDZn7QSyJfJBxXPsbC1456FwW48MdMV6F3IYEVAknXqxs+1+U
 6Cd0Vx3E8b+Km7dwUyZelGktkE01Z6ckKmcudmZwZFhrm4PjMhZYoT6PxDPUkShCdZxC
 /cUMOVxmbhN0Jn7O7QnnLydGLlLuXkcOvK6elk48LZDsI97FNqIdSx9aNbFKVohtFv2F
 giiPkgEbJqFYyTJKzXQmAWTo9Yxux+ZYkMCsSch8nQQe6fJ9U41UsowvNuiDA0tdOj4C
 /jpoyqP7guKzKpfNU/Bw2oBBTb9ZrznzXj+UngNynl9yePU9GSZRg76LKi+Ml62tXu0z
 +sxQ==
X-Gm-Message-State: AOAM5301ke1q1lYkf9A6ouZ8rM9pIePNvlWp7KQWRLZIz9crBmRJ+ZOa
 tKUL/vJ5WnEmcyn9IZgVC8mwQA==
X-Google-Smtp-Source: ABdhPJxelBnx17VaSOh1TXY6ydy3Rneafv6xnfOnuvNEcpiHi5kTEfpfjyLdpLON4W/grgsjXzaNYQ==
X-Received: by 2002:a17:902:7001:b0:14a:9ab0:5d03 with SMTP id
 y1-20020a170902700100b0014a9ab05d03mr15108156plk.128.1642470370749; 
 Mon, 17 Jan 2022 17:46:10 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 13/17] target/riscv: rvv-1.0: Add Zve32f support for scalar
 fp insns
Date: Tue, 18 Jan 2022 09:45:16 +0800
Message-Id: <20220118014522.13613-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:47:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Zve32f extension requires the scalar processor to implement the F
extension and implement all vector floating-point instructions for
floating-point operands with EEW=32 (i.e., no widening floating-point
operations).

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fd6e74c232..fe4ad5d008 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -66,6 +66,17 @@ static bool require_scale_rvf(DisasContext *s)
     }
 }
 
+static bool require_zve32f(DisasContext *s)
+{
+    /* RVV + Zve32f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve32f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve32f ? s->sew <= MO_32 : true;
+}
+
 static bool require_zve64f(DisasContext *s)
 {
     /* RVV + Zve64f = RVV. */
@@ -2229,6 +2240,7 @@ static bool opfvv_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2310,6 +2322,7 @@ static bool opfvf_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2532,6 +2545,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV instructions ignore vs1 check */
            vext_check_ss(s, a->rd, a->rs2, a->vm) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2598,6 +2612,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_mss(s, a->rd, a->rs1, a->rs2) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2612,6 +2627,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
            vext_check_ms(s, a->rd, a->rs2) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2634,6 +2650,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
@@ -3368,6 +3385,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
@@ -3395,6 +3413,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
+        require_zve32f(s) &&
         require_zve64f(s)) {
         gen_set_rm(s, RISCV_FRM_DYN);
 
@@ -3447,6 +3466,7 @@ static bool fslideup_check(DisasContext *s, arg_rmrr *a)
 {
     return slideup_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -3454,6 +3474,7 @@ static bool fslidedown_check(DisasContext *s, arg_rmrr *a)
 {
     return slidedown_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
-- 
2.31.1


