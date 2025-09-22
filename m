Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF72CAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d0k-0004Nj-VW; Mon, 22 Sep 2025 05:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czN-0002Eb-Pu
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz6-0000dh-Np
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45f2acb5f42so31194545e9.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533839; x=1759138639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zR6vtj5zFWpC3fy91sWeOSp7fMJNhRDmtEpW8GYt8DQ=;
 b=GZLFsd5q2hzwMjYeo7a5zxhZsrVKTp864ytAEUBIKusigWiVay7X72iliE09KuKQkc
 Td+hxfuhZM60yccXNCpNecxlq/KB23CL6OJnPGgp0h72wo1WFLcMrcBzdrjd19u4vnAG
 2XO6uQ0YoO9Ms4ILfvQp3ConFf6qf/Kw5BYHZIqri1/XEFfQ4VwIBN3gh2QXptr3BddD
 HqZv9xnvJTHoM83HcfjLKGuOuF8go/RmsibPHqTJ2eUzuegW/ZK2zppVvOCueFez+l1K
 8bmtzDfG03DRc8887V8Vl90RceIuKq2IKVmLJT3kFYWgc3Cq8v2K7pidzjXg5jE4zAkf
 E/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533839; x=1759138639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zR6vtj5zFWpC3fy91sWeOSp7fMJNhRDmtEpW8GYt8DQ=;
 b=g5bKoX8k1/KPzapQJVBy+JVI9Z5cdZtMIBlGJC6enmhzOl7LapUW6NT/oFK67EMK7L
 1uv7+SZF17Yy5aw38wzQtQW3CB0rTBUNJ1LpRKtuP1NlL8aqPWEMIQR4fs69+nD/uTy2
 wTKre460d8RpyiTgYY/6Cs8ejPnIM2jgdojkrpbgwcqm1LW9XicTgOfX07q7MvFQOisl
 PPZIoEAvNyxnBSDOapeWrupAooyu2R7/TKimtIyFFzg2HhVigVX3kTLddvcgKdjdskVQ
 IOsNqk97yRbQ9i+F0BiM1s6ukMkZp4PX4oQ4IRQTVBPQO/d5nt2/z9HaRUHFul3KNU6u
 2Meg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcaNBjfIuHHhdWhu1YXE7rm4QjYDUr23zBslvlI1jvhYMhd8tX/8LAUNB5E8aL56ppZoS+XmZttNUm@nongnu.org
X-Gm-Message-State: AOJu0YxpxOIG9GmDNEm9Alet/2Feh04rno8f9QFqT+7s+k3emE2KplVg
 a7RDyGJA4XYct9yrIhtA23G4u1oBbJ8mTCBTxGevqjMLydG6qHwHQ9bCzX0czR6C0ilpxhlg5oF
 fFaln6L0=
X-Gm-Gg: ASbGncsZ2X5fZsc6H5xVTrSFJ1fTrobVSamkCla2VpJsuV/0y9H3tpqGQlBBrzG2ker
 oQ/uXFXa54zNGvUQ86cphuimu9lAFmIuHfvrgZBg49Y8lRHyVkrRLs7seuQ5EfdxY4Q7fqDbdmS
 PuYMNv5Ma/V/tYeUSnj1e+QUCPKW+KsbfZF1f1qazlAU0QUzH5AHj44irEyXfvhb6usAapnKs0s
 21C8kGF2mgNuoCmK1R5Z6ReCMrTIwgymURXWwm61Cn5uQdU2echCA5d0MDQUjWIrzxnJPbafIG0
 5tB3b9e3lY8/ipZdNLRm2kRT2Yy1awwC/sMlzd+xoFBVTw45cLJaU+y9kQKCoBKdcMpe3AIqtb3
 iMlc/h8mvkdD8wFR3GOA+yBo=
X-Google-Smtp-Source: AGHT+IEJT7U7eTozaOeVqApP8mTlpbGFsV3G/6F0gpdjxUhOb9NmKsPTJDmEH9mCywmoMo5fm4DQJQ==
X-Received: by 2002:a05:600c:5246:b0:45d:98be:eea6 with SMTP id
 5b1f17b1804b1-467a72a66b4mr113831185e9.3.1758533838693; 
 Mon, 22 Sep 2025 02:37:18 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46dd9a69466sm16427965e9.1.2025.09.22.02.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4F8405F9F9;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 08/25] target/riscv/common-semi-target: remove
 sizeof(target_ulong)
Date: Mon, 22 Sep 2025 10:36:53 +0100
Message-ID: <20250922093711.2768983-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Only riscv64 extends SYS_EXIT, similar to aarch64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-6-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/common-semi-target.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index ba40e794dcc..7e6ea8da02c 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,14 +25,14 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
+static inline bool is_64bit_semihosting(CPUArchState *env)
 {
-    return sizeof(target_ulong) == 8;
+    return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
-static inline bool is_64bit_semihosting(CPUArchState *env)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return riscv_cpu_mxl(env) != MXL_RV32;
+    return is_64bit_semihosting(cpu_env(cs));
 }
 
 static inline target_ulong common_semi_stack_bottom(CPUState *cs)
-- 
2.47.3


