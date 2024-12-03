Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2E9E6C5F8
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 03:39:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIJk0-0007yF-Gi; Mon, 02 Dec 2024 22:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tIJjz-0007xd-Bn
 for qemu-riscv@nongnu.org; Mon, 02 Dec 2024 22:38:23 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tIJjx-0005aX-Si
 for qemu-riscv@nongnu.org; Mon, 02 Dec 2024 22:38:23 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-21288ce11d7so45854365ad.2
 for <qemu-riscv@nongnu.org>; Mon, 02 Dec 2024 19:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1733197100; x=1733801900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+unVT0iJ51qHfPa5G/FCD6L8b3hBokRmjj3mo3WsF0=;
 b=h5mblpeEyPIZmPmKtCEkt0Vl1WDoe92Wdl/fjUf+nmzK3ro2Oqj+T6G8chXxfj2xJt
 YOAJQH7J5hnXNZlTTeaNG2tavaLZKt+ANwNT4jB+uMxfOcxPjFOzjlMPIpx0/T3frOwv
 xk2QjT2pEvEShYZuvln+qD+ilEd5cjlR63x8jCMe75H/oLI7n6J0l1/u6YFyts5TD+pU
 UnfhxTnzFGb+QXNuyl6NQIzA/BVp6zGtwBFXXFQJqAruRglanKyYi9YHZ2XOKyrmqaAl
 4lSzVL+nUz+kv5+FkeF5C1gQljN65rOTqzeZxuttmJH7HKRGVEJShQ638OxPx8nukC+l
 4Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733197100; x=1733801900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+unVT0iJ51qHfPa5G/FCD6L8b3hBokRmjj3mo3WsF0=;
 b=Fz8xaBo13kQLCSRLPRa7hXhTPrBTCMrofcxNYJZQNXQj7R/4lEN8LX7biojIdXxqbV
 OZZMdl0ihP5G9ZG6Z16urWv4qTDUUwLFbiNA0Nh+5g0+I8fHdOVAoX+T9pakQpAgAioy
 575B6Prua5kmUFjZSiXRe6mzjDKYUg6N3ybBR0ey5M/iiH1MJ0XSOba36/G9Shz23MVm
 yuFYIEZnNjgrlIwbhn4EZSULt1An5yE2TlbHCp9AsznZfcih1vd3AzHpkeiDYinRAFLZ
 5yKTdHMIG+qkHhKf71HTYgmWXcS0nlBl4EQjaY3GlxNM/xiiRpbgfTsT4INFXcVTMtfx
 5agQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8xTwNUWU3tT9CeIdd/PKsFpwHhCa1uJjiIGSjt8FNy9R1XuAqeZJs8eQwC8v+PgjnjpFWOfAb4bPc@nongnu.org
X-Gm-Message-State: AOJu0Yw/Lz9u8sZ2x8RF+ynIKe7ip+i0gnSo8e3rNHNBzQUsTskoe0pb
 4vnldUW/UgFgWJqg1C6gIbA8eUAlvyLJh4igVgKtUfPH00Kf5ap5GKJq2j9NxqQ=
X-Gm-Gg: ASbGnctjL/F1Y0rIAIlaooPYSAhToqYIFt0hva4lQdBaxiuT1lhcsXLgV36cpNjUpib
 sPtqj3/Z5SItVn2eCmx486Y4GXbYEjYBqtb5u7Utw+PCNfKO7s6X++xPmJAu5W8WFnWlmLfPKlj
 GJQxRGBQbGcOy2A/jf7pd7uyaiYIEkUfjWNl8mCfT8Amk9RGNLmLKTFHwC0BtUJR/pjKrmnKzlS
 ksFRaqkoz3qKeYMy/oiWpwTTz6DreBcN4Hnv2ZQKYcJwDmdpSp16tvhlp3WEgWDqVm1e+CSpzuy
 3Idj5nAz
X-Google-Smtp-Source: AGHT+IF54AoRZSJTTdV3rrBFyBeOMkXnmI3hPNSBNW1iG7cEI8X5C1ycKaeDLOBAh+umz6H6YnODQQ==
X-Received: by 2002:a17:903:2310:b0:215:58f0:2606 with SMTP id
 d9443c01a7336-215bcfbce9amr15371325ad.2.1733197100285; 
 Mon, 02 Dec 2024 19:38:20 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21566732e1fsm47111135ad.134.2024.12.02.19.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 19:38:19 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH v5 6/6] target/riscv: Check svukte is not enabled in RV32
Date: Tue,  3 Dec 2024 11:49:32 +0800
Message-Id: <20241203034932.25185-7-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203034932.25185-1-fea.wang@sifive.com>
References: <20241203034932.25185-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x631.google.com
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

The spec explicitly says svukte doesn't support RV32. So check that it
is not enabled in RV32.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c62c221696..3b99c8c9e3 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -652,6 +652,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (mcc->misa_mxl_max == MXL_RV32 && cpu->cfg.ext_svukte) {
+        error_setg(errp, "svukte is not supported for RV32");
+        return;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.34.1


