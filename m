Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC28C5B543
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 09:30:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uN6uE-0004j3-4C; Thu, 05 Jun 2025 05:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6uC-0004iQ-C6
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:29:00 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6uA-0003QN-El
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:29:00 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-52934f4fb23so592007e0c.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749115736; x=1749720536; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DO8YHAQpU75qaVczSmo9gZy5vhtvQPuq/Qr64lHtiOM=;
 b=l503K6OIPNVBmdq0EJY455zNeB9xHH8rWJEQqv2LF36u5q74VVBKGVQLcRTH1ZjPZr
 KRoGkAEDW8rkjuu6yp8YeLvOtA4ug/ZwSkvMjcjqtZErk3WiOqI8QZuRKDIaFPO0Czxc
 mGk1C8LwoS5zrQmdxhFHTddryYde+0EpEjnn4DlhzS+79ebPnl6tMNfpWY9mF7Yn5q7m
 C7Fh23wvkz1VDxgsTxNdPZHGlqMCVa9zb9BhRP9t7byh14fnDzpksyrRaVE6SPvuU2Mx
 Mp+SME2q0M+zdXsegLXXgJU7NHSkC9+WWhK68Pwn4hEW8BZc1XsUYddgSpJSYeFb5c2O
 vdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749115736; x=1749720536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DO8YHAQpU75qaVczSmo9gZy5vhtvQPuq/Qr64lHtiOM=;
 b=QANi2w2kgHtNfi7NgxDd1ylX6fvzs/rLlEoPIc5oFpwPE77Vw6coTrWW2TXT+V8R/k
 og1cwuWnxbYizdKV9gcE/olEN8ZRvOxjlwYR4e7ZXe4OLEQc8VuaOgxsqQlTcu3ZQtSV
 wihZnBNxpd0KE/0s2FAsq0GzD3/RtV7lczlQFokdlyWe1UXsgiBVUP3tioy03LCiN/V7
 d/eHj1ukMThoVMr5pVETOaROZeFD80qjCVlAAdxq3c9su9623EcX5ffELgBZAfkLv7MO
 Ki8HSmdJLRN9jPiGA87B2tp/0R4NPGfzOxaoKfMxGrDHhDU+oaknxK8GE7tsucPdTJ68
 RCVw==
X-Gm-Message-State: AOJu0YzGvCdjoOx1mEBHJ1pKcx2iu7j1z5/cStGYHlbHQYSzYXe+j70V
 fK+IdddTtdH5Lykynn5o9TjIHG1cyuI9J7MIPe1MFJsHeuSQTmEB7Y0NFbR7lp006b8=
X-Gm-Gg: ASbGncvmnoDXvESnqjtNK1qAtvCv6WGQuZ7V15Cx0092GsuySMJiT0gIUirNkhD4VOh
 xb8HAeiXwoSOpI9+Wr8Aw+nIr/WhXTW3T8ArBPwX01WIZk0C1arK8tYQRyqkCm069K6NtqrEb4w
 fIUcEJNZJgZMZNvqqyPvS7lXnWkQho1HYuo6q/7PeLTegfQPzCUUA6VwG98UpMZG5IyFTr/d+SL
 dWPWLqRYePkW4VSketN8c36OFjh+vEWwu0AkDw/Gz3rLGSmjQsMvvNMgvdmuREKyAdfR4t1rLL8
 XJtfctIdV3f0wG21OCL0ZHHf1ssTihtcGOe+Zad93ircNa3ecWgSH572s/gKjV9V02WlnaZ4oRO
 oTiJKdFKlULCwoaU=
X-Google-Smtp-Source: AGHT+IEjwhYAY9lxGzRrEDiKcxrhweRLC1jsYzWm4xu5oTWBYgG4A4riYOTo0xpmEjK9asBcymYJaw==
X-Received: by 2002:a05:6122:3193:b0:530:819b:9a3c with SMTP id
 71dfb90a1353d-530c72540f6mr5469480e0c.5.1749115736203; 
 Thu, 05 Jun 2025 02:28:56 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53074bf86b1sm12311772e0c.36.2025.06.05.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:28:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/3] target/riscv/cpu.c: do better with 'named features' doc
Date: Thu,  5 Jun 2025 06:28:36 -0300
Message-ID: <20250605092836.1383882-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
References: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa31.google.com
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

Most of the named features are added directly in isa_edata_arr[], some
of them are also added in riscv_cpu_named_features(). There is a reason
for that, and the existing docs can do better explaining it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 058387ac48..798bfed6b7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1377,13 +1377,23 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
  * 'Named features' is the name we give to extensions that we
  * don't want to expose to users. They are either immutable
  * (always enabled/disable) or they'll vary depending on
- * the resulting CPU state. They have riscv,isa strings
- * and priv_ver like regular extensions.
+ * the resulting CPU state.
+ *
+ * Some of them are always enabled depending on priv version
+ * of the CPU and are declared directly in isa_edata_arr[].
+ * The ones listed here have special checks during finalize()
+ * time and require their own flags like regular extensions.
+ * See riscv_cpu_update_named_features() for more info.
  */
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
     MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
     MULTI_EXT_CFG_BOOL("sha", ext_sha, true),
+
+    /*
+     * 'ziccrse' has its own flag because the KVM driver
+     * wants to enable/disable it on its own accord.
+     */
     MULTI_EXT_CFG_BOOL("ziccrse", ext_ziccrse, true),
 
     { },
-- 
2.49.0


