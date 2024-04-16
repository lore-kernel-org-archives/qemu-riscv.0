Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0B0C4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwo29-0000oV-4R; Tue, 16 Apr 2024 14:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo25-0000mb-QP
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 14:59:54 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwo23-0005L5-Hn
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 14:59:53 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56fe7dc7f58so4456984a12.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713293990; x=1713898790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xDdgtYhdKYRWfSSiojdSyo8J+LTMwwnUVOciC/4kns=;
 b=hY9ZuXyusK9LwCIKW04b4dG3D2tYhUUA7+xkhvYtAMsnOdScgzLGEmrFno6Vi4/8mH
 8LPZ4Swcy9tZs+oCYB/5OTrUWL/H7WVRezp4u78wGe6UnOMsP6u5ul63IOhqV6GlkT/m
 yGVgrZFI44gECWZDhFVpE3+DiPmfR1QykVwVASagzfdvl2TaVL9D7w74JGMbQbP07gX2
 iz+daiX3x1nWDIcN2g56UP6GR4iPsq9Y9SkqF9/asWGWnorGkoM9Exvm/DNSMf01eLgg
 3UYX21VLoErXcW4gRvzo9pVVFaFDrrXM8F4D1sBnf25wTQlfszaaluuhYC0MofMIIwIw
 lZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713293990; x=1713898790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+xDdgtYhdKYRWfSSiojdSyo8J+LTMwwnUVOciC/4kns=;
 b=wfgnwVjAQZ0N6R6LCrA8NYMw7Ucq4jjwZt9V26RZntUIVpxfnraOAJ+4k84xkEciHH
 qTuYCLe0rnUiSPltk9KvHL9vnIWtvNUiGRMNGTfdBfngDtpugn+Fmw9ELCm6MXj3RzM/
 kcB8CxE96kvKKy0n0j1G3ndTaiSZX7VAAKs7VHVOb7Tc7lCU+asWtbBXCKrnU+jG3WmD
 ZFLJb/cR20oeftoGu1V22mnyMcwaPoqT8PrnsjvLILl+7uD+GY5CuHF+RnWqYXDxzdly
 O5lGXc+r22kD6mqxrtnrs3TWcI4gZ5ifljYsgvZexivTQcWrZfq4m3uT/wUW0YpS322+
 fzDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUkHbeQKb5Umg6tty3n/fg/gSOCFjLNFFBboZxaKZLNB/59Spbv4nSdrk7bB+eKQj0fvDDgiCA9CzThewly7xSIV3WeSY=
X-Gm-Message-State: AOJu0YyyRBTcP917vPWeWvP+JuRVzftKL0evhZSczocGxDt7UWtLzdf9
 blz0RXwxcjqcqjw1+UUBmoB9xg7iDEWO+8Hrxn7GOXCMOfM91Pba9nZ7PgovS7E=
X-Google-Smtp-Source: AGHT+IEDNy9nz2o8/rgG8dWOKTg8TwpSrw8fZ0OTvZcdzdz1ruK9kl5BqonIaZQSNdgaf9AzfUmw8A==
X-Received: by 2002:a17:907:9803:b0:a51:d204:d69e with SMTP id
 ji3-20020a170907980300b00a51d204d69emr12935641ejc.7.1713293989842; 
 Tue, 16 Apr 2024 11:59:49 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 gc21-20020a170906c8d500b00a53e0db2f29sm2313701ejb.182.2024.04.16.11.59.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 11:59:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, devel@lists.libvirt.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 01/22] hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx machines
Date: Tue, 16 Apr 2024 20:59:17 +0200
Message-ID: <20240416185939.37984-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

Similarly to the commit c7437f0ddb "docs/about: Mark the
old pc-i440fx-2.0 - 2.3 machine types as deprecated",
deprecate the 2.4 to 2.12 machines.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 docs/about/deprecated.rst | 4 ++--
 hw/i386/pc_piix.c         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7b548519b5..47234da329 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -219,8 +219,8 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
 better reflects the way this property affects all random data within
 the device tree blob, not just the ``kaslr-seed`` node.
 
-``pc-i440fx-2.0`` up to ``pc-i440fx-2.3`` (since 8.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''
+``pc-i440fx-2.0`` up to ``pc-i440fx-2.3`` (since 8.2) and ``pc-i440fx-2.4`` up to ``pc-i440fx-2.12`` (since 9.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 These old machine types are quite neglected nowadays and thus might have
 various pitfalls with regards to live migration. Use a newer machine type
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 18ba076609..817d99c0ce 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -727,6 +727,7 @@ DEFINE_I440FX_MACHINE(v3_0, "pc-i440fx-3.0", NULL,
 static void pc_i440fx_2_12_machine_options(MachineClass *m)
 {
     pc_i440fx_3_0_machine_options(m);
+    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, hw_compat_2_12, hw_compat_2_12_len);
     compat_props_add(m->compat_props, pc_compat_2_12, pc_compat_2_12_len);
 }
@@ -832,7 +833,6 @@ static void pc_i440fx_2_3_machine_options(MachineClass *m)
 {
     pc_i440fx_2_4_machine_options(m);
     m->hw_version = "2.3.0";
-    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, hw_compat_2_3, hw_compat_2_3_len);
     compat_props_add(m->compat_props, pc_compat_2_3, pc_compat_2_3_len);
 }
-- 
2.41.0


