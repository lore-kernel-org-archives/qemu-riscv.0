Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQ2j-0007b1-Bk
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ2V-0007Qp-DB; Mon, 19 Sep 2022 19:19:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ2S-0001tJ-GC; Mon, 19 Sep 2022 19:18:57 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z97so1350973ede.8;
 Mon, 19 Sep 2022 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
 b=V1Xkq1+a6hse0yYR3fG7QmZf7eJLZ9IHXShDEimvhNxJCgJXQZEhiB7rS29v8mOpv8
 P6Q/NgzpGGR1zjQswFV9oVsIkApjiLp/TuMLa8asbQeDVSJ9xcqsRDBMPPfvubQ/ud8M
 6dma9SHs8xseeoX1geC075YVhTJkg5UYKK9V145qBxKkDYQso+5CEuESYbx9GpS5ITt/
 geAPZY2mvKURWXNpdq+82LS5ePfVg2MiJ8HHMrB93gDn3YIy3WMpYdI3RCQ1Wj2jPwFe
 D51PhycmYQXgI5PX3syysunfpaQHEnp6cVcDiO8I65JrGDV+oaRZA47creHSMX5+vVkK
 EpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
 b=cgcDoZl0+5pja86Whdon6QMRfuTODrn8HjzGVe3dXOLsNLmIGX+l855NcamftJM8nD
 VBFT5UEvgC8HYRmOjUXF9LgvJRlHfjd+U/lA8unXSxaM+bp0wZ5zgjQnm62pqSF7s/wM
 853Kag8VWE0Rp7QJjMI8kldZOZwelmZbM8/1pg0DZxOYnz7XyPL6mwviO2+hzuTqezCi
 2NJLEKp3LfnKG53zkDhmCGHFLkXWCiXeptGes+we7Aupyq7NCoSNtNvW7MzbSkeUQ221
 cXMSf2dyRFm8Js4UTKptWJQD0P1LNMLnVg3heSf91/x3CxPV9W66/8g7untU5EjVvWJa
 ODoQ==
X-Gm-Message-State: ACrzQf0WM36YeEtpmbmI2AO6yJSE3HPfAq43rJQ4sS4o+IsfgmShNf6x
 2KiRoLs/gLErW2eiJ36Auwg48KCmb/d6Kg==
X-Google-Smtp-Source: AMsMyM6LQ7zX0snjJOKDhu4y1VtCyR5HxEAeYDZgQV0qmXEZF7bGIa6sBksILYTX9vlQa3QJPxyguw==
X-Received: by 2002:a05:6402:2711:b0:451:327a:365f with SMTP id
 y17-20020a056402271100b00451327a365fmr17131653edd.315.1663629533162; 
 Mon, 19 Sep 2022 16:18:53 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:52 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/9] target/loongarch/cpu: Remove unneeded include directive
Date: Tue, 20 Sep 2022 01:17:17 +0200
Message-Id: <20220919231720.163121-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 19 Sep 2022 23:19:07 -0000

The cpu is used in both user and system emulation context while sysbus.h
is system-only. Remove it since it's not needed anyway. Furthermore, it
would cause a compile error in the next commit.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 target/loongarch/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dce999aaac..c9ed2cb3e7 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,7 +13,6 @@
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
-#include "hw/sysbus.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
-- 
2.37.3


