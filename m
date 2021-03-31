Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRQRY-0007eR-R7
	for mharc-qemu-riscv@gnu.org; Tue, 30 Mar 2021 22:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lRQRW-0007dx-VH; Tue, 30 Mar 2021 22:18:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lRQRU-0004ik-Iz; Tue, 30 Mar 2021 22:18:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id e14so27648701ejz.11;
 Tue, 30 Mar 2021 19:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihtX5VssituVLzkgIYBEx9Dew+g40bf0EopofkqaQJI=;
 b=QTjJDkenyujFq3ss4TQk53cN4KRvzEOm0sUAB+5NIsrg1wOjtIb2zwEkRkF57YgR4i
 cYsd+4BV8fUe76HLTJ7LV4fR1BdhWG5tScYvDrp6qoNV6HBvjSZ+Wp77QqxoqQ6rhP33
 SuW3WiKqNpUdaDrsoO6EXscPZ8XIYwwJyZPCK0i4Np1aZ2bilINerrZLKPBgepQsIcPQ
 ndo2Q0F2yHqnSgkZHezKLz54/QirX5Hdw4i9pStC/2f4qoLHh67ILQqWNh4XcMnkBx5+
 XcKKu6udiILS4iEpSHeEsRoBcQhKR5DpFDnl9DRTIIBDGUaWMcxTgUf+tmi04D4/QCg4
 Bi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihtX5VssituVLzkgIYBEx9Dew+g40bf0EopofkqaQJI=;
 b=iRGYRgBVBsfuUSQV+tgbII2nmCOwhZKKaxz+E89H3xOGNvak52wpxOseOC6i1e6+iW
 +ZCRcwaR5LXH0usu6ASqzZ7LSJStdfM0tHdA1YBOW8hVdloE8zBUrGvuOMiLJft9g0Jj
 PSwNGOhRNkE98jQn6RsnYTpEiyl3jTjNEXHopL5Ynk0KumPrrOIFIM5+GlTFmovZcx87
 sQZli7EjZsTZryBp8Rl62k/9d9aCTpGhKtdXHpePfuvazvQcXbe6EOi+9PmAgZTTcjRt
 +FbJzXEmkqYXlDBLiOS+y9Ne2cCDjV5h7sgtL9k0vpbk0HfebbhKIVTh/DJaDpNpfC6K
 VDDQ==
X-Gm-Message-State: AOAM530PK/5c8CGt/tcGEpdWY1pqs4bnaKOanGf2aDz+OMhS9PYxDo1B
 S1d6o1VxBqezyzucDCmo+U+K4NLNggk=
X-Google-Smtp-Source: ABdhPJw5as7RmAiTuvpxbibZ1bMv5W3V7xUKF9O5XH+73TmUrl0VXscZApVGiAmtmhTShykRoTlTgQ==
X-Received: by 2002:a17:906:4f10:: with SMTP id
 t16mr1064384eju.531.1617157125864; 
 Tue, 30 Mar 2021 19:18:45 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a26sm496211edm.15.2021.03.30.19.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 19:18:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/2] target/riscv: csr: Fix hmode32() for RV64
Date: Wed, 31 Mar 2021 10:18:24 +0800
Message-Id: <20210331021825.537484-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Mar 2021 02:18:51 -0000

hmode32() should return -RISCV_EXCP_ILLEGAL_INST for RV64.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..2bad396f64 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -177,7 +177,7 @@ static int hmode(CPURISCVState *env, int csrno)
 static int hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return 0;
+        return -RISCV_EXCP_ILLEGAL_INST;
     }
 
     return hmode(env, csrno);
-- 
2.25.1


