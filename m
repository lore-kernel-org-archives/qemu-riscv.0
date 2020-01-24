Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iunCz-0002g5-7n
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jan 2020 19:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunCw-0002YM-4b
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 19:52:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunCr-0005XE-Hy
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 19:52:22 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51724)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunCp-0005Sy-4I; Thu, 23 Jan 2020 19:52:15 -0500
Received: by mail-wm1-x343.google.com with SMTP id t23so143733wmi.1;
 Thu, 23 Jan 2020 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qqu8m/9tcqm71+PI9aGfjbTBDkYS/QcNrCY5KIhFwaU=;
 b=J9mNID0b1REEk4ltwhwoEdNjM9xkvwPxnUODRKsfq3/eFF31NszCF18aVloegGx87s
 lwB8w56lgtZKltARsyupTbWp43Nl4u5mIP20U+VCfB21o/7auKA60l3fz0rUNziRh0Xl
 ulL8k3v3Ks19owrAoxNVO2eTDUA8hCiJtklLCVeTG2YWAoEffdBFE6eXK5+aGMB/C/3L
 Q9fnA3vpEpUj1KKMA/JsyNM71nl1oM0grBOJx1ivCHe8cJwyjSydwfn3PY1UyxANomXg
 IwOclf8fjDAWClSZDyyZf9dESFQg0DyJgDkTKNFGzzqpOYiuK6dVHBQ4Y7l0stopymBH
 bUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qqu8m/9tcqm71+PI9aGfjbTBDkYS/QcNrCY5KIhFwaU=;
 b=Lloep9LfDJoVQkZU4X8REg4g4QafgTU/6g4z2qBJR5YH7cHgMxfqNvWLz5nVY+WEFq
 ks38qQzweMIS5BnxnmwBQsnqejot0kHWfOQQUxvzzn/OoEDgZv4uabrwYdym4Qq0iS1P
 ES68njKreunS1bdifjIvogrEeY6bZX94JOIgMbvGxrNU6CdM0ByB+tOSFk0TK8VKh67f
 R7fR7nqKrLLvwz1BY8YSqKlOOoi35ujS84i09P+SPFU6KGalY6W8UmQ3KP1deKChqYFJ
 L2WY/bIDQFk4kvr/68a/O/tvmqLFTFGbFEPtKQJis4NNcPifTJwMEDdn5gBOIiunMQio
 cjjA==
X-Gm-Message-State: APjAAAVlxkkfK9X3XMZltyfGPQTVDowWA4LQ0ImevgMaOyKPuiAZ5Zes
 IGTIAepV3GaFB2KNRN5o2Tan3Z82
X-Google-Smtp-Source: APXvYqyJT6uyqfT1+HJm0b/Gl8VY8J27oVrllPPkDJn4RN2MEC/nh/mJsyT0yRwXXAT4UApb8GJ3SQ==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr558828wmj.168.1579827133961;
 Thu, 23 Jan 2020 16:52:13 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id s139sm4598271wme.35.2020.01.23.16.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 16:52:13 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, S.E.Harris@kent.ac.uk,
 thuth@redhat.com, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, imammedo@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fam Zheng <fam@euphon.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, aleksandar.m.mail@gmail.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 dovgaluk@ispras.ru, Eduardo Habkost <ehabkost@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH rc2 17/25] target/avr: Update MAINTAINERS file
Date: Fri, 24 Jan 2020 01:51:23 +0100
Message-Id: <20200124005131.16276-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200124005131.16276-1-f4bug@amsat.org>
References: <20200124005131.16276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Fri, 24 Jan 2020 00:52:23 -0000

From: Michael Rolnik <mrolnik@gmail.com>

Include AVR maintaners in MAINTAINERS file

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20200118191416.19934-22-mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[rth: Squash ordering fixes from f4bug]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
rc2: Remove hw/misc/avr_mask (renamed as hw/misc/atmel_power)
---
 MAINTAINERS | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c768ed3d8..066515ac8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -163,6 +163,14 @@ S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
 
+AVR TCG CPUs
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: target/avr/
+F: default-configs/avr-softmmu.mak
+F: gdb-xml/avr-cpu.xml
+
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
@@ -880,6 +888,22 @@ F: include/hw/*/nrf51*.h
 F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
 
+AVR Machines
+-------------
+
+Atmel MCU
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: hw/avr/
+F: hw/char/atmel_usart.c
+F: include/hw/char/atmel_usart.h
+F: hw/timer/atmel_timer16.c
+F: include/hw/timer/atmel_timer16.h
+F: hw/misc/atmel_power.c
+F: include/hw/misc/atmel_power.h
+F: tests/acceptance/machine_avr6.py
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.21.1


