Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945E1C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 13:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRu2T-0000Q9-U9; Mon, 22 Jan 2024 08:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRu2R-0000OJ-Pr
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:08:31 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRu2O-00014O-Oh
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:08:31 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4B8C140C75
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1705928903;
 bh=/DdGWBKENTjZaY7KXKP1GzdLyXx7O5ZTdH2bjh80K18=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=rK9EGAp5/w5ew0FmZTrRoesOKWJVFF0RHgH15tnklh5OZ2OnJ5Wcr4CeOxjehwDqD
 MmT0ZLXTH+VGSRush8M/kDK2Bqv3nnb0gXtwPzM2Tdv7OFOXLQYyPukwvdCgfWXMwJ
 sEDoLxmHQT+kPwwro6JTjbgSMeqxkctx49HO11AcWLwB4gXvW6EBpvLGIo7VHZ+JJ1
 oMrNXUByQXmOeabbSlYBl6Qw61ehJq7T9Mn1bK7fOFV5lG9Vme3NXKNrG8hda9NxW+
 MTwXxxdknLMCvS/51P5g65Od9fxEtbRRo/BIWio/FEWOWFedyHd+Tz9aYc0RlS/C6h
 vyRwZri5MCSNg==
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e5ebf58fbso11093885e9.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 05:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705928903; x=1706533703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/DdGWBKENTjZaY7KXKP1GzdLyXx7O5ZTdH2bjh80K18=;
 b=m/Wg0XrOmlIwMhsTrLscsn/v2ogp5MZTSGyzPbQwaUuaEhvH7kgeeA+UpCOPlOD4PW
 5dfvuHbiTTETzVaMoTEqk8gUt9ZWCNbJQuYyv6qnN7aqLHwGu5EGgY38AXHCWJdg6e3v
 UoATWsT8u8dce+mXMeF/CCplVu11LwxkdzY7H66TVM0wbXum24+irwTvyn0tggfS00o7
 YudyQgIwii9HV9X1ao3bAzWJRdDLDfgm7zaslHWnJPRbnEZJkkWfbPu51Cph2tJfiUSE
 JwTCrWXIpbsdUoRiDpE5mg8ac6Zr3SnsQA1PXwBXGRG0kRusB7mpFP6wAjCrgcDI4B0e
 AJ1A==
X-Gm-Message-State: AOJu0Yxj2htfWOnJRvX4jCCAR7UoDGIoaG0KiXST2TKLqOG56XhKRtxa
 lnIiI4TlK7k4+5VmxPyBTdWCSNsoCj6GnVQ+h+U14dd2lbUnQDQCScvT/hBqTvLiLFC6wbjDH6o
 7Il32CSQelL9LpOjITAZShYYAA140xyWwr7TSkwztsowrp+j3aG6ktP2KerB1BZGxaIKy
X-Received: by 2002:a05:600c:4d0e:b0:40e:75e5:4e70 with SMTP id
 u14-20020a05600c4d0e00b0040e75e54e70mr2192379wmp.166.1705928902911; 
 Mon, 22 Jan 2024 05:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExRT6gsEd/qOi465xI+wdYQnAJxVXrEJMllDivULizXySEff+kPZa4juN9B9iG3qjUMHDmBA==
X-Received: by 2002:a05:600c:4d0e:b0:40e:75e5:4e70 with SMTP id
 u14-20020a05600c4d0e00b0040e75e54e70mr2192363wmp.166.1705928902659; 
 Mon, 22 Jan 2024 05:08:22 -0800 (PST)
Received: from workstation5.fritz.box
 (ip-178-202-040-247.um47.pools.vodafone-ip.de. [178.202.40.247])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040d62f89381sm39214456wmn.35.2024.01.22.05.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 05:08:22 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v3 2/4] smbios: function to set default processor family
Date: Mon, 22 Jan 2024 14:07:56 +0100
Message-ID: <20240122130758.74051-3-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122130758.74051-1-heinrich.schuchardt@canonical.com>
References: <20240122130758.74051-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Provide a function to set the default processor family.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v3:
	no change
v2:
	new patch
---
 hw/smbios/smbios.c           | 7 +++++++
 include/hw/firmware/smbios.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 647bc6d603..c0c5a81e66 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -989,6 +989,13 @@ void smbios_set_cpuid(uint32_t version, uint32_t features)
         field = value;                                                    \
     }
 
+void smbios_set_default_processor_family(uint16_t processor_family)
+{
+    if (type4.processor_family <= 0x01) {
+        type4.processor_family = processor_family;
+    }
+}
+
 void smbios_set_defaults(const char *manufacturer, const char *product,
                          const char *version, bool legacy_mode,
                          bool uuid_encoded, SmbiosEntryPointType ep_type)
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 7f3259a630..6e514982d4 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -295,6 +295,7 @@ void smbios_set_cpuid(uint32_t version, uint32_t features);
 void smbios_set_defaults(const char *manufacturer, const char *product,
                          const char *version, bool legacy_mode,
                          bool uuid_encoded, SmbiosEntryPointType ep_type);
+void smbios_set_default_processor_family(uint16_t processor_family);
 uint8_t *smbios_get_table_legacy(MachineState *ms, size_t *length);
 void smbios_get_tables(MachineState *ms,
                        const struct smbios_phys_mem_area *mem_array,
-- 
2.43.0


