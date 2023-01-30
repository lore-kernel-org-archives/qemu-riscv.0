Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMR5I-0007UT-8K
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 05:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geomatsi@gmail.com>)
 id 1pMR56-0007T7-Qy; Mon, 30 Jan 2023 05:08:14 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geomatsi@gmail.com>)
 id 1pMR55-0004RN-69; Mon, 30 Jan 2023 05:08:08 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p26so18923200ejx.13;
 Mon, 30 Jan 2023 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6KLMCo5biRiC7s1o2u7KTvaufRUzTlqDNiiarYgvWeM=;
 b=BzByR55tE0uOEQiY12DWDyfoTa2a4Z/wa9jqZ3qZG7mOjrUQ0odXQUELqpRAFT9+xq
 zK63uj3qoZ8khVOSOEbx37NsLx2k4xLsg7EvDmnonq1THAX4wpocxVGTrmp2Nu+1DQV0
 CzGNMDyF+Hhkq1XCuYOT8Ie7zAvPDvUY+H+exrV1iOIFKCq5/TcnXwowFLa3poD9iDVL
 +m/3iQrRpP4PfWhvgehkXZ0BO0iS+cmhbUa8M8ZPH1uNwQvOrbxMWyFYM5KIfOedwzME
 u0Y3nF9xSQ2s2CR7vgVUoUSkmxgzGf+MQv2BcycXn2OqtT6oDPG0jF8eIhMc5GB/WHY5
 kO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KLMCo5biRiC7s1o2u7KTvaufRUzTlqDNiiarYgvWeM=;
 b=A358TbXTLbgHK2cVxiNYMFOFPA0gCKAJrNsln43GYrxK1LBxHPpRZ4RehbSCFB/KiN
 8nyTqci++tovc2UDNTuIqKzsuclZ9aShfjSEbTWwBF2XXbg+g2YRjKW7+OrwiWS3Jzp4
 6gvkIgCi65asVGZrpsWjObayTEybHxkKLsvPmVXQY6SPAjelqAhcYNpXrUJMq+5n6wXQ
 QI9vr1av/MxRZ9do10IFksT+tNx865kH7MaG8BWSjN4K0Elkgi5l1LFZPqtcC9MqWoNC
 s/Tw4lVI/rRGuZGd/zfHktCOXOirzhH+Qqumg+OgJYivZ2vfojkqCFgSsulZHe/xXfFn
 LcRw==
X-Gm-Message-State: AO0yUKV4Hu4tZpgXJABXbXyFuiCZyDfv48nvINVdL2IlMkQrAfe+gY7y
 hwTrpNKRTgKf+O6+WBo6Is6VdgQlFF6SQaKZ
X-Google-Smtp-Source: AK7set9YyjbWy6OW1oJO5WXZnAhO6TIXUaZhiBn+YCL2/c/e+GKMGLNSkW5VsZDNNqHcDlng8S3sTQ==
X-Received: by 2002:a17:906:d8c4:b0:87f:546d:7cb5 with SMTP id
 re4-20020a170906d8c400b0087f546d7cb5mr9990632ejb.37.1675073284752; 
 Mon, 30 Jan 2023 02:08:04 -0800 (PST)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a50eb0b000000b00467481df198sm6562461edp.48.2023.01.30.02.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 02:08:03 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH] target/riscv: set tval for triggered watchpoints
Date: Mon, 30 Jan 2023 13:07:57 +0300
Message-Id: <20230130100757.721372-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=geomatsi@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 30 Jan 2023 10:08:14 -0000

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

According to priviledged spec, if [sm]tval is written with a nonzero
value when a breakpoint exception occurs, then [sm]tval will contain
the faulting virtual address. Set tval to hit address when breakpoint
exception is triggered by hardware watchpoint.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/debug.c      | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a28816521..d3be8c0511 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1641,6 +1641,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
             tval = env->bins;
             break;
+        case RISCV_EXCP_BREAKPOINT:
+            tval = env->badaddr;
+            break;
         default:
             break;
         }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index bf4840a6a3..48ef3c59ea 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -761,6 +761,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
+            env->badaddr = cs->watchpoint_hit->hitaddr;
             cs->watchpoint_hit = NULL;
             do_trigger_action(env, DBG_ACTION_BP);
         }
-- 
2.39.0


