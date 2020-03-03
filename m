Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vma-00064N-R0
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl5-00030E-Tw
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl4-0004dv-TV
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:03 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42238)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vl3-0004dE-OG
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:01 -0500
Received: by mail-pf1-x431.google.com with SMTP id f5so550555pfk.9
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=TFaI+CsTEBm5jcbgK52B+eLHOA/XNjrGjXU/SzxCs/E=;
 b=UVkhjAuNk0MHOJJG9SQzHcRGZeJ0jkhV/9L7HgZ4y3WpEm1NySfdJ6CO2oR+Zr1v4L
 TGetjWt/4X68WaeCpgSzlG26VEUnujlAkwm6Ehxz5W1KO9MeNE1LAebzV+nb+bjrNUSq
 y2w//hO7TSI+/Xk6EHxwEyh2x0CssLAPGOIZg0Ni4E9OskcKav9JNbR9061DZV8YQX5u
 GhvKg/6NI6GS8M85Z4YiHBkIPvt0WLqoX17wmB3+DCV/aVA9nfFIDDZ1q/TgVuR/cDVR
 xxoSTBqStIcoZ5GZf+Q1rslKz29mGhrR43zn2NCg1zqAGaj/9X0LrVDZilSRou4nKSrS
 0scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=TFaI+CsTEBm5jcbgK52B+eLHOA/XNjrGjXU/SzxCs/E=;
 b=Wskl+6G2v+qcIOEfYPNLDX+AWQX3ynwvcQDuXM51Qa/zxfYSWsnOaa4imjO47Hqngk
 Cn6ysH1ETI/dcq8ulSEKEd7lDu9nCxMocwfDA+U3wtzbVnxCzYcEpkABt8iArXeXVkK4
 HyVPDAT9CrX5fyMNecBQj1S62G7rinQByK53fPGYRJxby5kqO8ybMwhxlp374Ce6Vlcd
 dtnfnL7ihnw1TrwyROZaxUgVb43IxHVeeG4wvYS5NfghSXPbxIjvlIZA1rEm9GImSpwE
 RWM0EBC3yAJKHZANArMnvicbX1xzxfN+b7IgaERxa2NkRe2QR730wFbWrbW2qe6aLabA
 vrIg==
X-Gm-Message-State: ANhLgQ1eVGhX5FAfMVTrbtjkOhFOCaD/Tslnduk/+b9t5yMp6UN50zWa
 WTtEUvxQ44i3Cf+WfyAnMdPEuq0rhcWFYQ==
X-Google-Smtp-Source: ADFU+vsvTnLhLBoYoTp2B6i7YnvgNtmFsLVIUsNqTjQvX8AX65VyXKStRdMcRFYXp8cd5uPApHAC2Q==
X-Received: by 2002:a62:e70e:: with SMTP id s14mr1579661pfh.115.1583196600269; 
 Mon, 02 Mar 2020 16:50:00 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id c3sm22271988pfb.85.2020.03.02.16.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:59 -0800 (PST)
Subject: [PULL 36/38] riscv: virt: Allow PCI address 0
Date: Mon,  2 Mar 2020 16:48:46 -0800
Message-Id: <20200303004848.136788-37-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::431
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
X-List-Received-Date: Tue, 03 Mar 2020 00:50:05 -0000

From: Bin Meng <bmeng.cn@gmail.com>

When testing e1000 with the virt machine, e1000's I/O space cannot
be accessed. Debugging shows that the I/O BAR (BAR1) is correctly
written with address 0 plus I/O enable bit, but QEMU's "info pci"
shows that:

  Bus  0, device   1, function 0:
    Ethernet controller: PCI device 8086:100e
  ...
      BAR1: I/O at 0xffffffffffffffff [0x003e].
  ...

It turns out we should set pci_allow_0_address to true to allow 0
PCI address, otherwise pci_bar_address() treats such address as
PCI_BAR_UNMAPPED.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 hw/riscv/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7f9e1e5176..5d175d5c9e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -641,6 +641,7 @@ static void riscv_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->init = riscv_virt_board_init;
     mc->max_cpus = 8;
     mc->default_cpu_type = VIRT_CPU;
+    mc->pci_allow_0_address = true;
 }
 
 static const TypeInfo riscv_virt_machine_typeinfo = {
-- 
2.25.0.265.gbab2e86ba0-goog


