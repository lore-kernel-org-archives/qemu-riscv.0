Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD84C5321D
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 15:32:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sibfo-0000Fu-0B; Mon, 26 Aug 2024 11:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sibff-0008Fg-2p
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 11:30:21 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sibfd-0003cQ-6D
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 11:30:18 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7140ff4b1e9so3503868b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Aug 2024 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724686215; x=1725291015;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsiagUrA8byZnAGLoeRuYpUl3zN9h7ZESSjwciHMwsQ=;
 b=G37q3cbEPPsiscU4CF9D6yizneGS10+GtN5kxwGx2jwaOEvm3fLwZyEU1OG/Eys61G
 0oC5yNO6PP0Dmlb/07+z2uZ6RAUD0+JZb2I2SZ7O2hjOVCCC2FeFKqTqLt0n5kAJHU1b
 S+taC+tcWqHUo+UNwJulxrK/84HP9LzEXDpk5muhZI9+ZIQrLrh6+w/FsxFWt4hs44CI
 YpA4C+YqHLFZYfNDx3LYynCkDjp5s4TVmJvxWd2zrg3WqoOhjDXqPYDDULt4V9R+2CkN
 XpkiSu74hqnL3l/jY3ry15jXb5LXL1w5p/WDPq70djeupl0Wod/yq+HWwWfOl83RiTSH
 9uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724686215; x=1725291015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsiagUrA8byZnAGLoeRuYpUl3zN9h7ZESSjwciHMwsQ=;
 b=TrLvfpAlk9CSRjjTA8olTAG3uleKw2ze2rY5GTfcsqNn/+Y8Jfwue8dFZjtGu55Bla
 rpx/2QXfT7nkGmt+uAECmAmHFNQsIVIbkVt/wMgWcpZdJd8Qqhum2mWGGCYpRkkyUrX6
 OUL51xwTfpa4qkDwl2nhbleZf8o3QWxc8+b/4V8FJdi2MfenjbI+ekrOtsW/MO8v9MlI
 EqKTp/ytW64OURAfWnJ1RxNviwZXUFTHuv1tik9nEmQm6vqm/KOU6nJiujx11etitYyK
 dTQb+taAfGqD3aWMZtw002pg1bzDFTi4Pzx90KmMI0yP7gUdRH/f5jo4bxo6pisFSb8n
 Ph7w==
X-Gm-Message-State: AOJu0YxUH57CTu7tCq1T6SqQNUgk37ozq7dCHvvKNMU86EUq9I3DXeKf
 25R9+usrGiekbJGw3COXlri2kQjmSHCVhxhGG7R8UIowPJq96KHR/NUWTo2rzgVo8smZvRTPfBe
 1
X-Google-Smtp-Source: AGHT+IF4UqzMHvV6CtfFYOWgUDbolv4bSQEUcjkFrVDBCcFRbPBbnzwRK6BZBSgNWXArki+q3/xzqA==
X-Received: by 2002:a05:6a00:2383:b0:706:3329:5533 with SMTP id
 d2e1a72fcca58-7144587f44fmr11446176b3a.24.1724686215437; 
 Mon, 26 Aug 2024 08:30:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143422eaabsm7396525b3a.12.2024.08.26.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 08:30:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v9 04/17] target/riscv: additional code information for sw
 check
Date: Mon, 26 Aug 2024 08:29:36 -0700
Message-ID: <20240826152949.294506-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240826152949.294506-1-debug@rivosinc.com>
References: <20240826152949.294506-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x431.google.com
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
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/csr.c        | 1 +
 3 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7be0fa30f7..11c6513a90 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,8 @@ struct CPUArchState {
 
     /* elp state for zicfilp extension */
     bool      elp;
+    /* sw check code for sw check exception */
+    target_ulong sw_check_code;
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
     bool ufcfien;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 12484ca7d2..121fef1be6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1761,6 +1761,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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


