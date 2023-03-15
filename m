Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVG8-0002rX-Vm
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFk-0001oG-AZ
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFa-00028G-DH
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso1583822wmr.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kz7lt0xm5BPRCHm1G6eqVDryZ05MXO1c0h+JE0rLmmA=;
 b=bNaT2vpbbehdm/qIsy3+TgfhjrFJ3XJLHmB6VUL1Zs3hbPlEekL4nMPtCEWVbHGIft
 +uqqJZze+SzlmR5+XbGswOw2gV28QZykyeKQDCduFr3rCosoyao3ujrKh73H9FAEK/A9
 Zc0rZCrYEEt49SCLyLy6SS7DN7dNMpnehLLgcEU33rRKhymSQiL1ZrY0n+z4UtfTsXMu
 7VkEsida0B+zZdCuwHbV+9MZo4FhFi2JmUxbHHPtBQWCQPwBd49YnWjDYYwS7G985rJe
 gT/k5NFq+3dS3UcnUH1wtWCHqBChTYagQB9kvw/T3NHUHpyxr7iCWHkLdm0ZYzB0a672
 WlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kz7lt0xm5BPRCHm1G6eqVDryZ05MXO1c0h+JE0rLmmA=;
 b=sc11IjV0L6EaQb0+gn53jbLpyJipbfNO+14VyUh8+DVn2cSGQ9t7TwJb4zrmmMwzfM
 U0WjSp2iiycZFWhrmeeKloaG7dImr0rnJi5SHQyx2zOvWKel+rh6Ye9g+zJNwJan1GcT
 4F1kXG60aXpYChVfUolt2p7YUtdD3IwQzAZAhc9AocbFTQhpZBx+YRgXuYLL6uLmRKSH
 p/R4/E2GkFy98CMkpZb9e9V16MgrbuwcRgU2/aIZLq2FbvjC1b11OICg/NOUCajSOftF
 5nyRvLkiLjNa6dFORi/pf2CI1S1xh09vx2l2EyDTy5lttEawMnDNGqmMCE9ifdb/TGe2
 zPGA==
X-Gm-Message-State: AO0yUKXgzKGYk4mJgOCQctjwsEElrPUYdKoEv4GzFqoSLUKeUvsY2h/h
 tuH5apq4OEZUVNfFBCgZsE+QAA==
X-Google-Smtp-Source: AK7set+W3U2ebB184rL4uN6qOAW5BkAnAwjXheuRqduGYN8670olbbrt8buVpX+hsof9NfwroTRX/A==
X-Received: by 2002:a05:600c:1c17:b0:3ed:2f7b:daf with SMTP id
 j23-20020a05600c1c1700b003ed2f7b0dafmr4623147wms.10.1678902560244; 
 Wed, 15 Mar 2023 10:49:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c059300b003eb68bb61c8sm2680607wmd.3.2023.03.15.10.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62FEE1FFC1;
 Wed, 15 Mar 2023 17:43:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2 10/32] tests/avocado: don't use tags to define drive
Date: Wed, 15 Mar 2023 17:43:09 +0000
Message-Id: <20230315174331.2959-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Mar 2023 17:49:33 -0000
X-List-Received-Date: Wed, 15 Mar 2023 17:49:33 -0000

We are abusing the avocado tags which are intended to provide test
selection metadata to provide parameters to our test. This works OK up
until the point you need to have ,'s in the field as this is the tag
separator character which is the case for a number of the drive
parameters. Fix this by making drive a parameter to the common helper
function.

Fixes: 267fe57c23 (tests: add tuxrun baseline test to avocado)
Message-Id: <20230310103123.2118519-12-alex.bennee@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 60 +++++++++++++------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 30aaefc1d3..c3fb67f5dc 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -67,9 +67,6 @@ def setUp(self):
         # The name of the kernel Image file
         self.image = self.get_tag('image', "Image")
 
-        # The block device drive type
-        self.drive = self.get_tag('drive', "virtio-blk-device")
-
         self.root = self.get_tag('root', "vda")
 
         # Occasionally we need extra devices to hook things up
@@ -99,7 +96,7 @@ def fetch_tuxrun_assets(self, dt=None):
 
         return (kernel_image, self.workdir + "/rootfs.ext4", dtb)
 
-    def prepare_run(self, kernel, disk, dtb=None, console_index=0):
+    def prepare_run(self, kernel, disk, drive, dtb=None, console_index=0):
         """
         Setup to run and add the common parameters to the system
         """
@@ -121,10 +118,8 @@ def prepare_run(self, kernel, disk, dtb=None, console_index=0):
         if self.extradev:
             self.vm.add_args('-device', self.extradev)
 
-        # Some machines already define a drive device
-        if self.drive != "none":
-            self.vm.add_args('-device',
-                             f"{self.drive},drive=hd0")
+        self.vm.add_args('-device',
+                         f"{drive},drive=hd0")
 
         # Some machines need an explicit DTB
         if dtb:
@@ -154,7 +149,9 @@ def run_tuxtest_tests(self, haltmsg):
         else:
             self.vm.wait()
 
-    def common_tuxrun(self, dt=None, haltmsg="reboot: System halted",
+    def common_tuxrun(self, dt=None,
+                      drive="virtio-blk-device",
+                      haltmsg="reboot: System halted",
                       console_index=0):
         """
         Common path for LKFT tests. Unless we need to do something
@@ -163,7 +160,7 @@ def common_tuxrun(self, dt=None, haltmsg="reboot: System halted",
         """
         (kernel, disk, dtb) = self.fetch_tuxrun_assets(dt)
 
-        self.prepare_run(kernel, disk, dtb, console_index)
+        self.prepare_run(kernel, disk, drive, dtb, console_index)
         self.vm.launch()
         self.run_tuxtest_tests(haltmsg)
 
@@ -206,11 +203,11 @@ def test_armv5(self):
         :avocado: tags=machine:versatilepb
         :avocado: tags=tuxboot:armv5
         :avocado: tags=image:zImage
-        :avocado: tags=drive:virtio-blk-pci
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(dt="versatile-pb.dtb")
+        self.common_tuxrun(drive="virtio-blk-pci",
+                           dt="versatile-pb.dtb")
 
     def test_armv7(self):
         """
@@ -244,10 +241,9 @@ def test_i386(self):
         :avocado: tags=machine:q35
         :avocado: tags=tuxboot:i386
         :avocado: tags=image:bzImage
-        :avocado: tags=drive:virtio-blk-pci
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="virtio-blk-pci")
 
     def test_mips32(self):
         """
@@ -257,11 +253,10 @@ def test_mips32(self):
         :avocado: tags=endian:big
         :avocado: tags=tuxboot:mips32
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips32el(self):
         """
@@ -270,11 +265,10 @@ def test_mips32el(self):
         :avocado: tags=cpu:mips32r6-generic
         :avocado: tags=tuxboot:mips32el
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     @skip("QEMU currently broken") # regression against stable QEMU
     def test_mips64(self):
@@ -284,11 +278,10 @@ def test_mips64(self):
         :avocado: tags=tuxboot:mips64
         :avocado: tags=endian:big
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips64el(self):
         """
@@ -296,11 +289,10 @@ def test_mips64el(self):
         :avocado: tags=machine:malta
         :avocado: tags=tuxboot:mips64el
         :avocado: tags=image:vmlinux
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_ppc32(self):
         """
@@ -309,10 +301,9 @@ def test_ppc32(self):
         :avocado: tags=cpu:e500mc
         :avocado: tags=tuxboot:ppc32
         :avocado: tags=image:uImage
-        :avocado: tags=drive:virtio-blk-pci
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="virtio-blk-pci")
 
     def test_ppc64(self):
         """
@@ -324,10 +315,9 @@ def test_ppc64(self):
         :avocado: tags=tuxboot:ppc64
         :avocado: tags=image:vmlinux
         :avocado: tags=extradev:driver=spapr-vscsi
-        :avocado: tags=drive:scsi-hd
         :avocado: tags=root:sda
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="scsi-hd")
 
     def test_ppc64le(self):
         """
@@ -338,10 +328,9 @@ def test_ppc64le(self):
         :avocado: tags=tuxboot:ppc64le
         :avocado: tags=image:vmlinux
         :avocado: tags=extradev:driver=spapr-vscsi
-        :avocado: tags=drive:scsi-hd
         :avocado: tags=root:sda
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="scsi-hd")
 
     def test_riscv32(self):
         """
@@ -365,10 +354,10 @@ def test_s390(self):
         :avocado: tags=endian:big
         :avocado: tags=tuxboot:s390
         :avocado: tags=image:bzImage
-        :avocado: tags=drive:virtio-blk-ccw
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(haltmsg="Requesting system halt")
+        self.common_tuxrun(drive="virtio-blk-ccw",
+                           haltmsg="Requesting system halt")
 
     # Note: some segfaults caused by unaligned userspace access
     @skipIf(os.getenv('GITLAB_CI'), 'Skipping unstable test on GitLab')
@@ -380,7 +369,6 @@ def test_sh4(self):
         :avocado: tags=tuxboot:sh4
         :avocado: tags=image:zImage
         :avocado: tags=root:sda
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=console:ttySC1
         """
         # The test is currently too unstable to do much in userspace
@@ -388,7 +376,9 @@ def test_sh4(self):
         (kernel, disk, dtb) = self.fetch_tuxrun_assets()
 
         # the console comes on the second serial port
-        self.prepare_run(kernel, disk, console_index=1)
+        self.prepare_run(kernel, disk,
+                         "driver=ide-hd,bus=ide.0,unit=0",
+                         console_index=1)
         self.vm.launch()
 
         self.wait_for_console_pattern("Welcome to TuxTest")
@@ -404,10 +394,9 @@ def test_sparc64(self):
         :avocado: tags=tuxboot:sparc64
         :avocado: tags=image:vmlinux
         :avocado: tags=root:sda
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_x86_64(self):
         """
@@ -417,7 +406,6 @@ def test_x86_64(self):
         :avocado: tags=tuxboot:x86_64
         :avocado: tags=image:bzImage
         :avocado: tags=root:sda
-        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
-- 
2.39.2


