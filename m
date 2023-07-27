Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BA4EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 22:26:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP9B4-0001Hu-HC; Thu, 27 Jul 2023 18:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9B3-0001HF-Dx
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:45 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9B1-0004t7-SO
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:45 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1bb717ece50so1109727fac.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 15:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690495782; x=1691100582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHWPH6ZDd4/g5ZGPy4OVuAieR6dV6/jBAR0dJfNNJ0k=;
 b=e/v0+MTKpMfxe6370JPbdyPeKb70SMlsXtdXTu3hm4bjHkcRP7TywxinpfUu271w/u
 cq3JCMhRTrWGfQ72GTU/FFz/BpBc4hScIo9yDqzlQ7RJCpYlwHfKWbaWCoBjvTU0jjB8
 W+tvwbVWP3lswYv8eWPf/xcVkufTnPH1SNlXJ6ZynTHYNwlEkm7OaOfaWFg25O3JTcjK
 T6QN+cK/Jl34R8JScW+5qpoW9WujYBWITLiItRl1HpG1MbBAO7NM4kwJu0igkCmeKa6i
 7WriiezQsStRjRlTfjX6sjCNST9shfbWxnI1UMn+GeCtXi9JvEdaJRgNT//iaFtb5kdv
 LEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495782; x=1691100582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHWPH6ZDd4/g5ZGPy4OVuAieR6dV6/jBAR0dJfNNJ0k=;
 b=ltZGMZB9sYsNoMI2BElF6x7dPmFQmPAz9TxwxxyFeXivX7G2Hs+abbgLp1IxmcMZHK
 Xj8BR5HHIaXed8hX9cZc9ur0mH5MiGevqpCY2gwwzNwNDTGNip1v8sSYBJt8dFuvz9nj
 5yZcKy4B5O6BFwa479GH37tq0GCIRbmi6qHVquIM/QhRr0jNG+QwRE1mFPCd0x4V23gL
 PyfhVldC+mcVz/9B0SPk+2IUs3lmr/doLI+VPH7tX6PjqPRhAkjfhpdpssI0XPvfFRSE
 LZfoyMlsx2CCqiJ+EGFNJi/nkzBQgcrwUreGGN5CvgYoc84ywdB5y623c9EcsT5beuaE
 iTtQ==
X-Gm-Message-State: ABy/qLZzlojluy5YZtUztvo9gD6fJC2uq8ZH7ZinshJejM+Rs34/LocB
 FoOybFQy5UjMoQXjLUjrJ05F1Q==
X-Google-Smtp-Source: APBJJlGOuP9vN1TE8fcHZ+GoG2+clwD5Y3C6JWSzCM90HB+HD9iZh35eV4fHqGJyNJDuTiY3EHbFIA==
X-Received: by 2002:a05:6870:b155:b0:1bb:9b40:268 with SMTP id
 a21-20020a056870b15500b001bb9b400268mr791130oal.44.1690495782758; 
 Thu, 27 Jul 2023 15:09:42 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 y136-20020a4a458e000000b0051134f333d3sm1070471ooa.16.2023.07.27.15.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:09:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 04/12] target/riscv/cpu.c: del DEFINE_PROP_END_OF_LIST()
 from riscv_cpu_extensions
Date: Thu, 27 Jul 2023 19:09:19 -0300
Message-ID: <20230727220927.62950-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727220927.62950-1-dbarboza@ventanamicro.com>
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This last blank element is used by the 'for' loop to check if a property
has a valid name.

Remove it and use ARRAY_SIZE() instead like riscv_cpu_options is already
using. All future arrays will also do the same and we'll able to
encapsulate more repetitions in macros later on.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f1a292d967..33a2e9328c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1842,8 +1842,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
     DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
     DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
-
-    DEFINE_PROP_END_OF_LIST(),
 };
 
 static Property riscv_cpu_options[] = {
@@ -1901,14 +1899,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 
 static void riscv_cpu_add_kvm_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
     kvm_riscv_init_user_properties(obj);
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_extensions[i].name);
     }
 
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
@@ -1929,7 +1926,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
@@ -1943,8 +1939,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
+        qdev_property_add_static(dev, &riscv_cpu_extensions[i]);
     }
 
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
-- 
2.41.0


