Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo1R7-000342-4S
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 05:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo1R5-00031C-OM; Fri, 19 Nov 2021 05:48:03 -0500
Received: from [2a00:1450:4864:20::335] (port=53081
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo1R3-0005bg-Sn; Fri, 19 Nov 2021 05:48:03 -0500
Received: by mail-wm1-x335.google.com with SMTP id o29so8066119wms.2;
 Fri, 19 Nov 2021 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/sEMkLXaHtdeyM5KKpAG59SYshobRaqf25V6rhhYxc=;
 b=WC7Z9ERmudsck6Y3YRfWMWFqGpYGpG4eX0mIE8EPni0WLrhZoktZM/jFA9rm53A+NJ
 vsYl8FeM2WUwIUYtC3LH0HG/TWxOzeua7EHiaR/I0oZld9EauzlPJoqHZGbcx4tCFqTd
 apBrVbpyP5osu1wYVrdn5QFLixLJJaOCIjgmIZxBWCW8kqdO0r/INj/AEa+rJ1TpG9EC
 Poi/s0VvQIH9w3kvzT54uvGnk+ni9dajcgLcCDHqYwuuBz1hIW5HRL6YruVJr1q67ccM
 9QLorL52i9CG5zFwsnvYcSrIk42LL9Y0fzi50BrABE9Cko/g7dlrw1OIIwiLg3GLztTS
 XVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=m/sEMkLXaHtdeyM5KKpAG59SYshobRaqf25V6rhhYxc=;
 b=nfywqpknIDH/4t0XeIAXzPcPkz1nALpRn+iMO8T5rP9jxuEczfOw9PGfrJQrxMiL2N
 Kp7lYOpuIHcxb0uNf6M3xTCfp0elfA/h5VspVctzlZGMzp24vgfFJpgDddbrke6MfSjO
 PFT/AO/5i6qleGa/driWtUUYzsNS1OJuXHhlFDRmCZnOl177PSwIn8IvnGa2dvTTJaSB
 PWZTyUEEqdmBha2Kef+qwCmzO1yTTJ7TRR9UKuqWiJaAhMNg9ASKG9+JgocP5gH7MlHd
 QQOHOalgart3+5PWOxmRaXJ+tPD5rCvFqfI1wtiNC9JdfUt2uk1rDTNPPaZSbs3UUPmP
 mtCQ==
X-Gm-Message-State: AOAM533ytN/A1tOY0I6qZIoTzDTIRZ1H6kB+VIrz+copalHk8EyjU8vL
 LFASpBCc1qkheQeU83XZHdk9gzrMUdU=
X-Google-Smtp-Source: ABdhPJxtsRL3mNjwdvc2rx4KHoxUQg3TkjmOiLQkJNTEehNedUntZxFv/lSoEyyeZcQfAfGyGu0bCA==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr5365609wmk.93.1637318879700;
 Fri, 19 Nov 2021 02:47:59 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 e8sm2481692wrr.26.2021.11.19.02.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 02:47:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH-for-6.2?] hw/misc/sifive_u_otp: Do not reset OTP content
 on hardware reset
Date: Fri, 19 Nov 2021 11:47:57 +0100
Message-Id: <20211119104757.331579-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Fri, 19 Nov 2021 10:48:04 -0000

Once a "One Time Programmable" is programmed, it shouldn't be reset.

Do not re-initialize the OTP content in the DeviceReset handler,
initialize it once in the DeviceRealize one.

Fixes: 9fb45c62ae8 ("riscv: sifive: Implement a model for SiFive FU540 OTP")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/sifive_u_otp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 18aa0bd55d8..b5adcfa7cb4 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -235,14 +235,10 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
 
             if (blk_pread(s->blk, 0, s->fuse, filesize) != filesize) {
                 error_setg(errp, "failed to read the initial flash content");
+                return;
             }
         }
     }
-}
-
-static void sifive_u_otp_reset(DeviceState *dev)
-{
-    SiFiveUOTPState *s = SIFIVE_U_OTP(dev);
 
     /* Initialize all fuses' initial value to 0xFFs */
     memset(s->fuse, 0xff, sizeof(s->fuse));
@@ -259,13 +255,15 @@ static void sifive_u_otp_reset(DeviceState *dev)
         serial_data = s->serial;
         if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            error_report("write error index<%d>", index);
+            error_setg(errp, "failed to write index<%d>", index);
+            return;
         }
 
         serial_data = ~(s->serial);
         if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            error_report("write error index<%d>", index + 1);
+            error_setg(errp, "failed to write index<%d>", index + 1);
+            return;
         }
     }
 
@@ -279,7 +277,6 @@ static void sifive_u_otp_class_init(ObjectClass *klass, void *data)
 
     device_class_set_props(dc, sifive_u_otp_properties);
     dc->realize = sifive_u_otp_realize;
-    dc->reset = sifive_u_otp_reset;
 }
 
 static const TypeInfo sifive_u_otp_info = {
-- 
2.31.1


