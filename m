Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6AgM-0003GI-FZ
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 06:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgL-0003D5-7h; Sun, 31 Jan 2021 06:14:17 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgJ-0006hB-LK; Sun, 31 Jan 2021 06:14:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id u14so10707749wmq.4;
 Sun, 31 Jan 2021 03:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDkI+rwKtjNKilVNRpLbahjwFzHqXAoDQm6Y6hyZ/4A=;
 b=leLcc6pFkG2sud5rWI+np/GSNmk62nWtvomlIRSzn4Ps4W4u0zcCv9+YPncGta2nOk
 zojnlppJSKiqHsmhu4SMXg9Sqb3Nho20dwRvOZu88vHcEoIyLCwBIwgwPC6qkGR8SGjL
 mDOi057bPcyru2ek9N1L9V9YoqMQiiYOVJ7P1lRvK0U/qB5QmOkczRl7tbDXxThWuHvg
 NDUxTIVV1kg0sYo20cJ/D46E6W/6YFEUGy5kZmYktcCAwspqomi+1r5IuzzJ7dlfnJR4
 jSraOTY7DNRBaBcm24oskY1FGrU55g878fdQuGIoCSgpemOyATgpaDpx8l/aG/31ITJ+
 fC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GDkI+rwKtjNKilVNRpLbahjwFzHqXAoDQm6Y6hyZ/4A=;
 b=IdGasWBdK5lAJyBApByBrFM5fZ5u3qEp5ONkwDsAhPVbYvF3A8keVuabTDuWDAJEMu
 2a1NkOKpeSUoWN1VRbEXU7i/8pd+xQpn9VAOrzu8MpR4X5/yl4rB7vyl4Lepl/xMFx91
 ih6b0ovBJ99iotECYobYGyT/Ww2VxMcL+u8kBvv1Dv0mmOHzlw0oiqCrPwqm8UEEpsRB
 ZxxZ8PlJCJykKkOTvo8KvZlmSZHZACUlyzwfAczZbamfAcOdQ98pVhs0qwNpBdOwela1
 QlgvnMEeZO7vkdErYDboUek7CFfPtNZCdfDOeMPrTR3F5qnYJLzjb3U9STgQ3UldeuHr
 07OQ==
X-Gm-Message-State: AOAM5310ylY9zqicyjctH/iSUpPrQjSDTtdTsXAHjX6K87YqlE/v2R6R
 fa0Ro7rB6K1MIrcPS5NhUP3+Kf+TBxc=
X-Google-Smtp-Source: ABdhPJxnjopGFqmpUKqaP8zHmFxUTRSBU1pnTi6CbH65zn6PNcQ5hIQXrup6Ok2s8PWmQ9nwRghYPw==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr10912239wmh.22.1612091652608; 
 Sun, 31 Jan 2021 03:14:12 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h1sm23178056wrr.73.2021.01.31.03.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:14:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Green <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Walle <michael@walle.cc>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Marek Vasut <marex@denx.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 08/10] default-configs: Remove unnecessary SEMIHOSTING
 selection
Date: Sun, 31 Jan 2021 12:13:14 +0100
Message-Id: <20210131111316.232778-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 31 Jan 2021 11:14:18 -0000

Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
already selects SEMIHOSTING. No need to select it again.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak     | 1 -
 default-configs/devices/riscv32-softmmu.mak | 1 -
 default-configs/devices/riscv64-softmmu.mak | 1 -
 3 files changed, 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c7..341d439de6f 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,6 +41,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index d847bd5692e..5c9ad2590ef 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5eec75f05e..d5b2e25b6df 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
-- 
2.26.2


