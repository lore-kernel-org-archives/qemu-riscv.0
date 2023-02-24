Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVc8Z-0001nr-Vl
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 12:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8X-0001mL-9X
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:37 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8V-0003uy-N8
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:37 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-17264e9b575so270808fac.9
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gVj1M/nMMH0BmloQmU2g5NSrvMNYo6IEPm887UKzGc=;
 b=eJY3xBwolzpInIB7rOU3kyaPTbjJB7++DPwsY5CttIs8rZHnrboU1mlhl2nCvDUyK0
 cKaHd/v4xZEDBWcVg7z8TS81nkIPlKw91abwdbkPUY3P279JuhIluxjSPHxV1V5/YwKZ
 3DXEv+ICnvsyKvvExFUYqTwD69ZRYyDRCrlAzDg9DOnvs8j0+09EZaRYI1qinSEpzMls
 YiIQnwOLBK5ZMS2jFyRLhkpUjOxeW0fCtA42r6LA54FzcAOO9geVMEEUMrL2pibFoLS8
 hvxSPwGBbIGO77Nf+26pUfm17bPqg8N24bzaq25gbSwSF0mFC0Rnt1Zt1Zf7xPDGXQRg
 H22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gVj1M/nMMH0BmloQmU2g5NSrvMNYo6IEPm887UKzGc=;
 b=CJrm+IAQNTCbbRU9sn+lRuUGFx0S/K0zL9J5UzizbO2GMHJ1EoNAHlqlMXXeOnG94+
 Z8nifPxBRBACPn5erqeUfN1zAU37OyClDVjcNP6/rzW6oFK/t72+Zs0hNk7k5l1GMV4N
 5/+43CKmpO1Foe3PSld/dgCIJ0bCpSj7fNPtpnJAeovUiT5iIlNAl5jmP9Ru2iN2mqAt
 t95ont5YbzDUSRVGTmKlMXDKtEgd0Btd7flWLOeZ80BM0FujHLAsyUTu8R8MC+z097B/
 ZIXs1cGwW+fglf77zZARiodx0eK0gyxtGxP/ve3zIMMn/JLqYDjkeh8oxSuUA0hLdfOT
 ckTw==
X-Gm-Message-State: AO0yUKWnGUznF811oajk3X3J+lomHznMLhVf9InHnDZrs883kLC9d5U/
 q7DLOJ4P89vywArSLfFaOP+Ikw==
X-Google-Smtp-Source: AK7set/D0pwYYZjL58HKINwGMyDbioDkqwpNFsyhI6j89o0s7cP/Wcp7sTu1cc0nEfHqmoD9JaSDDA==
X-Received: by 2002:a05:6870:8a2b:b0:163:51eb:b577 with SMTP id
 p43-20020a0568708a2b00b0016351ebb577mr13495298oaq.46.1677260732497; 
 Fri, 24 Feb 2023 09:45:32 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/4] target/riscv/csr.c: simplify mctr()
Date: Fri, 24 Feb 2023 14:45:18 -0300
Message-Id: <20230224174520.92490-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 17:45:37 -0000

Use riscv_cpu_cfg() to retrieve pmu_num.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3692617d13..0f4aa22a0f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -165,8 +165,7 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    int pmu_num = riscv_cpu_cfg(env)->pmu_num;
     int ctr_index;
     int base_csrno = CSR_MHPMCOUNTER3;
 
@@ -175,7 +174,7 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
-    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
+    if (!pmu_num || ctr_index >= pmu_num) {
         /* The PMU is not enabled or counter is out of range*/
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.39.2


