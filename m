Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAT-0002Si-Bo
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAS-0002Pm-19
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAB-0000dR-Uj
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id o7so8677387wrg.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIvbfo0IIlc3X5pccePnUec4yCPh7dln0aorBfnrbhQ=;
 b=QRGJf3yo39nlVeahj8Lp9NaZDSwquXrLTwIb/t4B9gkjzWQDgqBKG8QTo09F8dXsZ7
 hB1H/PN0GN8IwDvY8VOdymgBj36108d1Jb74hOi4HT9fZOdKBsOxzyB1UPIT47YLy56x
 /gqBIA2Zwb+Rkoph5ksfCL+dbcU1ZrYmGN1CH6PFmWiNygiPwJvX4hSSyUAQQuTiX7Aj
 9fXSVtZIu1D5tfuG2QmL5VD4CWddpUjUVCS3wYfGZKpvDKCjXEcRygCr1o8h2HdC6Ipm
 hTaxNl8n03dxk/hDwgXtbLuE6CGVSuH0x4fKDmu6hxqkZwyGclbL5zj88b6Cmn12gV51
 skug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIvbfo0IIlc3X5pccePnUec4yCPh7dln0aorBfnrbhQ=;
 b=QCLN5WY6T3E2RWGI19wZNTCHR3+UXGvy71NFxiFMNaEpibWsYtmWEclZW+HehnixYo
 sRjqlp9E/r+YLpki9VsmOzLaDBw7kANQq3QjAx5UvGh0cjeD9+PeX3hu1rTcJuLp5qnS
 GIbVfgaQOZsjokszUPBWgmY4JwcNxXf2rp4+AWZ5b3FAerkbjKCkfGb6fbkGzAkysIKb
 dEFjMq5iys4O3ytLORU4t8nXxYeYZZvr/SDR93va0YJZwOfI1xgdVQBZw5B8d7wZPqsw
 TOmy57JksLexsyADgftUZ4Bk31vPDRXgzFS7GeeAKQuoEoScWFEoBmkDtiSCAmnLxsNg
 A6rQ==
X-Gm-Message-State: AO0yUKXgiLc7iUWkYWiOT3RRY447cK8tKqK7o65aErTRzeAUjFTRWlju
 wjdl4VdVWxvTcD6qlt0g5a9r/A==
X-Google-Smtp-Source: AK7set/Sqx6+rKkNHlHjpNr7jRBVe5HgG8HeI/V+mlbGqqUMmj8WB11gZXPPf9pygNtJ0t0E5EUiaA==
X-Received: by 2002:a5d:6888:0:b0:2cf:f2f9:5aac with SMTP id
 h8-20020a5d6888000000b002cff2f95aacmr2751970wru.45.1678902226906; 
 Wed, 15 Mar 2023 10:43:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d68cc000000b002ceacff44c7sm5166876wrw.83.2023.03.15.10.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9E531FFCB;
 Wed, 15 Mar 2023 17:43:43 +0000 (GMT)
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
Subject: [PATCH v2 19/32] iotests: allow test discovery before building
Date: Wed, 15 Mar 2023 17:43:18 +0000
Message-Id: <20230315174331.2959-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:04 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

The 'check' script can be invoked in "dry run" mode, in which case it
merely does test discovery and prints out all their names. Despite only
doing test discovery it still validates that the various QEMU binaries
can be found. This makes it impossible todo test discovery prior to
building QEMU. This is a desirable feature to support, because it will
let meson discover tests.

Fortunately the code in the TestEnv constructor is ordered in a way
that makes this fairly trivial to achieve. We can just short circuit
the constructor after the basic directory paths have been set.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/check      | 3 ++-
 tests/qemu-iotests/testenv.py | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index da7e8a87fe..bb294ef556 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -145,7 +145,8 @@ if __name__ == '__main__':
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
-                  gdb=args.gdb, qprint=args.print)
+                  gdb=args.gdb, qprint=args.print,
+                  dry_run=args.dry_run)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index aa9d735414..9a37ad9152 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -178,7 +178,8 @@ def __init__(self, source_dir: str, build_dir: str,
                  debug: bool = False,
                  valgrind: bool = False,
                  gdb: bool = False,
-                 qprint: bool = False) -> None:
+                 qprint: bool = False,
+                 dry_run: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -218,6 +219,10 @@ def __init__(self, source_dir: str, build_dir: str,
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
         self.init_directories()
+
+        if dry_run:
+            return
+
         self.init_binaries()
 
         self.malloc_perturb_ = os.getenv('MALLOC_PERTURB_',
-- 
2.39.2


