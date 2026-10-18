Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3FCCF2C9
	for <qemu-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 14:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIRb0-0005p0-Rg; Sun, 18 Oct 2026 10:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRav-0005ne-3x
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRaq-00050F-Vy
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8a05da1cc1fso209216b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 07:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792332631; x=1792937431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P6RinCIlj8umNB/ICCbnc+5KtiBXAHX73/C1WUV1Zkg=;
 b=LdoWo1LCMwZoKzLUAV6vEsl2kn+rXq1zjoY0FOI+LyqRswbOQbqlGQmZANW4qE8+lu
 pL6SLGNzN8fvzlUBrgeOeuWjg1YkqyMLHP1GpWACaHDEp2SGVlskrzvLMw89KgeQD+c8
 CwvapPH1C/wmAcFUSJ5HzlmxF0fzHba48jT4HX/4kOmxrlhvEAJAfjuhmQaiCRVcppX4
 UyQH5FYBtjw6VuA7OM4+rR0m90L0XU78/bOkdxh/QDIKSwSgZ6BmiOhE/wQZdK07Ihgn
 3UAzejoBiuU2UkDcPTTpnFNN7kKz/xM/zbxd0f1NyPvkGeYNeDRGXjBWIfY64keX34in
 PaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792332631; x=1792937431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=P6RinCIlj8umNB/ICCbnc+5KtiBXAHX73/C1WUV1Zkg=;
 b=AubpCVUX8CzwftvuXiyU/i3PTUs3viZrystT7yC6Kh7HfcHdmZ9dOGCEZ60ZaL+c/C
 /4NCLZpsvJwoi0c4dnsaGDKfVQe+MGIAycbMmyNDPq1aKk2MuHRgadCrfTi43spTh7DP
 lcPBlvi741bFQWBAtAwfo7GZEXmy3OsMJj68BSVGw95ssGQ7SMLkBCGt96JE6RCmH98K
 t+vuDmKyqSe1Kz1xG32CcF8tFnWd6ntYaS2Q2ljp/dMPQOZ0MtajsiQO1F0N4Sjh4v/p
 j6QvtUB2pIpaCR1Ev6xHXqK1RIGfRnfSYQ68X+ci+Q2WFOTloLT/nU4530XubOgYOFd1
 Jv1w==
X-Gm-Message-State: AFq9FYK9PFmwD0YUnnTYDHOVvNPH5YIEM0vzLUDFMSJKL0Tjy+CrqJxe
 ZV8u7nfTwU4H6zLNI8+NF5u9JPFRM5id9e8i1N3mA+TTUlIUnlTj1SjT
X-Gm-Gg: AYBFou1iWMX/ALqaGPTt95+cFwd+1m4Z3Ms48Mew72+cXKSbLkfwd+hAE6Rty5+33OT
 wIvGeXRR8QGXdfwBlUM195c3gBi0Kt9CdwVocptEuqNcuPQyNzMv2NN/4ECADKWkpZoyqx3Jtfs
 WzLvBNdTe04SF8Bgbjn/V3cNrFclzJ3pbZD+BaTS0RCcRc8+3uQ+6hZ/hKYIXBc8U+iStCOlu5D
 7/xMtHbjI10faaDjDzSf1Rf8NRw+zL1QQPOX+zr92vhpHviyPgZJR9QPQTeLs4+XfRlt7BkAdax
 r5UYYraF1gjrx5b0WQswIROMQWPlzIHcJDwQKNHgursGrxk6tY39oUJQhk6ErOl9+ZTV5mFsZAi
 eJiIYYfUs/utg76MxGgwuuVAOJgPI4i04rRH1cBz8y+w2UtQbRpqqUcBwqzHtRb5QIUO9Ffe1Rw
 zk0BGrmoDZuM7AmN/Epl+6rEm0B7nCTpQbFE4CkTAXNUPl4Mj43qCIAOQwZ4BG9TehWOcSkwnG4
 BvhHJ1Axy26xDTF
X-Received: by 2002:a05:6a00:348e:b0:89f:34c3:2031 with SMTP id
 d2e1a72fcca58-8a04cb24760mr3871978b3a.53.1792332631367; 
 Sun, 18 Oct 2026 07:10:31 -0700 (PDT)
Received: from dt-VM.localdomain ([101.204.150.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-89f57653ea9sm2949430b3a.32.2026.10.18.07.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 07:10:31 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/5] hw/misc: use hwaddr for the k230_decomp_gzip input
 address
Date: Sun, 18 Oct 2026 22:10:04 +0800
Message-ID: <20261018141006.16398-4-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018141006.16398-1-dingtao0430@163.com>
References: <20261018141006.16398-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Use hwaddr for address calculations to avoid 32-bit overflow and
address truncation.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/misc/k230_decomp_gzip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
index da4dc6f954..54303c0e7f 100644
--- a/hw/misc/k230_decomp_gzip.c
+++ b/hw/misc/k230_decomp_gzip.c
@@ -102,7 +102,7 @@ static void k230_decomp_gzip_finish(K230DecompGzipState *s, bool crc_ok)
 }
 
 static bool k230_decomp_gzip_load_input(K230DecompGzipState *s,
-                                        uint32_t addr, uint32_t size)
+                                        hwaddr addr, uint32_t size)
 {
     s->input.current_offset = 0;
 
-- 
2.43.0


