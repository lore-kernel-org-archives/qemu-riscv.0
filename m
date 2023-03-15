Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVGF-0003eo-13
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFx-0002SO-4x
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:48 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFe-0002BQ-5H
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso1584010wmr.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jq6hxeJvtxl+2hc076HR0v7mq5ZkbtUv1Uhl1DVVlCE=;
 b=JoW+jfgH2ZSGaEGWNB1c86mJrHTmFwhbNALMh5n0IgddNo1vkrMorDjqVZvR5zDYyB
 E9D/TRIOKM7zII0KRnTs69PFwi21fI+mmi4y0l+s+TcHEz4bTD7IVx4mhIymk5s+coD7
 wGyBe3LliNocveapx/qlv2jek+6eEVPeVHepiYeI+7KYQqv7i+fGYtHYFkNRb9JmXRUJ
 dGOOwPnuVj6PCrbQNUqXEEinXq4f9Fivg6UUQi0y3DXAk2sUoHrjGUG9rGPPts+yij6+
 S91MVP53BG1C93gVX/WpyA0fmjtHXIZ0jTCb07KyHGfypwOxB3dr418TLIsLPWXw6hfi
 lM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jq6hxeJvtxl+2hc076HR0v7mq5ZkbtUv1Uhl1DVVlCE=;
 b=OxhvYF/eLhueQMKwKZClVGT0YHvtueSlJoAZplOXLVgmyECRO/yrxCa4vdIhhuwkVb
 cDKbThI4Koems2cl611dmeR7VQUTWIl+tJ6yYH+0AUSwlX5GPTSsgCmN9DX4gmqiaw5o
 jqaxa9IuLt3ir9m+AOLFpAlgzVO4Rv8WmyCxcus6XD+zk/sKv1gb/6XHXcTSaL2M9ljk
 eoT2OVy7JmPgVt0qwyjPjisu/gTVhI5ufrJ1skMNf8lMaPtD1t9Uduye0ilotFzMob4B
 a80hv9g+LG27w0C3sJv6X0r31C0a42hOhgOLwDMC1LyeCvctzK8ozMJMZnoZyb+HXk92
 IYvQ==
X-Gm-Message-State: AO0yUKXQEqi3DnDf9YBhkRPpS0GU0IxInFQ1WQZqZOLZpWDsMLyqin1Z
 XumIbDJrqp0LOE7FiWgljrSn3g==
X-Google-Smtp-Source: AK7set/4uUeLsWCDFPqKaCldv8PKAYfIYVJ5odmhFOzMgRKZP5LCNYBDfcUOkKbdOk8IDGiVM/Q3pw==
X-Received: by 2002:a05:600c:4450:b0:3eb:36fa:b791 with SMTP id
 v16-20020a05600c445000b003eb36fab791mr17432486wmn.31.1678902564253; 
 Wed, 15 Mar 2023 10:49:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003ed23845666sm2459424wmq.45.2023.03.15.10.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4650A1FFCE;
 Wed, 15 Mar 2023 17:43:44 +0000 (GMT)
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 23/32] iotests: always use a unique sub-directory per test
Date: Wed, 15 Mar 2023 17:43:22 +0000
Message-Id: <20230315174331.2959-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:49:50 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

The current test runner is only safe against parallel execution within
a single instance of the 'check' process, and only if -j is given a
value greater than 2. This prevents running multiple copies of the
'check' process for different test scenarios.

This change switches the output / socket directories to always include
the test name, image format and image protocol. This should allow full
parallelism of all distinct test scenarios. eg running both qcow2 and
raw tests at the same time, or both file and nbd tests at the same
time.

It would be possible to allow for parallelism of the same test scenario
by including the pid, but that would potentially let many directories
accumulate over time on failures, so is not done.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-7-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/testrunner.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 81519ed6e2..7b322272e9 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -228,13 +228,11 @@ def find_reference(self, test: str) -> str:
 
         return f'{test}.out'
 
-    def do_run_test(self, test: str, mp: bool) -> TestResult:
+    def do_run_test(self, test: str) -> TestResult:
         """
         Run one test
 
         :param test: test file path
-        :param mp: if true, we are in a multiprocessing environment, use
-                   personal subdirectories for test run
 
         Note: this method may be called from subprocess, so it does not
         change ``self`` object in any way!
@@ -257,12 +255,14 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
 
         args = [str(f_test.resolve())]
         env = self.env.prepare_subprocess(args)
-        if mp:
-            # Split test directories, so that tests running in parallel don't
-            # break each other.
-            for d in ['TEST_DIR', 'SOCK_DIR']:
-                env[d] = os.path.join(env[d], f_test.name)
-                Path(env[d]).mkdir(parents=True, exist_ok=True)
+
+        # Split test directories, so that tests running in parallel don't
+        # break each other.
+        for d in ['TEST_DIR', 'SOCK_DIR']:
+            env[d] = os.path.join(
+                env[d],
+                f"{self.env.imgfmt}-{self.env.imgproto}-{f_test.name}")
+            Path(env[d]).mkdir(parents=True, exist_ok=True)
 
         test_dir = env['TEST_DIR']
         f_bad = Path(test_dir, f_test.name + '.out.bad')
@@ -347,7 +347,7 @@ def run_test(self, test: str,
             testname = os.path.basename(test)
             print(f'# running {self.env.imgfmt} {testname}')
 
-        res = self.do_run_test(test, mp)
+        res = self.do_run_test(test)
 
         end = datetime.datetime.now().strftime('%H:%M:%S')
         self.test_print_one_line(test=test,
-- 
2.39.2


