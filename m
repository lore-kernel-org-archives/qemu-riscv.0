Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAm-0002rG-Gv
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAY-0002Vx-GU
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAE-0000lK-M4
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1821206wmq.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yN/kmP3UzMt/cUifiAR045QSMUEZthdjOX5czXccge4=;
 b=dpi8rv4lnXlZ9UNk6lCXb0nyhYmaD9MjBTd/aJAgT2xzR6+d7nyhQXaqSbDlPxCAB8
 vYKdPDwBGZ9POtBOB+r9E+Ts4l3wodFzRzSVyC2kO9157PCDXy260qHGkHUP3Bi2znn/
 Jery4QwT45HgHsOI+c6+HEbOxgyjNXpd3MXGTrqlmeQFtY60QfuFgsPCYuEBJc9oHWcd
 i55gBSEesCom8qUA9iYT+6VYp+H5DQVtL879c3N+haePQJsgPMjeya9KFXTb4pX38mbO
 I90a/w/7PO/fMvOeYRJQGiXJ8RNqppieBvTKe5v9PvBEVYFS5MKb+JeSZjpDGVHFTpeR
 Oorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yN/kmP3UzMt/cUifiAR045QSMUEZthdjOX5czXccge4=;
 b=qarCNx5uel+WP558WoPUrF+JjrV4F7t4Ch01jsbNNxAExC62+9Up3BEvWWuY7wnDak
 SvXaaW/gGaMO3DDdDjOYt2JUx9fHJiJCJ489W/w/XTJXZw935s0xXtK2C+24WWoXgxxu
 VpXXNCfuXck2nZEP9uDsD5xkrsRn8k4VrOMK5SkGgDN9FFDLMdtQXsSvraCgacABKGN7
 9LydzA013FQg11kzxkv1rNuGQcMZEBXX2ZGS8fzTWuFE1ZBLdWvm5uAfR9Y5FAMuB3rd
 eqB96XY0arRIY8fJj2ab/NR7ZVK/TcxCEqDsOwV2Ef7nWS/YTYwgW0W+TBvcDpYHdlLj
 gqIg==
X-Gm-Message-State: AO0yUKWfgXKMlhZ4kb6Gn2ibZOtVQ4pxqXPln93oiSOIrid5vpco39YF
 8fDamwjpCLdTKfvfPbez8R2XFw==
X-Google-Smtp-Source: AK7set+vJwM0yy8e5btAFhvysicYL2B6xeLTt9PEugX/nMNrxIbhbmQEHo6xJj0enuZRkqL+ERiKeA==
X-Received: by 2002:a05:600c:3ac8:b0:3eb:3f2d:f237 with SMTP id
 d8-20020a05600c3ac800b003eb3f2df237mr18572279wms.6.1678902228767; 
 Wed, 15 Mar 2023 10:43:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a1c7708000000b003ed2276cd0dsm2489997wmi.38.2023.03.15.10.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C44A1FFCD;
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
Subject: [PATCH v2 21/32] iotests: print TAP protocol version when reporting
 tests
Date: Wed, 15 Mar 2023 17:43:20 +0000
Message-Id: <20230315174331.2959-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:12 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

Recently meson started complaining that TAP test reports don't include
the TAP protocol version. While this warning is bogus and has since been
removed from Meson, it looks like good practice to include this header
going forward. The GLib library test harness has started unconditionally
printing the version, so this brings the I/O tests into line.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-5-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/testrunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 5a771da86e..e734800b3d 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -391,6 +391,7 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
         casenotrun = []
 
         if self.tap:
+            print('TAP version 13')
             self.env.print_env('# ')
             print('1..%d' % len(tests))
         else:
-- 
2.39.2


