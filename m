Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLl-0003EB-ML
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLb-00034E-Pg; Sat, 23 Jan 2021 05:40:52 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLO-0002x9-0G; Sat, 23 Jan 2021 05:40:47 -0500
Received: by mail-pj1-x1036.google.com with SMTP id my11so7490870pjb.1;
 Sat, 23 Jan 2021 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RuQ3gOwEbnCFLQacowSgyfhpGP/J5gBP7ftXBeVEIVk=;
 b=TXrJWP8cIxN9PV4tHIr1LR0D5IQHovzllkN5impJQLzRmyfB/Cd4kOqQ11Kawuf4NJ
 BHpPi4Tm2+6j+/+pd+U/mYzYh260LnN1z6c8vDHgLUwgk2EVkJSGMNUgvfVPTJJuXc2+
 eXcZ/U5ZgAeYbaNpRebF57gORT8SGmzpE+1IVSgEq/4cioE3w+uTzKyfjVs45HogSpqQ
 Qw5TqmBvSpw/6/2DHdWNFs0Cyc+PMEQqPXQO16IfPO0PLCLwDVDjE78KSQF/sHIKnRm+
 OJwliPPowigLqddSDHtjOSF7/NGDRrI5afXdgrJUAh3wW9iwNU/3ik1xUHR7FPG4HvDQ
 YJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RuQ3gOwEbnCFLQacowSgyfhpGP/J5gBP7ftXBeVEIVk=;
 b=a7MW76U4wHylEJK8DjnlYLYlRHNF9FlDmgDR9EgMrrw1QUNgqUjhR/BA2skVXQJqF/
 LNiWjQ51/uEMl4On9Ysnmoh1QdynRoJ3ANlR+uuWo0936tdJdXmLM7jZWXg4Pkr7zoQn
 twha28EggynbegP2hzTRmbKWXsVRGerkh9av8c0nwCYD715JKhhrGwQJ2pUt6o2VoURN
 wFc+nonLF0QsvscSmD6JM1r6T9Usy6xzS0/Q+XaP7Chcn/K2IYiblwHBxRZ8x9/4Tyuh
 6cqUOwpMiZ2HdEKRQXPP0IWQqloG0qthVPSyhlQZtWGQBcglKsyRsvj4smfYHf18knBO
 WKSA==
X-Gm-Message-State: AOAM5338a/F04H3IBZalU2saWQvlsYeoFqqAoGJfR6QT437dXsTmPQ0t
 Ng9j/eandd2GME8yANcErFg=
X-Google-Smtp-Source: ABdhPJxQhOyxnpicJMb8ceUpiLYZT3tR3nj4CI2SS/LodjTd+9q3xfMJhk6cOZEiZpQCtjIabYfIVA==
X-Received: by 2002:a17:90b:881:: with SMTP id
 bj1mr228389pjb.150.1611398435478; 
 Sat, 23 Jan 2021 02:40:35 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH v2 04/25] hw/sd: sd: Support CMD59 for SPI mode
Date: Sat, 23 Jan 2021 18:39:55 +0800
Message-Id: <20210123104016.17485-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 23 Jan 2021 10:40:56 -0000

From: Bin Meng <bin.meng@windriver.com>

After the card is put into SPI mode, CRC check for all commands
including CMD0 will be done according to CMD59 setting. But this
command is currently unimplemented. Simply allow the decoding of
CMD59, but the CRC remains unchecked.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---

(no changes since v1)

 hw/sd/sd.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4375ed5b8b..bfea5547d5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1517,18 +1517,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         if (!sd->spi) {
             goto bad_cmd;
         }
-        goto unimplemented_spi_cmd;
+        return sd_r1;
 
     default:
     bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
-
-    unimplemented_spi_cmd:
-        /* Commands that are recognised but not yet implemented in SPI mode.  */
-        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\n",
-                      req.cmd);
-        return sd_illegal;
     }
 
     qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
-- 
2.25.1


