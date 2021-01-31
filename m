Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6Afz-0002Qq-Q0
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 06:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Afv-0002MV-IV; Sun, 31 Jan 2021 06:13:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Afu-0006Sd-3T; Sun, 31 Jan 2021 06:13:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id o10so9598650wmc.1;
 Sun, 31 Jan 2021 03:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZ5JZwzpktnbjFuf/ncaeAAbDJxYH2JCDDvtVQgdW+w=;
 b=ToTCx2jWckWjHNwpEOz5wdo/JJkak9+T2kGHTPB3H9cUsSWYIJ2j0m0wd6ZXLfgxm/
 npiF4nB+90iU4FCLw2dxO9FGjYxk7sqqOKNPgbnT43up9MT3+TqVcO1dzfS5nC30YWsb
 SmW/ud6ZCvRzxnycN0tOgYoFcQKL6HTXZlNopN7UPbBXEYJQRYkrmDTygLyZixrodMtU
 uBmILEY/oCg/GOX2dzjcq5QWWrpK1Q/kqNiziD08GehDKl/Ls9OGkVq3NNt8CNgoNTvU
 Pqb8qpC0WBbuifL4S2EngyrN/0+LMivv3LKHDfCnICIuLegny6Vgj+AjlyrXJ9Px23Vb
 6zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VZ5JZwzpktnbjFuf/ncaeAAbDJxYH2JCDDvtVQgdW+w=;
 b=Wn4ZuQ2lgrC50LB+Ik4vsjc2eoQR830A+UP3hdpDw4WfzliavjJG6NrvnXKDl96bn/
 VQCqDnEYGeYPKrSya+AT9otduawVt+Kxc4CNMB95EgoycNnV39YdDI95NzWDoBU+gazB
 f2WRv7HTINgct7LJ8tGK3W1TCnDOz52fyvqmxt+n0EXAz1o2lrw5AjE0oOHdmhbKYn7G
 Dnz/ZcD7YccfsG0cz0wsVXCmFxkbP81llLv4wbxFpnypChHwaa+Q669fc+WGNQFTOrh6
 37OmtPqhlghZILN/cyUsjxckj40OivCqxI2VkCks0lePM2OTQqOs+jNcL6Za3LeOaFML
 82wA==
X-Gm-Message-State: AOAM533kajLV+a6rDV0u9tEnzf9lvo1g0SiWhWVWPxt/gwNfyVmZ7ou7
 /5qmlL2NYo1fFgUy1fmzYYwHmdb/Vug=
X-Google-Smtp-Source: ABdhPJxUb54MNnNR5jLVD0xKsErUHIn07Vu6OqovQ7PCBXAlfVBhNXjdpq2WzDgjRc+LEHv7SAEXbA==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr10918232wmc.39.1612091626857; 
 Sun, 31 Jan 2021 03:13:46 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u14sm17326317wmq.45.2021.01.31.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:13:46 -0800 (PST)
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
Subject: [PATCH 04/10] hw/lm32/Kconfig: Have MILKYMIST select LM32_PERIPHERALS
Date: Sun, 31 Jan 2021 12:13:10 +0100
Message-Id: <20210131111316.232778-5-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 31 Jan 2021 11:13:53 -0000

The Milkymist board requires more than the PTIMER. Directly
select the LM32_PERIPHERALS. This fixes:

  /usr/bin/ld:
  libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cpu_gdb_read_register':
  target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
  target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_im':
  target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_ip':
  target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jtx':
  target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jrx':
  target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
  libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_cpu_dump_state':
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/lm32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 5867f4db0cf..38ad22c54e4 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -6,11 +6,11 @@ config MILKYMIST
     bool
     # FIXME: disabling it results in compile-time errors
     select MILKYMIST_TMU2 if OPENGL && X11
-    select PTIMER
     select PFLASH_CFI01
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+    select LM32_PERIPHERALS
 
 config LM32_EVR
     bool
-- 
2.26.2


