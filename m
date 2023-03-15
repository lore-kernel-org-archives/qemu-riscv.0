Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVA8-00020U-Iw
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA5-0001xR-Ix
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVA0-0000bh-B3
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:43:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1565282wmb.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9R+WJAtyA8SeJ/1as6Ou9Go9GUXAmG0Tw994EVyLcw=;
 b=ZhgBQUWyxDhfXpmiHE0qRJgUZoPsqcJNfS562fDJLhlpne/3qqTUMowB/RqfnxCDV9
 OpqoaVD2EBKJXMRVDbCjo4ulwDbCQokWJLYVm/dAp961A74gTdezvO5F1R13phhCECrG
 49E+uaQqfR/RQIJNvWwyAqraPCQZVMhQZnSO9B0kDtVhhBWO7gA85O0Vft/pzzYRTBh2
 76m2r1ATby/XIdrQ+hDgqEGM+XKHdpMDvrjefHNAmAwqiKn8h8rP6iax0Kp2b/ry8hTg
 EMEHxNXuzNgfNZhazljSnz2gayYU4Kkd8/4TIkpyemgIY4rMMyDJ6rgXuH2jEkdgBrAV
 Kvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9R+WJAtyA8SeJ/1as6Ou9Go9GUXAmG0Tw994EVyLcw=;
 b=sLepnV4ZVuencjT2hg/WeA9IhIqmL/UA+Kien9aVSFhqcLk2VRc0piEZtuu33fYDO3
 Y7xB870Tt94jmCu0+fKJHxqf9CvQX3kuvIid/YP9M6rZROe6AW361rIl0+TQj9dqZKi1
 7nPFF6LNCpWFxvzpAkYgP/WE2AZXK8hfgipaL9XWQAzLq8Bmkydbk2cvH5XK+z4FgX4r
 XM8i6E+KK+yL9mjunmcxvcEHkdOsML2vtYXEKmFG+XpiT9bzen36lRZaN66Y6X1kPt5D
 CJElsuf+1ViMIuAF7282EX7lc3PlGoAEbd7qJKf9RuwmB/nRmPl0rGnFYiJwwzrc3/D+
 heZQ==
X-Gm-Message-State: AO0yUKWSV16wqj1JT2VuT2cRXbGEtQim2Ibly2O/iQJQ9rtti+8nvqdN
 P09mcpBo4K3KoMJ5mjb3K97bhQ==
X-Google-Smtp-Source: AK7set/ybwaAP6a2UGo19c1DFXtRAlmxo2N51HdG5oEuaDeW1Zrj0alTLu6ZNgeLbw2TKH8sda6cPg==
X-Received: by 2002:a05:600c:4f91:b0:3eb:29fe:7b9e with SMTP id
 n17-20020a05600c4f9100b003eb29fe7b9emr17862933wmq.17.1678902213357; 
 Wed, 15 Mar 2023 10:43:33 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a7bc059000000b003e21f959453sm2460485wmc.32.2023.03.15.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 714F61FFBA;
 Wed, 15 Mar 2023 17:43:31 +0000 (GMT)
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
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 02/32] tests/docker: all add DOCKER_BUILDKIT to RUNC
 environment
Date: Wed, 15 Mar 2023 17:43:01 +0000
Message-Id: <20230315174331.2959-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:43:41 -0000

It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
itself to get the full benefit of caching.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Fabiano Rosas <farosas@suse.de>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 54ed77f671..9401525325 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 # General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	  $(call quiet-command,			\
-		$(RUNC) build				\
+		DOCKER_BUILDKIT=1 $(RUNC) build		\
 		$(if $V,,--quiet)			\
 		$(if $(NOCACHE),--no-cache,		\
 			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
-- 
2.39.2


