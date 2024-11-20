Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841B0D6E2CD
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 07:46:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDfQJ-0002SF-R1; Wed, 20 Nov 2024 02:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQH-0002QR-VU
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:50 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQF-0006QG-9p
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2126408cf31so8143555ad.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Nov 2024 23:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732088804; x=1732693604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hvzvoO5brrLYHxKu/Ou4AE457DWwgARUuUV3MJMIxX4=;
 b=njoFlDXKz/0cvJozS6AeJqzzhxPRhGRGALeG6V8AZAM7xaW0TGRM/y2+ba2RuM306+
 mmtcxzk0Vsfe34FNVopfWlo6MLajx2VMzuzzjsztYmFMCAG/+822F1dsX/Ezp2xddCr+
 AiCKUIoxXEJf39wnVdcavpFxpRzprW4+7xLB5gtZ6NOED/lJm37QB4hho3kbIVGemEjf
 JPRdrNG4qRm5/s8HUCgRTSOmfbtYwYHpUTmP1gtRpqHR2qUQ7oRWdpFN6SZ1wTe6C4UC
 gWt3SZaxVXA/98hoRaAVUM9Lv7zyzB1HbFhv1P4Fh6LQ6wXe8bLPWi0glR6ToCq/VMZC
 R1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732088804; x=1732693604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvzvoO5brrLYHxKu/Ou4AE457DWwgARUuUV3MJMIxX4=;
 b=QPB++yw3qPsRfrCilFVIs/BMl4S5fzXc9JX4xspNgFocLhP9LOkql3Nm8Z5v24QlCA
 6M8PEttlweHpU+Q8HS0pPNi8eWeKL/EcKv8ysi9NvKkY0y2JeQF57i8e51/MaZvadjUT
 5GCEItIn7upjvtGiClZjn2iyr5nuX/a+H62w7jH8pdgceIeLOPk9sAkAWFle5JFPWov3
 sm533fekFAYR3D+WhYU1UYEu9n1Fdp0nAQEgTRjdABW91YfJpWsPUcNuj/8fSKsavLfp
 yseAYtL6r2uUhwhzT8+MKK9XN6+J+LcBZ4NDtdjmPYdkScImMIqnVdqTFfRwUK/bcnco
 zs2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZB9ttmxR5Ioqm+DAgCxP3DdbyyPmzuscl/7peq4ONSB4Ho9t/qhlDzWzUzRTiwv2AxOP/RVENf5ZB@nongnu.org
X-Gm-Message-State: AOJu0YwrQbA04+h/aRbYHYtZ3AzLo+Q1beBdtGV3Ny/9im5fYFaJdpg6
 wjZlltfkLilo5lEwMJIExGYIUTVNS6mjAymVgSGtXCpITafxsQoIgo8Fg70TYJo=
X-Google-Smtp-Source: AGHT+IF6nRdpWv1AfiP3UFwmy1yuIt1r9YmXhTV7T9KQcGgymz3ZFI4RY5hGtgFwo031oOrdXHOWUA==
X-Received: by 2002:a17:902:f652:b0:212:530:a65d with SMTP id
 d9443c01a7336-2126fd89c9bmr13159015ad.38.1732088804697; 
 Tue, 19 Nov 2024 23:46:44 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0f51fe0sm86206255ad.233.2024.11.19.23.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 23:46:44 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v4 3/6] target/riscv: Support hstatus[HUKTE] bit when svukte
 extension is enabled
Date: Wed, 20 Nov 2024 15:48:51 +0800
Message-Id: <20241120074854.1767780-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120074854.1767780-1-fea.wang@sifive.com>
References: <20241120074854.1767780-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x634.google.com
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

Svukte extension add HUKTE bit, bit[24] in hstatus CSR. The written
value will be masked when the svukte extension is not enabled.

When hstatus[HUKTE] bit is set, HLV/HLVX/HSV work in the U-mode should
do svukte check.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4b9f899217..fe4e34c64a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -604,6 +604,7 @@ typedef enum {
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTW          0x00200000
 #define HSTATUS_VTSR         0x00400000
+#define HSTATUS_HUKTE        0x01000000
 #define HSTATUS_VSXL         0x300000000
 
 #define HSTATUS32_WPRI       0xFF8FF87E
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1936a6f32a..b6fa8ae53f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3540,6 +3540,9 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
 static RISCVException write_hstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
+    if (!env_archcpu(env)->cfg.ext_svukte) {
+        val = val & (~HSTATUS_HUKTE);
+    }
     env->hstatus = val;
     if (riscv_cpu_mxl(env) != MXL_RV32 && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP,
-- 
2.34.1


