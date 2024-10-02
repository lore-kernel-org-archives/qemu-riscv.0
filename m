Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBA2CF6D28
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 13:57:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1svzrF-0007LI-4Z; Wed, 02 Oct 2024 09:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1svzr0-0007FI-FB
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2024 09:57:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1svzqx-0003Xp-09
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2024 09:57:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37ce8458ae3so3037173f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Oct 2024 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1727877437; x=1728482237; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKy/CyRSVUaBnXxnNttl6Oo4OhYAsB0CU8IGh0o82+4=;
 b=JtlhEycWAVzli2HeBora4alL3cXhk4Ka1XOgG/vDeN57mAWb8d+mJgok5VEQ12HFD8
 rZrxmUr+ltjCbATUjEwQXlvNgMfhcL/t9MnURfz729adD4dfwRbzJLfsVDTSYmJcrDW4
 BOjCQABmqDcBJxv18hs6nudC/zZiT3ZhNkRhYkoCM+C5MR2UdtP+wPoC2621aIGJmXU1
 8PG59ISplDP85AnriQlbsRKV1bH6LfY8StI13E2Rs4/gVw4Z9RuMEfNCGXzbqfFGlV8s
 w4k6pecBJZgH2fWHpM8jfIr/txKRCqWfEDoBowwx8FQNTIXzUW/LGYoopankwisXY+Lt
 J55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727877437; x=1728482237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKy/CyRSVUaBnXxnNttl6Oo4OhYAsB0CU8IGh0o82+4=;
 b=dKvJv3lEdXzTrdYYyLdbSUKYg1mjvBv5RIf5zJb/Me+KPZN+9T9A1B0qgqTKvbMSJf
 eV9IDWMHkAh9HUvLUtoVjl+UggWrWCGlOGjA6HPDiFVkZCY/sQFSqrJl/6ikzwcqrXCl
 V+kngekiQDOVsX6oobR50/pGhmhUWJaeARUuW1FP7pzrlwzZgso0ynMShz4q4oHWgk2F
 9SZlzCPQ1R28UiZHPEm9nZKFY8Er603IQ6lPJnk+5CTEjDJNkr/f7Zt9vxWXt7ULzE3H
 qXQTDlS9yHT+FKeWg8Yb9WZyfp7SOuSnMBdfHEcAAAQd6iEj3W66S+EiyfusScel+LtC
 k29Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBiFKKeWj0fM8SnJR4o/HVCxjctyXy0d/NYxktZ38B40oMbqgfvpNnO4HZKBEZvVKMpjnkH+l4Y1Rg@nongnu.org
X-Gm-Message-State: AOJu0YzRfJ4g4qPz4mPggYCAAuRKgZl5f+3mo7TuA/HMdfqSwHvA/lgE
 1wsWWR9DEA/YF9vL/O1/hiVYHHvgSP/yo+5F+wmQW7qCDwqXADN+wp2xNNzCimk=
X-Google-Smtp-Source: AGHT+IFR39d4gig7DSpI5U0MPULdgJV8iuJ8JxiwkrdcgvKsbu3yx5fSkmPzCk+HmEfGAzfA+S0wNw==
X-Received: by 2002:a5d:4603:0:b0:374:c3cd:73de with SMTP id
 ffacd0b85a97d-37cfb9d4418mr2890448f8f.35.1727877437497; 
 Wed, 02 Oct 2024 06:57:17 -0700 (PDT)
Received: from paolo-laptop-amd.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm869975266b.222.2024.10.02.06.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 06:57:17 -0700 (PDT)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
Subject: [RFC v2 2/2] target/riscv: use a simplified loop to emulate rvv
 loads/stores only in user mode.
Date: Wed,  2 Oct 2024 14:57:08 +0100
Message-ID: <20241002135708.99146-3-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002135708.99146-1-paolo.savini@embecosm.com>
References: <20241002135708.99146-1-paolo.savini@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The simplified emulation of vector loads and stores that bypasses the memory
probing in the vext_ldst_us helper function seem to benefit only the user mode.
We therefore limit this approach to the user mode configuration.

Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
---
 target/riscv/vector_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9026661573..08f71abc22 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -648,6 +648,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 
     VSTART_CHECK_EARLY_EXIT(env);
 
+#ifdef CONFIG_USER_ONLY
     /* For data sizes <= 64 bits and for LMUL=1 with VLEN=128 bits we get a
      * better performance by doing a simple simulation of the load/store
      * without the overhead of prodding the host RAM */
@@ -692,7 +693,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
         return;
     }
-
+#endif
 
     vext_cont_ldst_elements(&info, base, env->vreg, env->vstart, evl, desc,
                             log2_esz, false);
-- 
2.34.1


