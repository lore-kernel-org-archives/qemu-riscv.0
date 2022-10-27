Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oo63U-0007zq-Jp
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 12:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63Q-0007J6-9B
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63N-0002PF-I4
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:26 -0400
Received: by mail-pl1-x636.google.com with SMTP id y4so2137352plb.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Oct 2022 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r25VipQj5iv3sDMX8KrTJiiJWqt3kWaLtBvAXK9jQF4=;
 b=n5Q5eE7SKQPqJey69xXVyc+//AD3n+0ZiK5rtTK9S+HAbpfxl5fs15dgYAeqmw8e0R
 SUI8wXvQomR5Bf2bD1X+2SC4/BZO4WQfUWg3PgMkUntCZK9R8N4N4yRkILE7pRF6/9K0
 o7ikikQtuehPb0he70SzzvRK5Dpn9CSrQPQslG3XC+C4UKLbj4r9MvnjXeoXaXdlqFeg
 F0flZ1a5beB0voyi0ndZVRsj8XpZRECNKQFafyOfRY7P/eV7x3GMWg+EFWFRg+oKos3Z
 1WB/cU38JEvBqDwqZzhpSoYc8jmmRailR1wOFxMqiNmRyguEK/HYlxAXH8294D6N4X9m
 nWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r25VipQj5iv3sDMX8KrTJiiJWqt3kWaLtBvAXK9jQF4=;
 b=RQK3rqv811RcrzDhX2CkT0Ws9hnz+ktZpOfAyRiuGeu0j1DUjv/NIp1GwpDM8Ij1+U
 MqpjCDVbC6v2Ry++ezBs5wLAO6yxM2pitSupI4Pc2eFtQ/3kPhTOfN82/7EK8tdaMHMJ
 /lKJxUEtYW40r7m5P6TnOqj+a6V/IPv473x49g1JMORJmEjZVdqGHfr4/2TWfsFdHHom
 pGmolNDEPhgRtSKejICDNHuSp1UurWXnEgwrF6zk6QzsnlYIpLvwZibcFDFzg8Yil55F
 +aAc6d82uzEWL7w80uqG74cbGbOu5Nkmhzj1GcoNy+TDUXF0hI51IY50miFDD7ttIS5y
 KX1w==
X-Gm-Message-State: ACrzQf15w5BJSHeYLwY4dBOmcTmXIsMLV9ciFGq98T14lNrpM0gzRunF
 P1yMVNjKkTsOUvk1uOBV1Ibc7k9aJ3nfGg==
X-Google-Smtp-Source: AMsMyM6avW1Z37vV1LY2XHMpf7pcpTBFao/yq25Liu1RE7Vlg6gf5+XT2p5ehF+LrcLuuAMjzvFEgw==
X-Received: by 2002:a17:90a:65c7:b0:20f:8385:cc18 with SMTP id
 i7-20020a17090a65c700b0020f8385cc18mr11253052pjs.235.1666889301232; 
 Thu, 27 Oct 2022 09:48:21 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/5] target/riscv: No need to re-start QEMU timer when timecmp
 == UINT64_MAX
Date: Thu, 27 Oct 2022 22:17:42 +0530
Message-Id: <20221027164743.194265-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 27 Oct 2022 16:48:28 -0000

The time CSR will wrap-around immediately after reaching UINT64_MAX
so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
in riscv_timer_write_timecmp().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/time_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 4fb2a471a9..1ee9f94813 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -72,6 +72,14 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
+    /*
+     * Don't re-start the QEMU timer when timecmp == UINT64_MAX because
+     * time CSR will wrap-around immediately after reaching UINT64_MAX.
+     */
+    if (timecmp == UINT64_MAX) {
+        return;
+    }
+
     /* otherwise, set up the future timer interrupt */
     diff = timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
-- 
2.34.1


