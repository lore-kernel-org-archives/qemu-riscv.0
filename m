Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01BC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:24:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2aDo-0000f4-K3; Fri, 26 May 2023 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDn-0000df-7i
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1q2aDk-0005Lk-Vy
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 12:23:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f6cbf02747so6878865e9.1
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685118194; x=1687710194; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIQVcCjTMhOlPbI1SZWkGUS8pg/fs9v9F/Pz/RXWwCg=;
 b=bOARRMT/ASBMmVtrMp4XWCBBMJ+hyWuqjnLYT9ctR/rsEEjAP9Ddk/PUDKgKmmXd/5
 pRCqZCv+fUuQXqo+UJ4kkm6nhhzUypqFEhCbExsbMLMYY1G+a6bmMly47RvocGdTf9ml
 Sc3g2D6r9oS9j5yG47CgU/2gNnX0uYteCmHGkhnakCgynaNQXqY/rcF45ZGh210KUDvg
 WgivC44n0NYvsFQ58Ip2skVltfVlKylmnEL+xhY+tB9n9liEYnt9IeO+Pia9xqCfWplV
 DE6QNjmlOgWpSWm5smIRCuzbZXmF1RQ70DKUV5l01eo/WxIfoEmyLIBeZMFEShi60ZS8
 Ql4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685118194; x=1687710194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIQVcCjTMhOlPbI1SZWkGUS8pg/fs9v9F/Pz/RXWwCg=;
 b=dJmIo2i0yjQlmpscQV2WlBGfJuDz1L2gVfePdvK1WXf231VpHeHRaT91Sn7pg7dsH2
 4q7c95MBwg9sCPvZo4cC5kIHBcKRD5NlUD2tHsHHA22u2yQdEOEZXiIc77dRcjtXFRhR
 7jE/sLHZFsNCFCkV9cH985osPW6G5fxjn1OqfQqtvdfXQZeS35uWOY9KYCmOx1qNFoyy
 +0CfXmVM7qz+AkW/hn/+liNl94wLPyk01RngJVotjKpzUBYkHpRFdF+jygQ+DEKvwKy8
 P2lg8AMhplqQ2HVsDklLRcQvpuV2xBvyGgTCmqLfsQZLU2JlmB7MjM/ZHwXo001rMv3H
 D3qg==
X-Gm-Message-State: AC+VfDyMiM5c9RJYzUu1K4ElQMaDWxyIAlD/zrEuCSVtpJcRzJkoIxqC
 QeTkVL/SsZiDsYf6nqF7jD2pgNODyZi2o3SMKmY=
X-Google-Smtp-Source: ACHHUZ5UGPWr+hHjrrXRo5ce6gfLPzMG2CeUvhBHOiRhVnJlmJxptJFyiG4uc+tv80hjQksvLt8H/g==
X-Received: by 2002:a05:600c:214d:b0:3f6:6c0:7c9b with SMTP id
 v13-20020a05600c214d00b003f606c07c9bmr1825278wml.15.1685118194386; 
 Fri, 26 May 2023 09:23:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c294b00b003f6129d2e30sm9312090wmd.1.2023.05.26.09.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 09:23:13 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v2 2/6] target/riscv: Check for async flag in case of
 RISCV_EXCP_SEMIHOST.
Date: Fri, 26 May 2023 17:23:04 +0100
Message-Id: <20230526162308.22892-3-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162308.22892-1-rkanwal@rivosinc.com>
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

RISCV_EXCP_SEMIHOST is set to 0x10, which can be a local interrupt id
as well. This change moves RISCV_EXCP_SEMIHOST to switch case so that
async flag check is performed before invoking semihosting logic.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/cpu_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 57d04385f1..b25ee179e9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1602,15 +1602,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
-    if  (cause == RISCV_EXCP_SEMIHOST) {
-        do_common_semihosting(cs);
-        env->pc += 4;
-        return;
-    }
-
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
+        case RISCV_EXCP_SEMIHOST:
+            do_common_semihosting(cs);
+            env->pc += 4;
+            return;
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
-- 
2.25.1


