Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTkx-0003cC-5u
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkv-0003XM-IY
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:29 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkt-00034t-RK
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:29 -0500
Received: by mail-pf1-x42f.google.com with SMTP id j12so5302765pfj.12
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZYs26elqaYiAlUapqukWqAxtPc5Pa/77IqPMJUo1CRQ=;
 b=aEmE+DBpMHH9fyFnpERYzU9acnv+eoZPCIUw0qN+PZZre53Pe2oEbygZau8OVqpl5R
 ehJeCXwG9xGKCsVVt1kcE8xt0rdtcsD5z7LYhGe6Z7VA9mT0ReTPRjk7Qu85YLGPZtcE
 AXJZLH+wekR2xJYU9o9Kdod7ZyV7yBWJ9k8C229cb3z9/og/tExNoMdq0b0UUe3CteGD
 G6jCz0o/g4ZRqA5E89CpegfcxgSGy2gwEW2oD3tBVCPBPM0SACfzIKgWKR4pgQy/WQKf
 5FHHAtFu3KVsWqkhXJ311MUiYUsPB8zE7c12a8/czwNLU7NAv98xZMvvdRg04RtlAGOv
 wtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZYs26elqaYiAlUapqukWqAxtPc5Pa/77IqPMJUo1CRQ=;
 b=DmnIFJcTDdB4Tk9iOkhLMR/wV/6TSUSdOmIuqzcPcmaR1E6wFlXd2fr4XpvqY2+56o
 deEd89II1KgRHj1GDOjEFrFxfv0ovSRj8hyW9ROAXPGWMdA/ROjLkPrGvcVvOKZ64KE7
 YFjFpno+AqjlQS9W9lmfv3AbwG6llnHyBqu5+27CCieVnSHXXjhX7XmqRPn5FdBt3qeZ
 iP+HtE0K6cN5XgirJhv0+8zcHjVLxK6UGYjjVXIEz36hahK6njrAbILKUuqAPXAeH+/u
 CN9LagjNQeGFdanL7GVodVjfP4sSL3fR9Sr7XIbvIKKAytJ8neoCfYycT5BWdzz95FuJ
 OIUA==
X-Gm-Message-State: AOAM532EnM7oC9Ha8lZow5jmc5CeWyoHlzA6Ry0qzo8mAMYwYjTbrqp4
 RBG75dn2fy9y97/MgFYk7yjb0A==
X-Google-Smtp-Source: ABdhPJwulzLciBpZIKl4vn1wBR8Tffhg+dH9TTgFwamVU0gVTl/C6xwBekuRCa7KuMoAL+soXEZ3oQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr1062038pgl.46.1614309926630;
 Thu, 25 Feb 2021 19:25:26 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 67/75] target/riscv: rvv-1.0: set mstatus.SD bit when
 writing vector CSRs
Date: Fri, 26 Feb 2021 11:18:51 +0800
Message-Id: <20210226031902.23656-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aa76da9e185..e0f1106d909 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -293,7 +293,7 @@ static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = val;
@@ -312,7 +312,7 @@ static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxsat = val;
@@ -331,7 +331,7 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     /*
@@ -354,7 +354,7 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
-- 
2.17.1


