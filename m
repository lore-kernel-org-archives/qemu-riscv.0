Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OSk-00029R-R3
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:13:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSe-000241-O0
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:13:05 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40753
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSb-0001UN-LN
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:13:02 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q3so13224575pfs.7
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QmhziBsG5pFpMldyIeZwYZC1awxwL5wfWwunsysBLg=;
 b=AULAP8cXv0+NHR1o83OvIQhwBygfaCuT+9lgt9nC5kXF5pmO0VfmEQEphjvIXaOtVh
 3sNXPZOgX5bC0PS7/HjvOrgQ6pN6Esu9M4mcjfesD6IS+4Vj1XZgdfLb/+QkAEq7SxAj
 hJJOHatxOHUgefE9nf6ZgUBmkoo9uvsj3feT84U7QwXZCeHUjxI162kgZYyu0vQK7zHP
 KRLiztgcI/lge47gnd59656yrLhjBJhH3SCRP/178vLpfp0jpmzuxJHbH6m2675TOfQx
 7yIP2TAnPmtvNUY7nAObAED57JvNKv6cVpMBssVn8ciVHa8WukT114Q6YHZXY4WC+pf7
 WqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QmhziBsG5pFpMldyIeZwYZC1awxwL5wfWwunsysBLg=;
 b=uiOrlZqopGhYnjSMZvzbo+V4i5bq1/UFkuPasW3ajXYms9bhY7ZIdx5vvJtCxCNarJ
 a2Jh0hPLNj0+dBn73rswkiAPkC62zi7LpciJe436RN70N/NNXzlPFt2ZV45FKy4q0YJB
 Yr73QXuyi5Z0Q1FaRKH/eOllc5XKyn2WYr4IRwMFI3u5EJ3ynVewI/yZeZW3lz1uU/fs
 hfEPQt5aSp728Y8DTNgDz+zCGC0L8TVIGUZs8aJi1Hsj0XiDxwY+bUH+zmTFFe4cpdIF
 8XO+U+tjDyYO+EkTxOTwF/2Ef6ipqrUkOtKwJAPqlSAyzTrQNj5qGzGQ6yw5pkhtp9eo
 F71g==
X-Gm-Message-State: AOAM530NzenyEE9yf0kP46MgLNY0WWvdiJjHA9UbxqkNnC0F6hZVX24c
 4KMLk774cjDfY/2jmR0CcAEeKw==
X-Google-Smtp-Source: ABdhPJzILEo0z8Ar3oP4qNQQz3wddmWm21XKAl6YFJZ/wjPXPf/ooxFA3eFsVsXRVTfwLIjVrkaN5w==
X-Received: by 2002:a05:6a00:1310:b0:4b9:f9b8:1f47 with SMTP id
 j16-20020a056a00131000b004b9f9b81f47mr24629372pfu.25.1640743979473; 
 Tue, 28 Dec 2021 18:12:59 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k8sm15693975pjs.53.2021.12.28.18.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:12:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 1/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 funtion for widening fp insns
Date: Wed, 29 Dec 2021 10:12:46 +0800
Message-Id: <20211229021250.29804-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229021250.29804-1-frank.chang@sifive.com>
References: <20211229021250.29804-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:13:06 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector widening floating-point instructions should use
require_scale_rvf() instead of require_rvf() to check whether RVF/RVD is
enabled.
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5e3f7fdb77..8d92243f2b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2254,7 +2254,8 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2292,7 +2293,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
@@ -2321,7 +2323,8 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2359,7 +2362,8 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
-- 
2.31.1


