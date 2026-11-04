Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471B606B3BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=IQzhKlmt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtQ-0003YG-JK; Wed, 04 Nov 2026 14:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtA-0002nt-9q
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:17 -0500
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgt8-0002V3-K5
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:16 -0500
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-353804b591eso2064284eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821393; x=1794426193; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EBEHYo8+s/rHXMjDlzuZeA3a58RQmXurcGNT/0CnuVk=;
 b=IQzhKlmtJ0Mr/fLGidxQw1ROO5JuxsgdIV3MgmOvlODDeoI4shlIFiurN50shwLEeV
 zqfj6ta2w18zPf1Nbjb5I9/vdFEQOlkXusCIgG8WRRSLj84rtgP7n/GwLzp3Gx/gFo4k
 wisdb19TP2i4jLfEqOCzwjv7YCD7l12pchMVr+QD8Jx1GIrSF8tTl8yQo2HwefB+z7Na
 Sb1ptFU5sURSsUKPCXW/58LutW86lA4hx1hkN2pRN2MYs7aCkCsWQX9Paq8yACmK2c/c
 nPqYD/ZgV+nThEKwmuumXr/gNZ+TcFitAcrBn0EjAMXtub/V1liD+Pc/IqHIlmSOhlPj
 QDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821393; x=1794426193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EBEHYo8+s/rHXMjDlzuZeA3a58RQmXurcGNT/0CnuVk=;
 b=Q8axruqsT2DDl6hWHZcHyRRCDxM45mFOkTYycBaKQmqfWIC4PMomfOZaKrWFaUAQeM
 xIC4VgQhPUVkR3ueBW3NMgLrcLqBwQbWeNzvBkWj91h7hSfWea7/cylbfdGyR4cjyHYm
 LUpNGf68ClxxJlsjN7DNJdEAAU3iUg6xYl22zbWFq5K/g6Hr1W56ZVRYcXi72lMM2Egh
 WhS2L76LSmCSeCxhNpFyZH0PkFfNpRYmkFCu17FrWOks9eXWIDmACJNY6bR+SQY2GEl5
 v3aaGfA2ucnNpCiIMy9LEsN5MpYBggWIlyTuEQmSdzFtNTVL1nIEr8zCF54cy3StK7mN
 VSPg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwphBT1oxIIdum6LCnKmkUlxsghcK74it57Ua6qHKYBweueS6luLYLPH0n/X8G3gLE5IT1CtY8xNkVv@nongnu.org
X-Gm-Message-State: APuU4Z+7YmWtgWWJpuQoRRLO/6XnOUDI7rs1JbEY7LY9nING/UZyvLKf
 1679jxE5RcmoS7Vw2XGzjY6Hbt6r1iBqBfytX5soU3jDqB92+aoea9fBSusRJx5jlVU=
X-Gm-Gg: AYBFou0I6fAybWQAxX8bY0Q23+W3ub3p+EYhE7Fu251c0PdpjgmH7QDDA9guu1IDTbp
 xVF+wQIrtYOH1s3CuLOoHuKBtktQFwz7hLbTLrCVPvQZrumvf5VT08Ld8rydxsdqFINaIhtx1v1
 teZmzBhSVqxNKA8s8TSA53ECo3vnpcnN+Li3xUBVwrXN318V7fcr3ddDoULouyXS7XLYuzHD//9
 iZUCS9EvPZ/hpHtvGbQsUEvD9xhaJ1iP1/NLSV/rdXiqv3E81dL9ePsFnPNF8gOuYTqSou6R81F
 ccrqpNYVptP+al1Vd/wITK0KGlWEYkx7Nsk1kVi9K46+Hd5rCl8re0+6iersZErpCBGfwMXK+KW
 QypaC7vpQEXm77UtfcA2qElX/ZSBMUhdzlSn3n3/U40Mt17HoJHwaJPCMNERmX9X5IWxu3JNqsI
 5aekgzTZuuZkJ9j2PcHvSRdcJqUJdnxNPUFz/sNX0TNJ/oYWZ6O9675cCRfPIY4TJyFPsUNCnDK
 Aq/g3r4uRbXjsSPk1uqfE74JX0EdsSmLJBF40Cuc2V62Q/hj8pOCOewyxnbNadSaLIm9OXu6h2F
 2NtM+95Ue9Q8kiFQSmtnJczye65nm8eX8E2vr0RHUrWcHqWTsYgItad+aqkJLos9wLp6NMk+mxj
 nVdKyjcviAXIe1bwcXkqnb1Wh6JuG
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id
 5a478bee46e88-36a423454b2mr28110808eec.12.1793821392962; 
 Wed, 04 Nov 2026 11:43:12 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:12 -0800 (PST)
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
Subject: [RFC PATCH 19/38] target/riscv: Add cfg property for Zvqwbdota8i
 extension
Date: Thu,  5 Nov 2026 03:41:34 +0800
Message-ID: <20261104194155.679241-20-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1329.google.com
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

Add CPU configuration for the Zvqwbdota8i extension which depends on the
Zve32x extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6c09685bd4b..9271f79d1b6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -254,6 +254,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwbdota8i, PRIV_VERSION_1_13_0,
+                                    ext_zvqwbdota8i),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota16i, PRIV_VERSION_1_13_0,
                                     ext_zvqwdota16i),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota8i, PRIV_VERSION_1_13_0,
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index b18abdd8b9b..3d822432d48 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -108,6 +108,7 @@ BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
 BOOL_FIELD(ext_zvfqwdota8f)
 BOOL_FIELD(ext_zvfwdota16bf)
+BOOL_FIELD(ext_zvqwbdota8i)
 BOOL_FIELD(ext_zvqwdota16i)
 BOOL_FIELD(ext_zvqwdota8i)
 BOOL_FIELD(ext_sdext)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 72ce0b4fbd0..782e38b608e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -711,6 +711,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvqwbdota8i && !cpu->cfg.ext_zve32x) {
+        error_setg(errp, "Zvqwbdota8i extension depends on Zve32x extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 5cb44326200..b1ca584f9ef 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -42,6 +42,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
         riscv_cpu_cfg(env)->ext_zvfqwdota8f ||
         riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
+        riscv_cpu_cfg(env)->ext_zvqwbdota8i ||
         riscv_cpu_cfg(env)->ext_zvqwdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwdota8i) {
         reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
@@ -94,6 +95,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     case MO_8:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
                         cpu->cfg.ext_zvfqwdota8f ||
+                        cpu->cfg.ext_zvqwbdota8i ||
                         cpu->cfg.ext_zvqwdota8i);
         break;
     case MO_16:
-- 
2.56.0


