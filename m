Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E4C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:11:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwtU-0006SU-Lu; Mon, 22 Jan 2024 11:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtS-0006Rs-4s
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:26 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtQ-0005IU-K4
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:25 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d748d43186so6933015ad.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939883; x=1706544683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GiRO1555hL7UtHuko7cV18F9Nb/34zN4zFg55ve12s=;
 b=TmrKniAz+zozgVMbTuxFsZLTraxhvr/taZeHXu7rtyrWw/RuI8I7sYdoRHcFzDWuBt
 RoyeYG/s+lpFr7qi0ebYZOYGgq7vRNUdQTike0HZm/8ySVIcIpS0jo4FUyzLwX8swGzd
 RH+Ec5JAnM83nw/fCHXkUAf6KpVUU5PwDO/9bvLF+humTP0q9y3OVDuPSjQiJaZEBW9v
 5bKoSfv1Rk+SY46LenUPbFbzVPsS5XtuBFLnBkd1pbj6vMLsGlZ0qrc1sqhy+bJ/USX0
 19TEol/jfXiXKJk6blmBqYYAudi4hX/flDp3BCLNODgMNJgkwGIbNLYGqw9TneyVC/fO
 LTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939883; x=1706544683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GiRO1555hL7UtHuko7cV18F9Nb/34zN4zFg55ve12s=;
 b=CoMZJwEt6Lsz31JQTHKUFmfEIkb4/8iCs1sOfqXASpz1br67Ec0luCWJIcKhGx3EiB
 kMlVZocLLtStrf/VzVgt8ipkTgSoR1d/CjhRXdEKz257Ce2AEWRFyN0Ib5KUtpSSpbBY
 7euzH+pciTft5JkjK03qyh0rHOrDeVUHsHLy24Fsdz/RqvfD79IqNGWkCqRnqOtQsZDn
 rAnUi7vfRVd/Rl1e76YQ4mS8R5dKNFgW4oz8251qi81D44tOyI0L4xHH2zeTWLpqJUlp
 /wXqBoXxqlOcp5LW57ASp7CzcuhSB/v+HBSl04/lH+rIsCyHfYbQBA1/FaPea9/nDvhl
 2KfA==
X-Gm-Message-State: AOJu0YwuG7TdgEs9s4g0NOtA8bdw19HtSBGq1Grf5crm+IlIxGiouT0s
 0PPU6H7/w6uZT+7PpowTno9Ml26j2y5T+LCT1HHECwORnubJRqErziUWYaIG53s=
X-Google-Smtp-Source: AGHT+IFWTzDQq9uNmxjRcJRx+CAGLVycrA5DIlcnUPt+jo502VVMdemBSKeo6YAEYWYpfoyYVpPr2g==
X-Received: by 2002:a17:90a:fd91:b0:290:8e4:466e with SMTP id
 cx17-20020a17090afd9100b0029008e4466emr1365831pjb.33.1705939882771; 
 Mon, 22 Jan 2024 08:11:22 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 02/13] target/riscv/csr.c: use 'vlenb' instead of 'vlen'
Date: Mon, 22 Jan 2024 13:10:56 -0300
Message-ID: <20240122161107.26737-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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

As a bonus, we're being more idiomatic using cpu->cfg.vlenb when
reading CSR_VLENB.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d666620e48..d9a010387f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -683,7 +683,7 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
 
 static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = riscv_cpu_cfg(env)->vlen >> 3;
+    *val = riscv_cpu_cfg(env)->vlenb;
     return RISCV_EXCP_NONE;
 }
 
@@ -738,7 +738,7 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
      * The vstart CSR is defined to have only enough writable bits
      * to hold the largest element index, i.e. lg2(VLEN) bits.
      */
-    env->vstart = val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlen));
+    env->vstart = val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlenb << 3));
     return RISCV_EXCP_NONE;
 }
 
-- 
2.43.0


