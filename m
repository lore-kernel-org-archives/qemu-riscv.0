Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EBDCAC598
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:43:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4m3-0007YI-1S; Mon, 15 Sep 2025 04:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4ls-0007WM-GZ
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:13 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4lc-0002Or-HN
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:10 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b523fb676efso2785620a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925650; x=1758530450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gULplgMLCLslKgcVIvWoNyxi8gkKVOmzAYNJTIpxIg=;
 b=ZR2xikcOz8rB3q1wp6IYcOxjbS4P1GTK+Uv2F/vdmgILqxexi9YKg8A4WCQC/q68L6
 ek7jS5RD8CLJH8ZxtAp+qXgqRIZIBEBeAw9m/MbdO6vL3sv1/Hp0vP3BVY+GrEVxnQGX
 10uo74FzfX+xWf2zg4OBWKyQGjuyuC/bF+ENdbFDFmL6Tzc6AxjXR986Y35YiJLsAL+x
 W41pNy8nKE4s28cK249//hRvCX8WPThx6IDW1Uuloxc19SMR6EiOiiF0s7c3aVGME9kw
 QMU4rF6I6yWXnAz0el3kfDFbkdmeb840gL6OHm9QlsZaul7n+Qac6G4i8Duvmk9Z7VSX
 dxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925650; x=1758530450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gULplgMLCLslKgcVIvWoNyxi8gkKVOmzAYNJTIpxIg=;
 b=YFGua6Jqe2pk9j8vIy01W7BDaFxfyTUAD3rNP1Rhu77gQNtVJcE4qGzgp6X5f/kqvI
 BT9K4BEVIdKOhlmi64QJUBP4PV1TNtRBBSuOnsgHQvSG1suWTFedCUvPxR47v4hzy89g
 FG3n+wBIyuudrSHMVQaskdJ+X/NvhbHtvGnAOEnFsv7FPeaPlqyEZmVJ2ylCUCsolX02
 RYBmhb2YKnp1ICEBg8dtCh6tpm8CAo3Us5xp2zD5QJuZXAVlP/LLYkPdWM+yYyYPQyPc
 Srs9XIirGP2SenUdd3i0WxWRKYsNS3Ykw/PHcNGWB07tjblMs+tW0IEgt37jb63kAO5f
 EpPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwYlTwFOK7XHx95W/7NBTC5EnpeYFbZ4ZqIMQcrjOJYdyj6qYTKJ0ipUXAXaMEDUK8cVxU3jenKktd@nongnu.org
X-Gm-Message-State: AOJu0Yxgama7+U0gry/+74H18Q4mp/0qBFZe2OeDdziPZ0rZEhdDd+Ui
 9133lC1sVCB2cj9simZfAfnoe9+aH2SwXIPE2ejLNfaeGjaPvGgZuteZLX5cbMsAFoc=
X-Gm-Gg: ASbGncvaGyH39YZZyQQnzThZhUymTgKfcKBtzXBT49rZd4pPa+tvEys55NbMCE19eyS
 wYW+iYVGbGcw3sfktzTaxMseGOIXOz+oHgiwgPoDl/iJD+BGHY7ILZMkkI8almrNseYczkWx2oj
 0pJvsPLWcowDhNShOdIFtoPUFP7WtHROd7YCuaXyriMeyCvOZbnDL7FwV7UbF0dCn1W3veX0Oec
 mGFk6BCjO5VHv4jLo0LsVV/ybQn5dyg+L5fYu1xWpllr3LKUvrhs1MrJfqlpgXmdO/0fiM8sZyK
 j2Om5sxyl5RcJ4YGRDdRL/ldMbcQmZDe4zS1wDO0CCvk6lSXHY55Ts+yA2gmCS4xP/lbYzamuRP
 b7rGcqPBFgGUaLECgFV18KhUv+3uVhogaI/udLmEJjFs3pvH3IzOncXHkBMdQx24RpKQcJkBAHw
 2MEQ==
X-Google-Smtp-Source: AGHT+IGZO4l1hS8dha8ovnzDslNRABpQ9aoOETpEBmS09+P+ewAOiOeE29rYFU6k4Obd4m+DfSzUPA==
X-Received: by 2002:a17:902:dac8:b0:267:6649:ec17 with SMTP id
 d9443c01a7336-2676649f0bamr21805315ad.23.1757925650075; 
 Mon, 15 Sep 2025 01:40:50 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:40:49 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 1/8] target/riscv: Add cfg properities for Zvfbfa
 extensions
Date: Mon, 15 Sep 2025 16:40:29 +0800
Message-ID: <20250915084037.1816893-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915084037.1816893-1-max.chou@sifive.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The Zvfbfa extension adds more complete BF16 vector compute support
and requires the Zve32f and Zfbfmin extensions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 1 +
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d055ddf4623..fc0614dadba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -169,6 +169,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
     ISA_EXT_DATA_ENTRY(zve64x, PRIV_VERSION_1_10_0, ext_zve64x),
+    ISA_EXT_DATA_ENTRY(zvfbfa, PRIV_VERSION_1_13_0, ext_zvfbfa),
     ISA_EXT_DATA_ENTRY(zvfbfmin, PRIV_VERSION_1_12_0, ext_zvfbfmin),
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index e2d116f0dfb..f69be188e4a 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -96,6 +96,7 @@ BOOL_FIELD(ext_zvks)
 BOOL_FIELD(ext_zvksc)
 BOOL_FIELD(ext_zvksg)
 BOOL_FIELD(ext_zmmul)
+BOOL_FIELD(ext_zvfbfa)
 BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 78fb2791847..07b2b137934 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -704,6 +704,14 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfbfa) {
+        if (!cpu->cfg.ext_zve32f || !cpu->cfg.ext_zfbfmin) {
+            error_setg(errp, "Zvfbfa extension requires Zve32f extension "
+                             "and Zfbfmin extension");
+            return;
+        }
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
-- 
2.43.0


