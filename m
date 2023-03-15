Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAH-0002DG-14
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAE-00028o-44
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA2-0000eC-Cd
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso1832475wmo.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrymPH9qdF1LbwV8gLjsNCVK43k9DRaIqJfuQ5UvnQo=;
 b=r+XcLhj4ZE5rQGq6TiYnDWjpokJc5T9W32j4/kKFwhSfOdQhQs85QNp+z1OW/mV6c1
 23pd5GyiofG86rXDn+2ZVEXAThoXtwOo+S4Gn0DbHbWTRw1MWbc1CGSiycOeoC08THmH
 vOSC2gAb/qsHJX7zqj2iGTypfu5ymeVlHFcTd+8HoQJ1qnGvwrcmd2/uk9E635HUG7+p
 yPH97ygrfvVx2OIpPyaXpx7uYS2+d3rnIoCQIaLCGeOmnSlOrBdf645qkof5JABSK8ff
 7OIYUOSz6b0S4LbhGngax7H6ZcB6VC86MJAtQQm6BmsO3qqFG9u7O177mMIPOtkMDWXT
 ZBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrymPH9qdF1LbwV8gLjsNCVK43k9DRaIqJfuQ5UvnQo=;
 b=B3MtLBAxRppbun+0ApghwptPmpcy96ByNUWnl6zWzRCR747dtx/Lwa/uHrD2myUAza
 sWY3Y+2+EODleuurIeNflxzWpsvxBXtNTDdTN6uJlThxEz0GFrbdtF7zBJwWDP0bcVqV
 vSILMs862rlNpjHoBNzREzBkDnNZ4MuAClnqaN6YeTFrI2t7JqIOptQL1XjjUnS7lxoY
 npGMrtwwWrdXvI0Mv/TzKINBPZd9SPkPcQOFAZZVcUyvk8Rs/9JCTvlpjhixuacUzIhY
 dHrlyoTHBoA2rbKP53eOx8BksrcEeV84stureofkvDNPyFBvqrl5Kjed2t3En78j+YJs
 +uzg==
X-Gm-Message-State: AO0yUKVRPTBIaQVIlQm8mFLpNZ+PUQD3XEQ2zLCEYU0Qc+54fVWVQJ5d
 nsuJbOf8/KhdutUEdybhCY4bbg==
X-Google-Smtp-Source: AK7set9mNgRWdVa/Sl3ht5HW9D20+DV44igEbogmxcj4oqBoXJBmTKUe2ZCRMwiPhyrSnb8iyv9JbA==
X-Received: by 2002:a05:600c:1c95:b0:3e2:1ef0:f585 with SMTP id
 k21-20020a05600c1c9500b003e21ef0f585mr19371145wms.2.1678902216664; 
 Wed, 15 Mar 2023 10:43:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b002c55ec7f661sm5352712wrp.5.2023.03.15.10.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CD8D1FFBF;
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 07/32] tests/tcg: add some help output for running
 individual tests
Date: Wed, 15 Mar 2023 17:43:06 +0000
Message-Id: <20230315174331.2959-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:43:50 -0000

So you can do:

  cd tests/tcg/aarch64-linux-user
  make -f ../Makefile.target help

To see the list of tests. You can then run each one individually.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index a3b0aaf8af..8318caf924 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -201,3 +201,10 @@ clean:
 
 distclean:
 	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
+
+.PHONY: help
+help:
+	@echo "TCG tests help $(TARGET_NAME)"
+	@echo "Built with $(CC)"
+	@echo "Available tests:"
+	@$(foreach t,$(RUN_TESTS),echo "  $t";)
-- 
2.39.2


