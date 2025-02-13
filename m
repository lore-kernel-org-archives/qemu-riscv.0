Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BADC0219D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 07:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiU2Y-0006Yc-HH; Thu, 13 Feb 2025 02:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tiU2Q-0006XQ-G3
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 02:53:38 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tiU2J-0003em-SB
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 02:53:33 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so935302a91.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 23:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739433205; x=1740038005;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Xcq/loJ3vQE2fd/7Vvd4R7SRDzNQCt8Syzl1F+omPA=;
 b=QEt6LF27uYwwBTvAI+Zq6BJnyGNkYZ4ZVDVvW44KNYZfX5BruwkDbWxNZdE4MNf8GA
 x4+JCM1/UZm9Jqrk7aFipqUggqWCN/YSYoPl/KLCqgy6I/Rr8dvX1fu6D3F+5oVzzc9z
 5U3iGLQZ5rC0lcdEUQxdIDhXYcZ0MVY1UFs11aMnRFhGy8F03jAW4J0e0y4+/Swxlldw
 YAGWfevzBcYKUe+3581IuUzqQFaVbUveFOFPaeTlHuHuzTvQtaWzxL2kicnypdKmddXi
 LpxlEJ16x7qPxnHrYbY7XAkW9GlR1S2t28SIzbH7HdItGOQUDoOMadzCKdTCFJnCTm2d
 K3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739433205; x=1740038005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Xcq/loJ3vQE2fd/7Vvd4R7SRDzNQCt8Syzl1F+omPA=;
 b=fGglOOlPOLkV97QoJ/DquoQ5+KiiBIgBPI5q6rQUxlgtAbnGRl4UBzSxUuvXuHhaVr
 3snmsnkthDnCAslxI953gVcbqGsZ2TmUdhtIjlJJSoabHXbLKH0whmKHACcQmTMQV+cR
 ACEDcjkrS9F14DwnCpkbwJLFDbbJVp9JipnMOZDLKZGlIZLDUI/YZAshgvOn2vd7JEZ6
 kLWfIswGIAIxygxqdZmvhSEPU/fh01Lo8f7Qs67/HM6bSXumOSH4x0NB6sSeh+8YU2RO
 k/b0F7bPqbOWtWeXkkn3aoCuBkercTxCp7GLyPxxAlXQIDzJd+VGl4f15jjtGO5QxLMj
 Jr+g==
X-Gm-Message-State: AOJu0Yxu+YUcs0sYwKSSmAWvYyVcO1stEnVGY2GhFbvHOrJFmB0jtZlK
 5sBUKPQuwNDS4vhDsu+QhR+LJk8vllzSLm+XTFkI/JJTR9AWOdp2AiZ7aagFcXGTgQR47urJRbm
 1Zt8=
X-Gm-Gg: ASbGncuR8GCBIJqoUX4WxzJ0mUGEFXWA2BiWDN2IJ4oDUfQx0iyYPLuCGcZQIj0CXk4
 NhXUN5ht2rF2W8q6dlwhd0cqSKMNjkUbl/ifEEmSluagdZeTZ5Wn51L/4NNwFBJHvkcu0uuqV72
 UdYo53okc+f+r1+D0fNf3pmCDPECVrrFTvZvfomi8SLo2uf34c38QZZK/3AmUxILv1m4xHm+FvZ
 wu7dzhJkpp1KAB+yvUCyRfHymUKvCNl67OxPQXyw3oojzpqObYTBvYpoD/NfhY/S1mKjt9qkUHj
 qi2D4J9k63CPbpHi
X-Google-Smtp-Source: AGHT+IF4SlBLixhnvID5sNZIDAs5i3uS7SI0vuUxYbP0oqwZ9fTmemQfHFm9676WtvH17E8gMADlEA==
X-Received: by 2002:a05:6a00:3e04:b0:730:9334:18f3 with SMTP id
 d2e1a72fcca58-7323c1bcde7mr3792843b3a.19.1739433204886; 
 Wed, 12 Feb 2025 23:53:24 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324276172asm676903b3a.132.2025.02.12.23.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 23:53:24 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Tommy Wu <tommy.wu@sifive.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: silent warnings about Smdbltrp/Smrnmi being
 disabled
Date: Thu, 13 Feb 2025 08:52:20 +0100
Message-ID: <20250213075221.622676-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=cleger@rivosinc.com; helo=mail-pj1-x102f.google.com
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

As raised by Richard Henderson, these warnings are displayed in user
only as well. Disable them for CONFIG_USER_ONLY.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/tcg/tcg-cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 0a137281de..4d0d16576d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1437,7 +1437,9 @@ static void riscv_init_max_cpu_extensions(Object *obj)
      */
     if (cpu->cfg.ext_smrnmi) {
         isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smrnmi), false);
+#ifndef CONFIG_USER_ONLY
         qemu_log("Smrnmi is disabled in the 'max' type CPU\n");
+#endif
     }
 
     /*
@@ -1447,7 +1449,9 @@ static void riscv_init_max_cpu_extensions(Object *obj)
      */
     if (cpu->cfg.ext_smdbltrp) {
         isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smdbltrp), false);
+#ifndef CONFIG_USER_ONLY
         qemu_log("Smdbltrp is disabled in the 'max' type CPU\n");
+#endif
     }
 }
 
-- 
2.47.2


