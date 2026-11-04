Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B2608F12B
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=RPpmUArS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgto-0004pu-3t; Wed, 04 Nov 2026 14:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtk-0004c1-V6
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:53 -0500
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtj-0002dV-5P
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:52 -0500
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-36d6e342f98so1156690eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821430; x=1794426230; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RYdE0Ffc0rrUlTKJNgRYuD3EifMicwHIr8Kk4+NSUFs=;
 b=RPpmUArSAW+Z3DSTokt3tQ/2QHCP2wvUsjV7ArlB3z52d7kBuybbtLnLdRa7cShN4T
 GB6h0FMLcFP3I7zmRkWCujdnLOLHL28+okc1iSd0+4MKqMgYHK6y0YedfRHxKQLyScM1
 NqJRS9W8lOaBAeM1MVXJKr8Y655z6TS0+IGvbsLBuEpIzIMCK+80RvgXDzJoTjDbxgaN
 5qo5P/lKUPGWfdyV2mq8dJT1u46w/X1uZQHyv1Wa2NAvjhnlCBIdgBaCR70w1LkmclVo
 G0doTpaHu0q5MN42emuH7b89u4WLXCele2QyDco8cmYP/cKikim6Pk/Pskoj+mDsn1xR
 MK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821430; x=1794426230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RYdE0Ffc0rrUlTKJNgRYuD3EifMicwHIr8Kk4+NSUFs=;
 b=S1QkeX+Wm1LUCv7f3DA+FzwCJmRKbhlB7YpdE3AtGb+qGs5fVCEAB9NAeNWDHIx2CN
 FijD3N8umvM2T35nWcuzeaCnw7sRmBAdS5PM2xAB4xuDw/zFJk3LG999B2wd/1HPOlb2
 y/bUs3qB1cft6Qna0ixDCi39dW2H2Ykci4oh7YVJiaBMgQZgsLpDRWaMQQNZBggfVSgr
 aIoK6bHRZD4rEIQKEEmZOCtBzPO4M7YHLexiR9BDjLnH+obsSpzkSB1MS++pC4IhUgIK
 1EHRG+vvOGe62Ea0dW918PCELptZ0j7mm8ycJRlIXPV9FAM8cY45HGvGw1dOkyF3pahN
 LClQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7TOmbOmTuEZ1he/7Uj0nnURoDvIKj3Dc1mo+rzjScVbPIQwT4AyXdOZJAU7G6BuSAFX+i6vqgb1fq@nongnu.org
X-Gm-Message-State: APuU4Z9QXM+jjDFyqt5vxIUcwIOMuD3brbukOzApyGpf1TT3Nd0aETjJ
 6io8Y/HtVEHZWpEgUHhq7oEzTXKQxR40kEH3i47w/VVl6xEtUtDCDgrDOuhILzfc5uc=
X-Gm-Gg: AYBFou0irJwvPZ1XKyUIHwFfwgZGwLUwbzhWgSwLyBXN/6z3WwtvylrVWMeOwIKKOrF
 0vBs2Ri0c+OUIoMdXK51iz1cG6vm+yI2/6eR7kamjKTFypxkwedkhflRS3VkrNx6X9gGTQ5N3sm
 8jMwVyTLtwru4stD4ZGB+0UptV0l1fSJDxebUFBkfHFLWrYr1dGQg2SX597GQyYSArmmgxPBnHn
 1BGXlb2v2OkxSBCA+KvGv9xG5gyODYQ5yehoPP9rpDduqPHiOYYJRgzwBtXLuBAuRM8qVSFxoH5
 dI2fOSFMzHS0Ok3qdUZ5E4wQEzy2dmVAZ+ubDtSqYcSd8ZMpwDkKf/4y/TCpUd9njQ5cKHRx2LJ
 u5I7k6hEIOUcCig09tyhAmPm7vCWeNVZ+UuzwiKNDCeGemevXuUrh6zEAkbtNOILwwlMUNuwmuI
 9HpXWOiXmyRlFcYnf8SFeU/KWEQW8x+xY6foa+9h2CrYt1Nfv+HMA+abCN8lSsNCDbGfRuSZe9q
 mKrSLOGVJVw2xCa+MVKu7FToVADgUstVRNZMiN/xAGGLl87qCFB0OS6sudOTQOc3+4OLahcI4OS
 lnesu82LLFjGkCkYB++VDYOkj5T7mw/ltYlMowawKeyQnn+tFTQ5MyL11c7XTYxld9ZliegaTqV
 hGOTKV6HsbSk7ZgasnZJXGdthtsVY
X-Received: by 2002:a05:7301:2a24:b0:36d:48e:82de with SMTP id
 5a478bee46e88-36d049e0895mr5102515eec.12.1793821429660; 
 Wed, 04 Nov 2026 11:43:49 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:49 -0800 (PST)
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
Subject: [RFC PATCH 30/38] target/riscv: Add cfg property for Zvfqwbdota8f
 extension
Date: Thu,  5 Nov 2026 03:41:45 +0800
Message-ID: <20261104194155.679241-31-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1331.google.com
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

Add CPU configuration property of Zvfqwbdota8f extension which depends on
the Zve32f extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 566e2e835ae..b4a9f2c3e30 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,6 +236,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfqwbdota8f, PRIV_VERSION_1_13_0,
+                                    ext_zvfqwbdota8f),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfqwdota8f, PRIV_VERSION_1_13_0,
                                     ext_zvfqwdota8f),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfwbdota16bf, PRIV_VERSION_1_13_0,
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 80750db1ccd..0385b58de0a 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvfqwbdota8f)
 BOOL_FIELD(ext_zvfqwdota8f)
 BOOL_FIELD(ext_zvfwbdota16bf)
 BOOL_FIELD(ext_zvfwdota16bf)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8684e4c709c..a52637f5ca9 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -726,6 +726,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfqwbdota8f && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfqwbdota8f extension depends on Zve32f extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 51170625aad..6f3b666784e 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -40,6 +40,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     target_ulong reserved = 0;
 
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
+        riscv_cpu_cfg(env)->ext_zvfqwbdota8f ||
         riscv_cpu_cfg(env)->ext_zvfqwdota8f ||
         riscv_cpu_cfg(env)->ext_zvfwbdota16bf ||
         riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
@@ -96,6 +97,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     switch (vsew) {
     case MO_8:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
+                        cpu->cfg.ext_zvfqwbdota8f ||
                         cpu->cfg.ext_zvfqwdota8f ||
                         cpu->cfg.ext_zvqwbdota8i ||
                         cpu->cfg.ext_zvqwdota8i);
-- 
2.56.0


