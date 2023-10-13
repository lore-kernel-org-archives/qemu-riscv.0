Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC49C41513
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:03:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrFva-0000La-Ly; Fri, 13 Oct 2023 07:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvP-0000Il-Kd
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvA-00029A-AP
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-406618d080eso20725125e9.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697194890; x=1697799690;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+T1o7c6jOO1qih6JAKenu+zKIks7hzIqe4wyjYwbkaU=;
 b=J+S0x5REs25IiK8jvvQkMn2Kf8FPLK//BnpHSqA1Spqkm/Lo1XmPwFko4dJDRIzH2z
 r/vdXosmBJFi8XuDojgurQsZzDVSinsftOmqM+sg6mpZNAT+IYhiQ+SjiJj7uuntjEE1
 wWWu224bQ/iixaRIWWQReSaUTI8258P+GcqxELZm+Ky+BIdTgtod1tDvpHKZhuZvetOB
 uoe+Mxs7n07Vm0cvuuHFQTQpUYpoMiTCB3vBjopgA9nnzG9oM105SGDkR1fpdh4R2odC
 fVKdEag2J40rqvfv7yAarbs6Rmjv3tM7oo8ZrP3b5u5jHJTMsYg2itYcID2nGUFfsh8J
 58xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697194890; x=1697799690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+T1o7c6jOO1qih6JAKenu+zKIks7hzIqe4wyjYwbkaU=;
 b=oi5dEEC6rgau2VngH361/C+2LbwFT6+gR9/unuexwdyHWJbwMOmcDJyG3pTP1TMe6v
 rxLERVTKtJc0W9abgT1e99jC2Nfvn5FY0L10BMIYMWECaqv8H74EVdbCZK0InIhlrEd8
 Mhy8h0NYWRS2/nl+mBW9LwbLJ93qwbogTbQqgUKAtYYQT7E1/lRS4aBDJhn4gEsNY1ti
 LDh6gyDear54/ZVkzarjlD2kqspqdnidHMfC0ZfLUe+Nyi1c3F4GzROVS76RoChmBlYl
 LMcX0fg1UseVIl2epw8bUju3QvikZ6Xq3QYobMZc1YoIdoWppzhg0KSanQ+irvYUi8rl
 T31A==
X-Gm-Message-State: AOJu0YzqJQDB/GRc4U2Z3fLkEwQJoVW44r1tHSXvKEfboh7tRMdNEwXE
 SuX4s19E44WExvyJkZK5xNVHHQ==
X-Google-Smtp-Source: AGHT+IEXFZuM/MmF+AOp9KRP86//Dw437EDivy1ExFV195og1C+ZU8YvW9o2VcfhNISkkxn7kGQH8A==
X-Received: by 2002:a5d:4fd2:0:b0:31f:f829:49aa with SMTP id
 h18-20020a5d4fd2000000b0031ff82949aamr20768512wrw.23.1697194890067; 
 Fri, 13 Oct 2023 04:01:30 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfce08000000b003271be8440csm20455185wrn.101.2023.10.13.04.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:01:29 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 3/6] target/riscv: Use existing PMU counter mask in FDT
 generation
Date: Fri, 13 Oct 2023 11:54:45 +0100
Message-ID: <20231013110111.34619-4-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013110111.34619-1-rbradford@rivosinc.com>
References: <20231013110111.34619-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
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


