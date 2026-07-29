Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5A9C53200
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:01:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpDGh-0004vx-7q; Wed, 29 Jul 2026 19:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wpDGc-0004v8-5Q
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 19:00:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wpDGa-0005PR-G1
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 19:00:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-cbb973e6749so1746760a12.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785366045; x=1785970845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BXYpGfodJPSXEOwaOqS7Hh15kpJ8daBroc8+Qw9cSh4=;
 b=ZFJ3se7VaI9+4miQa6QSpXqQVGQABFxgJZlegKYeo3e+uYlPPsTDw3leU0vNlsJwj1
 YIq0rylQmv0ciLwf/kpkbwAJfHz7X9j+Saagni+PU+edN2oWaYYw2MOUzc9qcxQbSQpN
 LB59ZOsEzfqGaAZ2g4vO71PIZnIqxKXC9nIj+/1wAmTzf/UmJbK462ZP/chn0De3OhUY
 Ic/kcFr/fU9Vrm9OKTr9QSsCv5Oi7iVfHrLjYW63jUZTOKQJLTflfgefaEHYf7wX/uhM
 1HVhidSKAmUZGYMTm9FWb3BStNVj2nZijjw6f3T3VxdBNEBBbaQlCGwSCeb9DFKEBKEI
 hmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785366045; x=1785970845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BXYpGfodJPSXEOwaOqS7Hh15kpJ8daBroc8+Qw9cSh4=;
 b=eKW60RUVxUeN5uYXkaO9lR4BoUBykBdRlC1WkmH51G7dha0/ZDi56Qlr/j1rNW2//s
 XOlknTGzaJ6wIg9+0B1Veg+zXnEhFynif+N3w22MMhuzlEMGOhLb6huhwsD5/5O1FSO/
 lug7fL+Ultc8j4RByE8WltAFRb+J8sNfMQeujTQGP4U6lb69ZipQvOGHKl6UxpVLJXEg
 TC9BKvcThWCHeuZ9T8BQrdtDvLKyjmpdgUvxzVgALNmyM1JqoNxMHATGWp50QpTgisap
 pPQyiWNM/sZ1tN2hP0FAEe+ui6C38g9cEjAcFKXOzdSmDo+FEVIT1kkA2ZoJe8eII9Uf
 lb8w==
X-Gm-Message-State: AOJu0YyCgWCYnMeU3vgydfj0MBi+AXQi/tCecRr+avWjv23NRSOHtMet
 F3baVnZNhKC6umiVutgVUeTjG+KIxc0udGjx8xtYrlRVjYkKSn5TzzYy
X-Gm-Gg: AR+sD10utuqvhkl4ZjL0fHu2Tf8Vtn6CfucwbPfI62EpW5X0E8FpFS6B46bK2Ms1ZI9
 q219y8L0t3beywpNJiGVSHMrG7BDqyoM+RtJJ+JtjmXHENvSt+L9NVfCrG+/xYeNjIyP/cLV5ZT
 4V5qf9bo5iB35KfqORFjerTsGZQdhHln8W0jaoG0/CdPcbNa/04ls1wTwl4e3XEgKiQ9DCK3C47
 yZUcJyGNK7cDQ7mePDe3iV/OBRbN/zgd5eNNKGb1hXJ0NigOXbJYQC7hckiSTvoB5TcKD9QOhF1
 ijwv1QAdGehm0sJ9xUjzTe/S81jKQz7uZrHNcfSVGntmaC82DBBbHghoDDF4CCqXTBTZ3uzGVLY
 eduSSGRoxbD3bo3tm0F65qOVU5m57IWAXbRfQda8CCuHoKSjuW+sV8SZEa11C6bPhX9zppXrv12
 7c2LyQ6jJZB14D+qME/HERVhlLeMwznjL0DSQ+TPtGhOi/VRI=
X-Received: by 2002:a05:6a21:3390:b0:3c3:7bb9:c93 with SMTP id
 adf61e73a8af0-3c9006b6c93mr30100637.53.1785366045233; 
 Wed, 29 Jul 2026 16:00:45 -0700 (PDT)
Received: from arch ([112.133.246.13]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31504b88e12sm13804534eec.11.2026.07.29.16.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 16:00:44 -0700 (PDT)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH] target/riscv: prevent abrupt abortion on unassigned value
 write to tdata
Date: Thu, 30 Jul 2026 04:30:28 +0530
Message-ID: <20260729230028.1797355-1-314abh@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=314abh@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

tdata_csr_write is approachable by guest programs. In case of unassigned
values written to a tdata CSR in debug mode, the switch-case falls
through straight to default causing an immediate abort. The risc-v spec
says:

    All tdata registers follow write-any-read-legal semantics. If a debugger
    writes an unsupported configuration, the register will read back a value
    that is supported (which may simply be a disabled trigger). This means
    that a debugger must always read back values it writes to tdata
    registers, unless it already knows what is supported.

This fix correctly ensures that the WARL behaviour of tdata CSRs.

Fixes: a42bd001 ("target/riscv: debug: Determine the trigger type from
tdata1.type")
Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 target/riscv/tcg/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 3c0fe7010..ae493235d 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -913,7 +913,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
                       trigger_type);
         break;
     default:
-        g_assert_not_reached();
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d is unassigned\n",
+                trigger_type);
     }
 }
 
-- 
2.55.0


