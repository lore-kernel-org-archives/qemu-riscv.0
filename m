Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F03CA0FEC
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:47:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA6Y-0007q9-S7; Fri, 01 Sep 2023 15:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6W-0007pq-S4
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:46:52 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6U-0002yu-M0
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:46:52 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b9e478e122so1829928a34.1
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597609; x=1694202409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFowtOvUEba/kKqZrEXdKj+K1mBKqITpZ1FgtYYmnRU=;
 b=Pbf9qXxTFi7A9wVbSspuwOonbN5Cbt0Rl+v9D863XLIHqRyuENtFgwxFKrLuMriGiD
 NS3BzLEdK8QHvusYsu4sNQWOeLfK9liOEM814SVz7dzwaLo4dn2HohNdS/h+FzK30s1s
 XzHkyiiAmCGmwMv++eRR4cdggbEjArByw8K20xUtbhpxqoKMwu2pcKdGn5O77WzrxC80
 nCi8necGaKXEiidUi1c1KjuK8UXVN6GckuIvNlSIc0f/7O/vIxda7f9jOWKwkBiuuYls
 vHSxJ7M+EQTwdX4OlOPlcQu4MrqPy/VXbUEH8jURARpC4wzuPbETJMEd1bWr8asxSKyw
 s7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597609; x=1694202409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFowtOvUEba/kKqZrEXdKj+K1mBKqITpZ1FgtYYmnRU=;
 b=QRIx0zxG90iXd9cZH5l6qOVa3zsNPfI4qZRh/mbe7bIgy+1bArnTOXUJOJy5Yesrs3
 si8VxyRBUok5Lo2m5uAeVvS2tTRdvqXCvVIdx/x+c37fFSNxPdK8FoXQJYdrReG6d1Jv
 xBFJH5NT35uKPDhl9DAt0iF6MHV8OLOFfzlJ8jDf49jKuEtlxl9wWNH0iR7nbN4x7FXE
 UgTwb+/zAqmIfn2nMw72UfPFuCFpz7zc9XXUu5o5IcQdLc++eCSaSlX/lR01BozNBK/i
 22SC+h34jM3K2/Vqb+n+rGJP4HviCBtB4UB7WCrZx41AIChE67MI51oqEZFLUJYhF/UY
 eDzw==
X-Gm-Message-State: AOJu0YxHs82P+f+rd04/3rAGKnNgqr+mTKCXnZfrD4+WFGOXqq29LxLB
 rewQLifxsYl8O1YOrhH9XBWt74GkiZ94B+p0Ai0=
X-Google-Smtp-Source: AGHT+IEoKTT5nWgn9YuGUCMnPpnInn3vvQdrMKufRxvXZbLgrFJaXRKOSIQX5gWJUembQpDDfWD4Kg==
X-Received: by 2002:a05:6870:d698:b0:1bf:1a58:c50 with SMTP id
 z24-20020a056870d69800b001bf1a580c50mr4290849oap.9.1693597609588; 
 Fri, 01 Sep 2023 12:46:49 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:46:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 05/20] target/riscv/cpu.c: split non-ratified exts from
 riscv_cpu_extensions[]
Date: Fri,  1 Sep 2023 16:46:11 -0300
Message-ID: <20230901194627.1214811-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Create a new riscv_cpu_experimental_exts[] to store the non-ratified
extensions properties. Once they are ratified we'll move them back to
riscv_cpu_extensions[].

riscv_cpu_add_user_properties() and riscv_cpu_add_kvm_properties() are
changed to keep adding non-ratified properties to users.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8662414906..2349f813e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1881,8 +1881,11 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
-    /* These are experimental so mark with 'x-' */
+    DEFINE_PROP_END_OF_LIST(),
+};
 
+/* These are experimental so mark with 'x-' */
+static Property riscv_cpu_experimental_exts[] = {
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
@@ -1975,6 +1978,10 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+
     for (prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if KVM created the property already */
         if (object_property_find(obj, prop->name)) {
@@ -2014,6 +2021,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (prop = riscv_cpu_options; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


