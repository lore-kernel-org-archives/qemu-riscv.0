Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA570C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 17:54:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sYUZ8-0004sN-1H; Mon, 29 Jul 2024 13:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sYUZ6-0004kN-3z
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 13:53:44 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sYUZ4-0000Ip-7j
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 13:53:43 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3db1270da60so2682730b6e.2
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2024 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722275621; x=1722880421;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k622JqYymJR6YovQS6GBPxe8YFj6SVEYXb2hrEdnpy0=;
 b=PcHl/SdyHHXaw2e1U08YzmaRofzCKpd7C2YIx+a2+6ux2t2xtqCznIhvfy6VvCGY5s
 YIqWUf7uxewlYmSBUGeCj9pFFXppN4a3joCxPIqknD635iMvdok3OJHi3VBEe2eJxegj
 ymLHu5194QGHAORsOIPvv4puCr7ZlNShtJuvaZGMI2UB3n08rgJSl/IpFzxkC6i3TsQO
 dKVwUU6yvNtgm4BV7eEoYeOjYYD+oKDhRP6WRANMCU85TNznrVFjakloFEx1QOwP5Dj3
 +SmLTOUw3MFk4Q50d4qqN7CEkYqLzk6iqKrHVbzCN3wB37dxcw2DV1sXZeO6i7WwKDc0
 h6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722275621; x=1722880421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k622JqYymJR6YovQS6GBPxe8YFj6SVEYXb2hrEdnpy0=;
 b=lxR6hMWU7t3QRCQ465zMkciilPrObPNYzwQpFRJAI4G4Pe9OhHfVs25h5eUuMlYJsm
 2s2YqAvDOBHKeEeHhj/gN5b3Uw3RIviph6vhPfWCvNfGJXJpZW18GM/L5GLTCPy7+u6B
 gKsh7K3OAbf0XN/URdg8gtyO/eEDJ+eS8wfYAh7RLCtqIvWHlu4GS8yHFqx3CIA8dwTI
 6jx3Qnae+13O/D7TiA6usAsVB6qUnmvdCpkMj0wvhRpacinKRwbkUoZSrPGiCdh9HMb4
 9tRBktl5nUVw/G9Dx07A6dlmGmA9XFddKkA45EC5fD9PsZ0eafP95WP96u6uXPKXf64U
 6H/Q==
X-Gm-Message-State: AOJu0YzgIq1crr5K53Etn64v20NDjX7WGhehZj1SvGwxbMQGbRUEIxL7
 Zgi3KSaUDY0zLwBPXURTVAE4o43Spw/66i/GFfiVzV8kkgois8EKq30DTr7eOEqeclZ475x7zJM
 4
X-Google-Smtp-Source: AGHT+IE1F+bQDJgORGgRNbJkhWRWXDWdWbmiWUMWkwXtaLvT4jnkfLGc/EHvvji+PRkNnzm5zxGmrA==
X-Received: by 2002:a05:6808:219b:b0:3d9:24f8:7dd2 with SMTP id
 5614622812f47-3db23a5a064mr11468658b6e.6.1722275620770; 
 Mon, 29 Jul 2024 10:53:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f7c71b15sm6303141a12.18.2024.07.29.10.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 10:53:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, jim.shu@sifive.com,
 andy.chiu@sifive.com, jesse.huang@sifive.com, kito.cheng@sifive.com
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v2 08/24] linux-user/syscall: introduce prctl for indirect
 branch tracking
Date: Mon, 29 Jul 2024 10:53:10 -0700
Message-ID: <20240729175327.73705-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240729175327.73705-1-debug@rivosinc.com>
References: <20240729175327.73705-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=debug@rivosinc.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Each application enables indirect branch tracking (forward cfi) for itself
via prctl. Adding branch tracking prctl in linux-user/syscall.

Using same prctl code as proposed in cfi patches in kernel mailing list [1]

[1] - https://lore.kernel.org/all/20240403234054.2020347-1-debug@rivosinc.com/

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Co-developed-by: Jesse Huang <jesse.huang@sifive.com>
---
 linux-user/syscall.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b8c278b91d..ec157c1088 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6295,6 +6295,17 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_SME_VL_INHERIT   (1 << 17)
 #endif
 
+#ifndef PR_GET_INDIR_BR_LP_STATUS
+# define PR_GET_INDIR_BR_LP_STATUS      74
+#endif
+#ifndef PR_SET_INDIR_BR_LP_STATUS
+# define PR_SET_INDIR_BR_LP_STATUS      75
+# define PR_INDIR_BR_LP_ENABLE          (1UL << 0)
+#endif
+#ifndef PR_LOCK_INDIR_BR_LP_STATUS
+# define PR_LOCK_INDIR_BR_LP_STATUS     76
+#endif
+
 #include "target_prctl.h"
 
 static abi_long do_prctl_inval0(CPUArchState *env)
@@ -6477,6 +6488,14 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_TSC:
         /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
+    case PR_GET_INDIR_BR_LP_STATUS:
+    case PR_SET_INDIR_BR_LP_STATUS:
+    case PR_LOCK_INDIR_BR_LP_STATUS:
+#ifndef do_prctl_cfi
+        return do_prctl_inval1(env, arg2);
+#else
+        return do_prctl_cfi(env, option, arg2);
+#endif
 
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported prctl: " TARGET_ABI_FMT_ld "\n",
-- 
2.44.0


