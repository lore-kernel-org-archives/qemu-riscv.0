Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56761C36010
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:28:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0ixj-0006Yy-Du; Fri, 04 Apr 2025 11:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0ixf-0006XH-Ul
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 11:28:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0ixe-0005U4-Cy
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 11:28:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso25671065ad.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Apr 2025 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743780481; x=1744385281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64ffXBXuQzv7IOha/LjqB6wKvW483xyiKKjQy9ObikU=;
 b=AIdv2bA/H8pMT1YMtNxhNd77QVTLl5Fiac66CD+UU/sjLJVR45ozWOmu7vqXfYk0k9
 +NKd3zrGMkBsnt+6NwNoQuyhLsPW75QObwt03Hokr9q0P8xon62juVYgdrY29zI32tAt
 fi7kYdwdMI/bwNKmNBRqnEA+yXhv5LyNMtEIJj9df/esnQIANI9NfIAEI9t1wAyn4F5+
 GE0HVjUdvGHJIlC9Ywdx9ioiDTGUXGwT5yAtMIBNoHay1UzE5HQGhYMqREUw9lDQr26T
 X3eu9brxp5ls1TM/3qBVM1sNyvYHB+YAeHdwyAzA1+hOYq0RZ0Cv75HxmuxxCnQMW5Q2
 kV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743780481; x=1744385281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64ffXBXuQzv7IOha/LjqB6wKvW483xyiKKjQy9ObikU=;
 b=vNzSjVb0vRisTkbFV9+iYPVIpTGBOybD01mTYiigovgrFqMHe4dTF4LL753S0UvDK3
 PYr0zymPdacELITpwohidUuA5dsrNbPnWJSxVDyHDs6mPnrw0yRlBEKdfm02kJXT6e76
 /7TAxnuGovmTS0E/zRV2zECR+VjGFMyZYWj3RwZX8v9cP+lGj2nW/38lfNefVyDonsdj
 s/37WmSudm/mT+pbfAvSsqrqqg6ySxeehMOtac2q174RjYB8AWqu+kw2V3vxmu5VBGCY
 xVfNYulAhMU9Xy8M0rZhDj9pyoo3xKOdnNCQbFtSOHC72gf+vTBBZkV1S6hHpj1hmX3F
 ll0w==
X-Gm-Message-State: AOJu0YwharxLSKhesvHTGfNSQ7zWg4xcWJA5Xh13CissA+bt7L6IVN72
 MJnQ3JCTcnEIEhQdkW5YwEOuo0S096G+7N/KKQ89Ips2j7d0sgRm/KHe+7LuZ9s=
X-Gm-Gg: ASbGnctfUV41JVxu9FacN1yu8Pz3Z41T8orx9yehVdIh7uXCaSJ/HC5rgsvJsCJDr47
 dBZZcCZUFTDenpn8cfPy1bVg2BS0zX6gB5f+NFAqXhzS5qc5dggJWJTBOeUv66aA5KfP35PGcoL
 2pOWx9MpqY0eLjzKiARGrMuN1zUjjwTOQoHV1iKvqDzj5Vwvc95f+MX89zTOyBCsNac1k0FS+E2
 zZaLKT5c0TZsdgqxx5+uwEiKvK+M7fwWdOkBf3V2HqCSJOIVR4dmr2GXlduELj2C3dvv5kWMRwS
 F7m6Kx2GqAefFJn48ZXDqRHDC7wkNPsDZgT0sW9Snqdn6KpMV7m5GedXm7eeP3suMqthzb0F/w=
 =
X-Google-Smtp-Source: AGHT+IFikrKsQHo/Vzh6+XZfsatdcMZsz7nuWuCZRlDJFE113VvzBIFe86jcfRN/uktgmpW36Pt1Gw==
X-Received: by 2002:a17:902:ebc8:b0:223:325c:89de with SMTP id
 d9443c01a7336-22a8a85a1camr46644875ad.1.1743780481133; 
 Fri, 04 Apr 2025 08:28:01 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866e3ecsm33570655ad.198.2025.04.04.08.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 08:28:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv/tcg: make 'max' cpu rva23s64 compliant
Date: Fri,  4 Apr 2025 12:27:49 -0300
Message-ID: <20250404152750.332791-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404152750.332791-1-dbarboza@ventanamicro.com>
References: <20250404152750.332791-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
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

The 'max' CPU includes all available extensions we implement, but at
this moment it is not rva23s64 compliant due to missing checks that
the parent profile (rva22s64) does.

Users might expect that the a CPU called 'max' CPU will also compatible
with our latest S mode profile. Let's make it official.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5aef9eef36..cd489ae35b 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1486,6 +1486,8 @@ static void riscv_init_max_cpu_extensions(Object *obj)
     if (cpu->cfg.ext_smdbltrp) {
         isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smdbltrp), false);
     }
+
+    object_property_set_bool(obj, "rva23s64", true, NULL);
 }
 
 static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
-- 
2.49.0


