Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW0ah-0000ac-I9
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 13:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lW0af-0000Ys-LE; Mon, 12 Apr 2021 13:43:13 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lW0ac-0000Wj-Vh; Mon, 12 Apr 2021 13:43:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618249379; cv=none; d=zohomail.in; s=zohoarc; 
 b=b+dv06hUWXKWxIOKegPvd2XAZlajctfxrxahYvZv3ciBmGTdYvA3mYi++jymjV/wgKDzxBhfJaA9ckNVJBKkNc2gpUCneBrOLhTIkrdWUVOROUhvdJIDMDMw09dMTuJqemf9BnnDzB0x7NTnUmBzvCsYmLUF5tBrZtV57PBZi/4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1618249379;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=NqEBvyBkUWMyqT1aEs2cawZtrhEfGIpjP27VgayNH5k=; 
 b=JXuImHr+rKRGP4a433SOD71zzVmjVQKwumzih0hXrJ2VRJNZza8TpPiThX2YTldfRKXIUB1nne6ZMR8Mjf+A35GrgKyvl/WARCwwwcwzOw9NlFAblnS+7TIBMvuat8MUSBu1w8Bo4iUXSAYn9YEr+RpDfE8jQetdNjKPM7Scjn0=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1618249379; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=NqEBvyBkUWMyqT1aEs2cawZtrhEfGIpjP27VgayNH5k=;
 b=JYCjumtWx8rRR14isW8twfNxBcsZtvpgSo1eYcC3I0kkbm0LbQAwnwoHtBWXM/FN
 Y/iOzaNwaC7gd+Ll2AJJkRgIeQcTytKdM92SO7+ehY5P5kRvZUnZp8zSJnb8VIi3xua
 ET7vPPR1x0T1D9ViPvtPHxHUUhCBKsxNs5Reu84k=
Received: from localhost.localdomain (49.207.197.211 [49.207.197.211]) by
 mx.zoho.in with SMTPS id 1618249378272518.6965502542902;
 Mon, 12 Apr 2021 23:12:58 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210412174248.8668-1-vijai@behindbytes.com>
Subject: [PATCH] docs: Add documentation for shakti_c machine
Date: Mon, 12 Apr 2021 23:12:48 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 12 Apr 2021 17:43:13 -0000

Add documentation for Shakti C reference platform.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 docs/system/riscv/shakti-c.rst | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 docs/system/riscv/shakti-c.rst

diff --git a/docs/system/riscv/shakti-c.rst b/docs/system/riscv/shakti-c.rs=
t
new file mode 100644
index 0000000000..a6035d42b0
--- /dev/null
+++ b/docs/system/riscv/shakti-c.rst
@@ -0,0 +1,82 @@
+Shakti C Reference Platform (``shakti_c``)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Shakti C Reference Platform is a reference platform based on arty a7 100t
+for the Shakti SoC.
+
+Shakti SoC is a SoC based on the Shakti C-class processor core. Shakti C
+is a 64bit RV64GCSUN processor core.
+
+For more details on Shakti SoC, please see:
+https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/fpga/board=
s/artya7-100t/c-class/README.rst
+
+For more info on the Shakti C-class core, please see:
+https://c-class.readthedocs.io/en/latest/
+
+Supported devices
+-----------------
+
+The ``shakti_c`` machine supports the following devices:
+
+ * 1 C-class core
+ * Core Level Interruptor (CLINT)
+ * Platform-Level Interrupt Controller (PLIC)
+ * 1 UART
+
+Boot options
+------------
+
+The ``shakti_c`` machine can start using the standard -bios
+functionality for loading the baremetal application or opensbi.
+
+Boot the machine
+----------------
+
+Shakti SDK
+~~~~~~~~~~
+Shakti SDK can be used to generate the baremetal example UART applications=
.
+
+.. code-block:: bash
+
+   $ git clone https://gitlab.com/behindbytes/shakti-sdk.git
+   $ cd shakti-sdk
+   $ make software PROGRAM=3Dloopback TARGET=3Dartix7_100t
+
+Binary would be generated in:
+  software/examples/uart_applns/loopback/output/loopback.shakti
+
+You could also download the precompiled example applicatons using below
+commands.
+
+.. code-block:: bash
+
+   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/s=
dk/shakti_sdk_qemu.zip
+   $ unzip shakti_sdk_qemu.zip
+
+Then we can run the UART example using:
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M shakti_c -nographic \
+      -bios path/to/shakti_sdk_qemu/loopback.shakti
+
+OpenSBI
+~~~~~~~
+We can also run OpenSBI with Test Payload.
+
+.. code-block:: bash
+
+   $ git clone https://github.com/riscv/opensbi.git -b v0.9
+   $ cd opensbi
+   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/d=
ts/shakti.dtb
+   $ export CROSS_COMPILE=3Driscv64-unknown-elf-
+   $ export FW_FDT_PATH=3D./shakti.dtb
+   $ make PLATFORM=3Dgeneric
+
+fw_payload.elf would be generated in build/platform/generic/firmware/fw_pa=
yload.elf.
+Boot it using the below qemu command.
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M shakti_c -nographic \
+      -bios path/to/fw_payload.elf
--=20
2.25.1



