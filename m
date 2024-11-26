Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23647D3B985
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:27:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFtgd-0007Yo-BZ; Tue, 26 Nov 2024 06:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfk-0004ke-EF
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:24:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfh-00031K-K8
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:24:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43494a20379so23233305e9.0
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620236; x=1733225036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0iDFiy4g206+uiI3tz8kmnBegTpSA+b+66gFGs5ekU=;
 b=xMNe6qCssTdvInzhR/rWRpAKzc4TYxKSKdMEHWwPrU2iE40rqgBcSEJlsTBc5AxlMO
 4Kn5qmdYpj0mbq0pbZmavVwYbreK9DWWaE26bkkCtkCJRDPx0763nz6yejg3750uxQPj
 aHhk1FNsvMyaMgVYT3yeCIGeMmfgV5rEvceNsDJ0kSjndjJSTziqQB9jq9kCWYjIW3uw
 3IkU/zTylI6qmITcNzqmy9lJSbmYrSOgO4iQp05k9Um+IZOysMowECSq1jDNDg7noiSc
 /YNrE8TykBCbWERq2fLxvWiTS19s5SdArGyiQ7JTtAZYZUOZkZvpYDDj+t5XX/I2s1Ze
 BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620236; x=1733225036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0iDFiy4g206+uiI3tz8kmnBegTpSA+b+66gFGs5ekU=;
 b=CPC+IPmx09QEpbpABwBtEv9Z6C/r5aKVPQOQ6cw7M3kXBUoLMTJZ4zrUFye06EtZgd
 1Wh6PnIsyjETRXHBhrmJfMM94V+KRC80fIl1PqTxxax1RC3sSzy6hsATvz835l2dcAFu
 DFTAjMzCU8oJLU+FqYmaV6Tdp4sImeIEc/5TONX4ya58outeBDkoFpChJSJbEmElZrQF
 KSH+Z74i1j1rLfpir2/RfM89MYTudFRxMmRrQ9WLxfAMLflt+pyHBfSfcPefvKkQNQYc
 o2D3jxDW5b4OsDvdlZj3AsfoA0HL1zDSPmxb8BBZU0D8R04KNZcqFm8mTfz9/pZ78kEI
 IwUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX84BrmcF8Zbl4uOY0YBTqVXO1/vY5ZGGALqH9QlVt7U0roMhktycfkefSbpNUpneBjKwvjtWEtI6j3@nongnu.org
X-Gm-Message-State: AOJu0YyDILoQAOGVlKo29ogiIGuZ6fWiOR6q9lfcE1SHXSllxyLF3CXW
 c32HL1u253IzWGzgdiuX50uez9r+L6gtWPpRiCRRjdsv1/j8M/QEKprQNzSA/VY=
X-Gm-Gg: ASbGncsuATjlwk3Q9/cqM8glRTnDfcIk5kwKTTN7MIl+iUoQt5SDonRzSmbAOtd1h6O
 B29nEt9Lms7HgWLDVt8AyzvhQfTNj6DBv1yqdG0kY6afnOB9mU3eaYqhfcYDQpMC+kZ5VElpJOV
 iI/EmiXaHyWEgVD41euls1pFzSggryOJ2E253V15HOpi9n802KFOnaOY5ebW6DbqwfIZ65JZhbG
 A9h5dXC/cre3brL16T9ZS4o0eVzgpX4IhMeyg87+AEVnehZullIJGK128RI0Lx+jIvMuDzf
X-Google-Smtp-Source: AGHT+IFg/gi+61i2OJlRicWC3cP19bowqD2mQdjF+QnLLM120B87cgN7yu5W5xYlEgHd5cop0f4Byg==
X-Received: by 2002:a05:600c:4683:b0:42f:7e87:3438 with SMTP id
 5b1f17b1804b1-433ce39e773mr149650775e9.0.1732620236161; 
 Tue, 26 Nov 2024 03:23:56 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349eeb375fsm75702535e9.3.2024.11.26.03.23.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:23:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 12/13] hw/riscv/virt: Create GPEX host bridge
 without refuse-bar-at-addr-0
Date: Tue, 26 Nov 2024 12:22:11 +0100
Message-ID: <20241126112212.64524-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

RISCV virt machine set MachineClass::pci_allow_0_address
(see commit acead54c78 "riscv: virt: Allow PCI address 0"),
directly create the GPEX host bridge using the default
'false' value of the "refuse-bar-at-addr-0" property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8999fc348cb..b28edb9ffd5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1158,8 +1158,6 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                             pio_base, NULL);
     object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
                             pio_size, NULL);
-    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
-                             true, &error_fatal);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -1807,7 +1805,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
-    mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
-- 
2.45.2


