Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQ28-0006Jq-8J
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ25-0006Ck-Gh; Mon, 19 Sep 2022 19:18:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaQ23-0001od-T2; Mon, 19 Sep 2022 19:18:33 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e18so1402444edj.3;
 Mon, 19 Sep 2022 16:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YuQwXC400wn1XG3lPzRkN46CWgPRCmkTZD5KrMqPnvc=;
 b=OfOTlhHIdUYcoHKPguW/SrroW/2HH31KpnqDNx1VDOdScP9GFw+hcz6wLKt9qwYKmr
 tUiVUE0COMOBBIwnlZk33ru5T+PAhA69FfCE40NYduQ5A2+ZLn3WJwfMhsySvcTEX8NG
 kUvI2CGts6p4THnGkq0xeeKDTU5xPudeCwmi2+6sBCLSQZmuxjpnNtMXwBahzmJp9kZR
 Ylpol3lEYtvuiLAmcekgtLJXtFpD/8AjmspSTSwXdjX14Lafob9CFzE0RecWT58O2Hq9
 Vl+Tlro5icVzofsz7kyjKQ+0/Ll3mwbPbZepIT1+f4hmtu3MFNqsfZTqVJBagsK7iMxp
 9/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YuQwXC400wn1XG3lPzRkN46CWgPRCmkTZD5KrMqPnvc=;
 b=Ix5XCSIbD9VCnwaVKHPsiLDZ0eQSdjCAXvRW2gzf0CmMfAQI/borVexYvMwluqETuo
 ixR8q7eiNril69mqBF89x9HreUMyVcAmZMf0pFbnu4yVLvHSuW0+0B7fm4Sx6njsWKDw
 2OTT6XmtIPnKRGZog8w0YgyIM9J+U9cApzvU6GO8GzsemEG+eyO20DZWUkHcll2vXFeh
 lWb8GmriWMHDUvmq7lmEaBc4Q5KTm/OIXE1ogx7RE8uBRFWsSM8+tjO34k7Oi/1o7RB0
 KsZWWsqjW33rmX1Oi1PsO4eTCupz5gp9HU1C4yjcVeZAbUZ0y3dsh2/3qUChi7tT2kEm
 bO4w==
X-Gm-Message-State: ACrzQf3tasZpfvt5fHLq5+6t9YC4pJo1ejMsDPtFHmkUc4NOOtZ97t95
 tOpF9uadcdKGt3YazlHXSpelgeTdRIi25g==
X-Google-Smtp-Source: AMsMyM4dA5dnazvKBz2RVfKC8EJQkafmLFlSOVYf1X2uY4aMLi4DKxlHP7A25Z9KlTvDpLqBqvU2+Q==
X-Received: by 2002:a05:6402:1b06:b0:44e:a073:1dd8 with SMTP id
 by6-20020a0564021b0600b0044ea0731dd8mr16910792edb.391.1663629508436; 
 Mon, 19 Sep 2022 16:18:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
 by smtp.gmail.com with ESMTPSA id
 rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 16:18:28 -0700 (PDT)
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
Subject: [PATCH 2/9] exec/hwaddr.h: Add missing include
Date: Tue, 20 Sep 2022 01:17:13 +0200
Message-Id: <20220919231720.163121-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 23:18:34 -0000

The next commit would not compile w/o the include directive.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/exec/hwaddr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/hwaddr.h b/include/exec/hwaddr.h
index 8f16d179a8..616255317c 100644
--- a/include/exec/hwaddr.h
+++ b/include/exec/hwaddr.h
@@ -3,6 +3,7 @@
 #ifndef HWADDR_H
 #define HWADDR_H
 
+#include "qemu/osdep.h"
 
 #define HWADDR_BITS 64
 /* hwaddr is the type of a physical address (its size can
-- 
2.37.3


