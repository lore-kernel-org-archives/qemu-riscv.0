Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3D9C48BF6
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 19:14:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhDkz-0003Bh-4U; Mon, 04 Mar 2024 14:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhDkw-0003Ao-Ow
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 14:13:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhDku-0001bL-8Q
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 14:13:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33d8739ddd4so2665486f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 11:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709579621; x=1710184421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffYxUIi2VesCW8E3hAaY86N1SXnFx+7CKtORz4AUgmU=;
 b=PmFDnmuV6pdVif8ImWmnSP8a85lP1gXCdoGZMgXNlJer/1/ZZBXIyS1xJUKQ+X/fkQ
 3IXe7pB/k9om9Z75qW29S1QbkQKbF2Hy3qxfLe58SAe2uTCURFdpTGEfDuRfUOF/Bf96
 ZRqwR5LBhRIxHw+9vLnt3NL9n5mkbM5p3RHI+zJWvFFj4K43ginE0AIPrno4jvUFkyRv
 7Ou8nGUuUQCIHAxkeDD3PVq+WtDXau09WZDOXe600DkggYotwJAsdVCWssmI9O2+ZbmS
 bw0dA4s3nQbLZwKtZS1GMVV/Ej58ONg5x7L8EDuECdYIb5EviQcFSv0+Yw34thX3wjfe
 4GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709579621; x=1710184421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffYxUIi2VesCW8E3hAaY86N1SXnFx+7CKtORz4AUgmU=;
 b=Vz3y3JA9A9rIJlHUyjQYdxYBLS8ljTkZc8loyg3P3vBhrbG+pvOEbUAvv2b5IJIBRe
 EQxT6JLlzCFqOO2ntDikAQ1OXQ3nVeOl2+p4LYpxqyCdToKbzDOZMYAZOzUENpjx1jPB
 alCM4ntcyy3euJLg0G14prU6ooGyBBy7EmxIQQYRdJ9mOTDOg3q2I0A1Zi4a4hwxlaUr
 YeDrxVIkVtyGUfCUMX7w54RcvRD6W5ixuNJsK+xRRktiNeWmFkWcNO1z6yMSOlm6mDwA
 LibAU3rpGCgGZJ93SOERhVCCBLTjQzPq8emgbkd8jh1Cz3ZknRdfhqAiAMJRJpwnvJ9Z
 XcVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8fuoVYA8f0WO8wfoaRtsV1b3dKnrTcu6iUhph2rts8fyaB6VTo/2TlYobY0lmIE1bBURYM6BwiVn2B+Kuqmlq6l0Lxik=
X-Gm-Message-State: AOJu0YxNKWrkWilGvnYSBny/238iA9Zlpb5UZUTTdNAD879Xp710cZFM
 GFRrxUYEVwJvj/Yer+24wL5ykAIs7fPRocoVlMVe0BHQId35/fl3PZdnUS2ztUNINhVtc0bcofk
 Z
X-Google-Smtp-Source: AGHT+IHEcl25GzX8m3ns3WwogSQOD0Ke9ISZPTBiAOpEOaWGaqRT9MyRa3w/WL5QIQOjyqxIFP43Aw==
X-Received: by 2002:adf:f04e:0:b0:33d:deb8:8bab with SMTP id
 t14-20020adff04e000000b0033ddeb88babmr7694640wro.53.1709579620799; 
 Mon, 04 Mar 2024 11:13:40 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a16-20020a5d53d0000000b0033de10c9efcsm12920753wrw.114.2024.03.04.11.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:13:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4909C5F94F;
 Mon,  4 Mar 2024 19:13:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] disas/hppa: honour no_raw_bytes
Date: Mon,  4 Mar 2024 19:13:35 +0000
Message-Id: <20240304191337.3101411-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240304191337.3101411-1-alex.bennee@linaro.org>
References: <20240304191337.3101411-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 disas/hppa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/disas/hppa.c b/disas/hppa.c
index 22dce9b41bb..17e4f1ccdc6 100644
--- a/disas/hppa.c
+++ b/disas/hppa.c
@@ -1972,9 +1972,11 @@ print_insn_hppa (bfd_vma memaddr, disassemble_info *info)
 
   insn = bfd_getb32 (buffer);
 
-  info->fprintf_func(info->stream, " %02x %02x %02x %02x   ",
-                (insn >> 24) & 0xff, (insn >> 16) & 0xff,
-                (insn >>  8) & 0xff, insn & 0xff);
+  if (!info->no_raw_bytes) {
+      info->fprintf_func(info->stream, " %02x %02x %02x %02x   ",
+                         (insn >> 24) & 0xff, (insn >> 16) & 0xff,
+                         (insn >>  8) & 0xff, insn & 0xff);
+  }
 
   for (i = 0; i < NUMOPCODES; ++i)
     {
-- 
2.39.2


