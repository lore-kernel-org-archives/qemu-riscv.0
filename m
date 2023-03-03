Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zP-0008BR-LB
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zK-00089N-9e
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:02 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zI-0007uA-R8
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:02 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a9so1945910plh.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832920;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iar28XWCjKHLpwhZETdxylE8DjmCp9sM51vAD+CbMx4=;
 b=4SD9s8xHQILfjjhhwkVS8WcK396iE99Yz8sX4il8p4elV4EC2KE8Zp3o74EaTNP9LQ
 eVR7h+1Lkv0w/Jdbdw0N/VfrMyddL52FfInuhnae83U3SQBzUK6SNGUOYgN9U4B5i4AX
 ticwoG6NikHjuu6YRXMJlfUffQN6ouePQr7kzWiVP04pBSW+SjDfoCaK1RbqaiDKl88K
 JF3V3GfY/bdpGTRbXxSD/rbovccqbcgSg403qItduSeHtcnAhNxjO0BvootouIK1O9gN
 m8CZMNJQLy0tJtS+vE39rb5X8hty7GKFFYK3OSPbwlnKo7A+CxHZwpyhDZ1CegqgOWaw
 5+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832920;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iar28XWCjKHLpwhZETdxylE8DjmCp9sM51vAD+CbMx4=;
 b=cO4tvIue2D19On6Oe9819J1v9bn6H9DQW+iSD3RAvBs3jCd0Q0SDkmUHoME6vZHKth
 YNaWBXhK0/tJ/rCGggvo2U47FXqj7IDo1rjyrL+K4hnWTB0HRk1MQwMltbkkqcvxvKrI
 uLFB51NyBx1Z7+IakWWDpwarubDpw3Zs8KDjQa+ZdfmDR6eYLZM/uZflHavb+8dQ3mf+
 X2huPNjrgDJgMRk6AGDw4ZFumyCP40+uX/AsEClMR8J6tfaI3ohNv9B9IJaAv7WoDKR7
 mzve2isZR6weZsEzNOU7ETYEMFPnywJe4pr0R+qQBObvw7sdwPPDJMOTbIVW/+gj7xSS
 Qhcg==
X-Gm-Message-State: AO0yUKVuyBcENhiBpHjBWAHUuvH0GDZ0PRl8MoyfWJSREroaSkmMc7De
 UpS+DCzMi2/E6v1QQ/gJ1HHWfs3AyPvZHYkW
X-Google-Smtp-Source: AK7set++LCv3z6jZhGCZ1qC0XUeRSz2J/8tYXg/W1BgSzLeIfdzHc/VAua9lXvRR2mtNB3+lC6cFmg==
X-Received: by 2002:a17:902:d4c9:b0:19d:323:e70 with SMTP id
 o9-20020a170902d4c900b0019d03230e70mr1623087plg.33.1677832919839; 
 Fri, 03 Mar 2023 00:41:59 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ks12-20020a170903084c00b001933b4b1a49sm965246plb.183.2023.03.03.00.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:59 -0800 (PST)
Subject: [PULL 31/59] target/riscv: Use 'bool' type for read_only
Date: Fri,  3 Mar 2023 00:37:12 -0800
Message-Id: <20230303083740.12817-32-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:04 -0000

From: Bin Meng <bmeng@tinylab.org>

The read_only variable is currently declared as an 'int', but it
should really be a 'bool'.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-8-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6a82628749..9264db6110 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3775,7 +3775,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                RISCVCPU *cpu)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
-    int read_only = get_field(csrno, 0xC00) == 3;
+    bool read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
     /* ensure the CSR extension is enabled */
-- 
2.39.2


