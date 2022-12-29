Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNo-0006xr-Tj
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNm-0006xG-CK
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:58 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNk-0003dA-PW
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:58 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 m7-20020a9d73c7000000b00683e2f36c18so6845947otk.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHy65YgYZ7EFTsqj5jqz5XI2px8pxCQwfSaXjdiH0SQ=;
 b=El8aA8ppoXiamW9bbv4fJ+2XAfwQYQwOrMAjPNxIebV4vVq35ebvoVnzkberlbNMqC
 JzWNd+m5vuiMam/hfKOtWYTU+X8dpoInKdQb+L2b+5U0TbrKfoDFAQNzqOwtwcCjrObd
 rwMcp9SApOvuLTV9iKJ5BkMbLhiowJOEIpnDtcFqP3rBcntqI9STn+WiqW8gAQV4oqN9
 u+UYNxPbbOTHwmFQ8qfBe491qx5H5JcubCjxiMyiRYNUTPBA+sOePKNmgKNBT67cCrco
 ljj+PLL8Xlg49RVEmwivU0eGCKqudT6JM4mtQMm5y3G6nOs/mm6RTjHkALbAUVWC+SE0
 7R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHy65YgYZ7EFTsqj5jqz5XI2px8pxCQwfSaXjdiH0SQ=;
 b=MuYoDhgYpU5ElEQPSJlROZ/JMKNGRZ0qs7mHd1hSVptA8HcUBhQ9MGhjfeYMVOsFl2
 e3gEMFvk/MYsRF1jCcjjsmqkly8+0kkl0YOucGSGMtcKCk5wlX0aEyHMZNZO3ll8jfpj
 1fyX2g4uNxUMNnpLF2pRL42m8UoCjguewVw4h9UZzXKnWQaVw+A8Xk5LMuRHZCCsZ+I0
 R8FKV+6l8BcvGgXXCkPqswnoN7mrSJpSsBrHqm9ktqhBPK0mCJyotnWyYNG94uiLnblx
 mricARP8a21FsW3MKfwuVcO0cnUBmr8CmCwoGoEPIUv/voa90rcY/EOMihBjnHRISPCS
 oMyw==
X-Gm-Message-State: AFqh2kptK1aVkHqgWJa/fJHjptgK4HVKexqERjzY6JwanrSpG8fKRcI3
 pX5/P1qkZG72FZ14Ij8rAgRB1A==
X-Google-Smtp-Source: AMrXdXs49f/f49p1ar2kODabYXUeMRxP+5nOTWs7yFJR2QDexl0FLfPy5OGGF2o8LyTwunAJ4dqxMw==
X-Received: by 2002:a05:6830:39df:b0:674:f9e9:8ee5 with SMTP id
 bt31-20020a05683039df00b00674f9e98ee5mr14170175otb.3.1672337515781; 
 Thu, 29 Dec 2022 10:11:55 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 04/11] hw/riscv/boot.c: exit early if filename is NULL in
 load_(kernel|initrd)
Date: Thu, 29 Dec 2022 15:11:28 -0300
Message-Id: <20221229181135.270661-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:11:58 -0000

riscv_load_kernel() and riscv_load_initrd() works under the assumption
that 'kernel_filename' and 'filename' are not NULL.

This is currently the case since all callers of both functions are
checking for NULL before calling them. Put an assert in both to make
sure that a NULL value for both cases would be considered a bug.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 98b80af51b..ad196f0fe4 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -177,6 +177,8 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 {
     uint64_t kernel_load_base, kernel_entry;
 
+    g_assert(kernel_filename != NULL);
+
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dynamic
      * behaviour when loading an ELF matches the fw_payload, fw_jump and BBL
@@ -209,6 +211,8 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
 {
     ssize_t size;
 
+    g_assert(filename != NULL);
+
     /*
      * We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
-- 
2.38.1


