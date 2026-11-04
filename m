Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0EC6070308
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=g6ZUfV/K
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgt5-0002jR-48; Wed, 04 Nov 2026 14:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgse-0002IM-Au
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:45 -0500
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsc-0002Lo-Ki
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:44 -0500
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-3550c917fd3so1608865eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821361; x=1794426161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vwhROYoIVDL7uqD7PhyM1wXYwIRPQhsV7AJeWRT7iDY=;
 b=g6ZUfV/K21aeDTEZ47H71RFeOy+JnOw5LPBOzdMzbx2us7pSIApIcKwUCLXsib4AL9
 TvVGOvR4KfDTDvbv2AOpldD0E6DaPhtlT12CxAPdR0Ie5vL/CDjrNNjvnMAMNazdmll1
 ldoyH34goHcWCCHRTn1XRLP2toqBvrjVWCD6l42viXGE/gLjy7DpgMf6YRmGSGVlRLnL
 cIix2jhpsJNFAa8OHYVE/i27FDL3MlOcUkhLAmbyRr7y/v/c/Ps9H8iAOVThUDCzUGD/
 O5lLtyaASFtC5zX6MuMBBGDOAval0E3608TcNqhpOHNkqq+UgDdQFOmaCCDg9vSDC1vo
 Ofgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821361; x=1794426161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vwhROYoIVDL7uqD7PhyM1wXYwIRPQhsV7AJeWRT7iDY=;
 b=j0UC9bFwXa69lUyea8cN8YDp+ZGUhDiqTo6lBh6F/NAmHGy87vWPdwlmsgNTl+dK2U
 y6+BX9uZX/o33Ofoww9FSCxcGd9TRdOX5k44GUyEQbHO6Zlsj0mconAckjSV/FIyDGVB
 C96JqiwNSW1iYFfcUHZzmLuXT9Rt6T6UyD3fLI+VaKWxdWHbAwV5AkdwchEEhIhH9Vl/
 ig9CYaAcnF7QCes+bxTfAx9jkFvE1/EiGC9KWoOy7bgrPJ63tIykldRRZoFx1UXIaoB8
 h+fcLH7GtbvIRJSCvdTpilwMt+BNysVA5fGU4rddWu2HsQzGDsb2GHg841GyklWg8R22
 i9iw==
X-Forwarded-Encrypted: i=1;
 AKwUvByIE43QskpoGUmlr3XKa6yN+97nu7ertAXDwsrnz+u7realaBFMnw8ggAHb+GH554u5eh9ND2UTZEV4@nongnu.org
X-Gm-Message-State: APuU4Z/Vb9iuXhLpnjqR0UfeQAMHjxE4cdZj5g4bvq736fPUQeWrR1jV
 b44KkfKy7X6tARKmxggIzAKtocBX2GgSDHFc5Yj0B7ECvrJLlyS0aS1dKgsQcO77z4Y=
X-Gm-Gg: AYBFou2Lb0zmPiUxjiS06dj70BYf5oxnDQT3JVHqcuvON2E5JNNL0rtILdtrT7M1PoX
 jzzM8jYfHJwLxU48TLwT4rqQVGu5aKfuTQHbp+9svLQ5nDtMTQFtll918kt6qfmmqtb6l+XiFkw
 rPBTI0AvmM6jQDiLyhA7/y5se7DdPXrj99KuqAjcHS+1cMhngWUpEnQlrTW91sT868CoZrst5UR
 suAsh+46HlnokOi5PH1Xr2QE9rvN92CqMGnr27Z8jqpxQCWP9Hq6n2RogXas9CWxVoitPpAoMkm
 o3ibDkOVmtkJ17lSUbPxEb0Eo+M/rINLXYJdu8IjY2mK+wPXh3L4rQyH6pCBXI9Jdlv9L4Ws8aS
 NnyGxVzEsJ5c1+3Su+fdVHoDUy1p1y7AhKhGVrGEEZMNodxUQaFkfRhqkzhe++poTUxAF8mYhXT
 lQVNgHmHcKErFDEEB0qfCRIujv+nlX9SHUrqg7u8OQgaJHuTxVAoX74rzJGS4sNpFzM9hNzoEq8
 ZpA9DCARobfXsS5Yl0dDWlgNoYbQrwZr7tZ3J/8Ypi/Iggag0cu6N/h+aLh+gNukVceIbAEz5HC
 9++lE9ujVLbIyPvf18kyOiuUp3/GPu0aXoztJ3etP54XFEuSMePxovQvaZ78Mx7p1zL/CNgvoBR
 52id3Donokgniyn8OWAeLuXCzOT/T
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id
 5a478bee46e88-36a4244dbfcmr24530484eec.20.1793821360900; 
 Wed, 04 Nov 2026 11:42:40 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:40 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 08/38] target/riscv: Add Zvqwdota16i cpu property
Date: Thu,  5 Nov 2026 03:41:23 +0800
Message-ID: <20261104194155.679241-9-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1334.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPU configuration property of Zvqwdota16i extension which depends on
the Zve64x extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 4 +++-
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 08b14782451..7873e67c053 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -250,6 +250,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota16i, PRIV_VERSION_1_13_0,
+                                    ext_zvqwdota16i),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota8i, PRIV_VERSION_1_13_0,
                                     ext_zvqwdota8i),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 0c08d688ac1..8bac69a17f7 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvqwdota16i)
 BOOL_FIELD(ext_zvqwdota8i)
 BOOL_FIELD(ext_sdext)
 BOOL_FIELD(ext_sdtrig)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 1c51ea94489..54749125acf 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -696,6 +696,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvqwdota16i && !cpu->cfg.ext_zve64x) {
+        error_setg(errp, "Zvqwdota16i extension depends on Zve64x extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 6abcf522648..6d79fb5d299 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -40,6 +40,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     target_ulong reserved = 0;
 
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
+        riscv_cpu_cfg(env)->ext_zvqwdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwdota8i) {
         reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
@@ -93,7 +94,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
                         cpu->cfg.ext_zvqwdota8i);
         break;
     case MO_16:
-        ill_altfmt &= !(cpu->cfg.ext_zvfbfa);
+        ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
+                        cpu->cfg.ext_zvqwdota16i);
         break;
     default:
         break;
-- 
2.56.0


