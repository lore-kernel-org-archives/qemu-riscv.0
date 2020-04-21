Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyQd-0007kq-9O
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQa-0007hL-CI
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQZ-0007hE-7n
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jQyQY-0007gJ-RT
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g30so7052865pfr.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=cZPeewRwiJVRdUYRTxdn8RCJkKDKnsBX9QxOz+unSto=;
 b=BnQAf2Cad4prW/7YASlz4IQP8J4m59IwwQM1M3NugT8rHkZNle+/H6Ca7hYcgQHikQ
 8cnw69rrJ5FI9um8qbM6LCAEso8OtkcKhg+8A+ThoCriciEY9xunauxfmE+r1gq4B/VZ
 EWZhaSNiw/Mxo10hotzTPYSR54k5KwjxZLYqSJaKwVIQnmA8K+Z5ID9vOK8HD7wQoNAN
 LloUCa4qQVCN8IB6sP8E3ePSTYHKYJ83pasRrRvwWKPge058uhXgQwJBSHtxZeiZIt2G
 evNxzd3liYc5hUC6LIjpljZPyXkC62BDJQUJkFIQLfwEUOwbMMUF+3Wk8xSO6DI042Q7
 2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=cZPeewRwiJVRdUYRTxdn8RCJkKDKnsBX9QxOz+unSto=;
 b=NvFaYq9cktLxGBL3rfl3C7kT6a012iXNa0YCiNRqERVJkbf53HeP9+Y2nNqsyfdpig
 srbhlFp6EVSMtdAk5Z32nIFMjlYCBEaBmj9KNP5BD5dZ9CY+TC3zBGhhaZqTx5+L+Q/u
 Kqp3lw3RLYqF4AcXOsuHiAw57xpZvqKhcy+c7h5s1aOC6zZrfSnoACCv13nLBXVayBR1
 IlrxamYSRMKbs21eJNrWDsk7TahkVtCB+Re4NzcXE/9npkNfLGFB9wdd+vAz+lQrvobh
 dxzDPDdVfhDsRwTZT/GNvuU3CqjZpZh9wqWfu4NW5/vyxijQgTzyTMuRxj2Hd8oAID5t
 6gDg==
X-Gm-Message-State: AGi0Pua2y2cv045bHpU9wcxxVCVFw5G/9psu3AYpn2qveTFDJRNNTuXj
 HOQ3Fm5eg8RCRwn1gNKOc6iKxojhQfs=
X-Google-Smtp-Source: APiQypLVvMwxS5H7oRV02Lz94Xw0U0xOwQWypvN2+mi7Irq6BjAZTB9R4ob1fJ/r+zDWzCyhSTFyIA==
X-Received: by 2002:a62:5c07:: with SMTP id q7mr23741046pfb.200.1587496765135; 
 Tue, 21 Apr 2020 12:19:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o11sm2928763pgh.78.2020.04.21.12.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 12:19:24 -0700 (PDT)
Subject: [PULL 2/6] riscv: Don't use stage-2 PTE lookup protection flags
Date: Tue, 21 Apr 2020 12:09:57 -0700
Message-Id: <20200421191001.92644-3-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421191001.92644-1-palmerdabbelt@google.com>
References: <20200421191001.92644-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=palmerdabbelt@google.com; helo=mail-pf1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::42d
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
X-List-Received-Date: Tue, 21 Apr 2020 19:19:29 -0000

From: Alistair Francis <alistair.francis@wdc.com>

When doing the fist of a two stage lookup (Hypervisor extensions) don't
set the current protection flags from the second stage lookup of the
base address PTE.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e2da2a4787..48e112808b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -452,10 +452,11 @@ restart:
         hwaddr pte_addr;
 
         if (two_stage && first_stage) {
+            int vbase_prot;
             hwaddr vbase;
 
             /* Do the second stage translation on the base PTE address. */
-            get_physical_address(env, &vbase, prot, base, access_type,
+            get_physical_address(env, &vbase, &vbase_prot, base, access_type,
                                  mmu_idx, false, true);
 
             pte_addr = vbase + idx * ptesize;
-- 
2.26.1.301.g55bc3eb7cb9-goog


