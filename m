Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A9CE8FDDD
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:12:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnxqe-0001P3-Pd; Wed, 04 Oct 2023 05:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqP-0000I6-UK
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:02 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqE-0007NX-VR
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so352206666b.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410409; x=1697015209; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exSuT9/NnjvYPrvMnYoWAEzddFkaInk4+sF0o57vHQY=;
 b=QFtTkXr39MXhGql1oowRP/XgYpTTlL9cv9BKNOehi6x+T8wtXBPN4p7cUPqSyh1LRp
 LtBFtI29VRRYAfprAmQTxGP7iIbMC1QPJW3jqD1oXtPn5Eowl0RnMBR4CxJfd6ItaS56
 Z0r6IEJfhPoIU2PBWjMLgrf+ehiqAweUgjzaHlR8/u/DYCHRDVt0gmg/QeZxFfXqnMJz
 NI4TdtfJ62yDJnSdoPdxyRxYiSc6z50AQHjS8Y6odHngU76m2yryiGSTX7et93SKC6XO
 vdJj2BxEsAPKocLcY5vVBMh2RsyBlQ4B3lRQTq3HSVsHRcoWIGyVT4OlWZesgcog75dt
 l5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410409; x=1697015209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exSuT9/NnjvYPrvMnYoWAEzddFkaInk4+sF0o57vHQY=;
 b=XQ83WEot7ktBSr68RUoLjgB4RZt3Ln2VxXZ0Ljy5yL31PD7miY9Zpg6/7eU4/nHmHo
 kQdRp/HZCuj7ujxH0PKhFPHd9XsLLG15gFXLuXQH3kC2LyE0Qw1ayYuCk3cgXDqTkjBK
 lAo/iYWiqwwCrNvkoVxGuXD44AEH7jdldNNSXs12yOxCllcFQNv/f6z2VGJUwRETlMd0
 URiZVIwPqMGY8R3qeM6ZtinQIkTXvuzy4TX7SAOGuJrn7Fog8ZhkULiuWb85gbLgh2xb
 0Xgx0u9RCTLGnyC/oGokLCi7LIjmeuC2vvH9eBCH/gTxE5z3DazFPxC4Uo8Pz02Ykf3B
 h4cQ==
X-Gm-Message-State: AOJu0Yw5+JWZFBsbFIuyv7wHZjdAGO4CGUg9NPQYNZjuwy4ys2UtLX0q
 JfJn+2e0oGiRi/aHj691QDGvVA==
X-Google-Smtp-Source: AGHT+IHk/MNCNP1hSn2wP1C4tfXybRQGCpaPc50YEr2384IeglMQ0LyoObxoYLaU7hOwZaigDollCA==
X-Received: by 2002:a17:906:518e:b0:9ad:8a29:f26a with SMTP id
 y14-20020a170906518e00b009ad8a29f26amr1556091ejk.63.1696410409209; 
 Wed, 04 Oct 2023 02:06:49 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b00405442edc69sm977268wmr.14.2023.10.04.02.06.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:06:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 03/13] cpu: Correct invalid mentions of 'softmmu' by
 'system-mode'
Date: Wed,  4 Oct 2023 11:06:18 +0200
Message-ID: <20231004090629.37473-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu.c                | 2 +-
 hw/core/cpu-common.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cpu.c b/cpu.c
index 0769b0b153..8cb6790142 100644
--- a/cpu.c
+++ b/cpu.c
@@ -209,7 +209,7 @@ static Property cpu_common_props[] = {
                      prctl_unalign_sigbus, false),
 #else
     /*
-     * Create a memory property for softmmu CPU object, so users can
+     * Create a memory property for system CPU object, so users can
      * wire up its memory.  The default if no link is set up is to use
      * the system address space.
      */
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ced66c2b34..f04d59c8d5 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -228,8 +228,8 @@ static void cpu_common_initfn(Object *obj)
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
     cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
-    /* *-user doesn't have configurable SMP topology */
-    /* the default value is changed by qemu_init_vcpu() for softmmu */
+    /* user-mode doesn't have configurable SMP topology */
+    /* the default value is changed by qemu_init_vcpu() for system-mode */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
     cpu->cflags_next_tb = -1;
-- 
2.41.0


