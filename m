Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBD4C021AD
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 16:39:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tkQco-0006rT-BY; Tue, 18 Feb 2025 11:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tkQcm-0006qw-UQ
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2025 11:39:08 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tkQcl-0002Li-EE
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2025 11:39:08 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-220d132f16dso82881955ad.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Feb 2025 08:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739896746; x=1740501546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYUkm0URlvt/fEHggYoxirTMYLe7QUj525r8nmoUuyU=;
 b=HSLKx+9/NxxZQJ6O2m27KiDT7MWeehDia9ORGxWrm57Qdo/gAMA3wLGzm+aVToA8lr
 uD/j25MJfdnK+42QKTVkHENg8R9f0T743TIXfgLO4VdRdT5ovbbHJ9ioTX5IUT+OyoGF
 9NhCnp0GduUnzy1lwIJC9kzb7qT1yebVfPvbgTezBcLD9dv+4hqYblzUD5l1STX1XoVk
 660sH08Z+mwc3WYbJqMsYc3kAZQOhWA/OogKm0PeIO/vR/L+p7CzMloF55oiC+bcBycm
 lsxrE0Tp09QO2pfnBXukNYP/UxcNG2UVy79ykyHNKt1XbWYEvGfthYfiGnXc6Huh+QRt
 trVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739896746; x=1740501546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYUkm0URlvt/fEHggYoxirTMYLe7QUj525r8nmoUuyU=;
 b=sNxxQY0RWQVo8tEOne1L08x+rcHCPB57k76qevMDkvyWBHBQQBhMIwT5DZjJtZBLbq
 6AG4Ne/DVAsEBmVMWCLKMUTJciCXZycBldkd2G7VC+S0nuLpCA8QlxmpsIT0IWZ+B6ES
 BQYVCaCJ3Oers4BOqtjEpl1fBmIq4Qe6tkBWyFrPZKZTF9nsanvwDcuGEuMFoEWkuE3J
 QD+IqnHgaZvC9oRSJfuZBsKeyiyiMQUNHPrO5OTmlB4fS8V2Ibw4aykhW6lPgtKPrw7b
 +HPouybE12bwY+yhCQk8U9mnKNKlDO6xybxRwhTRYuBQWqWQX8NPKAA5MAQ0CZwR3+Ns
 Kd1w==
X-Gm-Message-State: AOJu0YwdHKNQ/3otb6muKhvzVxqRTLs40ogm14WoSPkIcw/PHfqwjkBJ
 pZElSizqsm91zMZJJMFRH/m48/SJHKpGWQ/Lp6bMEVzRnCOiDwvhpe2YdmH9x8A=
X-Gm-Gg: ASbGncuTKVRWuOvjeNpNGV7NQ8Y+E6Xe+fo5IloM90UDzHSqZACSSlEk3bFfRpyjdQZ
 jTKFdtuSH/qhQ96wARl3HEGmX60a1ojW+MMrCbeLiQh+64zdLV/TY+dbvcnh1IOzmdx64xMFSVl
 SGDbGZ6coVVLhebbgPILYHvdha8JHNu/7okJ1ciFFEYTvmzAVl39SE7q1vPKdrWKB5xVWB7h8hr
 yZrYpJL0rDO/4ffeqKsJOYisXp2mJHrfmLlKVjZBGNn+siZUB02WHXZnkzmMLiPrqzM5yY5J5GN
 tWSeHxu1DFrKXos824LkQ71SJ2dvADx3JZpFE2DrjgLuNBWriIly
X-Google-Smtp-Source: AGHT+IHtTeK7YiNntz8FIcfbRLXiFgTpoBDoe3qIcisBZRjXMGXrcSzcH+qOvAHyc2QRheznYF6HsA==
X-Received: by 2002:a05:6a00:3d06:b0:730:9204:f0c6 with SMTP id
 d2e1a72fcca58-732618c2a69mr24657445b3a.16.1739896745820; 
 Tue, 18 Feb 2025 08:39:05 -0800 (PST)
Received: from grind.. (201-68-240-180.dsl.telesp.net.br. [201.68.240.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73278d09228sm4595533b3a.117.2025.02.18.08.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:39:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/3] target/riscv/cpu.c: create flag for ziccrse
Date: Tue, 18 Feb 2025 13:38:53 -0300
Message-ID: <20250218163854.425607-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218163854.425607-1-dbarboza@ventanamicro.com>
References: <20250218163854.425607-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

At this moment ziccrse is a TCG always enable ext that has no flag. KVM
will expose ziccrse to users, allowing them to turn it on/off.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c     | 5 +++++
 target/riscv/cpu_cfg.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 522d6584e4..0b8d2c0c25 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1711,6 +1711,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zvksc", ext_zvksc, false),
     MULTI_EXT_CFG_BOOL("zvksg", ext_zvksg, false),
 
+    /*
+     * KVM can turn it on/off. For TCG this is always
+     * enabled if priv_ver >= 1.11.
+     */
+    MULTI_EXT_CFG_BOOL("ziccrse", ext_ziccrse, true),
     { },
 };
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 3f3c1118c0..88565e29fd 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -157,6 +157,9 @@ struct RISCVCPUConfig {
     bool ext_ssstateen;
     bool ext_sha;
 
+    /* Always enabled for TCG, KVM wants to switch it on/off */
+    bool ext_ziccrse;
+
     /*
      * Always 'true' booleans for named features
      * TCG always implement/can't be user disabled,
-- 
2.48.1


