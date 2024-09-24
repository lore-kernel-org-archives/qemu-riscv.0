Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4973BCF9C6F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 12:46:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1st4u7-0003ub-JF; Tue, 24 Sep 2024 08:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1st4u5-0003m5-HR
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2024 08:44:29 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1st4u3-0005uI-WA
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2024 08:44:29 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-502c8f50c5dso1498435e0c.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2024 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727181867; x=1727786667; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRTK5I7NFMS9CrB62Z8+YS9pz/eTcEjdmLZgOi2DrpE=;
 b=I7L57b1Ba0wRQs7cjMXVHAI0n6UcUTMV/nGrlGMaTwzyHy8wUuZ0Y2EfPKd2tWZZTL
 AkfaEOO7Br6Rjh/s9bedCrl4LEXAPfJXUXZ1sGw/Qw7YjSVgcIgFTW+49h4mVKRG1POj
 Ma68Cn5nSGWHuZAeH4tfkx45ph97AbY37QO4nYB9zbLN91eo64KpFHzclf3Pt3j3/8TG
 h6qfmGz1pumHybt+mXJZsP+nhhKJ1zSBGnqhTPUdA0lr5hzf3T+DyahJjNVGLPH0swsn
 iyMROuqnC3sQ/tXLFdZz/+UCtr7tSaJ3zKZjhWXy+Ff+19L1YMZsZlJA1EKtICuqogl5
 EPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727181867; x=1727786667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRTK5I7NFMS9CrB62Z8+YS9pz/eTcEjdmLZgOi2DrpE=;
 b=k1ttosAbr28eOtXHKjsWx17Y+YK1oWU3htwxVR1F9ng4O2rY50AcCm/5nc4cWCxGth
 rNwy2ikJfFPgTSGz3B7aCcoIxaBJn9ErWHP5DEEIhrH+zOMUOpy90a87qNSCgOz47kL3
 1N/jBYGBSIjV2aZeXot1z7dxhG0jt310QSNXQhwSAzZT3wi9b/bnegetp/SUTf3zOlLx
 7blANglIGOXG0dZ5idL47NWIyvuHsnqY/7yWzcRIjmZ5WAj1bbHWWUVVhWpkuH789xfl
 5uzraolzrfO+kqXA7TjXIRO2lHoPUYvuNT/I26VZArUQdYe8y/jR0JFxs9JGCq25BuCf
 M9BQ==
X-Gm-Message-State: AOJu0YyOqLkngBYPdZiPBQGcEi0NI5h1JLhQjXtYB8ej69lenhMu/jE9
 9UPwS3SuY3R1vuUBgl+d2imIAK7ZI0ZBNq/yRAzuMjWAuPMIL7dcF1RRivGBbJc=
X-Google-Smtp-Source: AGHT+IEYQXV8QUmt+M0ZCsXm9bRzxZpLTti2uXsoIbDtJnNoPAh1Lpl/2bD/QZ2ki8uWX26DLWs+Sw==
X-Received: by 2002:a05:6122:8ce:b0:4f5:254e:e111 with SMTP id
 71dfb90a1353d-503e4113966mr8542643e0c.7.1727181866743; 
 Tue, 24 Sep 2024 05:44:26 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([187.101.184.93])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-505aa10a8fbsm767830e0c.49.2024.09.24.05.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 05:44:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/4] target/riscv/kvm: deprecate riscv-aia string prop
Date: Tue, 24 Sep 2024 09:44:07 -0300
Message-ID: <20240924124407.766495-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924124407.766495-1-dbarboza@ventanamicro.com>
References: <20240924124407.766495-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa31.google.com
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

We want to use the new boolean properties instead: riscv-aia-emul,
riscv-aia-hwaccel and riscv-aia-auto.

Mark the string prop 'riscv-aia' for deprecation.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/about/deprecated.rst  | 8 ++++++++
 target/riscv/kvm/kvm-cpu.c | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ed31d4b0b2..d3e0e3e303 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -463,6 +463,14 @@ available firmwares that are using the current (wrong) name.  The
 property is kept as is in 9.1, together with "riscv,delegation", to
 give more time for firmware developers to change their code.
 
+RISC-V "riscv-aia" KVM property (since 9.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+This property was deprecated in favor of using the boolean properties
+'riscv-aia-emul', 'riscv-aia-hwaccel' and 'riscv-aia-auto'.  The
+motivation behind it is to make it easier to expose the internal
+state of the KVM accelerator in APIs such as query-cpu-model-expansion.
+
 Migration
 ---------
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index e256e3fc48..610057870f 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1732,6 +1732,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
     object_class_property_add_str(oc, "riscv-aia", riscv_get_kvm_aia,
                                   riscv_set_kvm_aia);
     object_class_property_set_description(oc, "riscv-aia",
+        "DEPRECATED: use riscv-aia-<mode> properties instead. "
         "Set KVM AIA mode. Valid values are 'emul', 'hwaccel' and 'auto'. "
         "Changing KVM AIA modes relies on host support. Defaults to 'auto' "
         "if the host supports it");
-- 
2.45.2


