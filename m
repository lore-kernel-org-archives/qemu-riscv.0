Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWzU-0004YU-T9
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzT-0004RA-EA
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:03 -0500
Received: from [2607:f8b0:4864:20::52a] (port=36654
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzR-0000Rw-93
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:02 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 137so7431137pgg.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=UyzAmfVic/NtafAph5XMMQMIJv4zarPD0wzakPv33zHblaMM32GfmIt+4SQczOOWEE
 /Zy6Gow4W5V9L2/6yOx4jdM2JZUZ6X6LIK11dExRNejOG5RJtfy4RLg2cGgzvaawAJ/u
 qVyHrpv6DPLc8UPdNSBkmPEY+klBKItWsp400ygaD9tsuP4cZFSkNCYljFxLWakY3/0a
 WAFrunhhGSbMRe1N4XO96+gRKI1zXEN4+XoK4GJvCEGir8vCdhXv9DkLob7fldXVfX5f
 FYDv2fAxTR6x1X8WR5rtlPRaAdBjNKQr8AjJ4MG2kT3gzyad46MqaYvOnOFW1L23AzzA
 3Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=Z0ncF4Z0JWKWlwPkFcl66Y5uL6nQ+nbL+jS8pcCtM1rNbcCv8/eJyAjmaK16tKn0dr
 sVfaPupKbADzfS06tS3h+lfAFjk97zHYmx4H7UZWOS7nPreprgvKAo4JfGLF8AMyn2KP
 c5vPupea0C3kFezSBznT02Jp4YVVX5AgtlrHNZ1KlkisAkVBKJHYOpQ4OkiL+Dq5ddz0
 EoGYuRW+GMC5rmKUZcBeMc3pXCnkHyACk86DT5iRd5XJy0QyeVhoj52EuCDVN8P4EkrN
 KBUzg3xi6Lq4zo61XfLNSJNfI7ziX8SMftTtSzKXga13BnBabzcGQZshORbCGLxKY+Ae
 /iMQ==
X-Gm-Message-State: AOAM533WrI1SkU158yqyToFG1fQWvX3MJZl9xS54CIFS21v5HTc2HkWn
 qwVKtR0rvYnge0Y5TQqzOXXpGA==
X-Google-Smtp-Source: ABdhPJxAMOCwpgUcnnd240dwGmKDpi9wiyxT+NceaRPjyOPpFM4SE1f7JMBep8sl5lQ1fR3Z0ZC2+A==
X-Received: by 2002:a63:4551:: with SMTP id u17mr19348205pgk.568.1638155160150; 
 Sun, 28 Nov 2021 19:06:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 28/77] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Mon, 29 Nov 2021 11:02:48 +0800
Message-Id: <20211129030340.429689-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:06:03 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51e..f61eaf7c6ba 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.25.1


