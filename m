Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0DAC4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 11:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzwuU-0003Dz-5q; Thu, 25 Apr 2024 07:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtb-0000JE-Cw
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 07:04:09 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtX-0000Mq-AN
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 07:04:06 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so9600341fa.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2024 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714043039; x=1714647839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vykN0pIt49J3GEMpH2YakbfFLS9d+NOdnblTzedh0DY=;
 b=ge/5W1Z5UVX3PPgyKn4UHFd9nbESU5wtOTP5095Bm6afywSeBiHPR5htX1M130Qno2
 XaV2Y+Sal3luYptmwrG+oNOxp/JMTvsZL9PjQhgsiqozUKtxQ3qymfYVfIsL1hnp+w7U
 3WP+c3tsTB9UmQ7oAh1nI1HXpLX52wAkmUmoB4mMKULchs7HLoE/PJRl9ZhUBrgEJVcb
 kRxsZ/RV/ShdXmv4b+vXS42eZFWq8RBOhH54OrSuD+FCQsDlv8IoJ9ryvWzD1rvYp4Tt
 dRt6r0yr5VmCD+4kCgfU08vUV06QEsJcJ7vFG+xj0q+Yk/9nNNtLsa/pMHUbNssLhWd/
 7hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714043039; x=1714647839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vykN0pIt49J3GEMpH2YakbfFLS9d+NOdnblTzedh0DY=;
 b=JAMvYo3tS0vEQzcHp0aDYRSh2i9LHv66u3uLVqIq0PWy2Orlk+BoxNjp/RAjVzc0eQ
 EtMlSmc+8RyIeJniBTQ8ZBrL8LvOxgNXg2FGYLapPjK//kftbJPJca4y1SrmT82kM8k0
 gsX+ETFG/grjorQmTNmp+NSEV2zwSL43ZqTYOw4nV6zdOh1LFjpB4+cirB4immPdgbN6
 O53t0pAGgCAOJLz3pymKVICafFUNgni9GNyCBO1w1OCdEy+lXSZGMSOEtFM5fpVAltWb
 jR5U/k8Y6C0lm/AVNusWefwajXf7bMMpDcfW5WWuPAOQwBSLJKaRATNV4J/JFnfUrKqV
 Gqng==
X-Gm-Message-State: AOJu0Yy+ddaowBFtibz9yBRQqFn9M5bHh8pPtK9kdqbdYqqFPLtjooRf
 YkLnG1ql/XGuGlIGnaXQbTKUCI/xoNKG22ANAipGbeuUMCLFp28NWXfGE3Nr2Y4=
X-Google-Smtp-Source: AGHT+IH8mFAQdgVe8Ug584icuarIPeRoP8mdneCGHYZqIATf4nok2omqYQTD+Ae/+hRL3KyPU8mLmQ==
X-Received: by 2002:a2e:bb83:0:b0:2d8:901f:7f45 with SMTP id
 y3-20020a2ebb83000000b002d8901f7f45mr3356811lje.13.1714043039569; 
 Thu, 25 Apr 2024 04:03:59 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a05600c4e4400b0041b0f10fc7asm5000576wmq.31.2024.04.25.04.03.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Babu Moger <babu.moger@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 21/22] hw/core: Introduce module-id as the topology subindex
Date: Thu, 25 Apr 2024 13:01:54 +0200
Message-ID: <20240425110157.20328-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
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

From: Zhao Liu <zhao1.liu@intel.com>

Add module-id in CpuInstanceProperties, to locate the CPU with module
level.

Suggested-by: Xiaoyao Li <xiaoyao.li@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-ID: <20240424154929.1487382-4-zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/machine.json          | 4 ++++
 hw/core/machine-hmp-cmds.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/qapi/machine.json b/qapi/machine.json
index 48f98e7d9f..bce6e1bbc4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -988,6 +988,9 @@
 # @cluster-id: cluster number within the parent container the CPU
 #     belongs to (since 7.1)
 #
+# @module-id: module number within the parent container the CPU belongs
+#     to (since 9.1)
+#
 # @core-id: core number within the parent container the CPU belongs to
 #
 # @thread-id: thread number within the core the CPU  belongs to
@@ -1005,6 +1008,7 @@
             '*socket-id': 'int',
             '*die-id': 'int',
             '*cluster-id': 'int',
+            '*module-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index a6ff6a4875..8701f00cc7 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -87,6 +87,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
                            c->cluster_id);
         }
+        if (c->has_module_id) {
+            monitor_printf(mon, "    module-id: \"%" PRIu64 "\"\n",
+                           c->module_id);
+        }
         if (c->has_core_id) {
             monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
         }
-- 
2.41.0


