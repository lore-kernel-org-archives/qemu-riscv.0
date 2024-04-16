Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E0BC4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 13:57:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwjG3-0002HF-7g; Tue, 16 Apr 2024 09:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjFr-000240-Nz
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:53:47 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjFg-0001mf-Il
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:53:47 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so5680476e87.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713275615; x=1713880415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cesSegXMr71Lpaal5FJBOqynS/3X0jmvbPzoIKbt5l0=;
 b=fyH4cx1qdVNzxXdMjTmuryJvQ722mbCX0fnEBSq6CcFcOH6LNSzQAgXg4BwUtPlqBo
 38dXIFcfwCwonmz56a/YQnYqH4j63Q8HBgGCIslBEMTcpA5Qs3ZZn9FMNcmtjrQuxhhS
 7J6UBVt6dF+CRMMrDNLArRxSaAZRczH4rTiP5rF/H9p62qgnLw6DZ+L8ADsUfKxjAm2T
 seYx4VZ2jF9eFLePr1a9CNkr2NqdGfv9SogMqTnFuAPdjP4T8AsHxHE7we54+/dibS1D
 W6Bk++QHmXJ73eCxDaCIP8s1snCEejLzkqdGkVCSh/4bqOWDfdiAyvohEt8MFZmvac8p
 lywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713275615; x=1713880415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cesSegXMr71Lpaal5FJBOqynS/3X0jmvbPzoIKbt5l0=;
 b=aNfw0K9xRdh3Uvi4JGUnAKaZcbNeuvas8DI9re+d58eBkIae3fFuPeFeL3Se6v4iKb
 UGGM8FRV607WKnDC2DcrooxQqQf0UoI9zd6b7Wo49duPWEhzl8QYl/8mweE6qxDycKEE
 T9soGeYwI4oCs6K5CpjG0FNtdb0ZehukDMOP2EoaTNFreCMsS66dkYZ/AXT6hpya7IUI
 CXF0/GxkCOd0WMMk5AMlnn1ZEG2zb491WF00/wZxfz3B6pIMqa6Zh48sbL/nXGFo1jgd
 Np8YDLglSsWDiPR1PX7D/8KtspZxuJD0ZH66yXv99GQyDSoaiq5zb4bWsc5hGw6AR8my
 cAsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHB6yu4cPMyKKo20i8gW12dx9CWzuptLCKo31EDBrJW+mSDiAw2tYoCji/IYyt7WhULlIiiPvRaxolOfkiS8rQ2KTqVW4=
X-Gm-Message-State: AOJu0YzmIGvC2ZzGMDWJRrPb51f1OpDW/9UyRhWHiAbtGBXqwwnXMz3t
 scYRnkdgZpZkgFF5QwulyfK2jh0+6/4UTibHenNEVVl72uwvvt3I9BsQNCWGqEU=
X-Google-Smtp-Source: AGHT+IGBPnjfSmRXCp87ZjDOBQyS+KGTJz7+un36CuOzI+u1xIIx9U8ve5RbLEcL35jlPS1DV7IfRA==
X-Received: by 2002:a05:6512:39c5:b0:518:de06:31b6 with SMTP id
 k5-20020a05651239c500b00518de0631b6mr5266704lfu.3.1713275614821; 
 Tue, 16 Apr 2024 06:53:34 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 fe1-20020a056402390100b005701df2ea98sm3337890edb.32.2024.04.16.06.53.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 06:53:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 06/22] hw/acpi/ich9: Remove 'memory-hotplug-support'
 property
Date: Tue, 16 Apr 2024 15:52:35 +0200
Message-ID: <20240416135252.8384-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416135252.8384-1-philmd@linaro.org>
References: <20240416135252.8384-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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

No external code sets the 'memory-hotplug-support'
property, remove it.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/ich9.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 573d032e8e..9b605af21a 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -351,21 +351,6 @@ static void ich9_pm_get_gpe0_blk(Object *obj, Visitor *v, const char *name,
     visit_type_uint32(v, name, &value, errp);
 }
 
-static bool ich9_pm_get_memory_hotplug_support(Object *obj, Error **errp)
-{
-    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
-
-    return s->pm.acpi_memory_hotplug.is_enabled;
-}
-
-static void ich9_pm_set_memory_hotplug_support(Object *obj, bool value,
-                                               Error **errp)
-{
-    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
-
-    s->pm.acpi_memory_hotplug.is_enabled = value;
-}
-
 static bool ich9_pm_get_cpu_hotplug_legacy(Object *obj, Error **errp)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
@@ -445,9 +430,6 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
                         NULL, NULL, pm);
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_GPE0_BLK_LEN,
                                    &gpe0_len, OBJ_PROP_FLAG_READ);
-    object_property_add_bool(obj, "memory-hotplug-support",
-                             ich9_pm_get_memory_hotplug_support,
-                             ich9_pm_set_memory_hotplug_support);
     object_property_add_bool(obj, "cpu-hotplug-legacy",
                              ich9_pm_get_cpu_hotplug_legacy,
                              ich9_pm_set_cpu_hotplug_legacy);
-- 
2.41.0


