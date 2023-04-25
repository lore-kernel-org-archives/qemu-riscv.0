Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOXs-0002el-B9
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXp-0002dq-S0
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:41:45 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXo-0007KZ-Ar
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:41:45 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2a8ba693f69so59610861fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451703; x=1685043703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
 b=mvExPJBCVtAUA1IGymCoo7ZSxMGWsopnTGT6rFxBaSur5n9mTmWe/O960ts99y5nKw
 LFVGz7mHvOurQnMDhxtYWstTqJPQGdlFgtOTgbXjgbbpue4NpFwhYdHrQf58llj8K3Ih
 dFsj0NC4ZrNYZtY7Kf3AV6C1wy671O1zXTlUvXkLvAsnghaOC24FY5cfTjcw9zlVoMco
 Azb/Ex70IqohHZkwtctPj61tggqHcp/bW4o0JBLVDyIjquplw0zuabGH0xK5dhIStHXd
 rTBFVBoScxtqVH6d7lenAnC9uh2a4SFCO/wTK+9OwbfchBrrku21Kn2tT1c2TAOk3yq1
 QOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451703; x=1685043703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwfQsco1hxF3XHjRYzbNyV4rrRWNhq8it3E+wHc4wxU=;
 b=K+S5+8KK6EywicxHfP5ji2UZl2cSxY+Z61bF74taZJzTcMWj7MFUj1xnqcoeMb4M6w
 82feNwW6AP73gRsGFboF6vscoQaIpVOSH/jbTFPtfUt6+ASZpCQSsrUA+g6ceyIfnT/r
 zmnqq9zha9S/ncqpwku0ZwBDOQLrFpvm5hrIQiXUNA/dHo8TQ2xjwGEC7T0vjQ68sgaY
 XM+zN/+V9ZsMe3zc/IMGdiRWT1WMw5d8A8LJzF8B9fNcuTcfU/XbDE6gSfRh8vCximyF
 iJDo5o1DQjHqU2Z//0pu7P+yZsNECjsuUYXQJVVj9ODgIoPw5TGNdHQAB04nQAu1IbMF
 Gg5g==
X-Gm-Message-State: AAQBX9cJPC1EFhdci8c9R9bmowBT6jiSUEZOG1NY7pbLpipPuFHTvjrf
 jphgS6s06gkI++E6FpHEkVRXyQ==
X-Google-Smtp-Source: AKy350aWkGQVHuE+hrXuduBs/WUQA0efnsftuDi0k2cTnnaBAEcmZ7jOZeuIBqfjnsYtJd0XNC5xTQ==
X-Received: by 2002:ac2:4910:0:b0:4ee:8ff3:c981 with SMTP id
 n16-20020ac24910000000b004ee8ff3c981mr4411726lfi.10.1682451702769; 
 Tue, 25 Apr 2023 12:41:42 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 49/57] tcg/riscv: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:38 +0100
Message-Id: <20230425193146.2106111-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:41:46 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 5193998865..aae0512cbf 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -924,8 +924,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1u << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1


