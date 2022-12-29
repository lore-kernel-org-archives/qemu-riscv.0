Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNq-0006z4-Vt
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNp-0006yP-Io
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:01 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNn-0003dh-VF
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:01 -0500
Received: by mail-oi1-x22b.google.com with SMTP id e205so17697709oif.11
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbiTZyRct9iVpY9HjRIeGjbp69cWeVQA/9hcWprmen8=;
 b=CbVhiL5zE6zXIjgDCsmBe3g/v2V4MPgv+jKJp27nDrcoCcm2zrFvtdUpWVwgKJvwJq
 4xwSkIxcwyoWEFKUyCsv3s9fQr0WySjjC3+jTNG8Bw7DZKiSKmepIDzDY5f6lr500buJ
 Hu776pr3CLLKHRSQocJiz/BpnHtjTU6T88T3+RiQEmwu3CRXCp+XNMxwq0FZyH6i3adF
 4n1sJZHoGEc3lKZQv1JyIGMJiIkUzxRVleXDU8rmo9lE5tkyjCwZXsA5EmX+2ykKj6xW
 UAnysYAx8Nwru4FyQ6n9VON/vJRP4OEgB53+hHTjm21AGfAgsAYXIKlmeuSApQL1tjsE
 67Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbiTZyRct9iVpY9HjRIeGjbp69cWeVQA/9hcWprmen8=;
 b=A5egLoJ54nxlmQcjS/aaiIwuiyXZ3szdVzdg+e3wgfFtkuJzrkv41bG/UjS6iPnuyL
 gW0A9r+DZGRwmr9GcwmvY3fxIdM9o35+aeHcj2Nukgvx+wyItLx4qTImrqO7r9noQewt
 pC9+icr2xg/mqED13BZqxSWVcm+XAHmWEoS1vz6XZi0qUqQ7xkPyfPlrh2ZnOR+JLfdC
 WxU1eH4UGI3SgWEKMsdvIC+gaiuDiowQS/7Ygne/PC+cyDSuWqXA2ZimnHlm81yaZLSL
 E8qq/oQ1HDsyIQ4mVaCE8i1BQKAB1pxiYzZX8kG9vSkGnox7LmysAQRZK9ZmNpAmCrSm
 qS4A==
X-Gm-Message-State: AFqh2kr+rtwOo1i9yUWTW7w2rOUbCMboRNWCM3U4mWJa6MsYYN7tvst/
 IvJUufgYWCjtimlM0XyFTOVRLg==
X-Google-Smtp-Source: AMrXdXtOpiqdz+eAeN2xzoRHQ1B9lzL6Zn0CUZzIEkwcWRcsd1dbR4xdy9c9Ebo5Sn0NQ6s6LWnezw==
X-Received: by 2002:a05:6808:bcb:b0:355:1de9:390a with SMTP id
 o11-20020a0568080bcb00b003551de9390amr20735042oik.16.1672337518581; 
 Thu, 29 Dec 2022 10:11:58 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 05/11] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Thu, 29 Dec 2022 15:11:29 -0300
Message-Id: <20221229181135.270661-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:12:01 -0000

This will make the code more in line with what the other boards are
doing. We'll also avoid an extra check to machine->kernel_filename since
we already checked that before executing riscv_load_kernel().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/spike.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 25c5420ee6..004dfb2d5b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -302,6 +302,10 @@ static void spike_board_init(MachineState *machine)
         g_free(firmware_name);
     }
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+
     /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
@@ -310,6 +314,17 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
@@ -318,22 +333,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]), htif_custom_base);
-
-    /* Load initrd */
-    if (machine->kernel_filename && machine->initrd_filename) {
-        hwaddr start;
-        hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                       machine->ram_size, kernel_entry,
-                                       &start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                              "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                              end);
-    }
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.38.1


