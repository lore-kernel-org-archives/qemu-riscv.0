Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18373CD6E7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 14:52:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqaYD-0000Ex-Qr; Wed, 11 Oct 2023 10:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaYB-0000AV-I2
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaY8-0000VQ-LD
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32329d935d4so6292793f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697035859; x=1697640659;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bytYQtr86+xvVw4UcM9bSG9EBrq4aWlnek5rPmUwEro=;
 b=vENiIN/DJqjZN6A4LfXsiiAfzFajOApMgm9hU1P3u7/pD9ZhrVNYj7DSrmAYDUdLC0
 IOfaRDzSlzcPVcS0Ex1onpMbE1tCNSZ1MDpzoAvUT2FGkRWL56qAu4Okwo9iawUnW3F0
 W7Hn92o6jvt2TnDX5Ee4pAk8ZhReoSytPqMk1KVzSkYE3W+A8CSrsNqhZtTuwzz+O4rf
 BZnbmYSDVJ2S6BzVEmMz1xWkd87G3XQaD0kXjX2AxtI2Qsj6P0u+yw3Uk/esYtxfDx3H
 zf8ZQpmYYnPncj6nN0/f9LEN9f7hlD4noomK5riabLwCNJEJ2wQdyd/FCM2YVjLAej2M
 RG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035859; x=1697640659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bytYQtr86+xvVw4UcM9bSG9EBrq4aWlnek5rPmUwEro=;
 b=RkmtYcPm7OWrk+gw0h68FOqzgIUz0kmjy2RuC1gljtVIaegenkcK6852p5CQhe6ER3
 vUUXe4T07ElowFzD5i4YZHwjPrHl8bKn87JYgrZTnRKpC+vgHCbWrGTUaw3IKg+cVsIM
 cdwzWTgkwhbNzfHKEQbN9bml07+Cm7LkuNUh4MTfZLBY974YLuB2BTbSsnwShY0dY4qH
 +45iT7mwmNE6pThLSW+uY1qifi2zVrbdKoLzDBkWfYazI+EdDrDpA4nJABHAZjjCDShP
 VUjrRyfW5pVhSMTrpLrSrl9EHBr6c5b+KM1tfoo01RjpsU/fTW5abu9dfD3PeN3aMt93
 MaIA==
X-Gm-Message-State: AOJu0YwFx/xq1b7i1CkdDjIvUYmLFRVga++73zeN/VmHSYrKfEYv5l/n
 FUL8lFC9zY5s/p0ySEv89pExUA==
X-Google-Smtp-Source: AGHT+IGe2trxy8S1Nk05p/8OP4sAUOYJIdJJKnBdLFEuEMIdWd3O1Y9jHdH7BvfNu2H/5mCl7eEXvQ==
X-Received: by 2002:adf:ef4a:0:b0:314:2fdd:28ef with SMTP id
 c10-20020adfef4a000000b003142fdd28efmr17551837wrp.18.1697035859016; 
 Wed, 11 Oct 2023 07:50:59 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0040684abb623sm19709208wms.24.2023.10.11.07.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:50:58 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 3/6] target/riscv: Use existing PMU counter mask in FDT
 generation
Date: Wed, 11 Oct 2023 15:45:51 +0100
Message-ID: <20231011145032.81509-4-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011145032.81509-1-rbradford@rivosinc.com>
References: <20231011145032.81509-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x432.google.com
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

During the FDT generation use the existing mask containing the enabled
counters rather then generating a new one. Using the existing mask will
support the use of discontinuous counters.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 hw/riscv/virt.c    | 2 +-
 target/riscv/pmu.c | 6 +-----
 target/riscv/pmu.h | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5edc1d98d2..acdbaf9da5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -722,7 +722,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
     pmu_name = g_strdup_printf("/pmu");
     qemu_fdt_add_subnode(ms->fdt, pmu_name);
     qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu");
-    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
+    riscv_pmu_generate_fdt_node(ms->fdt, hart.pmu_avail_ctrs, pmu_name);
 
     g_free(pmu_name);
 }
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 13801ccb78..7ddf4977b1 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -34,13 +34,9 @@
  * to provide the correct value as well. Heterogeneous PMU per hart is not
  * supported yet. Thus, number of counters are same across all harts.
  */
-void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
+void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
 {
     uint32_t fdt_event_ctr_map[15] = {};
-    uint32_t cmask;
-
-    /* All the programmable counters can map to any event */
-    cmask = MAKE_32BIT_MASK(3, num_ctrs);
 
    /*
     * The event encoding is specified in the SBI specification
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 88e0713296..505fc850d3 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -28,6 +28,6 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
-void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
+void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
-- 
2.41.0


