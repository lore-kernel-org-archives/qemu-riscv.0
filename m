Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxFcy-0002Kh-U1
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jan 2021 15:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kxFcx-0002K2-HU; Wed, 06 Jan 2021 15:41:55 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kxFct-0002De-5r; Wed, 06 Jan 2021 15:41:55 -0500
Received: by mail-wr1-x429.google.com with SMTP id m5so3582507wrx.9;
 Wed, 06 Jan 2021 12:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3YmbbzfB9PYrZG7RfZydvNgGFBev0UCWH1pPnTmK/K0=;
 b=HsexDqxxQh7aoYqHj3TirLO8+pCoGqRm22pbPUNlWiMz1ZnoYClWbu89IHOynCDBXD
 eo6zKj5GK2eSOYy8pxSqa//EAEviHmPQ4e6mM1BmN0nGA1en/D8XG0WOgLqb8ZlF49da
 MK3bTzHSldL19GAusC+ut7CPiv5lhmSbyvtyVm0JPvj1NhZJyQnETI2RePiBleb/HYhM
 +EzrvNR+ZBWuFSfhjmeVLrcy/OW+ykcKvYd9HWCdXHRjBNLH0niR8PHW4tNNf3tHAZP9
 cBHXIUCQeykwuxzwmdP/zfdKmUdNxiv83w5bmqZPyqeB9OlVNJ+lOTqNVGe8Po/jjw8o
 ++fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3YmbbzfB9PYrZG7RfZydvNgGFBev0UCWH1pPnTmK/K0=;
 b=omu0PWOpDhyg4Y0vV22P6AM7qkDFHRQhgfwIvrfLyfFa7c82qp5KUq/Bfk/00b2kNR
 9/yzJi+TvKhtqQ017fYwlveKVjJMskTEBB2JEGHQ5QubxyIGv7VSCseGBr8NGXn5cFSn
 w+7WkUIP/4bdKJ9poaUtChNDKq4gq22U5tmLbSoQe07IqAFss5rGgS+wcJmZLwJSJaot
 azFZu6DxPbYiivQlgCIC6+KvOqkBCGJuN3Fq7p7k0eB4HPHp1PLaWBp9PVX2BZkGyVu/
 lHt+cBy+dLogjHfhQmXJ0eGdaopX8TioG2lFenfSK4uOV01y3nZpoh0tMgS8HNbpIf77
 6A2g==
X-Gm-Message-State: AOAM532RDb2Q+l54+qEkBILZONOC4IFFy29IjzRNDMhngDeqd1vQPD0R
 nrmmUz3mVeQkb18kv4/Adi3a6bSxVYdxinuJ
X-Google-Smtp-Source: ABdhPJwFGBIGG0EzunDrk0hdhuCqazwqA23MwUrAU4UxsoWs2w4/tnbzOfa3Bk87UO/YRVHJFBm95g==
X-Received: by 2002:adf:ee90:: with SMTP id b16mr5829849wro.221.1609965708523; 
 Wed, 06 Jan 2021 12:41:48 -0800 (PST)
Received: from sylvain-MS-7994.lan ([51.154.65.74])
 by smtp.gmail.com with ESMTPSA id f9sm4937680wrw.81.2021.01.06.12.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 12:41:47 -0800 (PST)
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
To: qemu-devel@nongnu.org
Cc: Sylvain Pelissier <sylvain.pelissier@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v4] gdb: riscv: Add target description
Date: Wed,  6 Jan 2021 21:41:41 +0100
Message-Id: <20210106204141.14027-1-sylvain.pelissier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Jan 2021 20:41:55 -0000

Target description is not currently implemented in RISC-V
architecture. Thus GDB won't set it properly when attached.
The patch implements the target description response.

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 254cd83f8b..ed4971978b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static gchar *riscv_gdb_arch_name(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (riscv_cpu_is_32bit(env)) {
+        return g_strdup("riscv:rv32");
+    } else {
+        return g_strdup("riscv:rv64");
+    }
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
+    cc->gdb_arch_name = riscv_gdb_arch_name;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-- 
2.25.1


