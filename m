Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08E4C021B3
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 08:25:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmTlp-0000Jg-BQ; Mon, 24 Feb 2025 03:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTlg-0000AR-0Q
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:24:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmTle-0001BW-AX
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 03:24:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22128b7d587so76086495ad.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740385485; x=1740990285; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=onlUINOp8JpvgGqdS5sWDC3DlUou1fW9JzejUaBAofM=;
 b=dvQ3QL6IZhvcLQL0ghsJrDsZ5O+e5odpfNnYrWEJaJ2AgLho7nQufB/CZJGDq6drh5
 CM/JRbwe6JLpc2o/2zNbjG8DlsY6AclI8XLBwry4Z5C33OIt5HEhmOLyYD9qa7QltdFK
 nRQ7dSPeMw+Q8swiOM7PG9WAW236U7dT9ca0OOiOnBhvQdAGELJKGp1FdpWXOZVdMPq9
 o2GLNpizgplldvqv4Gsq9SkYXTnB9Xrwgg1/1ECXHaPeWiYKphN8s2WFoS7QbcTSl2Md
 nY+udvmQCEmyBU3A52Bt1i2f/YENpQo/aaQqNU36Y5T3gbeQXnKGEpqVfux/aMqHFLrf
 2ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740385485; x=1740990285;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=onlUINOp8JpvgGqdS5sWDC3DlUou1fW9JzejUaBAofM=;
 b=PX66oiXPqOuWlqR1uSZxplyg1xP7nlaAm+V9fqkoEf+SS0Ys2hP8UrfsJ+HNxbfKVR
 iGWi1f7Ecnso2yCYT84pFhpBWHNnC8jV/amzliT1p15DSZLK3Bq6tnvZZwLZ6mw+lIx/
 Wbu/WrlkBLKNIAjzos64p4SJUY4SyehexMAJr7RMjauNF3OyeQRI+8+SbcK5VlA1rwg9
 N/lFMsmSkTVq/ZuFFNSxh2tyWcgJhXyuafa1RcjdCSUjS48sXVwlTC3NUnaKxIwphWZC
 Gsqj2pKYPNlwW13+RtbzxZel3CJk7csDfeQz3F49RR9O8UwgkY68Os2IdeEKc4cHwetP
 vZbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWUy09ztzl0gsvCHDL/dBu3uTR6Leig9dphSnSgKW2qqcgpieDINr/ORkLq6lt1e4ov7r0LY+rXNN0@nongnu.org
X-Gm-Message-State: AOJu0Yxq0f0vnaO/kLC+JeZImFshsk0sFm2Yq8jjaOsbAOtYXtKIKVdk
 lhNQOHhiUbly5iYcb+7RqOdbXpRH6cbmYWdMPYL4HXAvLsG2aHo/YxcU18bkilc=
X-Gm-Gg: ASbGncvA0vLeVKILdAfNyQbwWZFlc1nUxTN6/oPvF45+G/xCv8I8M+D0omR/cI7WfiF
 3SEAIfIfwN4GgvvE4KAwsTmVXBqfnqMIcYKx4EdtpoeCNcZYvUmh7us4VCHDz4WFbVWdcFuHBQm
 v8fAT6pvgeEB/DVYf4T0JCzZmPPAf4pbK1CqKVaqLJ0wRlJ+03F/93HwaxPEHIeTLBXuiiGjgEt
 KXibdDx/Bn+iGeVCBu2+TA5r53wRUc5Mtyw2JTot40Wijc2dvGIGafbTMVhB0LYpST2+wzQnShl
 I2gDXkGLqwVvUn+Lt38D7UbJuP5GmE7ELyd0t70K+BI0K7Tz7B74yT/l
X-Google-Smtp-Source: AGHT+IFUB2NTRW56OIeSFM0J0s3sbM8xJzq+zvg3CSR8DFYSdfiwAVuzghlx2r0rdoYs+QjJxMyF6Q==
X-Received: by 2002:a05:6a00:9283:b0:732:56cb:2f83 with SMTP id
 d2e1a72fcca58-73426d72adbmr19698817b3a.15.1740385484860; 
 Mon, 24 Feb 2025 00:24:44 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325c88d74esm17714914b3a.149.2025.02.24.00.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 00:24:44 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 4/8] target/riscv: add helper to get CSR name
Date: Mon, 24 Feb 2025 16:24:11 +0800
Message-Id: <20250224082417.31382-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250224082417.31382-1-yongxuan.wang@sifive.com>
References: <20250224082417.31382-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x630.google.com
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

Add a helper function to get CSR name from CSR number.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 target/riscv/cpu.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 616c3bdc1c24..df10ff63474b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -920,8 +920,14 @@ extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
-void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
+static inline const char *riscv_get_csr_name(int csr_no)
+{
+    g_assert(csr_no > 0 && csr_no < CSR_TABLE_SIZE);
 
+    return csr_ops[csr_no].name;
+}
+
+void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 target_ulong riscv_new_csr_seed(target_ulong new_value,
                                 target_ulong write_mask);
 
-- 
2.17.1


