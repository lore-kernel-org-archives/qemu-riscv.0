Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1h7y-0003ON-NK
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 21:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1h7w-0003Nh-NC; Mon, 18 Jan 2021 21:52:16 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1h7v-000470-5U; Mon, 18 Jan 2021 21:52:16 -0500
Received: by mail-io1-xd32.google.com with SMTP id w18so36848180iot.0;
 Mon, 18 Jan 2021 18:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CYOV8khp4NTduR1YE+2GoXcxhPROtbd8FixAoGn5hPs=;
 b=BQm0ubT3OwhHB7VXbMtF/VkbdSinzrfTpknrO/E17jnH5P2CY8HjbCCc3LIpp4KDZv
 9JWt/IO9g76eybvATTOhsDlUeHHCv7vSvbehdLv3i+HnsJfEZeu5wk5P1JEMxWIMzfnf
 RYpXVRplKMHm+INvTvqr63kf486tQrrZfQvBFuY/Q5w7WrTznlr3X7XJPM4wBb/4GO7h
 lBHwEI0XJ1wEnuX/UZhuuVd3WxZymPUE1i/w7MKbfCy4mrYyi7/TQpM5ld3O/4YdeuM8
 Ijgtn2Po/1tw6hXZhfPBude8r6KEyMpKLenOZaxSi7OHVS3JkwgxfCmNNKQWcuwHgzot
 fwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CYOV8khp4NTduR1YE+2GoXcxhPROtbd8FixAoGn5hPs=;
 b=RciiEWa4WelbDSLlsO3TPRo5BOVgQM/qQlxJnMJAighiuzlEpf0dhjyx2vqNQjpLyt
 xK/8XSQh274FDyjMtLiK/br51MB3RiUIYPlLyxOW4RZsCsiC66jY0My5qEwRG6jThaKf
 bXcE4LxNnA74F2ikdauZeBZL4gmijQuHmYalF6v8lnPZD8ZeNruHKJN1WgVMInQ9a5Ap
 Rqo9QhELgdcFRX8zHqyIwi1RUvuMoB3K5TL7raeIDbFV3af7areKYdLFhApG9XmkLIhy
 nLFfErUWee0YnicBd4ZdJh7LTfsEVbqgT7kex60Cu/c/ZOibVUPyrEHFJ/ENPvgTvKqP
 QgOQ==
X-Gm-Message-State: AOAM5338KiOyuqIyZWAGIls+onqOlGKkgMW/WuSuD2Y/qdLeP3Rup0Pz
 dSQ7VUUsA7qsT6JQWQfXBNw=
X-Google-Smtp-Source: ABdhPJzogydnsX9qH/a2qD6yl0gJY87Gt3yxKlVG+8aja7iXwH7HJJ8tmCYMAMebRA+l6JKwhxX69w==
X-Received: by 2002:a05:6638:b16:: with SMTP id
 a22mr1742056jab.56.1611024733127; 
 Mon, 18 Jan 2021 18:52:13 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id p126sm4462058iof.55.2021.01.18.18.52.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 18:52:12 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Declare csr_ops[] with a known size
Date: Tue, 19 Jan 2021 10:52:03 +0800
Message-Id: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 02:52:17 -0000

From: Bin Meng <bin.meng@windriver.com>

csr_ops[] is currently declared with an unknown size in cpu.h.
Since the array size is known, let's do a complete declaration.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae..419a214 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -487,7 +487,7 @@ enum {
 };
 
 /* CSR function table */
-extern riscv_csr_operations csr_ops[];
+extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
-- 
2.7.4


