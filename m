Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNlz-0006Mb-3D
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNli-0006AP-GQ
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:46 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlZ-00062V-Fa
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:45 -0400
Received: by mail-pf1-x432.google.com with SMTP id m26so8681999pff.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWgD4UVQ2TdjrIF+P3KQ6I8xUCtdROW+Zd/TKCzCFU0=;
 b=V6vWjQHf2ya6dKcqnXdO1fJD3P7Jkp7/I74FFZExPZLQzGbvmmckO0ftJBpgr+dpTj
 leVLUUWzGnZplfHuaYAqXBx/gZa0s2eaFan0XXaOmf4l/kNoGTc0SNX7nPjvQcNVgJeG
 ifBYkJDRrG+RjA6x6s5KffcWM4lUn5pDMOPyJ9++IoPmIacm9CDA+KGdNjCaAi4ea+CF
 5I2tJlL5mn9lGPdSn4osET/XlRpT28hsLG4hxyNhJKACdUIycz6wix8kgUnJRriveXyE
 uNbw03UtQaJijs2T+IYmRw14eHYE18V9shiZBSBVIvppxmD0TLp4W1JMmWV3ZxUd+xHS
 TcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWgD4UVQ2TdjrIF+P3KQ6I8xUCtdROW+Zd/TKCzCFU0=;
 b=VYCb4RObpDKZ2eVWtxjpccVW1OHoCOihHn+fCUgHOtdy5wPF88p3I3IcmPduKq7G/d
 75ThcEbcwGUDU8fkpjkScElFVweAdZ9l51CPUvTPAw81avnfZtgiKdMQuL77cp/5rN9n
 xeX/wOkul8VgDqw5ZGOpI02ViIAKxNlj+ZRd7dWleQLyX8B6HAlyJCPfcNt/JK0uysXj
 1o7wmCcdrSpm1Rf6YNH/e4Gya9Pn7dj8rtaEfJ6CXXo6GBXOz6FVr9MbYGtAqBkbO5D1
 M5GoAJwQwS9x5a7Y3yqedupiV3/VrqxohbfdEyQxr52XXKTRM5zb3VGb7WZq6SWyJgY8
 bhGw==
X-Gm-Message-State: AOAM533WQZbXvjAHNgyIAWJWbDkeY0Q/cVblHQgbWwzMlwAKNEzC6vDf
 PAE73j+89S6QO2KTx3tHNUMQDw==
X-Google-Smtp-Source: ABdhPJztKO59Yg5DDDNnOEyGE1GVS+tLEwg1cjYpwo9iHIONJcCh3HndtRILjzFKVpIkXqWHJo3Uxg==
X-Received: by 2002:a63:3549:: with SMTP id c70mr7232542pga.120.1635498096259; 
 Fri, 29 Oct 2021 02:01:36 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:36 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 33/76] target/riscv: rvv-1.0: element index instruction
Date: Fri, 29 Oct 2021 16:58:38 +0800
Message-Id: <20211029085922.255197-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3ac5162aeb7..ab274dcde12 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -633,7 +633,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.25.1


