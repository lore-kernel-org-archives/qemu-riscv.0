Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E2AC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:58:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD8g-0002vv-Jw; Mon, 18 Dec 2023 07:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8f-0002tf-1F
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:29 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8d-0004wn-F6
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:28 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d3c93fadc4so2577345ad.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904066; x=1703508866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLrVv8VBLDDI9xgw0i6V3nJixdQ2OWE6VqwsOyfazpo=;
 b=PalTVUJrSA3LBtE3bWnO3mBvD3lPtFikQi2KYgbs1yWLrkoeUt68JJ4zuvQRd2uRaF
 vLIvcSywrHey/oWvJO4oT54XDtBVNkmNv2rfPvvHhFK9Bs9qj7gibmRSp4jlMgJwNgfh
 ZjvdGbCO9QsqHdShI7smekssHriAHj4iRd4W1LHXuZvnlDWGMBjOWu4n6myLEW2AplCS
 ElRwipdbpBt8+skj54zloLUc3R72YwrPQoHmDYT+fLE6fXSVDb3onJMSy00R3Wl/KNRu
 OHTP43WQnbGH2Ojhoj7w0Fynl76lhOGErN6IiymTpEoq1/ILOn7O6iBigBXYctSTf8ZZ
 inaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904066; x=1703508866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pLrVv8VBLDDI9xgw0i6V3nJixdQ2OWE6VqwsOyfazpo=;
 b=qD6TGXMYwnDDYVcHu2gpdCiUnKs3LMk42VeJlBt2FcBLgXAyRajwhqUtDd7IYSs8C6
 HBwF1QpZLb+LH8fIhyuKWLBfNSkal4tnI2qIUhaunGYEqfByJlZ96ajA7GBigAXJ2CVc
 HuWnu1YkRMWOIcs7Ppc2jarPMnRwDsc0za+14x0CBGPKXZw5chNzE821PHPhYZPvyXPD
 YICozs5StJj6DVIscVr5kJnehl0Kz8JY9h8wqe8+h5D59fw7AUaNAr78cKz2GPXNjPft
 DScwq6fAQfenHly8ZyuBTnB/wV7p2WZoZnv2p5ywN+srMILXUGLXOYjSIuheheru3j1I
 4VAg==
X-Gm-Message-State: AOJu0YxYX0GnLWfCHyW3f1lEAV1auXBPo20miLMYpAKbJ7GxfWLTuNdM
 LFuWtLzL1CN+1L+KOfILWDb45m1ufn6Lccy5eK4=
X-Google-Smtp-Source: AGHT+IF3Z4PYxaaBPck2HlRzf5kbrUhJh6dthf0/E21mjgJ20h8sJ2jfRp4Jrr9e2IewKyw5b0vk1w==
X-Received: by 2002:a17:902:d548:b0:1d3:7d0b:a878 with SMTP id
 z8-20020a170902d54800b001d37d0ba878mr3103003plf.124.1702904066132; 
 Mon, 18 Dec 2023 04:54:26 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 13/26] target/riscv/tcg: handle profile MISA bits
Date: Mon, 18 Dec 2023 09:53:21 -0300
Message-ID: <20231218125334.37184-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

The profile support is handling multi-letter extensions only. Let's add
support for MISA bits as well.

We'll go through every known MISA bit. If the profile doesn't declare
the bit as mandatory, ignore it. Otherwise, set the bit in env->misa_ext
and env->misa_ext_mask.

Now that we're setting profile MISA bits, one can use the rv64i CPU to boot
Linux using the following options:

-cpu rv64i,rva22u64=true,rv39=true,s=true,zifencei=true

In the near future, when rva22s64 (where, 's', 'zifencei' and sv39 are
mandatory), is implemented, rv64i will be able to boot Linux loading
rva22s64 and no additional flags.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f8c35ba060..f2e0ce0f3d 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -941,6 +941,27 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if  (!(profile->misa_ext & bit)) {
+            continue;
+        }
+
+        if (bit == RVI && !profile->enabled) {
+            /*
+             * Disabling profiles will not disable the base
+             * ISA RV64I.
+             */
+            continue;
+        }
+
+        g_hash_table_insert(misa_ext_user_opts,
+                            GUINT_TO_POINTER(bit),
+                            (gpointer)value);
+        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
+    }
+
     for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
         ext_offset = profile->ext_offsets[i];
 
-- 
2.43.0


