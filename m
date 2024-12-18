Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB06EE77188
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 11:42:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNsQZ-0007f5-Vz; Wed, 18 Dec 2024 06:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQN-0007aS-Qy
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:41:08 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQK-0007wm-Os
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:41:07 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso55893125ad.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734522063; x=1735126863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHmSZE7CHWvGDmRA2eHkri4i48DH29862/zQmSzlozM=;
 b=XzQrk/ig69yErSUwfrfKJOABMQtCnsM2X0DWV3pORX+VfdLNQiBRaFj5xZDxXO1B0R
 WjX2Y5S2KJL3g53KIDNkoYGgBelK7WHnCN2meOqsBaM6m11EgYkCApDs85WKL/ysCj4P
 y38avMvQP+GaLndfe4jhUMr0KxKT3YqipTfc5resmvfQMbbL6HSaVXlED0aBfNAlOnpz
 mpBrapyqT8+7alSwEZZZgIwo/+IZ4XtoRD0Tcu9ULVi18V2gSl13ytQBlcfoLdliG/6a
 9hsWnRTCcp1ZkJLdVBVLmCxFlj4VbKU6uYCE8k65ZO4SjvhQhJJfKfyK9U0g0RvnXQyF
 Rrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522063; x=1735126863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHmSZE7CHWvGDmRA2eHkri4i48DH29862/zQmSzlozM=;
 b=BptyHpD1oT2fo3t/16fY94nBRzx60WWsFO9Wm4BxX6LABhLPHHof+uhO+ZXmDZ3mpG
 kmoTuWThrUv5Ov21lE9Vv90If36BTE9qIUvaWYy7vFPp+oVEHolu0YMLAVn6+m4Yqvk1
 hD77Q3qI1x6HeOsIUhB6cfFgerPt5O/m8kMETABDuYCvAqps6A7oVZ5m8R7MD9Opy4eM
 yLrOJz2m3MdxRo5MIQGwOIDxpE9OJTwLGbjxQHU4tp99+KlyaeFIeruMm/pikd+Zq3C9
 kWOBVWcTFkJN6exxCurk3kDujKIy9lKUn3R1ALckhv9oNqGZ1TyaspeCO+HvsebtMaEU
 WyyQ==
X-Gm-Message-State: AOJu0YyyHidtRPQBoaKpdrq1EqWtVSzCxIoH/VSTn8/RcP1yYWIAoBjz
 fjX81TvBXCWe6GfUHS242dRrtJeVHNryYrlKJp8WjjPpYSZErQsLveB6QW8Jwz8=
X-Gm-Gg: ASbGncunawgFgvq2N6T+8Zi/A+QJLUnvcxXJMXiRMCNcnP5MCYNPYxokl9ysilRNHBH
 nfddwhzFkmOnpYjkUzdvpgfwv6vqZTNixglEpzuccoP2qrC29zyZdqZ96CrRW6A3tGpl7/K+q7O
 37yojNKrV06yPSSc9jeq1BBnlsEhiVdEsd75fE9PDEcqkAuW5eyjyvcVMYH7ElfMnt2ZygzPrek
 riP7Gqig6ePzct46Wp3YtNZLcPbehuTFz7u7bOZVp9wYafTJsALqHTalTsGI4lt+V5KB1VZt8yZ
 bg==
X-Google-Smtp-Source: AGHT+IFMpjN/SBTU28Vphb85HRm/82bg+8pa8um04x1NxUvv3mpfd36k89J7cwXgjzXIRbG8UwOsCg==
X-Received: by 2002:a17:902:d48e:b0:216:18dc:43b3 with SMTP id
 d9443c01a7336-218d725a6d7mr27687265ad.42.1734522063116; 
 Wed, 18 Dec 2024 03:41:03 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1dcb447sm74462285ad.68.2024.12.18.03.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:41:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 7/9] target/riscv: add shvsatpa
Date: Wed, 18 Dec 2024 08:40:24 -0300
Message-ID: <20241218114026.1652352-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
References: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

shvsatpa is defined in RVA22 as:

"All translation modes supported in satp must be supported in vsatp."

This is always true in TCG so let's claim support for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c                |   1 +
 tests/data/acpi/riscv64/virt/RHCT | Bin 374 -> 382 bytes
 2 files changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7aa8a136d6..b5ab97b4de 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -185,6 +185,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shtvala, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(shvsatpa, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shvstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shvstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 2c7dc6c9ab8d8da9c30ad34294ef28427a4f8f1a..fcd9c95a6ae6e6977e5d9c33a39785269a28aa58 100644
GIT binary patch
delta 47
zcmeyy^pA-v$iq3Lj*)?Z@&80F16CPEMh20I_J^1gOA03b4w&r2sKgP%$iNWC$iM&q
DMU4z8

delta 44
zcmeyz^o@xt$iq3LjFEwX@#91;16C16Mh5PQ_J<~OF?vl7W>n_zVPs$kV`N|e00!3y
Az5oCK

-- 
2.47.1


