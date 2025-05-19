Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601DAC2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 14:37:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uH1b9-0001vh-9c; Mon, 19 May 2025 10:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1as-0001rq-P8
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:58 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1aj-0007Qh-I3
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:48 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-74068f95d9fso4034879b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747665342; x=1748270142; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9c9sEOsbjPB0KZpR93KPEA62rIyuAu1k5cK2DiYMWpk=;
 b=gD+T2ADf/QpYLSubP2+CjGQ+O30mGXN/sHrBq6tN2VpAuN7bV79oByf/1GnKsWfT6d
 vLkvLMCKfnl3Q/Q61KaNsPchVfD2QIZJgkQCy07KSYcOUsievj31razD6fNyOI3Kfn+Z
 0uFgaADsT3d/wKjaKBVZXTULOuJ3y2+fM1FYA+M4xHmulsGS7jGLm/gcbwmh3Gny9Cuh
 zfnllOoZjIUU9IC2k2scVcFSsribQ1/9D9azQGnjIJyDpsmbkkwRr9JdxtXgDWfc5q4P
 qX/dvDuNb6meXA1r8yjt1MRfOPmC612wwuNhvFnNMfEUj+OcnQLiUAEbEHYvFe5K5jHA
 Dk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665342; x=1748270142;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9c9sEOsbjPB0KZpR93KPEA62rIyuAu1k5cK2DiYMWpk=;
 b=WhVNj0kQylqVQNuLr7ORF/Lh8hRHkjIsLkOcC5cmJEDDwkCEf8YjSRc+D71DL42BLC
 A0tsUF/XB2ioVNbPiqX0vNYZIeQLq42rXbsI3wb3Ers7yKbB4CchQZe41FcNNiiUcUAP
 P3qB8IiEwnnm4qDRvOo0Q8R99DtfMEyvohi6s0oiwa3sFko/dvA6wo5tI+6Eqfy85WoC
 m5hhtznhyxfmSt7KAK7s8yzIkY6SNxhI6oipTr1M6K6/VJ0M+yWqn3lXJoADn3XC4B0A
 rsGo2kz8IIzTTIKr74uo8+LWWmVQRcG2vouxQL48yMbf/NqB5GT+MQoHiMxDFcKqaKi/
 oscg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcp4TmEO8HxNdJ7o35ZqsbIdgjOKWMCOysCYH+7pg4kIAoy9ME0yDu1Tj0h/O3M8M1LxZ3JbK1nquZ@nongnu.org
X-Gm-Message-State: AOJu0Yz7oH9OXOqp/Cf+Mw1HyeDwwIHBgJ//knXKS+3r4Bslk8Sbks5v
 jvmZmZjHacOIoq3RG3QT+IC3HTcT+z4rKpkLMXepXc7WRzYcPELBkYO0MsWm5TkqBOY=
X-Gm-Gg: ASbGncsgLU4/bcrWXDIxrhKDe/SqTfjs6WLY8o0//ROmGmUudJhnp8F+1BmeKMygkKW
 8tIjPgDHVJ72Mgx6CqlbSK/XTRzhKlYubyu2hODXhBATeX28m2ptj0DIqbZ+e/bjlfzQRwLFIMi
 DJR6O1NHZpcF80NociQIA/sFws6ttawWXtOgNKFpBmCgLthDR45ul3vavysYew24F1yoVVAfKFH
 YnZBOh5DIltwQB5lEIDZJxkdvuoxoulEYVQahhjjfgbRzgD3JUvHZo9pVXD6RaRU9Tr5A8JKK84
 DbBfkS9Gy2EAhe6/RFHzhKJv5gsALbCE1WwCMSYqOHUq3A5dvhJeo8ddzRqT7+UaSx4O/xIhCg=
 =
X-Google-Smtp-Source: AGHT+IHpdnCZdcZIx2VDnvOBPL629+/kgITD8B6WQZUfUS5mAHQNKvnZ6plWa5FOxaboQNC6SvNlhQ==
X-Received: by 2002:a05:6a21:9208:b0:1f5:8479:dfe2 with SMTP id
 adf61e73a8af0-2170cafa32emr18770556637.6.1747665341882; 
 Mon, 19 May 2025 07:35:41 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a32edsm6297683b3a.162.2025.05.19.07.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:35:41 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 3/4] target/riscv: Fix VSTIP bit in sstc extension.
Date: Mon, 19 May 2025 22:35:17 +0800
Message-Id: <20250519143518.11086-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519143518.11086-1-jim.shu@sifive.com>
References: <20250519143518.11086-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x433.google.com
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

VSTIP is only writable when both [mh]envcfg.STCE is enabled, or it will
revert it's defined behavior as if sstc extension is not implemented.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 288edeedea..87c3c51f01 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3646,7 +3646,14 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (riscv_cpu_cfg(env)->ext_sstc && (env->priv == PRV_M) &&
         get_field(env->menvcfg, MENVCFG_STCE)) {
         /* sstc extension forbids STIP & VSTIP to be writeable in mip */
-        mask = mask & ~(MIP_STIP | MIP_VSTIP);
+
+        /* STIP is not writable when menvcfg.STCE is enabled. */
+        mask = mask & ~MIP_STIP;
+
+        /* VSTIP is not writable when both [mh]envcfg.STCE are enabled. */
+        if (get_field(env->henvcfg, HENVCFG_STCE)) {
+            mask = mask & ~MIP_VSTIP;
+        }
     }
 
     if (mask) {
-- 
2.17.1


