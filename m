Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pShKH-0004EN-Ic
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKG-00045A-2o
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:40 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKD-0000V7-01
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:39 -0500
Received: by mail-pj1-x1033.google.com with SMTP id cp18so229533pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htx3L8ZbFkDG8vcCbUENB0v9bNbIA+8lPNiDX6BMsUg=;
 b=OFI2IffIzxCoqGS4LvEtnKA2Klq6cxNbLKMs2DQw5EF/TX2wApZfGVAxa/8SakldiS
 +DvvhkMrzqAvs56bV9rCwhcAVN9Ze9xLOoETSx15Ei1ar4ijYuCUmz9kEeGkbrc2Wl0J
 GvGeZylEyokGrFq+TGrQj16e2ZZ5+FfAVwNJrp5HmciV1+/70cZhalzjmVZd8L5kNYpP
 oPdRsHYSS5EP59gXFpzFzVESbW+8O2it+1hNN4kJEWceTR9Vof2RnhFnGi/Le/0zjq2t
 t8WgoUqxRVwVvo3Wrawe6m5ZBdsUvsOJtXsm2jOf0dFdd5stBe5F3hSWCNNqNMlhr/Qr
 uOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htx3L8ZbFkDG8vcCbUENB0v9bNbIA+8lPNiDX6BMsUg=;
 b=YGA1RRlXTvIsjqbSMLJT7GHrhBQxlZwmZ0/qq0VfS9qx5JgmdHTqDWr0c4vpkIvw4J
 1rNN1nw+fYB1mY7PhukBy8gYk0IYcZIseQiXhtHCNKs64xssp4faQpUicZSQwpiR+A5a
 XGsghiNEelGzirUM2+y/JIDatBN3FJq5ljE1mRGHaSh1IXK6HN7VZnMhg8ag532Ju96v
 oRDEd/HiKN8G/rxso5ppdUKqtByyBl9FK9VbljqlJdKdd0DYOypyXmYoB+T4ZNhxKzTG
 xLzbMy4j0Mnxu+1OTxtfj+aIK6ZVxA80+JxcysLXHne3Nd/4zLMzVPvntveeTxHc0S0Q
 0g2A==
X-Gm-Message-State: AO0yUKVxJqKSX58dHPBfcfghQgaPME1VE7pmZKPA0K/nYA2v9q5egOkN
 FatiZ21DU0/CW/hOgAb6+XEMSQ==
X-Google-Smtp-Source: AK7set94vGJbfZWgGAtMv9FYssmjlDYOut6x3ozSPy5Jws3n82X0wXiz5NqjDqsEbkkfrRYl1eEw+w==
X-Received: by 2002:a05:6a20:231a:b0:c1:344c:668f with SMTP id
 n26-20020a056a20231a00b000c1344c668fmr4187355pzc.12.1676565695568; 
 Thu, 16 Feb 2023 08:41:35 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:35 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V3 1/8] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Thu, 16 Feb 2023 22:11:18 +0530
Message-Id: <20230216164125.1945633-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Feb 2023 16:41:40 -0000

ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
in the RISCVVirtState structure and initialize with default values.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 5 +++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..1621278eb8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1513,6 +1514,10 @@ static void virt_machine_init(MachineState *machine)
 
 static void virt_machine_instance_init(Object *obj)
 {
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b3d26135c0..6c7885bf89 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -56,6 +56,8 @@ struct RISCVVirtState {
     bool have_aclint;
     RISCVVirtAIAType aia_type;
     int aia_guests;
+    char *oem_id;
+    char *oem_table_id;
 };
 
 enum {
-- 
2.34.1


