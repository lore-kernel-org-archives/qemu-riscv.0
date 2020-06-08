Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiIba-0001BT-BB
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 10:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbV-00014Q-LX; Mon, 08 Jun 2020 10:18:21 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbT-0004Tm-OR; Mon, 08 Jun 2020 10:18:21 -0400
Received: by mail-pl1-x641.google.com with SMTP id y18so6716032plr.4;
 Mon, 08 Jun 2020 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xcmBsgz0cKbUUsDwz8kNTZJo8dkNy8E2MfEzUiwRlrw=;
 b=YWkI665KzMQVr6of+P6GyPne6R0gUR+Atw3VoQuw2ndNo6+Dt4cbmMLlJWGlPqdeSm
 y0dzCSL6gQLrfZBYtPKjrc1sqxD/WWxTnnebNauwxzhsqRG204Tj3yZfWFLTJg/VXS8V
 t8BHDQRIbG8Mht6SQQNfi8jE4xM2d5LFvJ/4eZZaStGdAjER1YcyTd47OpprhgOOlxJ8
 JgrRI90ng2FGk/K6OY4LKjbi6iwMIEr1JiGFsRmc93coce+OIWEweFa8aEhpp7vczg/f
 Zc+E/vKCQcKG3YTofQ5iGFJXxDylY9wbk1QcPFRhCdonmW/gKxKrZtIZUKKqAL8WU9JI
 J1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xcmBsgz0cKbUUsDwz8kNTZJo8dkNy8E2MfEzUiwRlrw=;
 b=tgR5YauexPQevKmlftl6kLmyUgSqbiZywmJKOW1ECd7xhFIvRJ0gMUXnUaHTQKwyA7
 IFJhToIS2Io69o9uqivoFShecqavh6W5FLKORRo6XT2klRiahb2AwGbBptI/x4FKwPWl
 q+H1HSHyHWi+V6Kuw2qtCWh+tkwXScPMqSqyVfbFBcWc4/lScJDZKhivLSXi6Iq+LfLl
 eY9V+zq2TvJISeAs0cnoaEhZEMPcWHUyHqjmYK9xlbioHKIBeFXh82p/3cbNBxGDwQW2
 7VtuZ8Yhw2qtEnNsW9Ok85gBQuPcly9KV1j0RQBe8M8BgvdcyLNpVNYUNRVfFdpPW5YJ
 cy3Q==
X-Gm-Message-State: AOAM531j53N0EVMEt+XNQ77IIVO+UyLawapPjtLSh4hx7tdq68Dmx0oV
 ssnoEB2Jo+ezfBsQ1Vrbq64=
X-Google-Smtp-Source: ABdhPJw3VOoZ7Bw/WrMsKuZj3boX77j2iKp9zttQsTqmwEz9A+oWkAvkok/ur6VKg6kUQVNFrn8awA==
X-Received: by 2002:a17:90a:bf92:: with SMTP id
 d18mr17261342pjs.120.1591625897790; 
 Mon, 08 Jun 2020 07:18:17 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id b19sm7292575pft.74.2020.06.08.07.18.16
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 08 Jun 2020 07:18:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 01/15] hw/riscv: sifive_e: Remove the riscv_ prefix of the
 machine* and soc* functions
Date: Mon,  8 Jun 2020 07:17:30 -0700
Message-Id: <1591625864-31494-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
References: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jun 2020 14:18:23 -0000

From: Bin Meng <bin.meng@windriver.com>

This was done in the virt & sifive_u codes, but sifive_e codes were
missed. Remove the riscv_ prefix of the machine* and soc* functions.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_e.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 472a989..8fab152 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -75,7 +75,7 @@ static const struct MemmapEntry {
     [SIFIVE_E_DTIM] =     { 0x80000000,     0x4000 }
 };
 
-static void riscv_sifive_e_init(MachineState *machine)
+static void sifive_e_machine_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_e_memmap;
 
@@ -124,7 +124,7 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "RISC-V Board compatible with SiFive E SDK";
-    mc->init = riscv_sifive_e_init;
+    mc->init = sifive_e_machine_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = SIFIVE_E_CPU;
 }
@@ -144,7 +144,7 @@ static void sifive_e_machine_init_register_types(void)
 
 type_init(sifive_e_machine_init_register_types)
 
-static void riscv_sifive_e_soc_init(Object *obj)
+static void sifive_e_soc_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveESoCState *s = RISCV_E_SOC(obj);
@@ -159,7 +159,7 @@ static void riscv_sifive_e_soc_init(Object *obj)
                           TYPE_SIFIVE_GPIO);
 }
 
-static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
+static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     const struct MemmapEntry *memmap = sifive_e_memmap;
@@ -243,26 +243,26 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         &s->xip_mem);
 }
 
-static void riscv_sifive_e_soc_class_init(ObjectClass *oc, void *data)
+static void sifive_e_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    dc->realize = riscv_sifive_e_soc_realize;
+    dc->realize = sifive_e_soc_realize;
     /* Reason: Uses serial_hds in realize function, thus can't be used twice */
     dc->user_creatable = false;
 }
 
-static const TypeInfo riscv_sifive_e_soc_type_info = {
+static const TypeInfo sifive_e_soc_type_info = {
     .name = TYPE_RISCV_E_SOC,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(SiFiveESoCState),
-    .instance_init = riscv_sifive_e_soc_init,
-    .class_init = riscv_sifive_e_soc_class_init,
+    .instance_init = sifive_e_soc_init,
+    .class_init = sifive_e_soc_class_init,
 };
 
-static void riscv_sifive_e_soc_register_types(void)
+static void sifive_e_soc_register_types(void)
 {
-    type_register_static(&riscv_sifive_e_soc_type_info);
+    type_register_static(&sifive_e_soc_type_info);
 }
 
-type_init(riscv_sifive_e_soc_register_types)
+type_init(sifive_e_soc_register_types)
-- 
2.7.4


