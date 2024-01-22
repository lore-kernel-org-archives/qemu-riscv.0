Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14970C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 13:08:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRu2U-0000QE-Pu; Mon, 22 Jan 2024 08:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRu2S-0000OR-3r
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:08:32 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRu2Q-00014L-AY
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:08:31 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EF8BD40C6F
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1705928902;
 bh=bkdhpseem98U1T18GinlyhMKqzaSig5oZwtVLCYIx7A=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=XtdjPpZrOPLol7lGgJWX9NNjvNbD/Cra7u9NPmV2tWFlwYWpsClaSBUxdS5Gm/V6B
 PhrvmamdD/8UZQtITyVncQ91gwUHcb04arCBaACRuVUjSm0X/KWl3PmZyx0BkXnQ4j
 wjPpLXrKMWbCFsmFqqO2xObRKTV1C1q7A0haXrwgO6R5rtj6Q3kmpqtxTAZiX7f9Wm
 3+f+gS/1GMMjAnCGpkzt5r1eE7aDEpjAybRJ/1vcJ0bZK13w0TGN2+Dip7KNa4lcQ8
 9NVMyurjnE75LsueYuA6Aqnd6MoIPRVp92r597pMpcWydiG2rhZmC0wE1W+K0beJ9D
 QIM5wNUB1cTVg==
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-337d7158aa7so1753210f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 05:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705928902; x=1706533702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkdhpseem98U1T18GinlyhMKqzaSig5oZwtVLCYIx7A=;
 b=gbS4R0GqmKL1P0ZFBYrT5GFk7r4HIRFnSM4EhzaaG4hRJlYXgW34/WOgDz/991j+ay
 exES+d4nE8nZQlRLkdeFP98+/6J2DOJehZjhjveNgWIWd40oKei7P9OOeaiAJziI7eyo
 v9gyVCbn1fCpBsYBR9w8HZeydbY6pR4kFKP3URolGl5fBS7PM5xL+6Zwilh0mETdYxM3
 Fn9/aqLr87F8NYeXWRIgMNSTa/Sh8+17cHj0EHrdgIy9d7/3f5K6E0zIau2i/Z5/c7Lz
 EDpOEoQKQk0dpEBgJeU80FPgFjCSQRA83N9PjYOIaaF4h6eU4tY0xJNga6fBVXk2bxcR
 ny3Q==
X-Gm-Message-State: AOJu0Yyt/Uz32ksZQUUR/awwgUgbOpw1X8izi/uedkSI1WF/goZaX6lI
 eCQnnll6DvRzqhYhdpRKk8b18hPQsP2pIoiley0DzxxVXdTzYuolDs1x6YtqeLqx0bvlWXvlnS3
 NXs3MTdbljkFbQeyI0UKAVnp3m4QpC6oK1sDCU3twP1gwoDUzvJ2TOvWMZyrEHrqwGKQDVqUVb8
 g0
X-Received: by 2002:a05:600c:1310:b0:40e:509b:4bcd with SMTP id
 j16-20020a05600c131000b0040e509b4bcdmr1150027wmf.375.1705928902167; 
 Mon, 22 Jan 2024 05:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF4Lz4w5Q13ye8H2GDlhNKmd1wbVHb+LigwBhM4NKRNdDAuU59yatBmjHni2ZMaA2hYxQBQg==
X-Received: by 2002:a05:600c:1310:b0:40e:509b:4bcd with SMTP id
 j16-20020a05600c131000b0040e509b4bcdmr1150013wmf.375.1705928901790; 
 Mon, 22 Jan 2024 05:08:21 -0800 (PST)
Received: from workstation5.fritz.box
 (ip-178-202-040-247.um47.pools.vodafone-ip.de. [178.202.40.247])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040d62f89381sm39214456wmn.35.2024.01.22.05.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 05:08:21 -0800 (PST)
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
Subject: [PATCH v3 1/4] smbios: add processor-family option
Date: Mon, 22 Jan 2024 14:07:55 +0100
Message-ID: <20240122130758.74051-2-heinrich.schuchardt@canonical.com>
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

For RISC-V the SMBIOS standard requires specific values of the processor
family value depending on the bitness of the CPU.

Add a processor-family option for SMBIOS table 4.

The value of processor-family may exceed 255 and therefore must be provided
in the Processor Family 2 field. Set the Processor Family field to 0xFE
which signals that the Processor Family 2 is used.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v3:
	no change
v2:
	new patch
---
 hw/smbios/smbios.c | 13 +++++++++++--
 qemu-options.hx    |  4 ++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 2a90601ac5..647bc6d603 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -102,6 +102,7 @@ static struct {
 #define DEFAULT_CPU_SPEED 2000
 
 static struct {
+    uint16_t processor_family;
     const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
     uint64_t max_speed;
     uint64_t current_speed;
@@ -110,6 +111,7 @@ static struct {
     .max_speed = DEFAULT_CPU_SPEED,
     .current_speed = DEFAULT_CPU_SPEED,
     .processor_id = 0,
+    .processor_family = 0x01, /* Other */
 };
 
 struct type8_instance {
@@ -337,6 +339,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
         .name = "part",
         .type = QEMU_OPT_STRING,
         .help = "part number",
+    }, {
+        .name = "processor-family",
+        .type = QEMU_OPT_NUMBER,
+        .help = "processor family",
     }, {
         .name = "processor-id",
         .type = QEMU_OPT_NUMBER,
@@ -726,7 +732,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
     SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
     t->processor_type = 0x03; /* CPU */
-    t->processor_family = 0x01; /* Other */
+    t->processor_family = 0xfe; /* use Processor Family 2 field */
     SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
     if (type4.processor_id == 0) {
         t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
@@ -758,7 +764,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->thread_count = (threads_per_socket > 255) ? 0xFF : threads_per_socket;
 
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
-    t->processor_family2 = cpu_to_le16(0x01); /* Other */
+    t->processor_family2 = cpu_to_le16(type4.processor_family);
 
     if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
         t->core_count2 = t->core_enabled2 = cpu_to_le16(cores_per_socket);
@@ -1402,6 +1408,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
                 return;
             }
             save_opt(&type4.sock_pfx, opts, "sock_pfx");
+            type4.processor_family = qemu_opt_get_number(opts,
+                                                         "processor-family",
+                                                         0x01 /* Other */);
             save_opt(&type4.manufacturer, opts, "manufacturer");
             save_opt(&type4.version, opts, "version");
             save_opt(&type4.serial, opts, "serial");
diff --git a/qemu-options.hx b/qemu-options.hx
index ced8284863..d90bdffc7a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2686,7 +2686,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 3 fields\n"
     "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
-    "              [,processor-id=%d]\n"
+    "              [,processor-family=%d,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
     "                specify SMBIOS type 8 fields\n"
@@ -2714,7 +2714,7 @@ SRST
 ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
     Specify SMBIOS type 3 fields
 
-``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
+``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-family=%d][,processor-id=%d]``
     Specify SMBIOS type 4 fields
 
 ``-smbios type=11[,value=str][,path=filename]``
-- 
2.43.0


