Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIr0M-0007OU-05
	for mharc-qemu-riscv@gnu.org; Fri, 20 Jan 2023 08:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr0I-0007Mh-Qt
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 08:00:22 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr0G-0006Hg-UZ
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 08:00:22 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso8995430pjg.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Jan 2023 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=l6ZB0DFwPcu0v18d1WUWdk00j0UwcY2hRLsDNJ9W4WQTug5eufdiXyZ9zZ4dcJkU1l
 +rsgtlyYCqq2Xqtkpa7dDFpOrZcT7Y2L1K0hBYkKuWqyjzx7Qv5+eNLQi61wb4Q/dbhs
 sx2cQ65piApC18YN6z/okQd1Cwkhoxokc5TOR5TMR6Gkot5G/HPqS1X3w8RRG6UE2Urc
 6D/TgdYEhWZpEFwgkoqNwc0b8+67B+paBvYxInLmLdpsdkArh+wURJ8suQFAajPfOZKU
 Q9GRijELNCUx2LbUerX4GfMVN6/zHROuxRHC7y0D/NHZkx15jPHFciKosFc3PVVUkl1U
 AZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=52mMWiMr8HTGR6xwo80V7+6bfhwpgfUBFX3Mzmq5HRT0qYn49hFsSsmylM7VxKhZPg
 NvnbT+fZzJ0h/OmNJJkbJUt4aWCwcdZ/ULqMHM8qu1uMIRtz+lVmmJPAqXK5SAb0eIHM
 ojFcN2iYLNnq5rSsOJcbvONjT/kgkq00kL/bjr/OqBBRpcHDJVRIEPl+3hpD6yEEVTsC
 NmVLNf+N7LXb2tX66tt4uJ3CLv3V4ckGIMT2uKalM8RwR0DqM5NKaTtOKZiAzOaObHO3
 lOKRAqZ824wGYiUcxf6bvnAzI2KI2wveAq0IK0W2vPLg3hLkdecadlcNw/b1Ybrf9ccq
 oFBg==
X-Gm-Message-State: AFqh2kpagf/Iosi+yD2u/LyQ0YrlAvIQMcdDg3hiboIwDuYJiefVUfeN
 3NgwwMIqCCq/fg/aEsXLvXEOpw==
X-Google-Smtp-Source: AMrXdXuuyhIYUn+WjwQ1F1lApMhscds+yd4usswIglrlY4Yw2RGHSkCdCpIujSbGKcG+kppdUqRFLg==
X-Received: by 2002:a17:902:e5c9:b0:194:d0ad:53f0 with SMTP id
 u9-20020a170902e5c900b00194d0ad53f0mr7405861plf.9.1674219618781; 
 Fri, 20 Jan 2023 05:00:18 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b0017f72a430adsm7279610plf.71.2023.01.20.05.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:00:18 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/4] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
Date: Fri, 20 Jan 2023 18:29:49 +0530
Message-Id: <20230120125950.2246378-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120125950.2246378-1-apatel@ventanamicro.com>
References: <20230120125950.2246378-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 20 Jan 2023 13:00:23 -0000

The time CSR will wrap-around immediately after reaching UINT64_MAX
so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
in riscv_timer_write_timecmp().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/time_helper.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 4fb2a471a9..b654f91af9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -72,6 +72,30 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
+    /*
+     * Sstc specification says the following about timer interrupt:
+     * "A supervisor timer interrupt becomes pending - as reflected in
+     * the STIP bit in the mip and sip registers - whenever time contains
+     * a value greater than or equal to stimecmp, treating the values
+     * as unsigned integers. Writes to stimecmp are guaranteed to be
+     * reflected in STIP eventually, but not necessarily immediately.
+     * The interrupt remains posted until stimecmp becomes greater
+     * than time - typically as a result of writing stimecmp."
+     *
+     * When timecmp = UINT64_MAX, the time CSR will eventually reach
+     * timecmp value but on next timer tick the time CSR will wrap-around
+     * and become zero which is less than UINT64_MAX. Now, the timer
+     * interrupt behaves like a level triggered interrupt so it will
+     * become 1 when time = timecmp = UINT64_MAX and next timer tick
+     * it will become 0 again because time = 0 < timecmp = UINT64_MAX.
+     *
+     * Based on above, we don't re-start the QEMU timer when timecmp
+     * equals UINT64_MAX.
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


