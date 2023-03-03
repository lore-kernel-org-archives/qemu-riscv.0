Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXzGA-00030n-J5
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 01:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG4-0002zR-FS
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 01:51:13 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG1-0001yT-0N
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 01:51:12 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1763e201bb4so2030239fac.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 22:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677826266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgOOI7JfbiaxIsYqyFar1QsOwyv72kWWDEfoe6yhldw=;
 b=pLnjIhSZA0+gfcKA6DQSFRY595IFkQ8gG/O50ZmohHMR5Mog7B0BEZaq+2XrqmyIW5
 ciVBvssHub9ZDeLUyOKVM97b6kg4/kj5v976v8+F5o0x30xu18Ya5YiDXwkz0YvJZMJI
 /DOeS2ohDq+lssG6P5rBm0pjNmu+vZfjzpfqfH57JnZ755XXpZNWkyHeArLWciQm1suB
 DmuOK1KqGUU+jOQ4GBDRMUvZ043RtarAO3Qu+cIjT6FcXj6/BFCS5xwsYc1fjhiJYKu2
 el19/VZVRwJhcYZ7qNV9iP8giPlbk7nzykfx2GlyDKcQcNcoESFKlN1jwb9/nlr/4FK6
 pCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677826266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgOOI7JfbiaxIsYqyFar1QsOwyv72kWWDEfoe6yhldw=;
 b=FD/dxzky6FII+9ZAoNmsNj7bUGE5wg0GRWKg/lyOcXzkN0rVLeYMZXmNbk6bGy2Y86
 Di18m1Or3YjrezSY3xbIOS1y1RdOQo3Ml3haN49lAdDilVdy1tIn8hhtjp0i6/2VCHEc
 aonRhwX3J/AnN1AIVA4XSrMF0I6Mca/E9lDW/ZRH4hzpp/N4y3iMuRFGoi0/y83xAJdW
 I83Bx1VhLLKWfEOU2vXKncB9T6Xnqi5onZeH8GI+nGdk2F5jk/jvOroJ7kgW1V8SM4lc
 QfpG8uMyuLeDWUfR8UHZgEgX5cb/b7iLBm4Vt7TwSRvdapDAwYmu6mktrNUCMAFOUc+N
 mOqA==
X-Gm-Message-State: AO0yUKUL8FYIBTCqeEi2ae2rVplkhPQzIi7sxmhLUqT3uF2lR33gNGL7
 xzZ4BpjhBjzNZHTsBUMsLvMZ7W7aezMP8bK9LVQ=
X-Google-Smtp-Source: AK7set+jnO+0EBZ+z30zj2mkbRaHh9mCH9X/TipVhClMQbr24O2R4gMnSTqS2XGaerLITswYu2yClA==
X-Received: by 2002:a05:6870:b61b:b0:172:3d65:2e2f with SMTP id
 cm27-20020a056870b61b00b001723d652e2fmr545067oab.14.1677826266111; 
 Thu, 02 Mar 2023 22:51:06 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 t4-20020a056870e74400b0017293fa734asm675414oak.48.2023.03.02.22.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 22:51:05 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv: cpu: Implement get_arch_id callback
Date: Fri,  3 Mar 2023 12:20:54 +0530
Message-Id: <20230303065055.915652-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303065055.915652-1-mchitale@ventanamicro.com>
References: <20230303065055.915652-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 06:51:15 -0000


Implement the callback for getting the architecture-dependent CPU ID ie
mhartid.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dd2f0c753..467d8467a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1243,6 +1243,13 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int64_t riscv_get_arch_id(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    return cpu->env.mhartid;
+}
+
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
@@ -1297,6 +1304,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &riscv_sysemu_ops;
+    cc->get_arch_id = riscv_get_arch_id;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-- 
2.34.1


