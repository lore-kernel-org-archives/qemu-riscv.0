Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKeub-0000ST-Qi
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuV-00009Q-Jp
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:47 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuM-0005GA-U4
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:47 -0500
Received: by mail-ej1-x630.google.com with SMTP id p7so40986623eju.6
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7aRz5A1gJNP7JkbnM/fhJCTS7Za0DL/dufGag57ukuY=;
 b=fDqhjR2Hd6JmMUDPMnxLDANWYCDs8QACyL9YXtgW0ADkKSLqP/MMhdBgOhQxRPUIO/
 A3NmXNh4DIQd93aokAJ/sRMRhc6nZlTCBhSBYjd+xHpVvhclIUpnWZzkB4bGMOjzfNlL
 uamfDu9OHs0PbqN2eyPMpeE7vm92QpB9cJQVFAX5UitLfRfFj/A8cjGQikkeVAt+ILOw
 1whUE0/dEgnRRw88QRX5G/WRfQtrWGNeE50hN6XW4O9kyIg/o+FIKIHQBWjpNS25d17M
 DPO9ttfHPst2u4vCtw4lVgTpl/JKBr/M5jtU/J5lqi+SyT3wpDDPW4n43jjbSq1tMz1T
 /2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7aRz5A1gJNP7JkbnM/fhJCTS7Za0DL/dufGag57ukuY=;
 b=mJMwACPFZA+F10woJA3NfsHJ/c+Hy/3ag3KuEpbPfhVReHLoKdZSUgF97ECxNr8+QL
 myx2s3N7uvf1XhalmhgP1DabSzZBKE+Rz1LNHrx1MSV1PGBtG9E/QFjwCWg9gYAabFdW
 n8SyTjBQi81B3m/ZrwwdUIK5RbzXLiodm2kWxrbF0w+bor+dUyY1BJkEXHwNaKO8PF6g
 6mpxJO0/xRWJ3E6m8ewltaIzM1BULTa9FeDR+okal3eTMYRqkqY3uXSKADzX234faGhS
 Fbl24kHltf2n642JENj0p1vEAfapwJsOSpd71OG4AZWs1p8CzZXx0/2dqC2QObJdMSNa
 EQ5g==
X-Gm-Message-State: AOAM531GoTsu4U8v5+TzSoE5PuvZzRL9nrQlfD9Opa845V4wqWEut8bJ
 +x449TLgvRK83tQJyg2EZhsblBTc+wFYUg==
X-Google-Smtp-Source: ABdhPJw179z+XcBzrDvsd5yGmEHu2EkbnWOBkRDSXGFQq76TnSj3OhtlxzMiVdHvPxvVC/XyhG08wA==
X-Received: by 2002:a17:906:4747:: with SMTP id
 j7mr7601778ejs.221.1615544435208; 
 Fri, 12 Mar 2021 02:20:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm2515090ejh.94.2021.03.12.02.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDAAA1FF8F;
 Fri, 12 Mar 2021 10:20:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bug 1915925 <1915925@bugs.launchpad.net>
Subject: [PATCH v5 3/5] semihosting/arm-compat-semi: don't use SET_ARG to
 report SYS_HEAPINFO
Date: Fri, 12 Mar 2021 10:20:27 +0000
Message-Id: <20210312102029.17017-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Fri, 12 Mar 2021 10:20:48 -0000

As per the spec:

  the PARAMETER REGISTER contains the address of a pointer to a
  four-field data block.

So we need to follow arg0 and place the results of SYS_HEAPINFO there.

Fixes: 3c37cfe0b1 ("semihosting: Change internal common-semi interfaces to use CPUState *")
Bug: https://bugs.launchpad.net/bugs/1915925
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - just revert the old behaviour
---
 semihosting/arm-compat-semi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 0f0e129a7c..fe079ca93a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1214,7 +1214,11 @@ target_ulong do_common_semihosting(CPUState *cs)
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
                 bool fail;
 
-                fail = SET_ARG(i, retvals[i]);
+                if (is_64bit_semihosting(env)) {
+                    fail = put_user_u64(retvals[i], arg0 + i * 8);
+                } else {
+                    fail = put_user_u32(retvals[i], arg0 + i * 4);
+                }
 
                 if (fail) {
                     /* Couldn't write back to argument block */
-- 
2.20.1


