Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C00C49EA1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:08:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbUDf-0004ba-P8; Tue, 06 Aug 2024 20:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbUCp-0002a7-AR
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 20:07:08 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbUCm-00018I-JF
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 20:07:06 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1fd65aaac27so2548925ad.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Aug 2024 17:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722989222; x=1723594022;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=316Sz2WI5Ks+hswcW2Zhyj1GbrmjYQrX/amYB/zWJFU=;
 b=qCuJRTvRK6cjAyohTKpob5+BXSEGsp8tiqjb6a7aqM3txLqiD90NHAJRw1JsQjrwhR
 L+7+yyr3sxN8t2l6HvHS6O6TLdaw67xkefnebK467161xGj3iEkMYv8X8FKId1u3fYuS
 SBLEzQ4OgnTi8aUSrQWrPwvXwRBsBa9kIjlTn4NNxk2l9GICiDdS1VO6DJOVkFGILTDA
 jYjW+g3oJHk8zoAv1qtYsjw8hLjdHLvuiJ/lyoF1tawzv0OTC80PKJRug7ziSEYBZ+8D
 /9+4SYL1YfyxoOOpt2LK1LJ/T2fRNuFpn93McG3G7spJCA47h504pVNPgLe5oOTuYBSv
 dI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722989222; x=1723594022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=316Sz2WI5Ks+hswcW2Zhyj1GbrmjYQrX/amYB/zWJFU=;
 b=IBkb7dfGA4uxspMPPylhBnTCQ4gyC4ma3UdkYkNmVc9IYO3BztoAcpA2QSWc/0XdkE
 Uyf14/M+ONwrhRXTfb3ZYgQ7BhC7fL8bNECvRzaVzykni5X+pkLX4L5Vc5zKVsBroYBS
 fZC48WValxg2SHhjrvp1mSS8PaH2vNJvUh3I7yFP8WWn2VaxvNVUuaoz73aZ404lHQZH
 pAKm+fdOpHff07ivH78VVqt20lI28nrG9qzyIq5LoB/Luv62zb0Qhp7zCcKdbLVMqska
 pKPKp7Y0eQhUeino3iiw6MpTIPWWoy32MIqX708nh4c/Aq7UMxTgwR78bd8lS5fbCqGQ
 9T9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIIKurqbQnZfQiD7Oi9NBz5pBwEQB78gheljFgLe3vr4sZizXGquUGL0nOiqi/TCHGYSM5JXa7KEk99pep7YPrJkTM4Jk=
X-Gm-Message-State: AOJu0Yzw9vkLshXYyUH8lnH9u7kCbW7cEp38cCul+ZDvqoWhoUoM3U5h
 jCc9vQOkk4gpHwtXuUnzYHnJAEQarQn7h/nCztAXldhJXpHcvAZxgwSm9B9OLmk=
X-Google-Smtp-Source: AGHT+IFwRFucBISDivapJGj0Xj9EJakD1Jb0QrLn11PsnwUhnSMsgPaWXwZPSMomdZbKL1Sp6QwtPg==
X-Received: by 2002:a17:902:f690:b0:1ff:5135:131f with SMTP id
 d9443c01a7336-20085543263mr8148325ad.25.1722989222463; 
 Tue, 06 Aug 2024 17:07:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f59cc2sm93381845ad.92.2024.08.06.17.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 17:07:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, laurent@vivier.eu, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v3 05/20] target/riscv: additional code information for sw
 check
Date: Tue,  6 Aug 2024 17:06:36 -0700
Message-ID: <20240807000652.1417776-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240807000652.1417776-1-debug@rivosinc.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 2 ++
 target/riscv/csr.c        | 1 +
 3 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8c7841fc08..12334f9540 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,8 @@ struct CPUArchState {
 
     /* elp state for zicfilp extension */
     cfi_elp      elp;
+    /* sw check code for sw check exception */
+    target_ulong sw_check_code;
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
     bool ufcfien;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8c69c55576..364f3ee212 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1762,6 +1762,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 cs->watchpoint_hit = NULL;
             }
             break;
+        case RISCV_EXCP_SW_CHECK:
+            tval = env->sw_check_code;
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


