Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlb-0004AD-SK
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkU-0001aV-GM
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkT-0004If-Gd
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:26 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkT-0004IK-C4
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:25 -0500
Received: by mail-pg1-x535.google.com with SMTP id m15so653587pgv.12
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Z4P6gozBSU47n/hk0aj8aavTiRQY7Brngh8HRCtVNow=;
 b=cegxpKcddvJ/OuGj8qugWdH9rvHwI38xclfoHrz5EzRd+C1Fy7W9u/r3UEkcW0wfzn
 B85UqAnlTn9YLqJzUxauGGeR9ummTMzsxBY9ls06UWeyVL1JFQK2YDvnkHIf4/AdpKxa
 k0oF6mwk4a2a7XXLvowA5fbS5IcP5YQQIN2NH/Z2L9KWdPKyelYezM8gxjyTnCnsIWPP
 xa0EWcrpQx2avRYp2oioM0GUvV953tIun4CUACSTj0n3XUjg38RRKDNDvxj2ONa9itMe
 xVJLDg1LGh5jb6FrvYm+A/sWvsuVFy65hpUcX3P7Y8/kUWcx6iAKbX3Vuk6dXVBzSMqa
 I2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Z4P6gozBSU47n/hk0aj8aavTiRQY7Brngh8HRCtVNow=;
 b=sgzTLs8s3m706cnTBnOEmEBu5zBpa/MlUyw5QyWYCj+YQ1ne/CicpYtT12VYq2QzSD
 EB/vlay71d4kHb4hzMITwqa9DyvlRcoVJyslzUYOkOrOk1/7BLLJ4tLhr5qS6MZwOpMj
 qmA6KarbiiiUH5jA+1QbgHL2+zWtyWB7+RynegQp1NqOivdTMpPyyWZ/0j0lUE36lETl
 i00wzpxp91SeoL9kF63O25T4o1lCRnVQrBOdovEzQFyFxtAIW6Mc0VeeTva1zUKbslYH
 4fNbY8keJ6aZ08uTPIc0JDHJe6Xa65413ZFlwIG1R5Zl/jV+uQbyqDmt0sixWP+q9aNl
 AYbg==
X-Gm-Message-State: ANhLgQ23oeY9+pJtmZRIAUjaPyBpRLg7bzczMMUUFpPZzIr3jp7Ggyt+
 FqHNtJfKOs8igQ4WoXhwi2olknskmXDFGQ==
X-Google-Smtp-Source: ADFU+vstzBL6DDNRXSuP0+j3QtrPgNvL79S8kXxEE78qJ3LWyGfYiYrz3C9k885yicKDKua6MaHZTg==
X-Received: by 2002:a65:62c8:: with SMTP id m8mr1520567pgv.69.1583196564065;
 Mon, 02 Mar 2020 16:49:24 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id g9sm22524722pfm.150.2020.03.02.16.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:23 -0800 (PST)
Subject: [PULL 15/38] target/riscv: Set VS bits in mideleg for Hyp extension
Date: Mon,  2 Mar 2020 16:48:25 -0800
Message-Id: <20200303004848.136788-16-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::535
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:27 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f7333286bd..c0e942684d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -448,6 +448,9 @@ static int read_mideleg(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_mideleg(CPURISCVState *env, int csrno, target_ulong val)
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg |= VS_MODE_INTERRUPTS;
+    }
     return 0;
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog


