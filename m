Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAm-0002sO-Ub
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAc-0002Z9-Jh
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAG-0000cj-1B
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l12so9783244wrm.10
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+Gk3L/rczHKMe28JnxrdRGaPdgdS8ubf+6dS/l9u58=;
 b=wm6TN9cDJHxUkJLZ37RkBeCftptRv0kpUc02mT9qgI4EXI/7hEEAg2iyvz3FeypWi9
 TZEWV8vBMO8H3890qaWwHTHpCZzopeLZs5sp+M6lkvV8XMNOoqQ3ggWz2OnjEyRNIv/s
 vFUNWQNklBxhaB1GQG1BQHclDIxO1+6L+akUO0M8Akyu8TLPyuSWUPkZx3NHA8aiIl4q
 tDYUuO4CDJqRJQfLtd8+07s+E5wa2bUDP8xHgiR4CuPD0r9gdEMqeHzFEjhJ2kxZqY+b
 00/72iEmqVScGyhlSwhJ2s64D52Fhn3OprIu4b0O6u2EE9Le9Z+4OmLFgbys4Uq/xWFN
 Du/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+Gk3L/rczHKMe28JnxrdRGaPdgdS8ubf+6dS/l9u58=;
 b=vUGL83QADenuf609GS2mY2ldJZAFTRsYOMiKBUUJ5eD+yNv+IFmW8uJ++pdHeUlwIC
 qDSiiwy+estiuebotRy41txjOGnJQW1vEHmeJKW3dRhE48CkHzv+Wk2Guak+xXjDQoru
 P0dhSDrUeKPk1w9k3/zsJmrrtdT1Az04ReEttLqM4du2JOa+qst4ZseykFpeg+R8HmyW
 JVszpkG+fn9kj1YSdeOvz1ZRShNKI6rPHkwbOqODgQGsFvkAJaTXMMlxonRkE8sHpoDI
 UB4btIz5FnfS0+9WlIYhLS6X5Zvz58HBOWjrnlp/NdoLeH1HpgU5b5W8yo5iHYL8D+6Y
 WG8A==
X-Gm-Message-State: AO0yUKWx1sglv9r9mI4VjPvXVOugXwQ6F50J2U0ltPr6EFvRFyfJAooE
 OCX2XFxYXIghRBhnuNS7LWI7fw==
X-Google-Smtp-Source: AK7set/XTzDPJnRDjComOqRJGu5FcKx0bJcQ+vjP3fbmc4KwdyM7SGpBwAlRkoWDCgdYe+O8+JKGIQ==
X-Received: by 2002:adf:f982:0:b0:2ce:9f88:abb7 with SMTP id
 f2-20020adff982000000b002ce9f88abb7mr2411812wrr.30.1678902231014; 
 Wed, 15 Mar 2023 10:43:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d4dcf000000b002c70e60abd4sm5324559wru.2.2023.03.15.10.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B70CA1FFD1;
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
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 27/32] contrib/gitdm: Add SYRMIA to the domain map
Date: Wed, 15 Mar 2023 17:43:26 +0000
Message-Id: <20230315174331.2959-28-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:17 -0000

The company website lists QEMU amongst the things they work on so I
assume these are corporate contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230310180332.2274827-6-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 65e40fe8e1..4a988c5b5f 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -39,6 +39,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+syrmia.com      SYRMIA
 ventanamicro.com Ventana Micro Systems
 virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
-- 
2.39.2


