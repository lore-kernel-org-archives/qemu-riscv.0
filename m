Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZU-0000Ln-UR
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZQ-0000Bh-8J
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:16 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZO-0008El-HB
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:15 -0400
Received: by mail-pg1-x543.google.com with SMTP id t6so4208372pgq.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BL1gLZ55ebPF1CU6VCPP/FzwVosXUicPzzehG55MPU=;
 b=qaRmjisPRMx6Bj6xIKHQ+UdKBYDsba74xVnhAR/AseeiXethgPO4Ue8+YgGEfrVr2S
 NX2L6e6SXP4LBkkNUEUt6Cz3f30tlg80W3cNgAwUs+q7QawJj52t1s+cBp10VvFJ0qZI
 zVOKxeduGUSxDzzRHWZDf9H4grMztliHSmGyLf6OMzmyYJADYwdVk8uXtzdk0oI8sWUr
 VFemrrl8l/PDHOa8zC5rsMKk5+My0bCXP66BogF923FxdpeySyUCTqLYFUEOeRdm+wqc
 xS57ZQuSY1nKS/x42WEj4qKW9kXtMIYvaxDJz3OBQuXDcSep7Na7izjkvH4rirQKw9XE
 peyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BL1gLZ55ebPF1CU6VCPP/FzwVosXUicPzzehG55MPU=;
 b=NJp41wqkf8Z7jqp/gDlCpfyuc87+T6LByHugQaVsVpkatsp1GepTD2nBs8BIXjt4/t
 4xIhZBUHfN46JcVGtGmZiflLdtOUMczaBk5YAzQt0uL5OyxbU2SwUloo7N4n0ASVp5Wm
 akjBneW/GIz0vDsR1khjADme+7AbQ1iGDj3zHvaZDs0Cmgo+H10wFJ0sJcc3uRBcploC
 AESLlyxNbHeuUivvpBNFcfh2xCzgAaCWd1GI1BSejy6aezUrr5y+1zqFGoqPfuMv/Gpv
 gfx0d+Lt71M9FuIXXosgQyeE0vtix8n9AqIjmGayJZ/nRNQ9JUexmKds9burcyz/b2K5
 WQPw==
X-Gm-Message-State: AOAM5315SQgN+EEKThsJH0gdkAdd9/5wKDHkRWIWRtKr7WFgmcz1BZTe
 QLHPkqJigJ6D9SO4INmJp2EjYw==
X-Google-Smtp-Source: ABdhPJwi8c+oFUbvG8EnpiHUGBnDqiPGHTdg0NBAkioxO4MP0/y98SNPP57NWBkGg78qzE4B7MF3dQ==
X-Received: by 2002:a62:8688:: with SMTP id x130mr6546500pfd.280.1595550493032; 
 Thu, 23 Jul 2020 17:28:13 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 3/7] target/riscv: Generate nanboxed results from
 trans_rvf.inc.c
Date: Thu, 23 Jul 2020 17:28:03 -0700
Message-Id: <20200724002807.441147-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 24 Jul 2020 00:28:16 -0000

Make sure that all results from inline single-precision scalar
operations are properly nan-boxed to 64-bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.inc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index c7057482e8..264d3139f1 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -167,6 +167,7 @@ static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
         tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2], cpu_fpr[a->rs1],
                             0, 31);
     }
+    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -183,6 +184,7 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
         tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
         tcg_temp_free_i64(t0);
     }
+    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -199,6 +201,7 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
         tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
         tcg_temp_free_i64(t0);
     }
+    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -369,6 +372,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
 #else
     tcg_gen_extu_i32_i64(cpu_fpr[a->rd], t0);
 #endif
+    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
 
     mark_fs_dirty(ctx);
     tcg_temp_free(t0);
-- 
2.25.1


