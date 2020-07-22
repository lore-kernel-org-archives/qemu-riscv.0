Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxN-0007c1-6i
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxJ-0007Xi-AY
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:29 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxH-0006Cu-EA
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id x72so870396pfc.6
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aUA4lJ98g9Mf2dTHcPIuDucVxVhO4/F5ZEHerwqnT8U=;
 b=OAMtUsSnc6L3K4q+z6BVT3ggR/EG5O3V6Yf4sKSE1AbSbLp09VcycOM44zxL+ylgCo
 WKCONK1cSLcNK/65GOGYNCAiXB3ItIb8Hg5BOYmXAXGnx5gtv9qgtV2lcNTxpQTniQBQ
 5TL7t3EBy8Vam1Pl6hIzpLjCDSocZ1EXT0OwbpLVEBZyzKCXlCSUz0aCgySn1u4EIGFn
 +jDcfCUFmNS2plNGFO8uu7Ef+7fX3s1ZcZhyMQQOy2j/+74eQ/GtjzXzbtpLDANxHInX
 XwCfqX8CeiDMz3F7HSj3jSiEY9XKx/QgYfXA34SGoEIBm0oqUlMNTK+/kTj0rdhV83om
 PDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aUA4lJ98g9Mf2dTHcPIuDucVxVhO4/F5ZEHerwqnT8U=;
 b=X3N4uE3i93luAes/Nq6JZSNLh/MCkhAkVyFaDNQ/afSAmMAExhNLH7JSi3Pf2RbCiX
 zbO6x4YNlejWQD9cYcUdfI/u87BOxpm3VO5BJDqcdDcD7bbJXJPvFtnGtOvNx0LmkMxr
 IAoPwnJssQHHeVOdrGzrdao2AOQCU4eDfDymNpIF6LTlgs2mzBNdCdHQNJ+7OZnVvncN
 3g/gDQOGNeNCXsekHTa+RK7u6jqH2PKLDdGgufg2hhh+21P+9xP3VJytMIPbN0qfDRlt
 e622b+SZv5YRUkDm0iXDpY+mwVfaLj2M43XVmM4wXWytt3dL1vWTxid2/hWa2F8JHOJs
 Vj7g==
X-Gm-Message-State: AOAM5307XoL7VKWDTZJl2iVIOJRS82qJbXpSONj4FVdUfHsZQEmZ0SiT
 eSRx0Y7Zx13SvqVB+2sfZzVfuQ==
X-Google-Smtp-Source: ABdhPJyVpZsoIkv7uEPQtv3e5A7FFrlxzAnvbDiiCWe50wopv9rhtKrM+sj/KX8i8GQtLdU6Gug+kg==
X-Received: by 2002:a63:140f:: with SMTP id u15mr24630217pgl.94.1595409746223; 
 Wed, 22 Jul 2020 02:22:26 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:25 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 69/76] target/riscv: rvv-0.9: floating-point min/max
 instructions
Date: Wed, 22 Jul 2020 17:16:32 +0800
Message-Id: <20200722091641.8834-70-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 49e6a91859..4c6755db97 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3857,28 +3857,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4, clearl)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8, clearq)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2, clearh)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4, clearl)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8, clearq)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8, clearq)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2, clearh)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4, clearl)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8, clearq)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8, clearq)
-- 
2.17.1


