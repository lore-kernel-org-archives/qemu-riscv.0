Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlfEz-0004k6-1I
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jun 2020 17:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfEu-0004hC-Ra
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2020 17:04:57 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:36377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfEp-0000P8-Q7
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2020 17:04:55 -0400
Received: by mail-qk1-x741.google.com with SMTP id 205so3522005qkg.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2020 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YTz6vFHmZFyC4ACE7F4vHqeFTUJV7CWjdiB6P/9KC+w=;
 b=hC/Pejzb8BghSmFgUSR+yU/UxhcdgiOuTZg5ww8qnQVSJ+j0wrUDItnixZfav82TfF
 u9kU66OoyEgjPZ2wUSfOqEsbfjJYkaDJ0dNgeGhQneC3JAAgYSs7plS52Yt19W5ddJTy
 6C2yFaWdcV9IS/gbbkfo6pmL6uhUpVpWCr7PiaaTIg1XVCOu5X2LN9WHmajL3OOhrHZQ
 e6eNPGdU1F5ipFHlNs8CflvhyLr97YoWavUT7BOHfwWtmTjjDN7p0uUCq22NqqtzmSsi
 g1CNKMY7eAld89KE83NMt0dQ9aGc/ytAjuDNkV7kAaekVPgFyRCEGH/4V418+uzQArls
 hu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YTz6vFHmZFyC4ACE7F4vHqeFTUJV7CWjdiB6P/9KC+w=;
 b=rbZFtHWlBExqAaTrS6YrpL93k0jRrjaFLUpIk3hUdtCi7w9E93kKUNErI9rdwFpWMa
 uR0Cj4egOeyIbJmiijUi/OEm4zHO1enKFsj0JPTapVqZ9dWAtzHNLuiAKXZy8kTU5Hnm
 stMJfEyMF530Pj1I6mxczwMTDyMOjxcso6fQVknXdm+blbJliQWhtFnBhrKLwlrF40uR
 O36LXqWfXBinSEakz+QAtvaonRp2ZTlrai0Xyspn4cjTMmLBcgOi3Q+ty4ylvx7OvxBd
 rd7+k7NmM/N46asYLqqfgaQ+GTV4iCbzEoFIbe4Et6WyK8HiTMDG+DjlVhIGGJWyLsuE
 2o0w==
X-Gm-Message-State: AOAM531CgTZ5uqxj44Y9te9ZwYxGXOwTTQ++C2vlah/BqjRdIXVFiYaV
 zWP909wNsZG4Xg3+sBW4Zf9QNg==
X-Google-Smtp-Source: ABdhPJzbaSCLaao3AWjR6m5aPs45KbFrOxOruYbFXhOkTsPlQrFCOCPObgXKviN3NH70Z40F28etrQ==
X-Received: by 2002:a37:5e07:: with SMTP id s7mr628501qkb.20.1592427890822;
 Wed, 17 Jun 2020 14:04:50 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
 by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:04:50 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, cota@braap.org, peter.puhov@linaro.org,
 robert.foley@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v10 66/73] riscv: convert to cpu_has_work_with_iothread_lock
Date: Wed, 17 Jun 2020 17:02:24 -0400
Message-Id: <20200617210231.4393-67-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=robert.foley@linaro.org; helo=mail-qk1-x741.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 17 Jun 2020 21:04:58 -0000

From: "Emilio G. Cota" <cota@braap.org>

Soon we will call cpu_has_work without the BQL.

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/riscv/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3a6d202d03..d56ba65b32 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -310,6 +310,9 @@ static bool riscv_cpu_has_work(CPUState *cs)
 #ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+
+    g_assert(qemu_mutex_iothread_locked());
+
     /*
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
@@ -510,7 +513,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
+    cc->has_work_with_iothread_lock = riscv_cpu_has_work;
     cc->do_interrupt = riscv_cpu_do_interrupt;
     cc->cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
-- 
2.17.1


