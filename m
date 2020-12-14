Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kou88-0001T2-Kw
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou82-0001CK-Lj; Mon, 14 Dec 2020 15:07:30 -0500
Received: from home.keithp.com ([63.227.221.253]:51874 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou81-0004HM-0e; Mon, 14 Dec 2020 15:07:30 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 6431D3F2E37A;
 Mon, 14 Dec 2020 12:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976441; bh=K/dnGbL6KdXY+xkFW0YSD6lvsulh4HeeZNJpZPFGyjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O5fR9FhSTh75lAnE7QU9tYA63Dzwv+F3cwwN7PgWOcI0/QnK6zRigzDxh7APTvLd3
 wLOJ7MLQTgflE14es14yIWv+YauzDltrV4XpBIGBkmCL+bW23TU0jagEnoTOWV4x5d
 c7Zib3glDj5OiSrN/KHM1+7AvxHl+Xg9FHsGYz6MYpNZaITw8VK0s3ITNtT8moVczy
 wq3sVMQuhG/lf1G64T80k1LjfPxZLEgmr/Ri61whcvXoVRIySEBOnKRFH8pnTfx+2E
 aDuVXV8RVOiIKKLUMTNscQS3B0Nkb5kFFmBbSP25xx4icmnsro4KcxlfWXmr4oT3UC
 DTs0PpiYiq7Tw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id v4noaiu2j1Z2; Mon, 14 Dec 2020 12:07:21 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id CC9E73F2E392;
 Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976438; bh=K/dnGbL6KdXY+xkFW0YSD6lvsulh4HeeZNJpZPFGyjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=po7cFpmr3IvSqjD4oZPRT8cmajDRLewCAXzsGkSPr38FV9sb4alAq+46GSnltdr62
 N7iDS41HkbIfKxejRNEXJO4bUVuBEPKJdwBd9IR1KwGrGqb4gzr1RD0T3mVyaL8X1u
 bUse0ryvcbbCv01mYSZaJy/0AxE8E3sQjlgXumlYlqhb3ENJPmzpsVJpGudwMADNAD
 9VpjqeUSbHdPiHYgmNdrksFml3zlcG17u4GZ7JHZLjY5OD+wRK1JuytygnTxhS1ZUS
 FlVKle7s/91a23fQ3lO9g4IAvfFZd5v5PRf9hhK9A8ScdBQ8B85IAeF2QtUi9T1XkT
 xr/lJXI2n9EYw==
Received: by keithp.com (Postfix, from userid 1000)
 id 620B4158229C; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 9/9] semihosting: Implement SYS_ISERROR
Date: Mon, 14 Dec 2020 12:07:13 -0800
Message-Id: <20201214200713.3886611-10-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:07:31 -0000

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index b0648c3812..abc15bf219 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -59,6 +59,7 @@
 #define TARGET_SYS_WRITE       0x05
 #define TARGET_SYS_READ        0x06
 #define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISERROR     0x08
 #define TARGET_SYS_ISTTY       0x09
 #define TARGET_SYS_SEEK        0x0a
 #define TARGET_SYS_FLEN        0x0c
@@ -967,6 +968,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
         return qemu_semihosting_console_inc(cs->env_ptr);
+    case TARGET_SYS_ISERROR:
+        GET_ARG(0);
+        return (target_long) arg0 < 0 ? 1 : 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
-- 
2.29.2


