Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbbfD-0001KA-8C
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 00:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbfA-0001EF-PC; Wed, 28 Apr 2021 00:19:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf9-00066I-1O; Wed, 28 Apr 2021 00:19:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id u21so92569106ejo.13;
 Tue, 27 Apr 2021 21:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cBG/vn+Mouc2f2rVusu430afCyfWYcUQo1i/pxUkWk=;
 b=MzkpGnaJI+cB+9GVl8RVW4kwMRYY1eTfByk0iS7Hd1W7LECQPtSY4Zvv0TX/VJoT2g
 pROux7ToT2xzzTFzQvry3dc48X5VjOSo0VndqDpyXBpj59IH8IsPZQ+cD9CpU37qOK3+
 l26m9SOFx1F70FWqW5KmxJLG8KMx8VyqNmegUbL9z//ZzJVCejD0JxE3YHX33G4qtSzK
 Ys3x8enZxQwfKMAivNZVPh88WIxqbLvNrpPTAHuKh6bLi6cSegjJAt0LIz/C9bWkXRWC
 yV6AACX4ci9rBCT+dDwptxyNUyI4+6osqGcyN0tbG1Tw1w9O+dA6nVzOjmQNgzNkAPko
 +8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cBG/vn+Mouc2f2rVusu430afCyfWYcUQo1i/pxUkWk=;
 b=bGIpUwgVuMilId0ak4Syeb8/oIH38Jz83yr/uY85G1yKc/iEnyFvByplByHcTwE1R0
 pLJrzB5kfgeH8N3MKOlaSELtEbcun3yP0/u67JN2sTXyCRNPb48LJ4iKKwcmtJNpaV0W
 PnmPufNo1bmNE8PBfxiwspPRxZ6ysKF5gs6qd0T/uB1QoQI39i3XZqIFic38L0pTrVAm
 F7yHYJMKoFRmNzjS+4tRS5CMbM74xL1pnMOmJHjUWSz8BYl4dYKppzWDEjENcvKS4BD7
 SYskHpgrGK4Ke4mn2kK3wF0WEe9Tbq7DydffVmYaO9X1O9xJEkmkxiLDu4/5gl1JU2zn
 uRgg==
X-Gm-Message-State: AOAM533oqh+c/aHa7L3BVlvJggCxPqV2jFq/TiGWJNicSALm/YKgALGP
 baRPMN+Fh7eKBjnoMypJty4=
X-Google-Smtp-Source: ABdhPJzwILH2FmykgCW6QYUwNR2O8DTfDnqSz0tMZM0YTXdWW57b7LEdYvyyZWnJulbKKWCAM1BGYg==
X-Received: by 2002:a17:906:4d50:: with SMTP id
 b16mr10767090ejv.53.1619583537524; 
 Tue, 27 Apr 2021 21:18:57 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id s20sm3759565edu.93.2021.04.27.21.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:18:57 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Wed, 28 Apr 2021 07:18:48 +0300
Message-Id: <20210428041848.12982-7-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
References: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Wed, 28 Apr 2021 04:19:01 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0682410f5d..fecc64d7ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -502,6 +502,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 #ifndef CONFIG_USER_ONLY
             env->mmte |= PM_EXT_INITIAL;
 #endif
+            target_misa |= RVJ;
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -574,6 +575,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.20.1


