Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28366C47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnAh-0003Aq-1i; Fri, 19 Jan 2024 06:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAb-0002uA-SD
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:22 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAZ-00021s-05
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e80046246so3923175e9.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664176; x=1706268976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEBY/QoJw39gPaelo1yXBjmSZBtzyiV4TS+i3QbPQJM=;
 b=Nw+dTagW1+d6LhKDba/gyndclCxvvQoFFz3LJR/KjY92aNF4CQ9oYOGcrhopwsZy2i
 M1OuBpYsTwB29K00ykYB7gP+2tvj/W21DKkPDUSQzlJXqrVdahY02Ru9ErI8rsO03M0z
 jGg9kSqVOVvbz61D57F7aDEspJh1hvvm6g3c5euD1H4vx5UXFR8W6n7wrscAY8nE4Zhv
 ZVVhofRhrRPgQFDa4C+U/gwQoZdyTgPEKc17+LUbA1T43++wQE8oz/GGJYhXU37Fo+4u
 F69OX4AhqoVSuyyq7SaH6mbTpdT7qLCcXK5A3X3DLyHpabFV3LZokoq5N+8wAjq3gA/7
 Uarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664176; x=1706268976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEBY/QoJw39gPaelo1yXBjmSZBtzyiV4TS+i3QbPQJM=;
 b=W6gfe7gouuz0Uo624Hhp9tR6RS/NNUdmwaCGPVYlV/YCLrwte3/oP2EZYSJyWpFL7a
 SvbvSwlin18+THYCfBrWbN7c6k2rpDx30fsEoE77DauIrV4QCN+5sOAK3eEEsy1TvA4l
 9esIhj4gasupIMBpJOd4cIZUDlvppTOhmCUQZ6SRE3rxmEC+jAyTYL/p63jVenelVSRO
 BhT4pQV/C0YyKuiOSPP/rDahAJB0YyqsplFdPBxPAct7poFhTAdIGC0FdDSOdHApnqqz
 Uw9sBJTC9mmtjhz3jCskg7re2nMdRYM1xydGMhcDo7zbq1BiLQ3S/z3dSovByxmf6yD+
 RLpQ==
X-Gm-Message-State: AOJu0Yxe5r6e6tmlmxGrvYl7eQe0D4l9DI0uJd2vWqhdhITG9FNOXmCe
 FOBuIzgKbG0ULnx4quGT8gpAXGpN2Zuqfd9QOcYxXYGNnuctJ2NQJxjSj5/9J1o=
X-Google-Smtp-Source: AGHT+IHeteUmgwAwy4JhqSXuAP9WItdxEigyNMJ0LqUhFfJ0EEy9EGExUg4AliU0+wFjYRuXuKt8Vg==
X-Received: by 2002:a1c:7706:0:b0:40e:84f3:7e11 with SMTP id
 t6-20020a1c7706000000b0040e84f37e11mr477000wmi.81.1705664176322; 
 Fri, 19 Jan 2024 03:36:16 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b0040e88fbe051sm8678595wmo.48.2024.01.19.03.36.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 devel@lists.libvirt.org, Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 15/36] target/sh4: Deprecate the shix machine
Date: Fri, 19 Jan 2024 12:34:44 +0100
Message-ID: <20240119113507.31951-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Samuel Tardieu <sam@rfc1149.net>

The shix machine has been designed and used at Télécom Paris from 2003
to 2010. It had been added to QEMU in 2005 and has not been maintained
since. Since nobody is using the physical board anymore nor interested
in maintaining the QEMU port, it is time to deprecate it.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240109083053.2581588-2-sam@rfc1149.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 5 +++++
 hw/sh4/shix.c             | 1 +
 2 files changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2e15040246..e6a12c9077 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -269,6 +269,11 @@ Nios II ``10m50-ghrd`` and ``nios2-generic-nommu`` machines (since 8.2)
 
 The Nios II architecture is orphan.
 
+``shix`` (since 9.0)
+''''''''''''''''''''
+
+The machine is no longer in existence and has been long unmaintained
+in QEMU.
 
 Backend options
 ---------------
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index aa812512f0..eb3150b5bc 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -80,6 +80,7 @@ static void shix_machine_init(MachineClass *mc)
     mc->init = shix_init;
     mc->is_default = true;
     mc->default_cpu_type = TYPE_SH7750R_CPU;
+    mc->deprecation_reason = "old and unmaintained";
 }
 
 DEFINE_MACHINE("shix", shix_machine_init)
-- 
2.41.0


