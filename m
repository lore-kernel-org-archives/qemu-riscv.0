Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZpfs-0003Lz-7g
	for mharc-qemu-riscv@gnu.org; Sun, 18 Sep 2022 04:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oZpfq-0003Lg-M4
 for qemu-riscv@nongnu.org; Sun, 18 Sep 2022 04:29:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oZpfo-0003v6-Nh
 for qemu-riscv@nongnu.org; Sun, 18 Sep 2022 04:29:09 -0400
Received: by mail-pf1-x433.google.com with SMTP id b23so25269127pfp.9
 for <qemu-riscv@nongnu.org>; Sun, 18 Sep 2022 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=oF5jrzq09jc1ZnunLnisOmXL6et+cmuzWVeFPl2iPR0=;
 b=NdPToHFQfNukZg5Is0/iQpnX/NFmHEehoGcVGF8z60zdx/CC/f00g3i3brH+ZYoYg6
 3DNSyP7Mhb/5yAdYYIna9k3WaOKE7x+Sh1jbiXPeDf0OOfYCIjsduI4MnOE/UQkb0SkR
 eeHt4KqS5XEtm7LansjpF30gvOHb75s3eE/SPaolc7fXeNATtRyZKE/431d+I12rvtVW
 Y+IRrMwhYgxtoqn6/DJfWDYMxo3tyYC/jmZGUuTpmuVrzi7PXPtzlPLYjSBPeGQVKODg
 CjlDPyIru3hJF0X3YA3jq/8nJxMjAQfGntmNgKxSgWf9Bmp7LqUGAW/m9+Oftep33oGY
 UPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=oF5jrzq09jc1ZnunLnisOmXL6et+cmuzWVeFPl2iPR0=;
 b=VwTj7eTHcJ1PRTIfFA1D5eWE6Vh3+G7Ey9UaVvSCcWS3a3uqlWB8fr0itbd7O1taJk
 HcDhzWx89HUctmFyTp8qtvw7X5uiZ9b8jTmLMDyUYY0Kok7JR4JuFZ+m+kkLIqMJB3Rq
 Yo+QPrLzlxit3dc3yAZmOeVwlGmBIwl9fFLO3AKgQ2AUTavCW6M1H9EPqlNRXZx02S/J
 k/CyCy0nNzkwnbQKMbSENdFVNvfNMOL9j2y5HiwVJ+XarDy3amBM5Xxeyjv+fAU4/clE
 BRy6b0BvswOmiY/k/SVUHMDXysQb6XNTARkTkCXng2PaB0031o0TxngTs2z7Jkp9HKrv
 KAbg==
X-Gm-Message-State: ACrzQf1ioGPCEFQ8aAX5xinZbvqjJsQXdO+nefzsb6LBBHE2brPM6U8B
 qiKkBn0QZ4ooJFjU68nRvU7fJA==
X-Google-Smtp-Source: AMsMyM4o9xXCgkCdiCi3uAMGjzqnOfGGJGPlbiBkTwtpKHGUaYZqQI7Hyn/LFSHlE4ygW00vKt2E8Q==
X-Received: by 2002:a05:6a00:8d0:b0:53b:2cbd:fab6 with SMTP id
 s16-20020a056a0008d000b0053b2cbdfab6mr13176343pfu.3.1663489746122; 
 Sun, 18 Sep 2022 01:29:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709026f0200b0017808db132bsm18113414plk.137.2022.09.18.01.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 01:29:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Tommy Wu <tommy.wu@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Check the correct exception cause in vector GDB
 stub
Date: Sun, 18 Sep 2022 16:32:44 +0800
Message-Id: <20220918083245.13028-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Sun, 18 Sep 2022 08:29:10 -0000

From: Frank Chang <frank.chang@sifive.com>

After RISCVException enum is introduced, riscv_csrrw_debug() returns
RISCV_EXCP_NONE to indicate there's no error. RISC-V vector GDB stub
should check the result against RISCV_EXCP_NONE instead of value 0.
Otherwise, 'E14' packet would be incorrectly reported for vector CSRs
when using "info reg vector" GDB command.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9ed049c29e..118bd40f10 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -211,7 +211,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
     target_ulong val = 0;
     int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
 
-    if (result == 0) {
+    if (result == RISCV_EXCP_NONE) {
         return gdb_get_regl(buf, val);
     }
 
@@ -238,7 +238,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
     target_ulong val = ldtul_p(mem_buf);
     int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
 
-    if (result == 0) {
+    if (result == RISCV_EXCP_NONE) {
         return sizeof(target_ulong);
     }
 
-- 
2.36.1


