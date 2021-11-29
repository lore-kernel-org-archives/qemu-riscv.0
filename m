Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX2o-0003gf-7D
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2k-0003WW-O9
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:26 -0500
Received: from [2607:f8b0:4864:20::52d] (port=42550
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2i-0000ra-Ql
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:26 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s37so4832452pga.9
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1ozsGpUYk5C8kuWugGPIckjkJ1AyXps0Wulk51YZ2k=;
 b=iSUEG0R8Bp8hbPAE63e/qlRmC3DElrpQUx0M1/sdhwNSITedP9jgOXsQ7ihsPogKv3
 ViNGylyOVIBEBTlYfmdpCwjz9TErIepGec4rlLu4FRMnPrwFR44n/2EpzLamxG1MiZ4m
 PGXplBLWnpzAiupiw5RpuO7gixkdmgH52nf35DSQ+y54LNpcFI2kbjVatfmPW64lglyu
 /Jm4hTX4DjBsb+Hq2iRZcppcXWrJrkY2Bd7PWtyONsuR2oxRYZyXVOS9SpX9GvVoe0jD
 Z+UPX00BBaY6IXszvALCLzI0RinU7l6RZ7x0LGOgBmQb6VgASazakReiQTRRPUfTa9h6
 EEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1ozsGpUYk5C8kuWugGPIckjkJ1AyXps0Wulk51YZ2k=;
 b=ChsDE3AExSlcvTBfim6d4pYB90UTXw9bQ/JKUzcxE+o/vDLlqR2Kb0LdunmXr71gUO
 rTGGMFfJp215pzzijKCV8Whzu2yrdnK7eEavAmc23Ob68VcSizrNZDz0m0Pt99sS64sT
 L/zvkmZ0cnwqulG7iXPt0WalpfUYfaaVYo85RMp6VfDk3XY27c8UUq0qpd/K9bmjbo9/
 uy2gn7EiuIHgeYs626uosSxL7BIuvrFsPolCU9j9cp4TrsYoNGsDvrjOr5i5rTwfN3xA
 foyNUEHkgMA+ygcDCdB1CRkVjoMmKT/kTDYmVHs2g28TX/n/8D6PjyfYYwCREqi1zAeX
 c0DQ==
X-Gm-Message-State: AOAM53054z7N8gaoh1E493Eurmy5Xs+EkXRQaMXExhqSFuKC9WzJ+hUu
 0onX0fDOUIDNfanO+GAMfmuAOg==
X-Google-Smtp-Source: ABdhPJzVpD1ZObyLDHCbrhEdyzojRLoUmTz7xhfdSQ9sQRs62nckrLyMt08RNubFHmjVkE26afxFtA==
X-Received: by 2002:a05:6a00:7cc:b0:49f:9cf1:2969 with SMTP id
 n12-20020a056a0007cc00b0049f9cf12969mr36916670pfu.12.1638155363513; 
 Sun, 28 Nov 2021 19:09:23 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 59/77] target/riscv: rvv-1.0: floating-point min/max
 instructions
Date: Mon, 29 Nov 2021 11:03:19 +0800
Message-Id: <20211129030340.429689-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
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
X-List-Received-Date: Mon, 29 Nov 2021 03:09:27 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index aed230e1ad8..cc95b692558 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3387,28 +3387,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8)
-- 
2.25.1


