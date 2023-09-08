Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F042DEEB562
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:27:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegBz-0003IU-C5; Fri, 08 Sep 2023 14:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBy-0003GZ-3H; Fri, 08 Sep 2023 14:26:54 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBv-0006mU-R2; Fri, 08 Sep 2023 14:26:53 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcfdadd149so41878171fa.0; 
 Fri, 08 Sep 2023 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197609; x=1694802409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hs5rnL6N8i7Z41Z0QA1Hj5bLchjSDHLnAk0hImYIT88=;
 b=mj6Z/GZ/AK6CIah+72keBhazCuWYRmdrGhrLweR+7FO+5VhVKJl2HBk9iHZTMOsMbQ
 HnDr3ozN9I23yRz38uyoQU8Q6JFFm7cVwYoi8TdC0MH5S6IpgS5YRR0SI7kl50vWAIzl
 kZoJsoQXvqbzD41aEXyEWRuiov4Osn2xrVUT6BG2DYYpHuXPzdDp6M5FeVQkykMIn1/m
 ZA7o7sROKA0KFAAfA2/K8SszOTiF00qGlLbFofzhjykFexT2GXDDRbrD4TlcbZyAAlCL
 o+J79nM9YpQqTQ82ouhIC2ImvKHTgzur14m8ogQdzfqNqgKTkbbq7lV4PM2yIA1gFnyn
 6syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197609; x=1694802409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hs5rnL6N8i7Z41Z0QA1Hj5bLchjSDHLnAk0hImYIT88=;
 b=q9/a15f8JyilWtwH5GAhMeXajf8CmJSkhIEf7DDq0Vl19zPDjKl+/VzWF5/7ZjCsHO
 IeEVfZESFhGmYSKb/94GV0DmxXWPehDOc/5ADQRjNKOeveMYQpweO+crqWCzLDpht1UJ
 0BwGyMnGTlGiiBB4XL+POmLE5S3JqiMGgJ5m2akeqalPuvkcR8Lb+HNUZN1TeCVh81PE
 gQShqNfp3HEAmPeF/+kB53CkgoRWxGoksOtZd1HiiB+2JyN1BFC5m7ZYbhtjeu1rpMQp
 kmAkPC32sGACfEfx8gIyEE82JqAFUJQQikaQ2WIEKoeSIGWq/JSkTV9LavLc856DoniI
 g8Zw==
X-Gm-Message-State: AOJu0YxJbqa6miNAYDEPpPC/J00b1K3Y0X81//zLDx0ZzhCJjdWZ7oAb
 Oo+YGsqs/RgUZxs6kcomn2g=
X-Google-Smtp-Source: AGHT+IHwwryQuODWeIfMVqRomajBuHJO3uIL7UVXKYr4j40eOaxma/6u5YUpyLYaeKWIoV8FLxbD9g==
X-Received: by 2002:a2e:9ed7:0:b0:2bd:a85:899e with SMTP id
 h23-20020a2e9ed7000000b002bd0a85899emr2432626ljk.3.1694197609395; 
 Fri, 08 Sep 2023 11:26:49 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:48 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 2/8] target/riscv: Add new S{sn, mn,
 m}jpm extensions as part of Zjpm v0.6.1
Date: Fri,  8 Sep 2023 18:26:34 +0000
Message-Id: <20230908182640.1102270-3-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.c     | 7 +++++++
 target/riscv/cpu_cfg.h | 3 +++
 target/riscv/machine.c | 6 ++++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f937820976..af8f16b94f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,6 +137,9 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(ssnjpm, PRIV_VERSION_1_12_0, ext_ssnjpm),
+    ISA_EXT_DATA_ENTRY(smnjpm, PRIV_VERSION_1_12_0, ext_smnjpm),
+    ISA_EXT_DATA_ENTRY(smmjpm, PRIV_VERSION_1_12_0, ext_smmjpm),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
@@ -1796,6 +1799,10 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
+    /* Zjpm v0.6.1 extensions */
+    DEFINE_PROP_BOOL("ssnjpm", RISCVCPU, cfg.ext_ssnjpm, false),
+    DEFINE_PROP_BOOL("smnjpm", RISCVCPU, cfg.ext_smnjpm, false),
+    DEFINE_PROP_BOOL("smmjpm", RISCVCPU, cfg.ext_smmjpm, false),
 
     DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
     DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 2bd9510ba3..9e9eb7cd1d 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -93,6 +93,9 @@ struct RISCVCPUConfig {
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
+    bool ext_ssnjpm;
+    bool ext_smnjpm;
+    bool ext_smmjpm;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 8b1a109275..d50ff5421f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -150,9 +150,8 @@ static const VMStateDescription vmstate_vector = {
 static bool pointermasking_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
 
-    return riscv_has_ext(env, RVJ);
+    return cpu->cfg.ext_ssnjpm || cpu->cfg.ext_smnjpm || cpu->cfg.ext_smmjpm;
 }
 
 static const VMStateDescription vmstate_pointermasking = {
@@ -161,6 +160,9 @@ static const VMStateDescription vmstate_pointermasking = {
     .minimum_version_id = 1,
     .needed = pointermasking_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.mseccfg, RISCVCPU),
+        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
+        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.34.1


