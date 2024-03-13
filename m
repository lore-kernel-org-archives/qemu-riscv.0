Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E3C54E60
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 19:31:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkUKI-0007EB-N2; Wed, 13 Mar 2024 15:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkUJp-0006qW-1S
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 15:31:20 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rkUJl-0002QW-1F
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 15:31:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e6ac00616cso261296b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710358269; x=1710963069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PUZYN/jxC55WgIbgr/YDIPnxwzEfC4uN3+8U/WL+Ts=;
 b=hZ1mtA7wSG29Fp8L2WEsSXXySTSzMXtIPzy1+7p/vUypRNYi3k4z2mpLs/850WUVbz
 HZGKYvYitNEkGYRlMqrFGpr0NVQyseFgPlty5FSKKU8TzlfaGHy0S/16r+bmKeiW6PRD
 tPJb9hXneUZhPzGyOG9fqF/l0VsNgkSzQza+1bNgQx70ntHB0B/FEP40g2NLOWFhX5hE
 MCVD3WRsTKBUMVvfsaCQO6MoNAOTS1BmofBswOLzWP+lijwdNLL1IkOxYPivppbIct0W
 Bk1dNc9kXdzhIYtl4VETpNQPjh5PsK0R1gxiF2rCE6d3bbPQuhQ9P8I98+ypdmXZgLKN
 KXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710358269; x=1710963069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PUZYN/jxC55WgIbgr/YDIPnxwzEfC4uN3+8U/WL+Ts=;
 b=IvCrCF/E/cEhqySWziw1U1IOHezBRdS2QoALMT5DIVKa91L1RsPuAw1loF4Tmp5psC
 T/XTGmc23AFn3ZTk1mZ2yrbTgDINPHRRpx5Eu10f4kUATjTuluKveX/VWpQIhEmkEyis
 rAB32EA3Jss2LYTXts7PaxFW6N7dgwiuNIne0vEizWGMWvEaqatGkDS0JiicMLVMs9Gx
 1191qwV5j5OWe9g6QfbzjeMvJ3jMh4dUSHwD0YYUrBviZZsA4F70ai9e1zNL4IeO70dV
 NcdGAEfiZvwYFvFSebWY5/SKPurOxnHg3kHJ5l32a6tkxSY1dzI9m3XLTumpzQxMQwft
 GLwQ==
X-Gm-Message-State: AOJu0YxVs+2qgYwein1m7UG55cL1vxJ6qsaXfemMhRsmaDMvpQD7cx/k
 ddxK8/mqCc4gv2tbmFYSq3sPKbltVoE5nLythb9JnzGsIT5AsC2NJRY6ytXDb5M=
X-Google-Smtp-Source: AGHT+IF+4Tbe4uSyPjFuMsg+bCY723/3U6mX5hoKEfqrjXZJR2lqvkGuGcc31S/VGGCgQxwOMIBqIg==
X-Received: by 2002:a05:6a00:938b:b0:6e6:97b9:1ec3 with SMTP id
 ka11-20020a056a00938b00b006e697b91ec3mr3668406pfb.13.1710358268988; 
 Wed, 13 Mar 2024 12:31:08 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a628e0a000000b006e5a915a9e7sm8912421pfe.10.2024.03.13.12.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 12:31:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v13 1/8] target/riscv/vector_helper.c: set vstart = 0
 in GEN_VEXT_VSLIDEUP_VX()
Date: Wed, 13 Mar 2024 16:30:52 -0300
Message-ID: <20240313193059.405329-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313193059.405329-1-dbarboza@ventanamicro.com>
References: <20240313193059.405329-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The helper isn't setting env->vstart = 0 after its execution, as it is
expected from every vector instruction that completes successfully.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index fe56c007d5..ca79571ae2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4781,6 +4781,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
     }                                                                     \
+    env->vstart = 0;                                                      \
     /* set tail elements to 1s */                                         \
     vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
-- 
2.43.2


