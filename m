Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DCC07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:52:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qveHh-0001u0-9j; Wed, 25 Oct 2023 09:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qveHI-0001Va-9C
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 09:50:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qveHF-00030o-Hy
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 09:50:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c9bca1d96cso40955465ad.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698241827; x=1698846627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rcXEbWZ4l7dEPjn5bTogVwbKYMRfT/6+s3z+X3Tlyw=;
 b=DjEs/mSHulNc6IoKTEO0aZAmH7haCI5waetug3bgkOJ1FLUq0Hliuf80ebPlVls544
 N6OK02bH7tjLspLbMOmrei8UsBI8hvyKRHzN3dzvuXtmW9FG8k/7MkSJaze87xibPnxm
 sIYb8ggf9l9fG7BmIJrBQv5uFLUQZ2cbU11bxIMPeQVHuQh1VHGKJ6sPS4FRG36CkQP6
 CL3bP+2nem5vPu1ePXhbI2mqeVBnMLUBt9mImQFmcnVI7859UV0jg5LNHCMxOa5Dypvw
 ysWmBJhtO55px0fFo4KUL9+TR6SWGh8i9SJ7qunNe2lsFLzldBRfibrfnySuLCXOzFaZ
 Hjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698241827; x=1698846627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rcXEbWZ4l7dEPjn5bTogVwbKYMRfT/6+s3z+X3Tlyw=;
 b=NKHFNkfo6saVFW57GnkFsABn7n/YT/x03YisstxhMPmo4rxt9MqZpY2nUa3hXoJZji
 bov4kBDBbT++5QN1Is/I4LO/Y0PpJRZb56bmt/SaHX+N1U/oUuCMIn9CnRlZ3OunOvlY
 E7NXSLNFraEz2o/S9LPoZNSDO7BdP2vVWAD8DsNBXe8oM80LPcBPqkKHHgzvrZcCc7KK
 rLRgDtNd66m7F1/0IJKRlwi2vUx7SyC83yaScTjTZErXJGgO1/z2XEQGSxsEofQzRalY
 4zZAtoPV8Pb/CQDz/DS2zqXqlFubt5tdjBdfSjyVCGZwEeSPvrbEL0PCqZ57Rk1H6MHw
 +mpQ==
X-Gm-Message-State: AOJu0YxklrqfLxpWK5/tiQiXixqwovKR5GMC371SGc9V6KCukBDG7Zg2
 Wgv458W1bFPyZukz4ngh/etv3w==
X-Google-Smtp-Source: AGHT+IEglG5f9vLOSb5QuB1KHKy6UsuOQRAgDYRH2iSPcotlh/83jGvjdaA05IFFz9nePyEEyy7Caw==
X-Received: by 2002:a17:903:41c3:b0:1ca:8468:f05e with SMTP id
 u3-20020a17090341c300b001ca8468f05emr15110269ple.29.1698241827242; 
 Wed, 25 Oct 2023 06:50:27 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 jw4-20020a170903278400b001ca485b8515sm9252548plb.91.2023.10.25.06.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 06:50:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 6/9] target/riscv/tcg: handle profile MISA bits
Date: Wed, 25 Oct 2023 10:49:58 -0300
Message-ID: <20231025135001.531224-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025135001.531224-1-dbarboza@ventanamicro.com>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

The profile support is handling multi-letter extensions only. Let's add
support for MISA bits as well.

We'll go through every known MISA bit. If the profile doesn't declare the bit
as mandatory, ignore it. Otherwise, set or clear the bit in env->misa_ext and
env->misa_ext_mask depending on whether the profile was set to 'true' or
'false'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/tcg/tcg-cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b2489a5317..57026cfcca 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -804,6 +804,19 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if  (!(profile->misa_ext & bit)) {
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
2.41.0


