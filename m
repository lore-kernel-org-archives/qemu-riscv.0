Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D23606B3A4
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ZTL+EuCp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgu1-0005uh-B5; Wed, 04 Nov 2026 14:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtx-0005gi-NE
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:05 -0500
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtv-0002fV-OH
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:44:05 -0500
Received: by mail-dl1-x122e.google.com with SMTP id
 a92af1059eb24-14fc585291cso1116057c88.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821442; x=1794426242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TaNeRlJbP6Q6PIof8V34PjOAP7LaLfV29uKWU3suSao=;
 b=ZTL+EuCpQrBdmPiePYbyl7sD8Um06APZzo+9UzYEH2AlEl3sVSPf4RIQhYmIwK3526
 O2HNhpRMsnM1U9b/q7VDiPHNSR17SJvqljIPS8jVILcKLhcToHfTAONg6o6OwvtAGEtx
 uc5b1uwN5i+u/iVpcjv4dNVWh9FdmlWf3JVz2aiDlvZHNyyjIRZyFNbMPAuXAYjzCbsV
 8EQWWAmMUn8diIXuOpYXPjR//GEagDMihsqhwhJ9YnHL96q6MXvNuJVHG+Sb5snNAG32
 2Yr6dvVp/RCLM09gUlM7AeZ0iGl9QoQu6nkTUn172ioO8ynz/TZj426pH7lRNnCshtNI
 uEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821442; x=1794426242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TaNeRlJbP6Q6PIof8V34PjOAP7LaLfV29uKWU3suSao=;
 b=Ejd8v5hsnCTdBnl3dGyduUkz2Il6Ukmywl4y7Uo8OTgIPESEj/xjTFhjrAX1kTgUyF
 WhQwVGusUz9DqmX1ftJZ/gRqAvGwquGzJgiQ+lpC1d2Udu1H9fCqvtM/nxb1YqSG7kqV
 Q9m3FkUTah5JAWz1bQMGOzD9uf9wW0UJa1V5vFRcashzsN78siZaE670dcb5NCIGnDio
 PJhcZSpiwXMGt7xj8MMJe7uuMpxVe+mZGVtKVO62cX400Zc5ADa0q2fPjOVgPmZk9kMF
 8RQ9uFnAjeFvbhCgnEa2hnPPGuHAskZ4/Cy9yqmJmcaRy+xMZEiE2oeCnrX/l+EVr035
 QOEg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkhtM7pln9j8TSO1H6XghVD/4zl2jF/EOu4WqLOPRgb3ili3hWUDpoff7Cx42gE3pQvNnKQihMOPTo@nongnu.org
X-Gm-Message-State: APuU4Z9jErMuHh9baOgG9niF4q8vz62LjKVu8JtkGJRBVKwO/DwiGiLr
 /S06MZRzeAFOQVw7MxuLaVyt17UoEcI2Y1T+IcEAAgEngp9sDNOziBvTRyN/3ptL/TM=
X-Gm-Gg: AYBFou1Gf6RdrzMddrgmcszvXwbynRWQaOdzTAu3FNAk0oZd4gcTZW1Drn3Ltj4DdVs
 EUxGCRHcurzef8GS1rq6Kdo0nYvAjgEe/wDhKJZQIbkOaFalTSOkL0QxxQan/baXninXHXTbOCo
 p5Abls0YcgwYFA7eLKuj0LMtDYTNsdUvHvutvnSJ2x1ysq5S/QnUe4UOQba4akpXWwSNa1G/tPf
 0D64MOPuNAJSTfcylXb3Etw8dWo2Sx8tgqijlggyl0Dc4TRSxeVg2pMYiP9GKh2yF0XYecptHbb
 Gpnsfanij6r/tIRB8r4H74/O33T2+QjN3MfMZMIts5VbyBzAOkAnuOoKz/cQa/ckIzH9HATwoKu
 43SZIqi87aV99SrPgcnGSbUkadYdXkkJJzSH8IVVgeUv0/4KHuMtubI4QiPg7pSVhlrRJOID9MG
 6aYv8ZPadiH/jowSQG3AfLV6wCEaXoWmLvZ48jLDyojc8QQ5En1uPulqYY5dNAfKPeGxZSkXnCd
 fRobx0jsq1LSvYkYsylBQbu309kGbVZvRS6ljcKDjE9fsEyXLqclSZYy2m3gl1j348dX3S4kjjt
 4yFyWXRGEHYtI19VRBhHpWudRoKdV2uIFRYdFTkgCinUxnGFFP58+9BsycYymuqeKDCggSXDx8z
 FIV2vexbhAilLY6BWSCciaLpRgUrZ
X-Received: by 2002:a05:701b:240f:b0:199:e38c:29a0 with SMTP id
 a92af1059eb24-1ac5de53bd3mr24704113c88.31.1793821441929; 
 Wed, 04 Nov 2026 11:44:01 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:44:01 -0800 (PST)
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
Subject: [RFC PATCH 34/38] target/riscv: Add cfg property for Zvfbdota32f
 extension
Date: Thu,  5 Nov 2026 03:41:49 +0800
Message-ID: <20261104194155.679241-35-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122e;
 envelope-from=max.chou@sifive.com; helo=mail-dl1-x122e.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPU configuration property of Zvfbdota32f extension which depends on
the Zve32f extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0a35bc7c416..ed0f5ed976a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -231,6 +231,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
     ISA_EXT_DATA_ENTRY(zve64x, PRIV_VERSION_1_10_0, ext_zve64x),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfbdota32f, PRIV_VERSION_1_13_0,
+                                    ext_zvfbdota32f),
     ISA_EXT_DATA_ENTRY(zvfbfa, PRIV_VERSION_1_13_0, ext_zvfbfa),
     ISA_EXT_DATA_ENTRY(zvfbfmin, PRIV_VERSION_1_12_0, ext_zvfbfmin),
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 0385b58de0a..d85dd2cfd53 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -101,6 +101,7 @@ BOOL_FIELD(ext_zvks)
 BOOL_FIELD(ext_zvksc)
 BOOL_FIELD(ext_zvksg)
 BOOL_FIELD(ext_zmmul)
+BOOL_FIELD(ext_zvfbdota32f)
 BOOL_FIELD(ext_zvfbfa)
 BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a52637f5ca9..32b6f9894fc 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -731,6 +731,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfbdota32f && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfbdota32f extension depends on Zve32f extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
-- 
2.56.0


