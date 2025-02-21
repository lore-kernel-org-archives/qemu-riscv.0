Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E3C021B3
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:19:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlTro-0002Pc-P8; Fri, 21 Feb 2025 09:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlTrg-0002LT-1v
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 09:18:56 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlTre-00072X-A5
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 09:18:51 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22185cddbffso50103235ad.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 06:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740147528; x=1740752328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwiUkfAptJW8QwZGHJK0YcOqS7OLINR985yyAhSkxR0=;
 b=bWj+iQafUmNdG1a2nzgnQhWQjNSSfopTcN5oGg3TkmdihySuvS6bLZXpe/x0o8r7LB
 Q5kVq+kq8QrNhta/hIlqx+cQJrWUKOsZ/9OqkwRso9QDNj5aNnDCE3HwyZ3Pxd0rOu1p
 5zanPTvYtm4OoIL1gitSE54uOgGYD7P4XdWYUcEDXyl0WVyjpmJKqONXemtHrWU+riTx
 CCYTX646a9pkxCzzfzWaXEWPWYEHpkJOeeXXFMErXu4iowAzhwcO/qtfprpwA9Raqrx6
 4CaNAo3BfHEfVuSHjI+HWAcdRZz/kn6Za25/R88cBJoU+Jx3WHaOeqZ6HiqGuWvQKqRj
 ar3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740147528; x=1740752328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwiUkfAptJW8QwZGHJK0YcOqS7OLINR985yyAhSkxR0=;
 b=k1gGsNOSYb7SR1sFoq6rYBbFyTefiI+EwLAsmtZed5XosUzBH0Fso14BqWBdZPgCVI
 0oep1z14sJAyQV5XwJxWNVNsyPrB4JMbHuIpUBAMb5HXTu9oKE6aq3xHzuy6Q4zV3w1S
 VqZVK7tnBfXO6ZlCZ3vlo1T2hUyoiZhzpJQ+QZdeVXby5E8LyCfTu8BAjapESplh1Lz7
 +xgvtc4ZLf/jktXm7CmC39vp262xRx7JBS7LolRp7VIA2C7XLEutJw9TKVAZvHi64Ct8
 3nexGF2KaRhoB82s6ielNagKcc8l2zGhd8L/sL1PmBFPpCgRGW5eEEaeWMezdcVcb6no
 bXYQ==
X-Gm-Message-State: AOJu0Yy4U1JUizGjTuDQD9BNFeRSHxSGkJ74vtRvoU+SJ8/C65GxRBxa
 QTWw8ONP1cPgeDKQyzJLTCd3ln6N4a9kcFtXm7O/5auu3m/Rad4l/kbKTk0s3ek=
X-Gm-Gg: ASbGncvTOe+25QoOWst9O83M9zSWWHe46xbBkT6upVabQZhlZ0pkUTVr47TaGLjphEb
 0ARPNWHamz7jpP3skCeG4m7cVOWlmBaBkK7Bj57tT+VJzjqnFQNBnC1/090Trc9U3O78N7R380G
 B9oyC6dtaCPc/521bJd4UbXP5Yj+4YAtd/gSQMUlPRUSTkPHzIevZA9mcDP1b4W5eV3Fn6g20hJ
 OeeJBag7cNY3LreLhi3UJAUXPlLNMxk2gvDR1U//v85lKOLV3WKU7LPkc1tYkVRhgV+9E5WBH0a
 CO3To4Jkoxq52Q5ecVA3oMFYHHKbg4drw6fWHU6ZJi57vBAuh82ByQ==
X-Google-Smtp-Source: AGHT+IGDVI4GEpTfESubysaaSk6jsk9ZHmZ7eYY/hS/fAVMYQ99JDvK2WlmEZsS1mq4mG8lmeMeliA==
X-Received: by 2002:a05:6a00:3a1e:b0:732:5875:eb95 with SMTP id
 d2e1a72fcca58-734140898f3mr15292204b3a.4.1740147527928; 
 Fri, 21 Feb 2025 06:18:47 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.11.154.120])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-734300da098sm1150290b3a.129.2025.02.21.06.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 06:18:47 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/3] target/riscv/cpu.c: create flag for ziccrse
Date: Fri, 21 Feb 2025 11:18:33 -0300
Message-ID: <20250221141834.626722-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221141834.626722-1-dbarboza@ventanamicro.com>
References: <20250221141834.626722-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

At this moment ziccrse is a TCG always enabled named feature for
priv_ver > 1.11 that has no exclusive flag. In the next patch we'll make
the KVM driver update ziccrse as well, turning it on/off depending on
host settings, but for that we'll need an ext_ziccrse flag in the CPU
state.

Create an exclusive flag for it like we do with other named features.
As with any named features we already have, it won't be exposed to
users. TCG will keep the same restiction for it (always enabled if
has_priv_1_11 is true) and KVM will be free to turn it on/off as
required.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 3 ++-
 target/riscv/cpu_cfg.h     | 3 +++
 target/riscv/tcg/tcg-cpu.c | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 522d6584e4..fc4632ce36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -105,7 +105,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
-    ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
     ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
@@ -1749,6 +1749,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
     MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
     MULTI_EXT_CFG_BOOL("sha", ext_sha, true),
+    MULTI_EXT_CFG_BOOL("ziccrse", ext_ziccrse, true),
 
     { },
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 3f3c1118c0..8a843482cc 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -166,6 +166,9 @@ struct RISCVCPUConfig {
     bool has_priv_1_12;
     bool has_priv_1_11;
 
+    /* Always enabled for TCG if has_priv_1_11 */
+    bool ext_ziccrse;
+
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
     bool ext_xtheadbb;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index ea8d77d06a..c93612b1da 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -360,6 +360,8 @@ static void riscv_cpu_update_named_features(RISCVCPU *cpu)
 
     cpu->cfg.ext_sha = riscv_has_ext(&cpu->env, RVH) &&
                        cpu->cfg.ext_ssstateen;
+
+    cpu->cfg.ext_ziccrse = cpu->cfg.has_priv_1_11;
 }
 
 static void riscv_cpu_validate_g(RISCVCPU *cpu)
-- 
2.48.1


