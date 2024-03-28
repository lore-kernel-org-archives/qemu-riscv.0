Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95479C47DD9
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:24:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rpfR1-0005JX-IA; Wed, 27 Mar 2024 22:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rpfQz-0005J8-Jo
 for qemu-riscv@nongnu.org; Wed, 27 Mar 2024 22:24:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rpfQy-0007mB-1Y
 for qemu-riscv@nongnu.org; Wed, 27 Mar 2024 22:24:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dee5ef2a7bso3997105ad.1
 for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2024 19:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711592643; x=1712197443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q026NYb4ZHzOUxF7VvpJFc4wjD5B0PSeAlVXt5PkoW8=;
 b=Fx1dknnM47cKt2mAGyUrkyZ3eSUoBmCokd4k1xXvcO1uBPleOFfbKgOKKc3KhFO5Nx
 DLnaELz+NE7Aje1HDQ9Xmd0QxwDZh7ON9kyC6sUjtD9YDHzCG/WnHV2E30EZ5XAdmxU7
 vfmdXf6cLGP650xnr1wVg0v/V6Z7FAmuDaSsOB6NS1POejU+nCtKJ6i9Vl7mHTRH1pvb
 8/Jsep7qUaHGMKkskOeSLZx5wkDT2Int5v5bJG9fHQSXNl0mdnOBwWvqWNPGeULPW44Z
 +wfICCo9E/NA/uN8sdrDsNJxlTmdMBtpRjEPMzHPNi3yZJtCrDVCzFIRrGCxI54ZPrL/
 0DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711592643; x=1712197443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q026NYb4ZHzOUxF7VvpJFc4wjD5B0PSeAlVXt5PkoW8=;
 b=KmEKKIVvhiddyHYojrH/+8MLHFfYbygwx2YKDaqegIvi68Lno5jaHI50iCkjC7H9SI
 GF+JUSS1xyp7zaWckMMOaO025PvRTJGjm1rSfK+o+aoof+suuIFR3vCs8nFWCX+Odhf2
 MC8x8YwfRC/MinU8WHGXIlLx2jnv/RuZRcTZztNtSZE2YW8h0Hq20J7xhH79wjDvN6D1
 l4IFRntLExz0Yef/YO7JiCmNkHP55F+nvRdFkyNyYKvZY7LQVHef/JF3p1/C7B5SmxVW
 LvlHBPsxJ0LGz/8AugOezVhz40KsqDwfexnRWImCHPuI6Iej6ZzuanC+v510dp+Bgnzw
 QoDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9zeHmxIwhl+C4vVTXfXHfHjrx3UmBT4mMPp4/MxkVp9PqZLJ29phfJVnHCm86O1bdQ3eAOmDkalubzPkoDEfUcNouSr8=
X-Gm-Message-State: AOJu0Yx+ZmMYJAPyMaSs0XtJ2UH872AK9djeMtSbDFJZacRDhHMUuyXo
 mhAtbvo7+1s+0ep0bHYhRRr6bDI0fKc9SSsArEVtBa6/UtRmKXtD83DJyfC6HUE=
X-Google-Smtp-Source: AGHT+IHj8OlxxfGYdC6cUr2aDqK3ew7acXUi8nJv0CqnERCoD1llD0xQ0f5UN7SyiiWVBAn6y2I0ng==
X-Received: by 2002:a17:902:ec8d:b0:1e0:c224:abea with SMTP id
 x13-20020a170902ec8d00b001e0c224abeamr1630801plg.43.1711592642801; 
 Wed, 27 Mar 2024 19:24:02 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170903230900b001e14807c7dfsm247424plh.86.2024.03.27.19.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 19:24:02 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 3/3] target/riscv: Relax vector register check in RISCV
 gdbstub
Date: Thu, 28 Mar 2024 10:23:12 +0800
Message-ID: <20240328022343.6871-4-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240328022343.6871-1-jason.chien@sifive.com>
References: <20240328022343.6871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x632.google.com
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

In current implementation, the gdbstub allows reading vector registers
only if V extension is supported. However, all vector extensions and
vector crypto extensions have the vector registers and they all depend
on Zve32x. The gdbstub should check for Zve32x instead.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index be7a02cd90..d0cc5762c2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -338,7 +338,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  gdb_find_static_feature("riscv-32bit-fpu.xml"),
                                  0);
     }
-    if (env->misa_ext & RVV) {
+    if (cpu->cfg.ext_zve32x) {
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
                                  ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs),
-- 
2.43.2


