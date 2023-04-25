Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOY9-0002uq-6j
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOY5-0002sO-SI
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:42:01 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOY1-0007PC-TV
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:42:01 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ecb137af7eso6394607e87.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451716; x=1685043716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
 b=xxnsD/5iYNTQXjenHapynSfAap13xr+jjgBEdvb08p27sjZayHxEqX4RF+2MnAdWMA
 wAqytipEkSAw7AuHPP1N+JC9o6tqW3NpSdl+T08V8AkSpenMdmSU7NODAoNiOrRTvHkq
 psxqH5kP/qSaqBQpcZFPpLDNMQfq9O3NkRnjilu7fakeSN+M2sK5YJVwsppwKx1uzdEH
 CvwXv1cGEWBacSp9zdfYuZ1g587adQaBPe52gfnTfXDJ52bLL0PZ3ziixJEYtGccPgpN
 Ji45ENUzfVZOrcWjMVwNyxXGpdUEkWlORJL+AiZYVfCJ9dphaIf3ABli6GKMPEsQxiLc
 2GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451716; x=1685043716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
 b=ebsO7xy15WmTmxwvWl3N91ur0l+ZpuoQZFdau0UiyQn0u3vd0fveN4ijIoFdJAIJRW
 c9GuZIUxAXssYmERX2CBVTHQ9G4ToCc7rOKF9BI+47CUtoG1wydGKSxUF6kP5fgrZ3Ae
 /SvmUG07JjEotP2q6DqeX6YBVy8ECwn00k7ZAFEeCMuMfoZ44eKt8YNaVX9C2gD7PvP3
 6XKNwhU6/ucV2EctkDecqnH4GEMguq7Yo/mIC/j+cXiXJEwZOmHeTtRYgQXL21Dr3dxE
 UU6kQxP7xv5yuJZj91V1tYQiAsNn/ttDZvREewEHy5zAXstYKhMv2FTY0yayxsIe3Qko
 dpjA==
X-Gm-Message-State: AAQBX9d+YUi2ZbfjAk2iAsRdKmimu5jkDFbCBCR69YT6zQH6v3TU3PXs
 tBJoMgTYQgPqZiRVTt/ifAemZw==
X-Google-Smtp-Source: AKy350bd/9gSuB1QSqpDIUwqwGX2VoH5mXNRf3MEZTG4aHNY9xg4L4cvOkPFNHgno1kNJj4ppiUr9w==
X-Received: by 2002:a05:6512:909:b0:4eb:dd2:f3d2 with SMTP id
 e9-20020a056512090900b004eb0dd2f3d2mr4950709lft.43.1682451716518; 
 Tue, 25 Apr 2023 12:41:56 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 51/57] tcg/sparc64: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:40 +0100
Message-Id: <20230425193146.2106111-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12c.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:42:02 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index bb23038529..4f9ec02b1f 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
+    MemOp s_bits = opc & MO_SIZE;
+    MemOp a_bits, atom_a, atom_u;
     unsigned a_mask;
 
     /* We don't support unaligned accesses. */
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
     a_bits = MAX(a_bits, s_bits);
     a_mask = (1u << a_bits) - 1;
 
-- 
2.34.1


