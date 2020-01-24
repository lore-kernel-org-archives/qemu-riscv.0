Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iunDB-00030c-Kp
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jan 2020 19:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunD4-0002tF-Ei
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 19:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunD3-0005t0-6S
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 19:52:30 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33401)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iunD0-0005ih-0u; Thu, 23 Jan 2020 19:52:26 -0500
Received: by mail-wr1-x441.google.com with SMTP id b6so93268wrq.0;
 Thu, 23 Jan 2020 16:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/V3ZxLfy/2R74Pz6NGLpeVPUx20O4nw7Zu8GDJsXKQ=;
 b=IYu+2GNm1smweyx+X98CjqnJ3S4SzAqZWw3cb0gpjbCAPJt32isR2vs3ED0P52Vv5Z
 U3zlsKB/+YT9+GtQ5+Ho9iR10bCEh4oyUxCHJiAQvFipenNzHBn0XeWO+8fhKfcjh6Lj
 zAWdiIVQikjyRhsVwTajluZwZ5XjL9TENVQuCWM3THl3nRV8kAgd+gT4/Iuk8fYGqFBK
 DI7hDbHTYrYR7IdU0o8NvWhyF9Z2Cg1c0g4tnRDVVQq9TC9udfN7u/1uZoKUa7QzgBbC
 2e1kXOIKi4dbHQ25pPYEGQk3jAalha20bTOyJrjZdKod2vkcEjbtJuxbIb+LHr0GYfp6
 tb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R/V3ZxLfy/2R74Pz6NGLpeVPUx20O4nw7Zu8GDJsXKQ=;
 b=oAE5gyjZyUsvblmBZ/WFCCoWlGDx5doVaBDTfNmgVCZi+0+g8IqW0eD+3NdFCjDp/R
 byyXPAsDkyuLMhuq7GSSiJoTLzrivpO3EXRx4aPLJDy32/hUXc6J/Vf+4OEZbjyDHp/c
 ub/uluPRUh+xozZo0tUA+OByrWxKZoLejWBQ/MZJvbcBclHTTnRvvTpf2UQgdcY+++cX
 nYrKewNa9PvBylNZ8egl7Y+uBCKCnAkyNTPdUrvzp0q8N/EE0eUtM4luldBB/YVoaFwt
 eLLTnrC80HsfHts8ViYTFMXUwI40JQoVuYpDMlpuALwd7wFJY6KemPfJFILUe513SS4P
 ez5g==
X-Gm-Message-State: APjAAAWmZWCbyeA3D2e4TyCrU6a9w/oKDpiQDVbnbxPTzWmCJIHfziqd
 lo4rkB7UyonvksnloU1TZdeD0B+0
X-Google-Smtp-Source: APXvYqwqpcr0Tq7ZvKG6JB4a1F2M5IOToBnfXxqe9F1wsXeX9lgVh+q4ulGGbOjaxxO+WWAoIm3Njg==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr896473wro.105.1579827144799; 
 Thu, 23 Jan 2020 16:52:24 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id s139sm4598271wme.35.2020.01.23.16.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 16:52:24 -0800 (PST)
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
 Aleksandar Markovic <amarkovic@wavecomp.com>
Subject: [PATCH rc2 22/25] target/avr: Update build system
Date: Fri, 24 Jan 2020 01:51:28 +0100
Message-Id: <20200124005131.16276-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200124005131.16276-1-f4bug@amsat.org>
References: <20200124005131.16276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Fri, 24 Jan 2020 00:52:32 -0000

From: Michael Rolnik <mrolnik@gmail.com>

Make AVR support buildable

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20200118191416.19934-19-mrolnik@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                       |  7 +++++++
 default-configs/avr-softmmu.mak |  5 +++++
 target/avr/Makefile.objs        | 34 +++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 default-configs/avr-softmmu.mak
 create mode 100644 target/avr/Makefile.objs

diff --git a/configure b/configure
index 557e4382ea..94e79ca634 100755
--- a/configure
+++ b/configure
@@ -7612,6 +7612,10 @@ case "$target_name" in
     mttcg="yes"
     gdb_xml_files="aarch64-core.xml aarch64-fpu.xml arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml"
   ;;
+  avr)
+    gdb_xml_files="avr-cpu.xml"
+    target_compiler=$cross_cc_avr
+  ;;
   cris)
   ;;
   hppa)
@@ -7831,6 +7835,9 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
       disas_config "ARM_A64"
     fi
   ;;
+  avr)
+    disas_config "AVR"
+  ;;
   cris)
     disas_config "CRIS"
   ;;
diff --git a/default-configs/avr-softmmu.mak b/default-configs/avr-softmmu.mak
new file mode 100644
index 0000000000..80218add98
--- /dev/null
+++ b/default-configs/avr-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for avr-softmmu
+
+# Boards:
+#
+CONFIG_ARDUINO=y
diff --git a/target/avr/Makefile.objs b/target/avr/Makefile.objs
new file mode 100644
index 0000000000..7523e0c6e2
--- /dev/null
+++ b/target/avr/Makefile.objs
@@ -0,0 +1,34 @@
+#
+#  QEMU AVR CPU
+#
+#  Copyright (c) 2019 Michael Rolnik
+#
+#  This library is free software; you can redistribute it and/or
+#  modify it under the terms of the GNU Lesser General Public
+#  License as published by the Free Software Foundation; either
+#  version 2.1 of the License, or (at your option) any later version.
+#
+#  This library is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+#  Lesser General Public License for more details.
+#
+#  You should have received a copy of the GNU Lesser General Public
+#  License along with this library; if not, see
+#  <http://www.gnu.org/licenses/lgpl-2.1.html>
+#
+
+DECODETREE = $(SRC_PATH)/scripts/decodetree.py
+decode-y = $(SRC_PATH)/target/avr/insn.decode
+
+target/avr/decode_insn.inc.c: $(decode-y) $(DECODETREE)
+	$(call quiet-command, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn --insnwidth 16 $<, \
+	  "GEN", $(TARGET_DIR)$@)
+
+target/avr/translate.o: target/avr/decode_insn.inc.c
+
+obj-y += translate.o cpu.o helper.o
+obj-y += gdbstub.o
+obj-y += disas.o
+obj-$(CONFIG_SOFTMMU) += machine.o
-- 
2.21.1


