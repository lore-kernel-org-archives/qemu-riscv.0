Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D427EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:22:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMXKP-0008JA-Rn; Thu, 20 Jul 2023 13:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXJi-0007iV-Nt
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:19:55 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMXJh-0004Z4-3v
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 13:19:54 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1b012c3ce43so801791fac.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Jul 2023 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689873592; x=1690478392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzgcRnLoiCaDy8vHSwQQ6Ea+tEzfQ/ngaUcJf6Qf3WI=;
 b=bPUeuO73g+x7h672pvt6l5YPKMrwNzHASTkKQj5qLFurTtovgnFlM7bDYaUM43yRqM
 AIFIJyd/xMKrMSv2y3JVp+6mBah8i1RkyjhPBgtiZH2z1W3Is7cTiHGptffqi32aoaPF
 B17/atTk8TDnQDCoLmZhnBDB/H2gMubXJ1P4kTgg1D3at+xVbhq9AdGHJK2NX+ZObJQl
 IKQoNGwtQTqQBu3qgQ3laCKeALoEvw/KT3ObkDCsiUkGfwSBWLOfWvkzfa0pMjTrBftI
 +PEJofU6JsRY6VRJKksfwIfK0AFxaJv/T73LAWDLAZm6H0rfWf2Sszbq/I9oOrGp+C0z
 OA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689873592; x=1690478392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzgcRnLoiCaDy8vHSwQQ6Ea+tEzfQ/ngaUcJf6Qf3WI=;
 b=G8mVs1Aghivt3aoTqjGRX5qJ6TV2EN3vg31Phc7Ao2YOWlj1lugbvPg89ZVafe+ejN
 yGj242CHGZkfHYjJ7JUEge3N/FQQkWTiJ8WtloNTuRwSuT4XUqITnB93rYBKO9asndRM
 fGvewfrnaLpJe5zSksic96szX50t2Fs+Nf4VqV8P19dbN+xyzcxV4Dm/ioXPiZ9GxgiJ
 Qd73Q8kA6sfE/+7FZF/V2EwM9tdxuiN4OuB8/GLMoh8usiNdIJTslS8+gRKGX88MZK6Z
 tSwEfAOwEIpYVvD8XrfYJq/CdP5MPN8P2CTg00ZpuhJm5JSB0hQwY7UKVBjfl9JANmpa
 na8g==
X-Gm-Message-State: ABy/qLbeNPzcjM8z+TjDsX6fHMX4aW0UBpgd5Cjt6nOKi5bmSR2Q9kC4
 uskb3y9Zk4bVkeuQZsa2KrFykQ==
X-Google-Smtp-Source: APBJJlEqd7MmeVPgIGUtFKdZg7tETOoBrwmEv6gU4hwh1HbCZX8rWbGT0gkXIRAmOIEussFaIa60yg==
X-Received: by 2002:a05:6870:73c7:b0:1ba:2c95:a168 with SMTP id
 a7-20020a05687073c700b001ba2c95a168mr120482oan.35.1689873592131; 
 Thu, 20 Jul 2023 10:19:52 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a4aab02000000b0055975f57993sm582564oon.42.2023.07.20.10.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 10:19:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v5 04/11] target/riscv/cpu.c: del
 DEFINE_PROP_END_OF_LIST() from riscv_cpu_extensions
Date: Thu, 20 Jul 2023 14:19:26 -0300
Message-ID: <20230720171933.404398-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720171933.404398-1-dbarboza@ventanamicro.com>
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
---
 target/riscv/cpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7f0852a14e..4dadb7f0a0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1835,8 +1835,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
     DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
     DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
-
-    DEFINE_PROP_END_OF_LIST(),
 };
 
 static Property riscv_cpu_options[] = {
@@ -1894,14 +1892,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 
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
@@ -1922,7 +1919,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
-    Property *prop;
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
@@ -1936,8 +1932,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_misa_properties(obj);
 
-    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        qdev_property_add_static(dev, prop);
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
+        qdev_property_add_static(dev, &riscv_cpu_extensions[i]);
     }
 
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
-- 
2.41.0


