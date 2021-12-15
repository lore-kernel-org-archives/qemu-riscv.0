Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxbhf-0000TC-9C
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 16:20:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mxY2j-0006Ub-38
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 12:26:17 -0500
Received: from [2607:f8b0:4864:20::532] (port=42999
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mxY2h-0005wY-EG
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 12:26:16 -0500
Received: by mail-pg1-x532.google.com with SMTP id l18so15991303pgj.9
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 09:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=usIBRdAq1zApdJQtT5S0XOjkrgEQzATABbaNkeFAxZg=;
 b=aKxFceNVucQXw+h4Zb5FpNkbfe/hwnlExIMoaECZPn4P5JY2R8nKbBu9Tx0BQksro+
 K7tJVDzq9xxX7O7Zu8JRquRLXDeUAC/Hj4B3qkIeHN6hRD8o2rAvEIogzc0odJe0PCwx
 EGSvtAoncmbdYbMiqkVzLCjDcDBJBmoZ/I2kpOEYYK1rHjgsqq5428hcR+VUY41nys2n
 FJmh12ydv5JfnuGhDcqLxfd7Ssk1mph4xIUmHEUU5DkaAPG54U2blHOybQdGYd2uu44Q
 rF9/w3Z4JqomPok2BUb8H9ZwA7yAwKD3kSBdKqCopzbj/C7qVoVCg1sUTc+q8f3DKJFU
 D+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=usIBRdAq1zApdJQtT5S0XOjkrgEQzATABbaNkeFAxZg=;
 b=WTPBVi/k+jjMUNhgRDKbdmPGcinTuuq3FTpOcBY1os15Nxm6iJ9hBK9nhkOWbuE5fW
 W6P4qe1VfUrNKq0iLGrV/mr7W6R7lQ6RuxDkQIfN0r+zskF7vLT21ZbqaYnZQwYBouMu
 7Zw9JLufhKEPvUDSOJopTUiZFr91mAJM5HGZh66eRo+jmD8sOSiy4dd0dOkr957YyRl9
 zQ0JcE3q7G9Sg5uLLeOjSxVj/8xunsdbSqQw/F34GPbzTQyy3MaMgCB6T+nWPp0w1ZVY
 rgDvnKYQUrG9uVfRXEftG+aWXYcayZUVbW5SmS14JqKV54i83qeqEOOWyM+w2rR+bfnX
 VLeQ==
X-Gm-Message-State: AOAM533YoJbzlYY8aJfoe7KQn8rx1/hIk/1R03ZVePXDoRRWoF6Fkyt5
 HRrKatyzdOZUuNUbl/cC9GXMYAXqbzp8Cw==
X-Google-Smtp-Source: ABdhPJwhAIVEDELtcDbz+JXsbn5AXTOarnVOKCG1RRzImzWzNGhDp9DS/qBROCNILHedhBsqdqL82g==
X-Received: by 2002:a05:6a00:1310:b0:4b9:f9b8:1f47 with SMTP id
 j16-20020a056a00131000b004b9f9b81f47mr1907339pfu.25.1639589172994; 
 Wed, 15 Dec 2021 09:26:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-148bb55d2desm498805ad.98.2021.12.15.09.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:26:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-riscv@nongnu.org
Cc: Khem Raj <raj.khem@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
Date: Wed, 15 Dec 2021 09:26:08 -0800
Message-Id: <20211215172608.1625941-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=raj.khem@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Dec 2021 16:20:41 -0500
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
X-List-Received-Date: Wed, 15 Dec 2021 17:26:17 -0000

5.4 is first stable API as far as rv32 is concerned see [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
---
 linux-user/riscv/target_syscall.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
index dc597c8972..9b13161324 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -45,10 +45,11 @@ struct target_pt_regs {
 
 #ifdef TARGET_RISCV32
 #define UNAME_MACHINE "riscv32"
+#define UNAME_MINIMUM_RELEASE "5.4.0"
 #else
 #define UNAME_MACHINE "riscv64"
-#endif
 #define UNAME_MINIMUM_RELEASE "4.15.0"
+#endif
 
 #define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
-- 
2.34.1


