Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E2ECD98F6
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 04:50:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waRAe-0008SP-0T; Fri, 19 Jun 2026 00:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAc-0008RW-AZ
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:34 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAa-0005VZ-DO
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:33 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-842848fd613so1572196b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781844571; x=1782449371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKPKLU7Wp4oiXp2bE1zP5WND+gmgqtQwA9/gdvD+Eus=;
 b=afeyuAhQ4JeY8wZpquSlbGA1HnBxMsfKQ8Pvl9VxnJkx97JImI1K336/zZMzic65S3
 dRDsw3jrSFfLTjxmU7EMDKyO6rSAvzaAbY0tEtu4ELDJFgzfoqC+Of/sFO7heUhOTqUl
 OMYD8UGPhC/JqnWNGgSqd4ASW1QIR/jjVIjZi1nEfiz5roTFlqu//auQA5Z2chbom8xr
 txqqIj7m3vh9FrDH5HT55ZB49mygPGGrRym7XHQdbg/ZLo4tTh7Yzw8jxpexp4d6/8mG
 csF21Q1S+bhU8oZbN6VX5/9BW23gu1aMDaNwA8DaJ5thSsrHtX3HhnN5H1YH9Y4b6UBm
 Hm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781844571; x=1782449371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PKPKLU7Wp4oiXp2bE1zP5WND+gmgqtQwA9/gdvD+Eus=;
 b=YBt3xHJaOLaSfK2QWwFS9PwtPjEoOs+gwkKE8BaH2WE6I/drbQIUYSeCrfLPA3V+JG
 ulUHzdYAgNWN2mQRYGvnQL/GufQv+RJ9+hyfcmCRbh/8t0lEUa1As06Ekg9d8+Suvi1H
 r5OgXYbMS5W0xhZbzU7Vn264QxdW1uYKIv3qpiionpvVcm03OZeITZIGEq9RU1hSWlDI
 dKbsFXo8Y/Pi2Hy0vWkaHLYmTtg2UlDDoHIYA7V+tXQ51AqvAADaS1cV/cagi7K+46rY
 DqacTHlNT4xXZKuZZaVJMYEnQjHxbeSTRoqeG94WBbA5xGig73XZTSUlcArltNo/wVfe
 Pklg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ho37Smrxb3W7/fZfiuNIAJEXDXFOn/r2UArsQE0hTBu7pP9x0w3Ax7DEaIUNG7Gfjvs+oNx2MN618@nongnu.org
X-Gm-Message-State: AOJu0YzZ7lyxbDdiKTin2rU5+fdQd78HWrBW+JqOEWQBdxlTIEh6w3WZ
 Xefp1Vi1f8lSA5/7HW3akwl66DB6cNFgOpbf/826uYu25VBuTZGkez6T
X-Gm-Gg: AfdE7cnU5jbhjAJHy0VioCR86gT6+NqC0WemrEtNyIYyM/Aeth1DobDoHgTOzD3pB++
 6KVxA4sTGetuRF4se0PUJB7wqHAWu1o4xR6E6v7DBuaGQx/M7fIC42TWFFsr5jIIqNp5Bov89KJ
 DCnFcB51vU6TyyvFLtMCdkYCidRUwZdoDkzHoKlj1UA8HTJ5USz2GkjkO+foXGz6Yu3oxD3LUY9
 QB0pENX27eIdIQNEHPagvcRPxD79PSec8Axhzoo3sDzeDLLvoXrarvO1jqJZdwRWwhzTSXUso7g
 Wgl3CBb5tKK1z1iueIpI/5lLrU33lSw2G1hzQUrMQjB+1Ln2QFQruWbfvc80gtpbuQBBybkKmN6
 dNocFXeQQxgDJ6JwlkTsRBq2DGs2BevBOCTwsST+VxRE2d+l53eSdznTDek6IecpknQOMo503BI
 Lx0BZcqZFvy8NAjs1+0fZbHPkmkJz8yL4SQVQ+TUKjaPy8GwX1L5xxKKW3hs9aKiWUWWjoI47oQ
 8nHcYKvOHCikKHCJDmZyrvjZbc+69PYpdyyCVjfhw==
X-Received: by 2002:a05:6a00:1ad2:b0:842:614e:cc97 with SMTP id
 d2e1a72fcca58-8455087753bmr2113107b3a.23.1781844571187; 
 Thu, 18 Jun 2026 21:49:31 -0700 (PDT)
Received: from donnager-debian.. ([144.6.172.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455363da44sm870141b3a.8.2026.06.18.21.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 21:49:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: [PATCH v9 06/12] target/riscv: tt-ascalon: Enable Zkr extension
Date: Fri, 19 Jun 2026 14:18:30 +0930
Message-ID: <20260619044838.1054677-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619044838.1054677-1-joel@jms.id.au>
References: <20260619044838.1054677-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

Ascalon supports Zkr and the SEED CSR.

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa497e5e8ab4..6c1b0059980d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3211,6 +3211,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zba = true,
         .cfg.ext_zbb = true,
         .cfg.ext_zbs = true,
+        .cfg.ext_zkr = true,
         .cfg.ext_zkt = true,
         .cfg.ext_zvbb = true,
         .cfg.ext_zvbc = true,
-- 
2.47.3


