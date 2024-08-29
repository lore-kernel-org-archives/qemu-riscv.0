Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B358CA0EC8
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 23:36:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjofD-0003gg-9v; Thu, 29 Aug 2024 19:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjofB-0003ZJ-7Y
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjof0-00039E-0t
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2d439572aeaso931046a91.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2024 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724974476; x=1725579276;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfvLnj6XNfSIT8sSl0+fnX4A6Nm3Jxdidu50F7PUqy8=;
 b=OlS6SvxV7mZDdbjhVB2sGMRBSNsHrmaHLAWXbe+/sVE+a43hEZBGhTtr0/Lu1soybc
 BSXuV03S6otKoQeorgbGeGmauZFbilzCVosQbdq1lMevsd7YcZs/UG8SyXuqf+hrKRjE
 GwwvVHln6CNSwgIWzg7QUR2dkTpklY0k5UtMwU1VZ5j4ehFtumrmW4D5c3WZ5kiV9Sr1
 de7ebs0eioDesPO+894lIFR0dSBRBt+qCIccbXZeFZ2ymMr8Idi+9vMcypRccoUWAXnX
 W8cWAsOfez+zrOwG+ahzYXF9yCOErmnUrvg5vVSOnR37bYf1prarDr2+/1RFeHZR1wjR
 rksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724974476; x=1725579276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfvLnj6XNfSIT8sSl0+fnX4A6Nm3Jxdidu50F7PUqy8=;
 b=S8K5ln9hvDtLBXqXrC5a1x5S/RLLlspaNETBE9ksKOkx7HIJN3Y5HBhzNJZStF/1eA
 dXFsd5V9jM7viEtJTkzAAfTBr2C12P/fbXBGn9RxKIvIfhG4EcHoLHicsf0dIsoUbTZV
 nmVh7W+qIv23Q9B8zh950HkPbw02BGNEonMa1j8GZb6YXMWVuH9iVLuLYxS+LUlRBCE7
 aVdwz9D8IRGTsQyKxUAgWeOoxFHt+UWp0VbraXQ6fd01elsyUzo1ohtA7BXeioK6fHqp
 jZRzWvyYdfM2mqMgw9qYWRTgG2XgMHdXPPmOmjzuPKvLm3tgn7lzv7CO/g/JzDCk533f
 9ZJQ==
X-Gm-Message-State: AOJu0Yw1XjeN8LIV03j9t3g+xs0WybDjx6OkEorv7JoVmXh/P+HoAhLO
 O6zaVEPreKT8vgLkqtDeNXJOWIWAbVoH5ffAtbz/bJ9QfpA7Gx6RkNNBUaBilVHa/SaFPXTV250
 N
X-Google-Smtp-Source: AGHT+IHN8P0/jUbIUm1VDG9O5kcp1SZ4HjYSM0a34Vkrcak0AFrSppIuV5zjncN2BEcQuM5/3bGAmg==
X-Received: by 2002:a17:90a:4748:b0:2c9:35a6:e185 with SMTP id
 98e67ed59e1d1-2d856889a6emr5868768a91.0.1724974476199; 
 Thu, 29 Aug 2024 16:34:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d85b13df55sm2331074a91.27.2024.08.29.16.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 16:34:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v12 05/20] target/riscv: additional code information for sw
 check
Date: Thu, 29 Aug 2024 16:34:09 -0700
Message-ID: <20240829233425.1005029-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240829233425.1005029-1-debug@rivosinc.com>
References: <20240829233425.1005029-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

sw check exception support was recently added. This patch further augments
sw check exception by providing support for additional code which is
provided in *tval. Adds `sw_check_code` field in cpuarchstate. Whenever
sw check exception is raised *tval gets the value deposited in
`sw_check_code`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/csr.c        | 1 +
 3 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a7c970e70c..a0f14c759e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,8 @@ struct CPUArchState {
 
     /* elp state for zicfilp extension */
     bool      elp;
+    /* sw check code for sw check exception */
+    target_ulong sw_check_code;
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5f38969aa6..fffd865cb4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1760,6 +1760,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 cs->watchpoint_hit = NULL;
             }
             break;
+        case RISCV_EXCP_SW_CHECK:
+            tval = env->sw_check_code;
+            break;
         default:
             break;
         }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5771a14848..a5a969a377 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1179,6 +1179,7 @@ static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                          (1ULL << (RISCV_EXCP_INST_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) | \
+                         (1ULL << (RISCV_EXCP_SW_CHECK)) | \
                          (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) | \
-- 
2.44.0


