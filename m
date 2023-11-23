Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131F8C61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:13:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6ECT-00014r-TN; Thu, 23 Nov 2023 13:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6ECS-00013s-Hd
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:13:16 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6ECH-0007mt-Ei
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:13:16 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54a945861c6so1643936a12.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1700763183; x=1701367983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eX29FSHrxZwtoMuV95zkFBlb/od/3/uAvsNcCfbYMG8=;
 b=f0k/xHN17AdwD1QjSOeLp1yQ6x4mEkvXrEjRN9PEvl1Q1c0W0+RprrvtyDbTeYpVpo
 XjQ5l6iPdG552PdiG5bNAscjTqM62AMPOumWapPA6nUTQEjeXgWbaCCkvQQwlzioFl2+
 ETK7hEf7okXy+NE4v6fsx0ElDFg2EzQOtzeQenk8HLhDUcyf7klODIVRBEPV9WW6TJoa
 Nb1x09/q4GLMWoWc4GelN1sw5zNwLuJ+R0sTPqlnA1W9N7RaZfxj0SoPSnLMN0GTrJjO
 thtIrjsVRRd/KVgL/Xdjk7AC9fk6pGYZGSuliNKOAFef4MGIOs8gaswzxNooEJCBJxqN
 jhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700763183; x=1701367983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eX29FSHrxZwtoMuV95zkFBlb/od/3/uAvsNcCfbYMG8=;
 b=qe6/2ESfUlTXNCo6IdrQh1ceKzwcOoxTtPGbCsmJZdpQ6ZfKVDEL8c6GDA12WVV3Ly
 9XF/sgyfLAcDgRbfYWYeL6AnHXSC7AdluU0O70ag2Ie7oV1EJP8eAp9T1zgD+SZGJMmr
 m0fdA3T4W3G0YmoqICb/F+D4FK0FP2bTYjsQ361Z40XfdMssm4h0VHA3hxHweOVPTN0q
 RArrEUVcJDxvmdETv4eyURclv5rBeBK6dOhz1q9ouLQ+SiYetf1NQxKusCeI1hWVEHGx
 Nqa2FeN7jK3gYX8jBu6MrSLD26bQIYCGenprZZaRJNI3ykdhLcRJEEzVrmRRPbEUFucL
 H3qg==
X-Gm-Message-State: AOJu0Yytn9rtEAU+8EWAmHGucafEFMQeyYpbGr89UjvZP+aHX4uSyUs/
 5F8jnuGIlQlZtWwkrZKHj+BqScZpqQXr9bqrgTdlQw==
X-Google-Smtp-Source: AGHT+IHk1m6bj7LoyzZMf8eWS76aAZNzmEZzYYnrxuyh4HPiosDEI2nqUIVCFZx3C3Z9zL9qyTUI+g==
X-Received: by 2002:a17:906:291:b0:a01:b8d6:2ea with SMTP id
 17-20020a170906029100b00a01b8d602eamr82944ejf.49.1700763183406; 
 Thu, 23 Nov 2023 10:13:03 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 e5-20020a17090681c500b00985ed2f1584sm1065635ejx.187.2023.11.23.10.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:13:02 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
Date: Thu, 23 Nov 2023 19:12:59 +0100
Message-ID: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
This patch introduces this for QEMU's user space emulator.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 65ac3ac796..2f9a1c5279 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
 #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
 #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
+#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
 
 #define RISCV_HWPROBE_KEY_CPUPERF_0     5
 #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
@@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *env,
                      RISCV_HWPROBE_EXT_ZBB : 0;
             value |= cfg->ext_zbs ?
                      RISCV_HWPROBE_EXT_ZBS : 0;
+            value |= cfg->ext_zicboz ?
+                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
             __put_user(value, &pair->value);
             break;
         case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.41.0


