Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscr-0006la-Mk
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqg7-0006M3-VV
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:51 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqg6-00074U-Am
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:51 -0400
Received: by mail-pl1-x630.google.com with SMTP id o1so2112552plk.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SKD/DhQEn/UQ94d5S9pD7tK+1lZR6VM2VkYrrkLV7J4=;
 b=ZZj9894HTv+8KxNebQlFTNtA8pQjogyWTDbNLUGX2+fddy4E0IHBMAGAsmpkuq7EAN
 51Q8FkTsepEb4oIOq6Bw3GlT4Ggp0Fup8AMCgUdNcwGR7Pga5NZYhucYZf68cghOExq7
 Db8WM/17bztpm4wnL5a3e2QwQMDz4L+ig3Vo6V0q3+I6EPloxm66Ri4qjppbqMsUC47p
 OTB5MavBV/E1HdpAJASi15+C6nNbFijxWPwgDTcZquwX+HT+rbueHSdG10KEooGnHly1
 TGL6lyMm1SDNm52K3f5vAwFK0E1bnWW1wAim1cqgMRBMHX9bXtgK9MM8UkQswT9EwHhb
 2qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SKD/DhQEn/UQ94d5S9pD7tK+1lZR6VM2VkYrrkLV7J4=;
 b=tKM8dWlKwFx5HXPWHZ8D8NQcVoGnFRg0J0M7KiJdlbhBW4sn3gRkSx/8d/rt4LRx+4
 LltWRxwPRLXAnFITHFtYqacBvZ7r42VAShDgsjUaIjaUYL0FfJ4drwGHuNPkhXSsmXUU
 1Uu4llSXUCsok/8HoGLgD9JoXHGaVa9G9ClGVI3MNzuDPc6Sa3iSyYrTmc2eo73SV53E
 B80wQL7QvpgBvREypG3XswpnZ3A7P9RV+uPPCI+QzkIeCS0hWhvAHb/GHOjgs51MCmNv
 l8sTBBekUYl3+3JyxRo2u/JKqZin8DyYPLAIZasUnRwxByfvf1udr5NglyVPL6JpZ0Wq
 AxNQ==
X-Gm-Message-State: AOAM530gcG4wt6x9pvsedPgCJ4PUCDI0bls6BuXtIVa2r3SgPp8LOyKg
 7UiKYDKZHY2sOwptxXD+5TtMzQ==
X-Google-Smtp-Source: ABdhPJxC36HZ5lLUBYdX9NT2D6ttgRmeUbBXduOf2me3EWc7HpqviGGDERUOd6H5aORz2iaCbIuYYQ==
X-Received: by 2002:a17:902:d70f:: with SMTP id
 w15mr20220275ply.110.1594378489191; 
 Fri, 10 Jul 2020 03:54:49 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 64/65] target/riscv: use softfloat lib float16 comparison
 functions
Date: Fri, 10 Jul 2020 18:49:18 +0800
Message-Id: <20200710104920.13550-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index aac055c6b6..c206b50182 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3969,12 +3969,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,      \
     }                                                            \
 }
 
-static bool float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_w, uint32_t, H4, float32_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_d, uint64_t, H8, float64_eq_quiet)
@@ -4033,12 +4027,6 @@ GEN_VEXT_CMP_VF(vmfne_vf_h, uint16_t, H2, vmfne16)
 GEN_VEXT_CMP_VF(vmfne_vf_w, uint32_t, H4, vmfne32)
 GEN_VEXT_CMP_VF(vmfne_vf_d, uint64_t, H8, vmfne64)
 
-static bool float16_lt(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_d, uint64_t, H8, float64_lt)
@@ -4046,13 +4034,6 @@ GEN_VEXT_CMP_VF(vmflt_vf_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_d, uint64_t, H8, float64_lt)
 
-static bool float16_le(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less ||
-           compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_h, uint16_t, H2, float16_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_w, uint32_t, H4, float32_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_d, uint64_t, H8, float64_le)
-- 
2.17.1


