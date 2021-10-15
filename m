Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxE-00088y-2c
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxC-000824-72
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:34 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxA-0003Jj-JC
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:33 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso1143304pjw.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=nq9NK5F4Z6u6F5pKTCAC6Xb8J2A3O8Us2ZzRXrJTVgUgPMMnFYsiMS4clQeYu0G3h6
 zVgw8JalBsFzTIqniw3FtbbrnFadq00fhvGmsLpa+yIjM8NbxytYl1o33IYGMTcw22Xz
 ePrvLMG/yWLoX9yE/XQicGc85aQiLSL8MDo8+O3g9bXcTYuJqzgDUA+/d3Z9jqsK1TLq
 rQ/D3anQh+JzY6ZXo1WgAEk1NHJtcpMopqpufQEQFWTOy9TeCY73ltw4FYtG6YHQ6uXz
 oRff4dPIDm2TPpmzE7PAbW7E/zizwQIJ+wPQ3vaaOtCVvxs1lm7BZoyEdnt+Kil3iLRZ
 ylXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=WDtPFdUu/uxe5ealpiVPMO+TX6+NxTlMvUMsz9vMr9a1F6Uwotj3js2n5wstd+Vrr5
 U0vFBjzavYhn7O3U90IAHrQYeTcs07Gy4eBxF03AwLzaBN1/NpBXnxj9a+2UuOIf5tFs
 EfptbMlYNJq6kN14vrIzo/sPL+Z6PxhHTNxZl90QN6DzrbRcz7LjIFCvAwm7ugZnkXxv
 xcJ5+7NwMQulyfjf7S2kwMPxw9rd1bHkRQHxmiCuLrckCsBVoB2l+ROdXNWSE6Lrdb7/
 Vl6I33A26OGPXkyoY5Zh0N0goZo2i8Q7LSks2Fqp05cQGH7LcLzdhDIyXZIjJHyRaVqF
 gehw==
X-Gm-Message-State: AOAM533AI64Tg3haxVCm4Q8xxQlQh7pxZVwAOGf/NDvNtLnRiOBHIUyN
 OOkzj4faWnHomzmPTeMbvQBhPQ==
X-Google-Smtp-Source: ABdhPJyw++OghG5Qk7QlgmHG6x00YuEXcWeuCdO5u0Mja5PslUymrKmF0dDGJRVFpbOGWF8JpI5+4g==
X-Received: by 2002:a17:90a:5515:: with SMTP id
 b21mr11782010pji.239.1634284111400; 
 Fri, 15 Oct 2021 00:48:31 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:31 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 27/78] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 15 Oct 2021 15:45:34 +0800
Message-Id: <20211015074627.3957162-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:34 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f21..92a0e6fe51e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.25.1


