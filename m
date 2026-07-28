Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D504C53219
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 04:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woZ9c-0003Vu-Ad; Tue, 28 Jul 2026 00:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1woZ9P-0003VC-OH
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2026 00:10:45 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1woZ9K-0003hU-JJ
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2026 00:10:41 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2cc73e322dbso32402305ad.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 21:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785211836; x=1785816636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PTCCDxCcqdsCUJTmXssKttH+fJ5nk/KFidckyqJ3KJw=;
 b=Ol/BKGqaOlXnvePn2ylJ+JFK644/diQblOY2E5UPGYL8FnOp+vloL4NUNMlI1foigv
 eb/S0HmJ8tUzAVqZPkT3PjrrnslL6EJFudck55NpjPfad3VUJVFSKDT+7E8JpcbmGQ8/
 IDTU9CCd1m3nmkDYr1OzbwMzDIkCztrkEynKBb0LtK0/r0rt18FvfW0A/ESizMKiONIi
 AGayaSf/lezNINVHEbx4SPjae+7JkrqE7u8rI6rVElZDuzjm1psawYDyjauSveNnpY3j
 fAtPIjOLNjb0ZJcpVgQFiplo5toSeVaqko99mkb934hpcO+on6THg3mH1ohvRZl2M8qE
 4mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785211836; x=1785816636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PTCCDxCcqdsCUJTmXssKttH+fJ5nk/KFidckyqJ3KJw=;
 b=C/Bi3j0c1xLao3eSCVHzYw4lsw0GC1MCsaHdG2tPh8myS377QJvALpVdvsN6bUpfQ4
 5gMPDFzl+eTkEQ8U0I/lc9pYJtGSW52uFndpp784lKavYS/SrL6Hx5hB47fA6kNbrEHk
 Me8r+Dlb7CFAJGSQvzoF1Rec2jlpbpttANNNyc6Dz57j/FEQl7fEcygNChMJN2VuTwef
 MxIOTLn5lC4/4KZQutZERnLUo2wygnJBk1EweIDYUAL6y2GOfxtz6egqa+OGtzVAPCI+
 Xt5oOFea+25bW7I/RM6TbeXnKohKNzGVlu+naB8o12fgQOHrnuVKw7n10nAd3OUSPlts
 OvDA==
X-Gm-Message-State: AOJu0Yy1XpNi3J6LI2mm8NpQQimK4SwGXkr5xP6hF5l5jZGMNOQPu2M5
 Ai03HmV6zJmgXm8AeVFeEcIsUEjR+HIr3BeF6VX8udv4U/KEJLvj71Mz
X-Gm-Gg: AR+sD11gvOpCoI/wOVws3FqTzcBoGrNURAbVtOPQ/b3C8xXp1OQfnkGNqiBmFZxRpyB
 Rrb6cEWISFmUoZ8sDY+YFzk5aFuReozoa0sxo30+sMMHymVJCmKivmdbmIoHjLcHy910TjKVoj5
 5WrL/MLYnJfWLZ0lTwUU850KSbfh94+2PnZ8TEaqDanXCp+ESj8WJ3I01/9GnUijUWeGBc8dS6U
 SCmjptexHoI7X17PAr1dDB0ae8OK9Gke0U/1HyLWmSTyOztxaagL/skQgXbsr6M03XcwSZjLDrv
 s8KBbCixHUFYhFZEIkCGOsqu82j1X35NNIh5VK5fCEMDOc7PB9/qIQGIrE4qVi/x/NPIFK5Urti
 axTTwJpJCXRSOy9uPCT+RtIURN6XEuVXLTCLkGRoW3IQvyO2tPYXFGtw4yvIG/p543L4UEOTxKQ
 VoTUQuf+fKbIbgyUUVIBekboLCei55FuXmQm5n+Oyz8ge/kH6iMR5V1uxCq1tXDP+I4QIggH8nH
 YmUDiSCIOebwT7+
X-Received: by 2002:a17:903:4b46:b0:2cc:a853:1311 with SMTP id
 d9443c01a7336-2d015eddc78mr9089285ad.47.1785211835949; 
 Mon, 27 Jul 2026 21:10:35 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([27.115.61.146])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde80ee56sm44378785ad.76.2026.07.27.21.10.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jul 2026 21:10:35 -0700 (PDT)
From: lanxiaoyun <dubdublan1987@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 lanxiaoyun1 <dubdublan1987@gmail.com>
Subject: [PATCH v2 0/1] *** SUBJECT HERE ***
Date: Tue, 28 Jul 2026 12:09:21 +0800
Message-ID: <cover.1785210445.git.dubdublan1987@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dubdublan1987@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: lanxiaoyun1 <dubdublan1987@gmail.com>

*** BLURB HERE ***

lanxiaoyun1 (1):
  hw/intc: resample level IRQ on PLIC completion

 hw/intc/sifive_plic.c         | 5 ++++-
 include/hw/intc/sifive_plic.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0


