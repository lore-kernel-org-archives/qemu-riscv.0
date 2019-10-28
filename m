Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pn-0005co-9K
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Ph-0005TV-W6
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Pf-0003v7-Mv
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:37 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36228)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Pf-0003uQ-Gm
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:35 -0400
Received: by mail-pl1-x636.google.com with SMTP id g9so5183960plp.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ZoHc+VHVu0Akb6H7aKW6gMetNPuN2wzERVN9x/1HJjc=;
 b=F8jCX7JZzM154uWfkxmBJq+SVY2/cU1YZZlyU0v6xzHxtDAFGY80ipmN0sFhOg3CH7
 XX2s23vG7ZOaf2KK9rgKPzOEt0us2yfbb3y+ZcRPkfSg+jSXNbIRbu0UM9DH5uGu3M80
 fM+wPmmdJ/sYzw9ZS3CAyTGfJqvAsrrJrZ3RRpK/E7K1KUyACQyCWmw8uKUkuLbGYZhh
 O7vWy5n2JYQ2+v27zdya2xOkVfW5nARDnxTKVdaNhK9Ak22TL1wTFU5HtmPuX8ZhowK/
 sNc9hdHy42d9PiHqQT7JxP/i47hmHGOlrz3OKgl5H8uykNF8BFWmt+rRSpU1/3a1pTnP
 ZSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ZoHc+VHVu0Akb6H7aKW6gMetNPuN2wzERVN9x/1HJjc=;
 b=rG6hnd8wR7JRIsPTuFvp8XCXK3zWWSfoe6/wknNT4jbgT08+JF2CRORxZNxv4Av9hZ
 RzT3xMq32SntK6UJ4jB0RxHmuk6aUbd3z7pm/pJb7E3AgnSgB2h1RNzSaEs4+EJYKeaZ
 S8TSwHo4SS1dVfvmk4rn5u6pA1ZYYq7zY4JbFC6R54IVQVqeuXduI4DgwasauudHuNbq
 s8Oadw2bI30E3ceDvH2X7fmH2hLAQaPfdqKM+A+qvrg3gmXs36XBGqG7jUs1IX0H197/
 fGvxyZecf09hQZv3ndBTnEElY14/LB45D1Xsb+sJSUp03LwpsJtIfBHdxUu3rSF67u3j
 gP2w==
X-Gm-Message-State: APjAAAX/k3aS3YrAVAfaZV1NSQbJwJXzg1Stkhm4AuJf+97JNnF6hd/1
 zzTma0uTBgUiIbjiTRaB+B99jA==
X-Google-Smtp-Source: APXvYqznrUp1MPO418qNiEbQu5v1Jcgq8VpP6W5YjouGPFDtFaD3bfbyp+Mw6ajSE2RUNC6hAZMsXA==
X-Received: by 2002:a17:902:bd91:: with SMTP id
 q17mr19824143pls.43.1572278314453; 
 Mon, 28 Oct 2019 08:58:34 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a6sm11595869pfn.99.2019.10.28.08.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:33 -0700 (PDT)
Subject: [PULL 10/18] riscv/sifive_u: Add the start-in-flash property
Date: Mon, 28 Oct 2019 08:48:54 -0700
Message-Id: <20191028154902.32491-11-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::636
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:40 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add a property that when set to true QEMU will jump from the ROM code to
the start of flash memory instead of DRAM which is the default
behaviour.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 30 +++++++++++++++++++++++++++++-
 include/hw/riscv/sifive_u.h |  2 ++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index eb4124f5b4..9552abf4dd 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -315,6 +315,7 @@ static void riscv_sifive_u_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
+    target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
     int i;
 
     /* Initialize SoC */
@@ -357,6 +358,10 @@ static void riscv_sifive_u_init(MachineState *machine)
         }
     }
 
+    if (s->start_in_flash) {
+        start_addr = memmap[SIFIVE_U_FLASH0].base;
+    }
+
     /* reset vector */
     uint32_t reset_vec[8] = {
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
@@ -369,7 +374,7 @@ static void riscv_sifive_u_init(MachineState *machine)
 #endif
         0x00028067,                    /*     jr     t0 */
         0x00000000,
-        memmap[SIFIVE_U_DRAM].base, /* start: .dword DRAM_BASE */
+        start_addr,                    /* start: .dword */
         0x00000000,
                                        /* dtb: */
     };
@@ -433,8 +438,31 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_CADENCE_GEM);
 }
 
+static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
+{
+    SiFiveUState *s = RISCV_U_MACHINE(obj);
+
+    return s->start_in_flash;
+}
+
+static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
+{
+    SiFiveUState *s = RISCV_U_MACHINE(obj);
+
+    s->start_in_flash = value;
+}
+
 static void riscv_sifive_u_machine_instance_init(Object *obj)
 {
+    SiFiveUState *s = RISCV_U_MACHINE(obj);
+
+    s->start_in_flash = false;
+    object_property_add_bool(obj, "start-in-flash", sifive_u_get_start_in_flash,
+                             sifive_u_set_start_in_flash, NULL);
+    object_property_set_description(obj, "start-in-flash",
+                                    "Set on to tell QEMU's ROM to jump to " \
+                                    "flash. Otherwise QEMU will jump to DRAM",
+                                    NULL);
 }
 
 static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 794b958dcc..82667b5746 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -57,6 +57,8 @@ typedef struct SiFiveUState {
 
     void *fdt;
     int fdt_size;
+
+    bool start_in_flash;
 } SiFiveUState;
 
 enum {
-- 
2.21.0


