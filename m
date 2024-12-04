Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7CBE77170
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:30:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvyN-0000Zt-KD; Wed, 04 Dec 2024 15:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvy6-0000HM-7L
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:27:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvy3-0008Ri-Pn
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:27:29 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43494a20379so1934905e9.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344046; x=1733948846; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IbFwYvNsoagTIF3RGxGTKY4/+lkaBIKwukflDbrm8ec=;
 b=oHBrfr6SsSMQbt/j6NX5wd20ZGGqyEI5YuWHRMKKgBYkc0pio5Ce00gY3VLUJ89gQg
 U/JzuvVTUwha3wWQYqXdi5UGPO6B3x/zd8IactEvSvybmy+gx9HtW37JODkuvmfFB/DD
 x5emvj/G3Z/QBlpQ2/AwWWC9svvg5P7Sh4bwQXrguY3AHGPSEFGJ2iskLwb6+3tQfqqK
 4PHBDLYlWUZwlYSG/Dg7SiA3GlpL3VSYW+UZew1nlBfCsKo3tBLwov1jpl5Ero4ycld9
 CFdhacWsEtPLMOFx7TaiG4DJM3KaVfOv5OnOtvOoyQlanmG/u99jDmUvg+q4fKPK9meQ
 h1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344046; x=1733948846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IbFwYvNsoagTIF3RGxGTKY4/+lkaBIKwukflDbrm8ec=;
 b=lMno8X9mZ0HQJNWBC7KuBPhznlv+szFqD3vzdWMLlWq3epuafOil7YVJ3QE6i3UTrf
 ohIlVwcWrT8MJ+PD/vKUQmxdkyTth4KTs1Y1SjUxcueu79bhXMZ2SQKtWB6MFb5yJb9+
 i3fPtiLp87v6zvRpU0IvI5b98e/nngVeIVkOokscYM5Cy469zzORC3Er0lpiLDr2FArc
 eoWKHbwQLJOiC+iFFN8pQ7PqVZcqldGfw89b5BtRZKl7HHE6YFNov/YLxsOUzwJ6TjWJ
 /h/5+H7djMcJgvaZ3kcFNd5yi4+Kv3Esy3kC867mSAHaJbw5uh411RslkeSCnzg+DGXH
 tiog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXriWDWUv0ouj3+6U5+uRBdNdQNl36OlRwwMTFAimHa4pJHQSsRXiaQpoT8226pGc+huNAXbty9Xm9q@nongnu.org
X-Gm-Message-State: AOJu0YzXsCM9BdP9yc0coEV1eKls7EhYWW73PIc7Li1V1J+W6OJ5Y6z8
 59a8pGHT7wSXHH8GzIUKuj4FAr++H7UlNpgee4GDiJwYx0QVnwntCfPSlEKYPKM=
X-Gm-Gg: ASbGncsnI98HM63Vq84Wa6EkfbbkjZTkw8BGT0BBMaHoU46ajYsSMoR3GLoFBMEiVHK
 t9B3BnRj4v4fgo3wVFwih82Bqt0ypt6KFztQwsSDx/8L1zAGbxojQxuN71d1ZWHp9ttndb811wN
 m+PBpNEuCSBoNulK6g0ffnxcTeImT3NMMARb/f2zKmaFuqAnF1ml4Dn265vvEV3VxA9aDFRxk+3
 6Ho/jsDioQuL9HgJfq3nAihPYV57dILSthDikvmJdXK2MGHLbufn/iRB31sZ+iqUgsTMj6pzPux
 3KryecQ33uH1i9ih44ER+cDw
X-Google-Smtp-Source: AGHT+IF0QYYY+bdmr+0sAzjLTUkGP9djfjiRtX1kSayuNI9VT4nEYz0b2lj96Y+Cs1hDyCe5O63MzQ==
X-Received: by 2002:a05:600c:3594:b0:434:a7e3:db56 with SMTP id
 5b1f17b1804b1-434d09abf4emr70062685e9.6.1733344046119; 
 Wed, 04 Dec 2024 12:27:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5272b78sm34941055e9.9.2024.12.04.12.27.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/20] target/sh4: Expose CPUSH4State::little_endian property
Date: Wed,  4 Dec 2024 21:25:50 +0100
Message-ID: <20241204202602.58083-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

SH4 CPUs endianness is set with an external pin in a power-on reset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/cpu.h | 6 ++++++
 target/sh4/cpu.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index d928bcf0067..2502ddba102 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -198,6 +198,12 @@ typedef struct CPUArchState {
     /* Fields from here on are preserved over CPU reset. */
     int id;                     /* CPU model */
 
+    /*
+     * The endian is set with an external pin in a power-on reset.
+     * The endian cannot be changed dynamically.
+     */
+    bool little_endian;
+
     /* The features that we should emulate. See sh_features above.  */
     uint32_t features;
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8f07261dcfd..f54005644c9 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -23,6 +23,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-helpers.h"
@@ -231,6 +232,12 @@ static void superh_cpu_initfn(Object *obj)
     env->movcal_backup_tail = &(env->movcal_backup);
 }
 
+static Property superh_cpu_properties[] = {
+    DEFINE_PROP_BOOL("little-endian", SuperHCPU,
+                     env.little_endian, !TARGET_BIG_ENDIAN),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 #ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
@@ -270,6 +277,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     device_class_set_parent_realize(dc, superh_cpu_realizefn,
                                     &scc->parent_realize);
+    device_class_set_props(dc, superh_cpu_properties);
 
     resettable_class_set_parent_phases(rc, NULL, superh_cpu_reset_hold, NULL,
                                        &scc->parent_phases);
-- 
2.45.2


