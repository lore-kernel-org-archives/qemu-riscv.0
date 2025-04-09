Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B9C36010
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2LXa-0000qX-AC; Tue, 08 Apr 2025 22:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXY-0000q8-TK
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXX-00018P-8o
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:51:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2255003f4c6so56755685ad.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744167105; x=1744771905; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPiY1prE7z9YET2feIy8aPCIDH6lUmFCJMHa3i6GVMA=;
 b=THPaneVXxITnFWPKSquoVqiNjg5eUzEXyYnDw+A74WF9DqeBH4u3IfydE5dl3x/89h
 wzcqj6xKbfm3zJcBe3u3nB/TOG+RVfMq8Mt5H2++0jAUhLhoas5fwr2bOdsXKaTVT/ko
 zC1fEPgi/6Re2C8Um6K9U/R109aLDq1fw/l8e3jijnSSXGa3LDIYRMYiDkf3pvhOQjy/
 5cGs3kpENqRqE0edI7ovgGLDubuubk3cYTh5tCPwyOBBtoSYLb7l0+YcAFR3/fj/HAf1
 Ved3d1sTKttcNcUS13bbUDJIJ7lOyb5pSjMbZWnacAqkvG9EXwMtP57zRPlwrdloCxGR
 paPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744167105; x=1744771905;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPiY1prE7z9YET2feIy8aPCIDH6lUmFCJMHa3i6GVMA=;
 b=rD2Is+U7FMzl2C2mDqnPO/zraMbi2hyGNVC8n5rn3dLlRaYNwquclzD08sgbXvRadH
 bZVwkclX0xxZ+dbBuCa1tVKQjK4Bi2wAfBvX76p8hmdo8kDjHGnTnhCzAcZDaLB2ff9L
 X8Wpe4ELDKE48ivnCtNm8+zKMZwcpgfDUhkTkX3zQhIu+ydIlEoI/U9GeM5OL5HjKvsy
 sMLDi0F+t2429BKjXLTIjBLA4ZYe0Gv6tGhxJBLIhuZgCtezqy/QFGWxlgckZSXiy84c
 BIdU/JlFjSqvm3V+9xJNRXSEeQ3nyNpDFv5F1+U+QzJ07eVSP301yWU2oKrZsnCQyhue
 9sxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhHthc6pT3hmMFdQxQte/Wt96pwHcY5gKiWPYPyW5gyQkIteggO996wYxTf4mxJ3nCXl2cG633IehB@nongnu.org
X-Gm-Message-State: AOJu0YwMX8/lC/h5LDnDzbdVO095ACp9I7j7D87jRDkRPyuMYy8DL0g0
 3y42Pv7BzOV+DmNk8bXkrItRzQLs7D/p4NyaYFOlGxMmo8J2CllauTC+YKMcaLU=
X-Gm-Gg: ASbGncsSjuOQlYWkVaEvqckeo349kMxqnEiPcM0ybW6hiapdUWCvwL44ImQFisDh1gL
 LyXECOl6rhnL98higBDdYiuyCgpF7vwJsmT/T3K5pTZD4o/S0Hb4yPWr68wGOu2alEFwZVxs9ZO
 Qks1oP9k2uiEEPS7we3FgU1I8aMkbnb1016F7q9Y6rNRArJpYjItv0IG54/V+W1LS2O9lZUcNdx
 PuX91Z+Rvpat40E/yOMRH8x6rGexyXpx9WoRhLIMvPZfp+gSXarHLAS9E2D1ejcepj2Vh6F2J1a
 Fz+/yl/081ApAx5r9OZq26B2CdaAOCN+1bM1VimOXvwJuSJrxw49VmDlb3FRBCNo0E4=
X-Google-Smtp-Source: AGHT+IGmvyG95mdgz9Ca/sM9ETWgF4AZxzp8VStWkQlVT8geD6HgdeFBkLTBfLMp3E5aEDbPkXKgug==
X-Received: by 2002:a17:903:2c6:b0:223:26da:4b8e with SMTP id
 d9443c01a7336-22ac296e291mr26583775ad.4.1744167105386; 
 Tue, 08 Apr 2025 19:51:45 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb5463sm665725ad.195.2025.04.08.19.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 19:51:45 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 0/4] Several sstc extension fixes
Date: Wed,  9 Apr 2025 10:51:27 +0800
Message-Id: <20250409025131.3670-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62f.google.com
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

This patch series contains several sstc fixes:

(1) Writing to ACLINT mtime should also update the period of S/VS-mode
    timer, just like M-mode timer.
(2) VSTIP bit of $mip CSR should check both M-mode and H-mode STCE.
(3) Writing to STCE bit may enable/disable sstc extension in S/VS-mode,
    which should update the timer and IRQ pending bits.


Jim Shu (4):
  target/riscv: Add the checking into stimecmp write function.
  hw/intc: riscv_aclint: Fix mtime write for sstc extension
  target/riscv: Fix VSTIP bit in sstc extension.
  target/riscv: Enable/Disable S/VS-mode Timer when STCE bit is changed

 hw/intc/riscv_aclint.c     |  5 +++
 target/riscv/csr.c         | 53 ++++++++++++++++++++++++++++++-
 target/riscv/time_helper.c | 65 ++++++++++++++++++++++++++++++++++++--
 target/riscv/time_helper.h |  1 +
 4 files changed, 121 insertions(+), 3 deletions(-)

-- 
2.17.1


