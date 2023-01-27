Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLVSL-0007pl-77
	for mharc-qemu-riscv@gnu.org; Fri, 27 Jan 2023 15:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pLUGI-0000Y2-4f
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 14:19:46 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pLUGG-0003eL-2c
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 14:19:45 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z13so5999851plg.6
 for <qemu-riscv@nongnu.org>; Fri, 27 Jan 2023 11:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jKhtk5rxl5pbRoYF48eqgFTbbHBid5hhGXVt7A76ZuQ=;
 b=jkrUHGogXM1IVwB7vwddZQamh2RQpgQwLUpkue+ZJvq5+50hN6OdLimYXt4LQCNBZD
 a87nCjYlp23FKW8E9g6F9YFySavQTQ5AwUf6lSL9HW6b7zLXSMpoE9KaYh6yGV+HjeGv
 ZAuU1CFP6iBIdTNrAE5l3dioE9y2LcsaRPFtjE0prKGBhgUMSFpAVIOOv45MsN0MPW7+
 S725RwBjbu/9cQkwDOp966XLaTJtbuk0GqKpLcC+YtvlHL69yh/7dYhWDigorVWgoepZ
 jdWQtn4+QdZAlqQSHHzZJOcOpWX+2u6Cokhh9e5VQhvCouqn8+5CHBjYaCuIz1tbhcGA
 ov2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKhtk5rxl5pbRoYF48eqgFTbbHBid5hhGXVt7A76ZuQ=;
 b=j5YPGOjXWZCG3wNi6nidJrTqSnbW8jjLMt6C66+HYxW1ZIZnvuCSFCOP8+xLo8rewD
 AMlhhuS1dWVZ3HGfwKqiO9Z+ulqa/5nmf1l2PmRd8MeF1EP4rZMccLCgvucmtkx8urFV
 n+pGewAV9oe7+Xc+1fvP7+0HbhceeiXN0Mic+ywHvElRfnyEDG66jJNUexJK4mMYx3hr
 CgDAu4g9gQUQRAykg7HqM5x3sbyNPkblQPs82UDXFWCaCBsbyjjweAdnstrpLSkONCgE
 iMP2hn6IarjP9Gj1PTTLvtKU7pq2k935dMXHychq6WHejSfo5iuZBEiqJXSOIpHAZ3Uu
 6HuA==
X-Gm-Message-State: AO0yUKUiy7PtQ329mjQ5UDKntXDOiAVV96Pkikhpa8PnFvh54kixHxhU
 ya2LVtooZJPAE4LcN/ulPp+o+te12F/R2UZFkWg=
X-Google-Smtp-Source: AK7set94Y9obB3EFPKA5uq3XM0ReUFMnWSHTsvvSoCYinBw075FjFyzJqF6fsIn9wS0qAO0OL3+2rg==
X-Received: by 2002:a17:902:6b89:b0:193:6520:739a with SMTP id
 p9-20020a1709026b8900b001936520739amr5678622plk.46.1674847182142; 
 Fri, 27 Jan 2023 11:19:42 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b00196065e8d78sm3238688pln.50.2023.01.27.11.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 11:19:41 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH: fix for virt instr exception] target/riscv: fix for virtual
 instr exception
Date: Fri, 27 Jan 2023 11:19:38 -0800
Message-Id: <20230127191938.756071-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Jan 2023 15:36:14 -0500
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
X-List-Received-Date: Fri, 27 Jan 2023 19:19:46 -0000

commit fb3f3730e4 added mechanism to generate virtual instruction
exception during instruction decode when virt is enabled.

However in some situations, illegal instruction exception can be raised
due to state of CPU. One such situation is implementing branch tracking.
[1] An indirect branch if doesn't land on a landing pad instruction, then
cpu must raise an illegal instruction exception.
Implementation would raise such expcetion due to missing landing pad inst
and not due to decode. Thus DisasContext must have `virt_inst_excp`
initialized to false during DisasContxt initialization for TB.

[1] - https://github.com/riscv/riscv-cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 target/riscv/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df38db7553..76f61a39d3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
+    ctx->virt_inst_excp = false;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.25.1


