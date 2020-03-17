Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jE3Ua-0008A3-Dt
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 00:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3UX-00087d-G0
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1jE3UV-00029o-5J
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:09 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1jE3UU-000207-Nv
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 00:06:06 -0400
Received: by mail-pj1-x1041.google.com with SMTP id v13so232764pjb.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Mar 2020 21:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=w80CzMDxP22b8vsHY5R1KjcrEbEeVniwI+3e9Z9g2gI=;
 b=RVdNSGKy+5t3KDmeaRJkyaaVbU6RLMsdHgueG1lJ9OlgMPSHrN4ynU7t95JZo951Nr
 lGidtawaBCUh44dSKaxJhNea/V4CBE7ASk3Yr2Em2sb+K2r+T8hjQJawETtv6DGPtU7T
 vaAGcEAlkiJmpdqJ4zQzRFh7yA14AQVPD6ihq7VWr1OMyLLveG3DplSc4eXGivvKSE6L
 DCIA9HoWkwEAhE40knEv1rzJyq3XWHxk7g1WdgfCh7A5K/igM9OwdMdNYqmaaYBLLNmL
 L4feS+lGS1blhxLi0fb04pq0PPQsU1BsU5Sa0j22vBDobTFpr7xKG12DiTqi/+q9V7Ic
 Z4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=w80CzMDxP22b8vsHY5R1KjcrEbEeVniwI+3e9Z9g2gI=;
 b=VGjEyFplbRZ4rqeMVFeYhkEzGwJip7COExsY2qpsQR5eR76eE49PsDhJuhCLIpDklR
 9ZmUTSvdGOhrZmyWQCMd1DLd758sCg+GaM1umZb0DIAp4NXiSiNzin2WFIjrBU5OeGFg
 avwoutq7CI2noNSQfJar19PoDJRLcixJZtPr+m+imb1Qi9Md4j2ONNCTPfYexqPaAOlL
 HchuVS9ESvkgkZOQpDQEFjnsIXquxlWrkI1nDMlbtPt94KHaSpHeQeDtbRP9v3oUoaR1
 jb5xV81dQhEECgZf/c7C7kJwftYjAe7kdfYc5pUCrJ69JSlt9w50iu+DGnrPC2ko6bNz
 emYQ==
X-Gm-Message-State: ANhLgQ2Xq6ycFlVtpGOFyUgyOsWHvemrHnfKemM7EB566xkMhFdbRCS4
 YAcVcxORFH+LAEz5sGirdBw7OT7cu6KYpg==
X-Google-Smtp-Source: ADFU+vtHPfipcGazbneWadOe0kx2X1CNILdui8txA4y7RiXl8kBgmpSPiidSGpCpkhgCfK0xa9NHxA==
X-Received: by 2002:a17:902:c1d1:: with SMTP id
 c17mr2429101plc.184.1584417963707; 
 Mon, 16 Mar 2020 21:06:03 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id e10sm1275052pfm.121.2020.03.16.21.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 21:06:03 -0700 (PDT)
Subject: [PULL 1/6] target/riscv: Correctly implement TSR trap
Date: Mon, 16 Mar 2020 21:05:42 -0700
Message-Id: <20200317040547.222501-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200317040547.222501-1-palmerdabbelt@google.com>
References: <20200317040547.222501-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Tue, 17 Mar 2020 04:06:10 -0000

From: Alistair Francis <alistair.francis@wdc.com>

As reported in: https://bugs.launchpad.net/qemu/+bug/1851939 we weren't
correctly handling illegal instructions based on the value of MSTATUS_TSR
and the current privledge level.

This patch fixes the issue raised in the bug by raising an illegal
instruction if TSR is set and we are in S-Mode.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Behrens <jonathan@fintelia.io
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 8736f689c2..c6412f680c 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -85,7 +85,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
     }
 
     if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TSR)) {
+        get_field(env->mstatus, MSTATUS_TSR) && !(env->priv >= PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-- 
2.25.1.481.gfbce0eb801-goog


