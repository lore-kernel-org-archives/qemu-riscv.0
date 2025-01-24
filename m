Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60247C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 09:06:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbFdS-0005q6-FE; Fri, 24 Jan 2025 04:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tbFdR-0005pm-A9
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 04:05:53 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tbFdP-0007cO-Fd
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 04:05:53 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-216401de828so32507105ad.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1737709550; x=1738314350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DiqkhodxlgaG5f3W+fdsVvVKaK/k4IU2znZnb436zgQ=;
 b=XXJ0c9AGtdTA2kHq64hEUbMZ1wbkA7uw7x0FfMnB661ktFJ9Zlr9kKsny9eK1rOEvp
 itgW/H0vJySPLqieGhvAHqUevqs08ZHER1BnNebmw4hzTWymv4/T6e9nHZA0+M+Coyjp
 IIt27cH2FZCNPRWGt8lztGvxwFpbbbUSOIs6g/6qKU5Wg/DundwdXcYE0R+gKHjPrHV4
 2D5PnbBeYs+T0O1ZtQ58VLQ+VGJUFuit45O7lEmk/IWQrdQXzdgW7GVBkwxPiLKg7F34
 d96cBiJEgjzYPoR1HXNKhurl1NSI6ViBiFKYQHPangknZazYBmRg7kdELk7gd4iFIQpc
 4iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737709550; x=1738314350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DiqkhodxlgaG5f3W+fdsVvVKaK/k4IU2znZnb436zgQ=;
 b=aVTXjT57M7kg1y6+fgh6Sg82wATXZ2BpGyIeGMAw7kfYQ/waaE+oaWI9/6z1Zox/Ef
 yeT79p3AAhlTUP8sSo7+O6iXx3hgWSq7boN+T5FHidlXvRUaxByVG2PWDRmDN8T1OqpN
 ZqK023Pp0CSkG2Vpd3QIBTPB982ixe8fhV2l7fGeFAGCooByytNk3YkyIS/caDTzEzxx
 7YkLwY+1NSU/5H0jDJ1ieaJfAalqD6XEkLDDmolAZdAl0pme2epYQ0MdkIkx3ct/+ofm
 Qj1MERTDeo1yyfOmUUaCSLOHmNhLZIj/unrtfziQ3MI0wbQR3y4Tm8RqBA/sdyzrA7Lp
 Dxbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHPQvFfhWFG8y0noH5LWH0YRw8WYayHnatrNGKVa8K9UvaYwogYUThUuPhMKjgA3LWThjI7ZAg+5ag@nongnu.org
X-Gm-Message-State: AOJu0YzgWNaqhF4RY54fcfQCE9/wRakpuPQltaAp5pNpuQgTd1uqAPsm
 Kjx8ZXeGTsmwUEvY9yppnhMcA0SQi7J0w0LM7rfMATTJrOkiPGTDw2GTew6i+QA=
X-Gm-Gg: ASbGncsniZKWdAAcrN9M2NWVW6b2K5nTWZcWJNW+Q2EIFRLkmkziHjdQ2XJUuFYvEFu
 rakqWIHc9d3diecJ2q9OYh1yYVKebFg8yU48J7x5oZMk/2oFkrKbomxw8jTYo4HJPlKE0TEl8Mf
 xqZaiCfYQwepziWuBr0aelD2l4zjBxxgZXKn5YRLEgWvlxiDKblKcbWnTj8mDk4uN1e13fb1cbE
 4JXf+sgpRCpULAmBs0j9nezHEP0+n0VuQJyLGH4kIf5ypjEpniSVE1j8qeZf40vSqc1qRr1EB0I
 M9mW7a0jvGRAB/k5xOcEGA96p3BoCPhPyQYCEQ0FyvWWdAR6sg==
X-Google-Smtp-Source: AGHT+IGg7sy4Qx//uj8busZ4yeVErd5dWFBIcVRX9nSoNaPvDpdg676uaqV97tJU4lzWfHSiTG02Kw==
X-Received: by 2002:a17:902:c411:b0:216:84e9:d334 with SMTP id
 d9443c01a7336-21c35577e88mr407045865ad.33.1737709548608; 
 Fri, 24 Jan 2025 01:05:48 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac48f897f8dsm1150655a12.22.2025.01.24.01.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:05:48 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: rvv: Fix incorrect vlen comparison in
 prop_vlen_set
Date: Fri, 24 Jan 2025 17:05:38 +0800
Message-Id: <20250124090539.2506448-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x635.google.com
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

In prop_vlen_set function, there is an incorrect comparison between
vlen(bit) and vlenb(byte).
This will cause unexpected error when user applies the `vlen=1024` cpu
option with a vendor predefined cpu type that the default vlen is
1024(vlenb=128).

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..2f53acbab59 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2034,6 +2034,7 @@ static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t cpu_vlen = cpu->cfg.vlenb << 3;
     uint16_t value;
 
     if (!visit_type_uint16(v, name, &value, errp)) {
@@ -2045,10 +2046,10 @@ static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value != cpu->cfg.vlenb && riscv_cpu_is_vendor(obj)) {
+    if (value != cpu_vlen && riscv_cpu_is_vendor(obj)) {
         cpu_set_prop_err(cpu, name, errp);
         error_append_hint(errp, "Current '%s' val: %u\n",
-                          name, cpu->cfg.vlenb << 3);
+                          name, cpu_vlen);
         return;
     }
 
-- 
2.34.1


