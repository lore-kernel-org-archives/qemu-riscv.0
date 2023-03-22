Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf75a-0007Ds-CQ
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf75Z-0007Dj-BZ
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:37:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf75H-0007h7-3S
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:37:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so144782pjz.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwzFze6i9LF5NLZ7SPHJQ/+EluN5wBR39ZnMalzotlU=;
 b=aSyy7G+L4qa8uf3W0fPzmOiTaU9MLNwwpuV+/Og2rwPZYvyEw49Ucstj5Z/GSxm3ZZ
 +bBxHypML9NsHxe67+UikhgLtrXqM2bvyn5ZGNaWNO66TVK7qYfYj9z9LO6mkaXKxyp6
 +qs1OnUx/wSGy56Z7OyNdEWKRbxffanSwKvSjcyYecLUUIiu1yA250P8FZGeMyqda2Vt
 FCh3uwP17yKTLWWPimJt3sm4VaS/i9OhyBRG6f5pJOsxSlZfjOPI/5ZT/R2U6B0HS0Yw
 5wGgnvi4WiPmjAEFO4alDsiAMBrOxwJQ7W2TIYPLubI08CukqC6l6XG+ed1Yt1TvCHkW
 a47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwzFze6i9LF5NLZ7SPHJQ/+EluN5wBR39ZnMalzotlU=;
 b=MuVsp5KntAoDDlfIfOudGn/XXPEDfPib9vUp/6Lk7NlOUdIDfThSxXIKc6f/Han64h
 eeQJXFVHXr/mXwZPMDLPafwDxR3+cnB2FOqUucxoAOzah2UX6AwTAhfN1H2qTWifSljH
 /LeiWGNUSmDX1vqAp+zzKjY4Q1fHDYLFzok84gC5zLLcD433O7JVoSa1K5+UM9Dvn261
 Ha7CJGcR8neie+XUnFKpmIxAKqOwqLTHpUFFUdktHBdwJtibGUQMQJUghwyguH00nohv
 gO8Ill3U0G9KBsO5n1iRjxApuAqqc8jX8eazkWBiZttCrm/cvpMkg6PAwKZIb2MQNu0I
 PHqA==
X-Gm-Message-State: AO0yUKUu0VQgmNAO7l/jc3llDg3tk3OMWqqNjBVdf06O3NdYAFFctr6Y
 92Eg3ViwYo9LoW9yh28OLla82cLs+ty49KusT3U=
X-Google-Smtp-Source: AKy350ZydfC8A8L4qtc8RDIfp2m00RMW8ls4na6hL+QPsvtXlkBqXUqCG/4wx9/F9+brCsM0o7j3nA==
X-Received: by 2002:a05:6870:5806:b0:17a:a2ba:9032 with SMTP id
 r6-20020a056870580600b0017aa2ba9032mr859890oap.3.1679523678241; 
 Wed, 22 Mar 2023 15:21:18 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 18/25] target/riscv: error out on priv failure for
 RVH
Date: Wed, 22 Mar 2023 19:19:57 -0300
Message-Id: <20230322222004.357013-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:37:49 -0000

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
index 399f63b42f..d2eb2b3ba1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1055,6 +1055,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
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


