Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVG9-0002yM-No
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFq-0002KT-4d
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:38 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFd-0002Ao-JS
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r29so10051003wra.13
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppSEIztWs3xXXlNFmxb7gCAEPQ7PlB98pYGLeW4YOYE=;
 b=WIO3ei+bYW7ojkqoukS+1PJLDudVTHC6RYsQF8hYA5vEQyo2CFtShEbvs0+omK2dcf
 dHIPYNEucLD1qgZ+YHpLk4QZww4ts2+QRHBBgu0XqttzygMdHCzbwYEsrivMNNjuxO1/
 Hf0+uxEmKTqMHLJ+Je7miLs8erttyjnqU6BbkoSC348P+JhGOwmce8mbog/KJ4iT/R64
 tHF+IPu69rmbHK07Bj60SYaxfQL8BCKlxQNtnPuUUZMjGGCNnT9Kqh3Bf57bLjwHvIEB
 2seWWKTdwhhNbvJeHp5W9sgHtv/0lOHROuPzyjsycDYf/r7QZ/c3B6KPiMFKhkj9zO6x
 I8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppSEIztWs3xXXlNFmxb7gCAEPQ7PlB98pYGLeW4YOYE=;
 b=D7CvyHIzfDSI1ZOyI8TWUNzP0uEQqdlZHJUYOBtfG06dCZyZZwmC+Or8U17H9xis6O
 Wx+wz2ZaGdbK0l4Bar9Bc4uWZIvWcw+0JaLGxEZ6iNGywKbXYP/kwqMEsAnX0xHCp7tD
 Lpnmo4senNY7MWN1sfkflGJ41w4El+ysirU03mkgSUlApyndz92yZDLGiNWJlPA1BfIM
 WOKnUqniyalKTng++TQHwn7YEf0Lts3HclvZ1bKA3U6/yHnH/GlL12KDNv2hl3v8HDWS
 0ItUMEUPXKe3S497i9PfK2APEk5q5HgyCpxaNnNoiflM75nJDZBZrX8wCzIQjAs4UWBV
 7H3g==
X-Gm-Message-State: AO0yUKWzftgyyPITnJVqdkKG6XzCNJRqo2yHVkHSeSWiNYiSXXbTbGbm
 +gNJ8m5s8PfEHx6Aq/aFiLq1ZA==
X-Google-Smtp-Source: AK7set92+GpJFzgamUBL/iLBl6mPPE+572u7XyDEJLJYBXQan6/PHN9kdy2rDGo/XW+QKyfAlZorDQ==
X-Received: by 2002:adf:fd86:0:b0:2cf:efc1:ba49 with SMTP id
 d6-20020adffd86000000b002cfefc1ba49mr2309746wrr.68.1678902563534; 
 Wed, 15 Mar 2023 10:49:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c4f8500b003b47b80cec3sm2522328wmq.42.2023.03.15.10.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45E101FFC0;
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
Subject: [PATCH v2 09/32] include/exec: fix kerneldoc definition
Date: Wed, 15 Mar 2023 17:43:08 +0000
Message-Id: <20230315174331.2959-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:49:48 -0000

The kerneldoc processor complains about the mismatched variable name.
Fix it.

Message-Id: <20230310103123.2118519-11-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f0..15ade918ba 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
  *
  * @notifier: the notifier to be notified
  */
-void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
 
 
 /**
-- 
2.39.2


