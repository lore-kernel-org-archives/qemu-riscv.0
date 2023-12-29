Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B26DC46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 12:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJBeR-0007nO-Cl; Fri, 29 Dec 2023 07:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rJBeL-0007li-EH
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 07:07:38 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rJBeG-0004yO-DB
 for qemu-riscv@nongnu.org; Fri, 29 Dec 2023 07:07:37 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 606813F62F
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1703851649;
 bh=pGgf1wpWz9czkWxYTWfdhI7PjQQXILGRmvI6GlRv8qc=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=kh/b+W3h0bPjGsnH0eGUSZum9A9k/J23OkQ9WjDSeDGj72/pkZi+BoOl729IF/Rtu
 jubUkCjkk62YQY4QBjwwMyrBgixlRNfGcc9rhdYu0oKoiaQCO94STqCJ7ipYKO5lKC
 n5zaRaNU2SqQUPPqqIEUREHXbhIs2JR/czLd83aU2TKPoOgylAOdmIRM+ytOs3tqRL
 Pof8nId1m3BpWsl5UonhotkBmrWZn7aApmHcfRrd0ZSc1CaQWvha5gAGkXWi4Jc3lQ
 pVSKdJNzCNZuD6YcDUCaGQcG69KH6leGGuOs3bmszbC6b1A/88YumQlo3ZgrqlZ//M
 6MDIIZbuLijPg==
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-555bda8b4a1so231342a12.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Dec 2023 04:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703851649; x=1704456449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGgf1wpWz9czkWxYTWfdhI7PjQQXILGRmvI6GlRv8qc=;
 b=dgcYhtM7LWy8YnB1LzlB1lcaAEHGCMGTKwNJt26/V8W3szDH1uEjT3VPkvtMTLxio4
 jZb9daDRsOGeImJ2gBcR+mKuB4fyq0XBJ/z7OrUgl9ZwzTnfrMX95bVOBernKZI6e/LR
 5CdH7xiq502/KMJLeR+Bc8d3LDGe9K0MeSZlVzQ6193u4m0kvWrCAOaQqqPBPaGgPOCQ
 +rRt23j/Ufw+JUQQppM7UEca2Tv1aBFu/OSxWjv3UU7m9OL6CH12G4khQNg69JnBGUv5
 BuB+zNU6bStQOMcemz5WkvNWB4B0ruy+kAmtvl5AMgnKyX7jfIw9kDSMRvVoW2s5CKPe
 N81w==
X-Gm-Message-State: AOJu0Yw6G64vnjvxsye3piFKBFxCy4B6DbRWS7aor57/jdo1zkLiO5gL
 cHxjoD/t+iw+Jg/gfGhmW8gfKrEFEqlM1rBAVZye7F2rwzi2Zy3TfVIkf5+eDnmt7JWWpRx1cW1
 wZOLo66dAckQJE4GjbuG2dgV2EJ4ynrBDRiO8hQQ=
X-Received: by 2002:a05:6402:4306:b0:552:e52f:944f with SMTP id
 m6-20020a056402430600b00552e52f944fmr8720992edc.56.1703851649112; 
 Fri, 29 Dec 2023 04:07:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKtkP9I56djALZdyds52h6QCcSlIsN2FDsDg5tG/s/KktteQ7TeJQgHIrtCYMKmU8FW1VeRA==
X-Received: by 2002:a05:6402:4306:b0:552:e52f:944f with SMTP id
 m6-20020a056402430600b00552e52f944fmr8720987edc.56.1703851648874; 
 Fri, 29 Dec 2023 04:07:28 -0800 (PST)
Received: from x13s.fritz.box (ip-178-202-040-247.um47.pools.vodafone-ip.de.
 [178.202.40.247]) by smtp.gmail.com with ESMTPSA id
 j20-20020aa7c0d4000000b005527de2aecfsm10943344edp.42.2023.12.29.04.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 04:07:28 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v2 1/4] smbios: add processor-family option
Date: Fri, 29 Dec 2023 13:07:21 +0100
Message-ID: <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.553,
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
---
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
index b66570ae00..7bdb414345 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2694,7 +2694,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 3 fields\n"
     "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
-    "              [,processor-id=%d]\n"
+    "              [,processor-family=%d,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
     "                specify SMBIOS type 8 fields\n"
@@ -2722,7 +2722,7 @@ SRST
 ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
     Specify SMBIOS type 3 fields
 
-``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
+``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-family=%d][,processor-id=%d]``
     Specify SMBIOS type 4 fields
 
 ``-smbios type=11[,value=str][,path=filename]``
-- 
2.43.0


