Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEl-00010k-Eu
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEj-0000r5-5j
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEe-0006M3-Uu
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
 b=C1y5DnAt2Jit4pcFE1rQFAK+D5SmsB7CrEXGZZKR3Nta2vx0NBsM1G75YArD+G/FOk4d1u
 Jqyh7LmZ9E3r66s+OqL4ERQiIKAmxusqEpAXt95tj4CbV+83WLdHu9BJDCEcm313D5v1l2
 ngX/jHGdXiPk5eN3QhhsbDzr0IbQBM0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-ruavRYByNy-G_-Rl1fQrxg-1; Sat, 15 May 2021 13:37:54 -0400
X-MC-Unique: ruavRYByNy-G_-Rl1fQrxg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h129-20020a1c21870000b02901743c9f70b9so444161wmh.6
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
 b=rom1vnj59DHL+jE3jLgrDJ/8/mJWp26R20ge5JozRpLNRTKnU3LYfZB0jx0QOWfN8g
 53PdVS2fbr+SypVB9UWl86Vmn8RuV/LN21u1BurWxsKzJ53ayV+JtJfuXVaVw7dMrJPc
 dTXKsP5MT2+6wR1uzd1ljZIZ7okldY6C3oUl27kXIaIlcznugYgiu4kOPDg+bl2KDGtF
 nD14YN+e11o+KwYWw2qXTfrIiraNClc3nABo8sfkxJ7Mstr/bqHG6AR6EzJ6f0t+VjvA
 lJWnAk25tQasvG/Yo60uQrexaHNdpSsWpmsXDWzx63S/NrkB/WgPdWh9hiFMO+SksiRo
 1e0g==
X-Gm-Message-State: AOAM530wPE8+ZsjcaGkqRkgJlyxwLDlAlaXlIlxkrJ+ak9dd4iYMOcjq
 wI3b1JuT0ylTN7BEoOO21VJmYSoX/rmYiawSx6b7lOc7RlPf6JpqKHN+GSenBX1ke/xzUtiRxgY
 ARaVGqLNf806ycSU=
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr65107208wrf.315.1621100272292; 
 Sat, 15 May 2021 10:37:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoFnLeRbk63Gsa5dVBOmEyZbu2HTopi5mLBkLvvTphYvDhVQD1hqnm/7wQOXQ6OyOFZn0rTw==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr65107196wrf.315.1621100272196; 
 Sat, 15 May 2021 10:37:52 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x16sm10269543wrp.6.2021.05.15.10.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 07/12] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike
 machines
Date: Sat, 15 May 2021 19:37:11 +0200
Message-Id: <20210515173716.358295-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 15 May 2021 17:38:01 -0000

Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
symbol and only have these machines select it. Adapt the Meson file
to only built it if required.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 86957ec7b06..0590f443fdf 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_NUMA
+    bool
+
 config IBEX
     bool
 
@@ -34,6 +37,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
@@ -74,6 +78,7 @@ config SIFIVE_U
 
 config SPIKE
     bool
+    select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
     select SIFIVE_CLINT
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index a97454661c0..ab6cae57eae 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,6 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'), fdt)
-riscv_ss.add(files('numa.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
-- 
2.26.3


