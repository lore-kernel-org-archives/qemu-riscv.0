Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcoE-0005W9-De
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco4-0005Ms-5s
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:37 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco2-0007C7-Cf
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:35 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 q79-20020a4a3352000000b0052fe885deddso1320057ooq.0
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUrnUOKftNGP2FPSgVGe+TWqw1fM66zN2Xsxfp1nXPw=;
 b=heibx168Er1sG2NUbiSDctbboJE/mqRffmb62ngiT8U6gUrVGJFEY8BXR+jDlkmmfK
 Dc7R1rTRpSKjVh7WEa0aitO0PdtwzmDD5N89ZtWHAr6/fcP15UlZehPJSEWDqqSfaIdK
 aeCXW1IxtGMBDv3R0gF441t0VmHrhVODi7Jc2LFKdqG4jeNhvtDiqLK7szPb71aAmS9B
 bXdMafDBsIsKX1tbved9KcZRn7Ko4MdCd0HndNxYzpwPCKRDurDFnRJ5Ywb/v3pBC3VM
 /eVx2KA78yspnv0NoPuhv7dw4vBI1nQGcHiQ778NLUaDZ7qJREa/RdKW5ckeLdLTyrjA
 6lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUrnUOKftNGP2FPSgVGe+TWqw1fM66zN2Xsxfp1nXPw=;
 b=oGX466oPgyoRmDWxVaxCOOEqhSwpGqjQKQw1UgGqRrVXzXcN5phrcyJ6MwhKhjJUeO
 ypHj+kBblI3xFInIaXzpad+2erdRwikpmiOQg0Fp7QLA/H8P2jSAMYLWeCQ8FkSR6q62
 9A6MxKIgxibJbQdUJ8IBu81FG9jMJJ+uFXHeBEUA3wRLagZpsqgp4CBeECAn5PIqFFZZ
 6Gj4zxHTCzMkthfiA6Mo2Y2GY/jgolgY8/79Yd5lJnGr8xLHn2ilwmsnR2NqQgjs2aSv
 c4nAKMW7CwRryx7hhH1hq2qfck/j/FzosZhOdJcn9PO4LkiQSUzXuxGVY05GX43WxoSU
 9RIQ==
X-Gm-Message-State: AO0yUKXkB8cSIW8Rck8irpsbDoqX8pHWH8sr3JENtgnr68z28t/5sCO5
 DlTYDqDX1M0DxKEMisd00uCBpA==
X-Google-Smtp-Source: AK7set/NPEzzz7ZFgc9YqJ8BKDThOzNXtCYhO7/oiLO3z0SmSGtIxQXAGU8TwL+sLynvJ+X31Q8iLA==
X-Received: by 2002:a4a:330d:0:b0:538:cf7f:d5cb with SMTP id
 q13-20020a4a330d000000b00538cf7fd5cbmr1506535ooq.1.1679169933445; 
 Sat, 18 Mar 2023 13:05:33 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 18/26] target/riscv: error out on priv failure for
 RVH
Date: Sat, 18 Mar 2023 17:04:28 -0300
Message-Id: <20230318200436.299464-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:38 -0000

riscv_cpu_disable_priv_spec_isa_exts(), at the end of
riscv_cpu_validate_set_extensions(), will disable cpu->cfg.ext_h and
cpu->cfg.ext_v if priv_ver check fails.

This check can be done in riscv_cpu_validate_misa_ext(). The difference
here is that we're not silently disable it: we'll error out. Silently
disabling a MISA extension after all the validation is completed can can
cause inconsistencies that we don't have to deal with. Verify ealier and
fail faster.

Note that we're ignoring RVV priv_ver validation since its minimal priv
is also the minimal value we support. RVH will error out if enabled
under priv_ver under 1_12_0.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1116686cd1..d8f2eca6ca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1064,6 +1064,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    /*
+     * Check for priv spec version. RVH is 1_12_0, RVV is 1_10_0.
+     * We don't support anything under 1_10_0 so skip checking
+     * priv for RVV.
+     *
+     * We're hardcoding it here to avoid looping into the
+     * 50+ entries of isa_edata_arr[] just to check the RVH
+     * entry.
+     */
+    if (cpu->cfg.ext_h && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+
     if (cpu->cfg.ext_v) {
         riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
         if (local_err != NULL) {
-- 
2.39.2


