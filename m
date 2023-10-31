Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFE4C4167D
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:41:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxqrV-0002qf-Cj; Tue, 31 Oct 2023 11:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqr2-0002TY-Sw
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:33 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqqx-0003iF-Qi
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:32 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so83277221fa.3
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698766817; x=1699371617;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mMVXx6ZKHS/Xdo2ieyq9Ad+4Pt4SoIMtAgRB3f52yc=;
 b=j0rqD5fdza/bMiBzrftEjc3PQ3O9AUQKc9TX/kICZgwn9VNyt0yDVqLk3Oex+E/BqT
 +I5N1XqKF5ABlZY+FehTUgxUpC2qKOvHjI8xCgmjsSSAiOTCBuJ2g3ueP46jExAZz2lK
 W0vkOtWStK6nJ9SOX9i4RZKkVwKeDzAIp/ZPBsHPOXSrVHVBCXzGgxtfioXgdr+cXqso
 U9xZ9rVRhe05UCiBdIbbON6y4VFmvIR5oydKcyUus+oh0OjF9QVHgJqF/P3wKniTmHuY
 Bf8AB01cVZkpiJMULdGrbOHs8Cp46QMXUd46mirRya39aumWidUwNNrin1iyZRaT3wAB
 wAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698766817; x=1699371617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mMVXx6ZKHS/Xdo2ieyq9Ad+4Pt4SoIMtAgRB3f52yc=;
 b=YQzH/Ef+7di9wBse1UupcIWl3N8vaAF0jQ8UtEVSiXWOOkk8xH/DedhMeqeod/D5Pq
 8oorvgfgj9sYXP0TvcmYSu7sqFdRwMxIL4yMXyNBONoT0uOTlwUECMGYir3RIa5Q7du2
 n/PPs5bB3qMIhFWxVOsPcRdyv5kXwkCmLwIYelFjhcq+vLMl3PXmwEM8cXuG8yCrQJ/x
 Af7CwM8JqoXfo5aKIefMzliBmPVhSPWgkaYUZ1qpOO00nvq30q87JCtKwZc8EfnfK10t
 djI/ihAB4zTOp92ftseGnSbyRcwt+v+H2O5R/+hDBJhNu04VkMDWId7R5F+G53w2a5A/
 1uaA==
X-Gm-Message-State: AOJu0YzsveqiTkUudibeL+vazC1qCyabiAROHjk77y6ZM7AH5xMJdm2R
 2JTIdWcE+MOMnuSPbkm1NhGd4A==
X-Google-Smtp-Source: AGHT+IFRkGg8wFvbyo6XvhxF/jE5rgx6/au+IvVHbhiztAPeusn7m+zQ7JBrEtkBAFzd/X8rH8njBQ==
X-Received: by 2002:a2e:ba88:0:b0:2c5:18a9:620b with SMTP id
 a8-20020a2eba88000000b002c518a9620bmr7948677ljf.23.1698766817381; 
 Tue, 31 Oct 2023 08:40:17 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c458c00b003fbe4cecc3bsm2094613wmo.16.2023.10.31.08.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 08:40:16 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 3/5] target/riscv: Use existing PMU counter mask in FDT
 generation
Date: Tue, 31 Oct 2023 15:37:15 +0000
Message-ID: <20231031154000.18134-4-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031154000.18134-1-rbradford@rivosinc.com>
References: <20231031154000.18134-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=rbradford@rivosinc.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c    | 2 +-
 target/riscv/pmu.c | 6 +-----
 target/riscv/pmu.h | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 9de578c756..241681f98d 100644
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


