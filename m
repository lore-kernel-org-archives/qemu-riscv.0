Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D30C0219C
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 15:34:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg3tX-0002WJ-Vl; Thu, 06 Feb 2025 10:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1tg3tS-0002Sl-4i
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:34:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1tg3tQ-0001Fp-11
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 10:34:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38db0146117so495311f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 07:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738856054; x=1739460854;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4fAi/WFyk5fUA9AqpTcM5pdirl0mVctIzxsel8zKVc=;
 b=RCactgeaRbwb7gMcVIE6DIG4QrZlN3XtBDGEHIh16M6G9hst6StOBQdFVldo7w/r50
 z2PQa+Hk8AKVSM8Zy1Sh+yqUtRSQdNDjqazPEuVsNYt2JnL9+Whnw6q933Ia/LuAiFfj
 C7Ey3/sAtKSEjULsfRSkYiPNCj/4vgPs4/ua/MvoEHtv9dHZfKCQ8isOkDnHMtPQL5VU
 syeQM8GEsfU/VTV5yC/mYXk6FHX6K3VBz55PM9srJ7TG9XLP7wmozODt51geHU4ZU5Yw
 t8J34KMD9Bg7zNnDRE6VLwCmc8/Blv7d6CiS6WM8+yxlcG51H/WOORvjikNJ0pi43Clm
 SSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738856054; x=1739460854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4fAi/WFyk5fUA9AqpTcM5pdirl0mVctIzxsel8zKVc=;
 b=NerpsvfEU8rWEvyWj5M9eEZuLPKonHPuUhRi1x30JcWUC+jsLwPRUmG5gvDbnHm1ev
 vxYZmJNm/1drjFT5fCfMphBHgxaKOmme03ugqjDyxP5Y0QgKoHUrZRZdIBS79vjcm/lc
 WwhRwYxHQGVwlKhn6dNbIos5HnSrEjKEGRk+5GxtRUdgei5OjDZtrHn2jjladePsLYLO
 hXuywhThwp/Ed0sK1Xmk7zVzXeMg0hhU7aUSSs8D+jGQ12T4y8EV5Rs2A/SeVDYcGmC5
 aU71062ms6ZZFbwZ0lEeXYmFjpMggHUtUUawVrOtXrULCggMByI/exNs+FozhCynKrzt
 begA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6cGvQiZxoaYceGpDCADowsL8+RNrn/t8rWprRzkAfNACA48QrJZ/eAKC3kn/sLmnUV/RxQz4zjYt5@nongnu.org
X-Gm-Message-State: AOJu0YxhYj/uk21d2v8x0CpY0ERC/MHiAlVVllNf0JtY0AGHfOuTm8AT
 H6YauOumry9Fi5i4AYhGVmLwlPPtuEgYq+AyIFVoDgGhBW5Nh15A/lFfLH4pd7E=
X-Gm-Gg: ASbGnctwuqR78R+EYx7DWsWSuRRqGYLx02/CSqHMCIIJv/yjgkEQJhbcfep1RwPueB9
 kbRFYNVOaXADP167heABJ/71xSoV16vCyTw4KmYH5NPiUAixyG2JDoppUiQoX7RFcdhdtr+/EjT
 DygPAbunuS1JLpmHSTS+OgSrXzB2RvROJYz2oZGGnEoDvgM6J6pvbcuB/YYqJVKEe41pS21gz+Z
 gvqWVIGV4EiVGD14XtZ+eCekiFT2EcmBkyMnwWNN42A+CZqeNcJ9Qzp6MHSRofB2pKMoVfMCzsl
 xond2GXAZg11a9lvAQls2QKowt7nnxR3oEiOFeX5m+O86ryHeuZQiOdk/Um+/40bNJ8=
X-Google-Smtp-Source: AGHT+IE+lIqtmzQFCpof9gOpI5qAce29bO2n7sMxfQ6jcqolHCidIieIJjlkCp49engQ87U8LkLoZQ==
X-Received: by 2002:a05:6000:18a4:b0:38d:bf56:8658 with SMTP id
 ffacd0b85a97d-38dbf568bb3mr1841968f8f.24.1738856053891; 
 Thu, 06 Feb 2025 07:34:13 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc45c26f2sm850516f8f.51.2025.02.06.07.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:34:13 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 2/2] disas/riscv: Add missing Sdtrig CSRs
Date: Thu,  6 Feb 2025 15:34:10 +0000
Message-ID: <20250206153410.236636-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206153410.236636-1-rbradford@rivosinc.com>
References: <20250206153410.236636-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This reflects the latest frozen version of the RISC-V Debug
specification (1.0.0-rc4) which includes the Sdtrig extension.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 disas/riscv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 305dd40ac4..85cd2a9c2a 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2438,9 +2438,11 @@ static const char *csr_name(int csrno)
     case 0x07a1: return "tdata1";
     case 0x07a2: return "tdata2";
     case 0x07a3: return "tdata3";
+    case 0x07a4: return "tinfo";
     case 0x07b0: return "dcsr";
     case 0x07b1: return "dpc";
-    case 0x07b2: return "dscratch";
+    case 0x07b2: return "dscratch0";
+    case 0x07b3: return "dscratch1";
     case 0x0b00: return "mcycle";
     case 0x0b01: return "mtime";
     case 0x0b02: return "minstret";
-- 
2.48.1


