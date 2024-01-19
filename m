Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE742C4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnBG-0004tJ-Eo; Fri, 19 Jan 2024 06:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBE-0004fs-2w
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBC-0002u8-3h
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-337cf4eabc9so464577f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664216; x=1706269016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wl7mxe76TBuEvV14rO6cbAGreHvKKNVNpG5LWETBxoQ=;
 b=HYyucrNSdK1YgB5NhB2yFJ30d1OmQ17aFSAn0mlHcWixhylJ1r7/+7sxml4NC2C2VG
 6YGKY6kMt0xpAN7d5RgzHeYP1md9RC9PoaIHEi7p5wGYo2zQ8X+sVbZeNQ3itXznLVLZ
 LpIa5k76jOsKFQu4qxCmZP++irxEnB+nl8iUY3vf0z7DLpBWCNAKxNPUNcMZIkLovZvB
 goARdhOnR7zG6R+AhfMIajoYAznFWl+fdTHkgd7+1CNLDoSwY/ahXJ5h2b9NHvlqd2cV
 zbd9RfFMFFnPTnjBPjQvvh5jZznanbVEUO64vrBP0fthTl8EnbFnHrSyt0zyHuQCL7b/
 Si1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664216; x=1706269016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wl7mxe76TBuEvV14rO6cbAGreHvKKNVNpG5LWETBxoQ=;
 b=mG65qcZOvTA2O4oNK5exN1YHreo5Jlo5uUDpgbTawJoYoNBXqmhgm8P/1y+snmYyS8
 OxzQnqrD4qTZ+vlgvajRqFeKg4GlswMTuM/h5OtZdwpBLRopxfR5K7MBv1RwFgiRPpSK
 87kRhR/8zfu8kDhGrLt81jy+V6O+J9ubnrRa1D/REUdyo7utWCb21HPewVYBfEeKFHi9
 Tsbx/UD3rpkra0sAsXxUK6/wSEXLSMiNicVxo70Nr7RmIHQaecF7JCWQrTZ4Un9qVFcd
 DOrxs4UEjyaeymToO/iTcVK6UFzAMYbYyfPNeLqMl7uYH5sEElfntEtoyeEdMhOkm9DJ
 10bA==
X-Gm-Message-State: AOJu0YxIxRr1shOKj9GRbcdKko2DOnwNt4NdAGmjld7lG8viEy5QijFm
 YfzOLBWONVHrJHFGg570VBVc+NGWFJDgNFZXrUfLXunrZVJRd4zmBUxCJpQWDAk=
X-Google-Smtp-Source: AGHT+IEvZYOQvoQNDNU4TVT1D89HgK4UHZJLcYGcSV0lPSbohQJK+H10Lan/9B12oj3i7dSd5Se2TA==
X-Received: by 2002:a05:6000:1742:b0:337:bf29:b6ca with SMTP id
 m2-20020a056000174200b00337bf29b6camr1154943wrf.23.1705664216774; 
 Fri, 19 Jan 2024 03:36:56 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4a82000000b00338ca0ada22sm1402247wrq.111.2024.01.19.03.36.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 24/36] accel: Rename accel_init_ops_interfaces() to include
 'system'
Date: Fri, 19 Jan 2024 12:34:53 +0100
Message-ID: <20240119113507.31951-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

accel_init_ops_interfaces() is system specific, so
rename it as accel_system_init_ops_interfaces() to
ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20240111120221.35072-2-philmd@linaro.org>
---
 accel/accel-system.h | 2 +-
 accel/accel-system.c | 2 +-
 accel/accel-target.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/accel-system.h b/accel/accel-system.h
index d41c62f21b..2d37c73c97 100644
--- a/accel/accel-system.h
+++ b/accel/accel-system.h
@@ -10,6 +10,6 @@
 #ifndef ACCEL_SYSTEM_H
 #define ACCEL_SYSTEM_H
 
-void accel_init_ops_interfaces(AccelClass *ac);
+void accel_system_init_ops_interfaces(AccelClass *ac);
 
 #endif /* ACCEL_SYSTEM_H */
diff --git a/accel/accel-system.c b/accel/accel-system.c
index fa8f43757c..f6c947dd82 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -62,7 +62,7 @@ void accel_setup_post(MachineState *ms)
 }
 
 /* initialize the arch-independent accel operation interfaces */
-void accel_init_ops_interfaces(AccelClass *ac)
+void accel_system_init_ops_interfaces(AccelClass *ac)
 {
     const char *ac_name;
     char *ops_name;
diff --git a/accel/accel-target.c b/accel/accel-target.c
index 7e3cbde5df..08626c00c2 100644
--- a/accel/accel-target.c
+++ b/accel/accel-target.c
@@ -104,7 +104,7 @@ static void accel_init_cpu_interfaces(AccelClass *ac)
 void accel_init_interfaces(AccelClass *ac)
 {
 #ifndef CONFIG_USER_ONLY
-    accel_init_ops_interfaces(ac);
+    accel_system_init_ops_interfaces(ac);
 #endif /* !CONFIG_USER_ONLY */
 
     accel_init_cpu_interfaces(ac);
-- 
2.41.0


