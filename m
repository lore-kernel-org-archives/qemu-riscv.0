Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hR-0003tR-T6
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hP-0003n2-MZ; Wed, 20 Oct 2021 06:19:55 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hN-00032k-C1; Wed, 20 Oct 2021 06:19:55 -0400
Received: by mail-ed1-x52b.google.com with SMTP id w19so24294344edd.2;
 Wed, 20 Oct 2021 03:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WX5XX48DMBcs3sY/O4MWnvihk8w9+6+uzGwdj8DEbnQ=;
 b=jSL1xDEJBnX9XEYcqsFfutsaLY7uv1BPk6GTH18saqCnqTodqV9T/C0PvWmIlisYx7
 K7pH3Fziai85B83dMUX7DegAMtpD1pjHI1a6HoZzlNWgSWHikijFH/8Fy76V1rZ3GSAh
 s/yOIjrCMtkHeqUxnjEo8j5m4tHZyPOzqGSZsyKituzY/XM9UQl0UJ/jeRYu2w7ZLzRe
 e25lpjsvzaposINktWB7lefHxDSjoLRReGyoEKIqVLBQlEqVUZrGOmNkIq9q2Qb1SN1B
 8B7Tbcs1R+lXLLQcMzFWb/1F4U88eXHX1blm5vgpFWAV4OmeuIp3SjAz6HoRKLwo4p9p
 DRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WX5XX48DMBcs3sY/O4MWnvihk8w9+6+uzGwdj8DEbnQ=;
 b=7RkkEdITOhPgzU793QmHLjm36c+N80lKE22kfPDPjmoBjad9hxh72aavlMJg+qXItR
 l10nNkDORWGkSyk7dqGT3teK5xZlf5A3u9YF8w7EadbB2jXNJ3uuRoupUCydZHclA7mV
 0IgJyaz/swuVCBCkob2gLMib20ToS8+4cZU9PMMR+1XPphpyEG5jNQt+q36mVb5n05Sm
 rBT43oEteICKmoCotHRZA+QTTxHLBGiPFhE3IR0qb2UCos7Ypyd3NREDSdwff0JasJ+u
 cDl6gh34R7InbY+8cngRP3vOPPVjC4YHmdG3nPrQPMqan6JFB5SK7eFt/HB9dqRRPJ7U
 RrPg==
X-Gm-Message-State: AOAM531zv0pH2Eim7xk//zVTFlca5iCRNf5NPoRoBGRa0mu/I+5qNbrD
 poWC13U7ixeYUDNE2kiS0+M=
X-Google-Smtp-Source: ABdhPJycSOVGuZwPXgzJV/oENA2q6ImNMWk91zSXFrVH2pl3/ocjPW9MdoJowX+4tYkinDWc04h5xw==
X-Received: by 2002:a17:906:f184:: with SMTP id
 gs4mr45442622ejb.116.1634725191730; 
 Wed, 20 Oct 2021 03:19:51 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:51 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v15 8/8] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Wed, 20 Oct 2021 13:19:35 +0300
Message-Id: <20211020101935.1369682-9-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:56 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7f9dde70b7..fb08c0ffb8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -558,6 +558,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            target_misa |= RVJ;
+        }
 
         set_misa(env, target_misa);
     }
@@ -624,6 +627,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.30.2


