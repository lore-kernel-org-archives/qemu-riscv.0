Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psRLE-0004Ue-7M
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRLC-0004UD-TT
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:53:02 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRLB-0005vh-7F
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:53:02 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-187c78c6657so151014fac.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Apr 2023 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700777; x=1685292777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ry93EuiL339cXmTcSwW+O/TAemEHyYi1HmGB8rjIeQg=;
 b=bsyrp98+yhTnfMaIDEAlExYnTQSo2RL4D0dvGwrn+2En3F+e6Ce7fnDrRNXdaQomT9
 YSiXMPd0ERzRhzRzwlWuL/Yu8NO6D3krQTB3hg11+hPidGNpAfmIGLtmVoZyFBDu0U+J
 xBgRE2e/WDTZ5QA7jOc+kqJazrdROxaNmAq43JdUP0AMfPrCWELCi5hqrjHhHjhjNiZA
 tEW/XmPLxHLGHMlorY9ro9S6/l4CthoWlBQX3KjXrELU8Y+otfmVGR2QYKF5QVd/a7QY
 AhyxKX6eylrnu6t1GRYcL+tDSKBCA4S2m+P2BoL49WrN19DdaMcsj5wYVxy6W4w1eDCD
 r/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700777; x=1685292777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ry93EuiL339cXmTcSwW+O/TAemEHyYi1HmGB8rjIeQg=;
 b=g6eL3qr2Cpz0agaAKWXHigPdE+rRr3BN+7KBxRz80fyPGJfy9c/qKO10Nb3ktrGEE3
 Brwd1vgMQvVUTsZnUQqmk7DHX9ipBq9rkWADkkQfzmbJnEdBFlOIlOtHF49CwHxRm5vV
 Z9JaxexS6CpDehMy0oFobqYa191yj2b9KUtiiSHyvCgV2vvBaLaPf5e7Neu8/uaFpRrO
 tRJs5Ro1mi7S8UpgPDHW6NmKz12AIxXFvxY2cEylqkLWlAOo4J7HF1NGh+sxCQGkG9KA
 5lF8LKtrD1HJU2qL+a4a3duJuCslBPxxlOWOiOQ7nteavJG1jEokBQdZTXIE/PxXqUAA
 lliw==
X-Gm-Message-State: AC+VfDwWogUzDAJamhFv3cmkHBWbpppkKF/+eaX2yV7rqsBRKRSQ+SnB
 VPbuD39Tz5KJVHGpA8BC8KjvXw==
X-Google-Smtp-Source: ACHHUZ6DOCEJfRde9M0If+servyTmkcjRv0W6sTcCaXxTAj9yTKo32wf5sIm2jUPlRkAZSw4J4s3Nw==
X-Received: by 2002:a05:6870:52c5:b0:184:1c47:853d with SMTP id
 p5-20020a05687052c500b001841c47853dmr3014755oak.35.1682700776977; 
 Fri, 28 Apr 2023 09:52:56 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:56 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 4/4] target/riscv: smstateen knobs
Date: Fri, 28 Apr 2023 22:22:11 +0530
Message-Id: <20230428165212.2800669-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428165212.2800669-1-mchitale@ventanamicro.com>
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 16:53:03 -0000

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index befa64528f..9420cd670e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1498,8 +1499,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.34.1


