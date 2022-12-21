Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kv-00006i-KY
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83ku-00004q-I7
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:52 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83ks-0007u2-Uv
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:52 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1322d768ba7so20147135fac.5
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+lO0sWlVx+Emu6U20opc5IL8+URL7UAx/BqzRgm2mA=;
 b=N0KRvNv9OR2OGHcwa7RPdWwr4hXgtHYPdMGnQpKOqW1IHfTUuTIDerTK9i5KV6nDRP
 0HUZVTdg+D9jwJ3Z/jbPnrTDtrFErnFzO8VeqPV2CcBaidVHYDeAiNTmf23IkPLF+SPt
 89Es72j6im7kR7Ddt8QthU3EuuEGZ/ccfn013ckAwpk5QPlrGUJ04mmz3vLKPq3x1vJN
 8FNTtdvhIit3bE60Vs/zKwfTBE1hAW5mR7KULVcKMjxkrMtCa/r4dF36A4d1FaEsE0fW
 8DleBf6mXXj4swJLde5BDc154RfE0hEcVMEdft/IzuUYqLbF5M1vJ4vO43AHZF6+YAIX
 n1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+lO0sWlVx+Emu6U20opc5IL8+URL7UAx/BqzRgm2mA=;
 b=US1vwrJiBdhOY8TCrBkSdhMCLBEPiWbl3sN05L6KXGSjSS+Oje+jHfusryE3xzQ5wj
 Eae3YO/I9mELlfUT9mq/YpabDc3lJDs+91V9z5+OILAMX+IoGoINRSAm4nt1JtUd8x9f
 v2WDnwmDdc9oSA945/99rDN8um3knMJ1FZF5SBddH3JTgsyAcBCXmNydK7dhxkdNuo9f
 kOEosqkcnzjU0nFH94NIY/XtHqUKhdaSWAzNwTyFY7abrnccOQ8c3fhxhXx4FZC3G2VO
 tc8GXqV6IMyHG+KD//LOmc5jjS7jm2LWq9UKXmOdhtc0WPna1Q1mJkOonZgPyYzHXSF+
 SXdA==
X-Gm-Message-State: AFqh2krH1xh8y6TV3FHTka8D1wycU9NmT0j9mI2o7cfJwM23Czz4flrZ
 d1ow3kBOQN1MXOCurkLZpvuZtQ==
X-Google-Smtp-Source: AMrXdXt02TTh+GTXRAxrx5DGAs/pJjjl7+jTtIeC7J+Dh2Gp1jagDcX6gUNqJH4Q2PGpfMytqlVg2g==
X-Received: by 2002:a05:6870:2f13:b0:144:81f0:7258 with SMTP id
 qj19-20020a0568702f1300b0014481f07258mr1062914oab.21.1671647030282; 
 Wed, 21 Dec 2022 10:23:50 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 15/15] hw/riscv/sifive_u: simplify create_fdt()
Date: Wed, 21 Dec 2022 15:23:00 -0300
Message-Id: <20221221182300.307900-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:52 -0000

cmdline' isn't being used. A MachineState pointer is being retrieved via
a MACHINE() macro calling qdev_get_machine(). 'mem_size' is being set as
machine->ram_size.

Remove the 'cmdline' and 'mem_size' parameters, add MachineState as a
parameter to avoid the cast and retrieve 'mem_size' via ms->ram_size.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/sifive_u.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0c9bf7fe6a..97a561dc52 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -93,10 +93,10 @@ static const MemMapEntry sifive_u_memmap[] = {
 #define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
 
-static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+static void create_fdt(MachineState *ms, SiFiveUState *s,
+                       const MemMapEntry *memmap, bool is_32_bit)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
+    uint64_t mem_size = ms->ram_size;
     void *fdt;
     int cpu, fdt_size;
     uint32_t *cells;
@@ -560,8 +560,7 @@ static void sifive_u_machine_init(MachineState *machine)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc.u_cpus));
+    create_fdt(machine, s, memmap, riscv_is_32bit(&s->soc.u_cpus));
 
     if (s->start_in_flash) {
         /*
-- 
2.38.1


