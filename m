Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPEP-0003vt-4c
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEN-0003rD-GJ; Sat, 09 May 2020 09:09:27 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEM-00030E-Nv; Sat, 09 May 2020 09:09:27 -0400
Received: by mail-wm1-x344.google.com with SMTP id e26so12984366wmk.5;
 Sat, 09 May 2020 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8Yj7Svj+riGcka/Uh3qsXECOKShvQfR2c9eaJKoO3w=;
 b=hgE12GnE7B03Rf0Li5UMoMVIpZwMF5xdaHeVTULpTEAeAyfTIxU/73x0FkzMTfwU1G
 j18eIGtDShw1NpPuIcibyAKGBEv8Z+jV2kfFqO00+zmXDW3YeHpN1wFTTPAlEXSvevsN
 GTt8SqYZGq2Fz6QJYhaCWQZRqUoF3WMNhNvcgcmVb+1w917mRa4ESy502W8DLWAScJrO
 6SyLHzlIeiDPyjJBWJnhTPBdv1EUZgShPkZ3nvVULre8KMn44FOQVM30REYOpSZUpkFZ
 acaIk8sfbkQh1N7LKB7gZJovLowPsd+E2L/X4weuyf+xaIZdReBPyPHRiuq+l8li+feS
 3W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q8Yj7Svj+riGcka/Uh3qsXECOKShvQfR2c9eaJKoO3w=;
 b=U4Q/uqNWPpsHn5dxakZ1k9Vtl+uIxwfG/ISIfYqVpZH1ALStz8QK0u1T76VOKMNOwF
 zd2z3HjpRkDwxvI+E/8GEIpI2cRUTMBciT6wyU5Yh9Pt5aSFGZcJhUNBD483NHHimBib
 ZaJSr329IKEbdyCBptSDIFZ9n7r/XUytnbQ4A/QjMULqox8pELsQSOkSCJsYIvv8xWl+
 WiNOBW87oBinLHfVIKMmxxxxLqDCSdvKk+Mfh5yRD/fUEPZMmur+bA3J85zAvB1rcjrX
 6vWuv1F89p2vdovcV/dJsmlWRc9iUWi4OBM6z2pkk7RnBWMTx1ZTdfs7TwOLrmtDt0WA
 tvCw==
X-Gm-Message-State: AGi0PuZIxJFW3RK97kjqUmKce+7h9GdonjOaa6eU5MmbDsZTgzmPnh72
 +hpN01mhIYXAUIP+VjLSFOr9Br7OKbw=
X-Google-Smtp-Source: APiQypL0YdzBqET4iF7tG3bgS7EpeWyVFfBof8z1hou5dM1nUjXm3UvbLE6X0Jtl9HSfA7evL3JbLw==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr20375629wmj.14.1589029764010; 
 Sat, 09 May 2020 06:09:24 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 03/11] sysemu/tcg: Only declare tcg_allowed when TCG is
 available
Date: Sat,  9 May 2020 15:09:02 +0200
Message-Id: <20200509130910.26335-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 09 May 2020 13:09:28 -0000

When TCG is not available, the tcg_allowed variable does not exist.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/tcg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 7d116d2e80..d9d3ca8559 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -8,9 +8,9 @@
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
-extern bool tcg_allowed;
 void tcg_exec_init(unsigned long tb_size);
 #ifdef CONFIG_TCG
+extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
 #else
 #define tcg_enabled() 0
-- 
2.21.3


