Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F6BC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGJ-0002DW-G4; Fri, 05 Jan 2024 18:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGJ-0002DN-4k
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:05:59 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGH-0002FK-KN
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:05:58 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d9b050e88cso95212b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495956; x=1705100756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKiONtxFfTqSHiECLhKcpjAfy4/ifaS9sd5P13OAD3M=;
 b=S8QUCbqAAO0n3xDx75KNu07eUd2q5SeD/o+/wzzIfkOS1smX7a6OVk5iQq9jy6ZkIh
 JMeH8nj9pZO21z/rxhSwp++BjH35e7ibn6pwr74tFLDvNtdasEQWkzKfW32rO5rXC6R9
 f/csPfhCYhHGEJPpzonV3J4CivKldmKoGVKtSYLR923ceVjA6g1mH4dFGk6CzOTTfhqw
 oxGrklaNdN8c+ilPWF0zKlvV+y45V0H9KOPUncTTacaD9eTcOj6TL1w+birk/Kkcl9e0
 Go7npVPhSvoxMo23MYy7aQ9KQu95BWny21E/NkjZCB4QlKrLZ8TtH7G8XnwCFTa2AXBa
 mNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495956; x=1705100756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKiONtxFfTqSHiECLhKcpjAfy4/ifaS9sd5P13OAD3M=;
 b=dDCAeCdveKOLUfTEotv0TGyS0kCeb3zPngbKn9ryaVaUjiqoT+OZplfAMfTmd2owPL
 CwBCzFEFv9DGCKzEimeZSf3eIRm1ztoKQDHlXpG62Lr9XkdSFI6f+jyn5AOxZZa8pFWP
 QsElQRjnshKhd0JZ1MQTD/rKBm9KnT4BWc4wSTOxh3zqjUpGWa1hQwRVrtPgTAaGKCyX
 JJqeVppXkbMGE/NyZFKxa+5NVIt1Qo6+Iy7+ZSHB9vqfhTekzHUuNY1gjePaVH2XgMtM
 8i09JV5fGpcCX1NLvUlEEHVgwfPxbrZ+Lj6h1iS07FPegXKK6Gd4LlJkHaYC0gRbduv5
 klMw==
X-Gm-Message-State: AOJu0YyQFEq5/U8mbhcazvKT9WMiGD2NqukW3kDUXHNw7HmJ+YuIQkoP
 Sq/Q1Wy0SD+JoxEfVhFJJyyfMyXxQQL0jA==
X-Google-Smtp-Source: AGHT+IFUd8coi8ICm8E1b7mH5Et0GvLDKR7md5MP+swQIB9kObVq/YhL2LV1u1sTc/WKQpa0gElsAA==
X-Received: by 2002:a05:6a00:1888:b0:6d9:a1e8:89d6 with SMTP id
 x8-20020a056a00188800b006d9a1e889d6mr80195pfh.63.1704495956106; 
 Fri, 05 Jan 2024 15:05:56 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:05:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 01/17] target/riscv/cpu_cfg.h: remove unused fields
Date: Fri,  5 Jan 2024 20:05:30 -0300
Message-ID: <20240105230546.265053-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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

user_spec, bext_spec and bext_ver aren't being used.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     | 1 -
 target/riscv/cpu_cfg.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 44fb0a9ca8..1c5ab8bd0e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -180,7 +180,6 @@ struct CPUArchState {
     target_ulong guest_phys_fault_addr;
 
     target_ulong priv_ver;
-    target_ulong bext_ver;
     target_ulong vext_ver;
 
     /* RISCVMXL, but uint32_t for vmstate migration */
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 780ae6ef17..0612668144 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -140,8 +140,6 @@ struct RISCVCPUConfig {
 
     uint32_t pmu_mask;
     char *priv_spec;
-    char *user_spec;
-    char *bext_spec;
     char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
-- 
2.43.0


