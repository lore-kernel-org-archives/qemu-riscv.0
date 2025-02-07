Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BEDC02194
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:28:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQHa-0006o8-6G; Fri, 07 Feb 2025 10:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1tgQHP-0006nT-J3
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:28:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1tgQHL-0001Ew-I7
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:28:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so21889005e9.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738942105; x=1739546905;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YNuSvlIi2eH0IATCfdiQOsDtFgKiJypecWcAgoJwHY4=;
 b=y3jEncWiQ+UtL+QDuKvJ+ru70LeY9MoWj68FSA08M604RC963yOJt3/iczRyEHSP32
 3asgaLoQLIxh/W7oG3na9AdkYeB0t3a9ESaCeUmHnXRnj2Prc7v9rxAHWoHex9LQ9JkE
 ZxmNxcbEjITY1MVCJ3Rw4kXZq7dNTm3n2GyhEFcftM+KUh3wKkhkBALvXOzm37E654Ze
 zSSS5m7mb2s1CYIr01TtpOcfWMfEqU3Fm12z8RqwKU66guzyunFex6RWjNZeNBA3Y6iE
 pP9a+Zr3DoDG/FLXpDqEWXOMEcm5lVB7plKIerydZRtw1NgrgDh1hEIcV7XREdmGYGkE
 ZY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942105; x=1739546905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNuSvlIi2eH0IATCfdiQOsDtFgKiJypecWcAgoJwHY4=;
 b=J9FdPEOZAN/PcfomXL6I6QhxCI/7E0hQUU7SQI2pR9Auyk1nea+1niIisDus30jHuN
 tmfP4GjB6Isy6ixwY6GhSzKrfOWCPu03rcBcZVUhlaphW3nIoBfQB4hdcb3tmwr+z7TQ
 7zz8mFKvk4YhlV/dGIP0/BbbeO2sKAwFxT0/nVbfG6+Srpb0/+EI+4EypG209SdxzTIo
 muUm4NPDQ33q14dNQM5nbP95aAF5O3clvOlj+6XBEqDFpcBGJftHAF2o1vnFK654Hx1E
 ZCYzKfxBji/55RQ+ZUtnOp7lhjlj135rcVCSyy6hTbV6xYNYV1YiSm/MkVDj/qO0t39g
 jKZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIMfyL6/cxKseYqMGkbGtdfRaX1qR2y6QIHuD7P0L1Fzqs0XbBtXjXCwEjMRDWpPDg5kHm6o+invTz@nongnu.org
X-Gm-Message-State: AOJu0YzlybWkS7C0tHdnTTiSTGKKoFn/XETyhRsNA+n967oWEFwsAZw4
 eeLXmnpZVmhRmaonBkQD6eKnvZaYdfzE5PPhXZC4ztWzaSDTkqBy8n4A6V2KwgU=
X-Gm-Gg: ASbGncsuS2Kj3An0SrOiQUrGk25R/62ixAnTkkT2xto5Fgv90R+laIUQeRablTL8Fzv
 6cLhe3jioPFJDeGKpb5K5ZgAqLbwgLmndarApFEGnb9tKKhFsIxHs5ttRxrHJtYAvkBmeaxDCgu
 UL2svXMy+WW+V2megf0htPXFEXlqkHX6Zia4g8PEs3vwg24uPoQje5MXnl6nvbcS6E8jKXo/Y88
 ZoKObxzEq7eX0UGatYMU8V0oHZy2y5Snef76gUi/poj3D2crQ2eqr4MjZ/79B6aeQ5chfL0HzGh
 p1W9vYPDds9mbO8WN8bIDVeit57IqNlrXKSwKotVsKU9lgSIkeQh5ty2irREi8TrS3k=
X-Google-Smtp-Source: AGHT+IEqlgL2igzW+RGqkuKw0zFmkmZS7qpbuqrgKXWWoJf+Je0i/KOhxbHdhi5F4xrR3Z+AHIELoA==
X-Received: by 2002:a05:6000:1acb:b0:38a:4b8b:295a with SMTP id
 ffacd0b85a97d-38dc9101923mr2851991f8f.31.1738942104771; 
 Fri, 07 Feb 2025 07:28:24 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5839877sm3301079f8f.3.2025.02.07.07.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:28:24 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH] target/riscv: Fix minor whitespace issue in
 riscv_cpu_properties
Date: Fri,  7 Feb 2025 15:28:23 +0000
Message-ID: <20250207152823.265068-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The mvendorid/mimpid/marchid properties have the wrong amount of
whitespace ahead of them.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2..cca24b9f1f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2844,9 +2844,9 @@ static const Property riscv_cpu_properties[] = {
     {.name = "cbop_blocksize", .info = &prop_cbop_blksize},
     {.name = "cboz_blocksize", .info = &prop_cboz_blksize},
 
-     {.name = "mvendorid", .info = &prop_mvendorid},
-     {.name = "mimpid", .info = &prop_mimpid},
-     {.name = "marchid", .info = &prop_marchid},
+    {.name = "mvendorid", .info = &prop_mvendorid},
+    {.name = "mimpid", .info = &prop_mimpid},
+    {.name = "marchid", .info = &prop_marchid},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
-- 
2.48.1


