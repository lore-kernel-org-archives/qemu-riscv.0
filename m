Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPBMP-0007co-Ej
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 17:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBMD-0007Xo-62; Tue, 01 Mar 2022 17:52:37 -0500
Received: from [2a00:1450:4864:20::530] (port=33438
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBMB-0002ll-KS; Tue, 01 Mar 2022 17:52:36 -0500
Received: by mail-ed1-x530.google.com with SMTP id s14so24039805edw.0;
 Tue, 01 Mar 2022 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7adXm54wD7xIz42X7XYXXv1NjIfr4eAjQzcG7izHJQ=;
 b=LF5nEsIdzxea+jW4sM+coRcUOOn4Q84+vcLjns5xder00nMHm9IIwSxPkIXO3NFXTE
 DUmE+E3nkpJgtJmWp2Ux21O4I2BCMogv76+x1W4CdffHL5FDpmYMU5DYseCYbx9JMQjU
 4mWEG0BpSTAuoqm9WuHKavaDl0wtb0g3IqpWeJyFreFYfSu+Dyg7XatYFjP9PSzGYAYw
 NDmgl4eD/gw0+nqKvcIM348QNHlrMP0HFMAv6rpO+lPu2/QeA7EWcuf7GaEfR8CnXzVA
 1DZhjxUYEwhXi3IzsxKFqp//Hq+iZjwLmvrFtq/TIuSTMQC+BYkWRomSNeFlqpKjpj30
 QYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7adXm54wD7xIz42X7XYXXv1NjIfr4eAjQzcG7izHJQ=;
 b=ZzUN7pPaE/dGizBS59BASBNqcLkA0D6lQH1dntStCFUf8gFWZX6ABI2z4FaRs0AG9N
 sew+WH8ZK1cSdcYNdkEpDyNaRBDDNU3+vQHf57ZU0DoG2TCaGWrQYJjghWZdUYqKtKLv
 1l6l/p+x4QEjRf4emA8yF31FUbwEd7J3JYqBxiUL/LSR5XRI6z9iU/LrfE8zNyvHTr0Y
 VXmzAovCiAUFTEQCP7UbBBA1hHgvWWHJ1rDmlpXxU7fN/FJa04Aa//nXddsInnGoszlw
 agAVEBYM70E0nP3DTak4r8a237JVKFEXrHkXjJzpaHwD+/xAWEr5Mp84EtElimmDcpHt
 cWcg==
X-Gm-Message-State: AOAM531Ue3GyismZjXLp3RvIe4QoYZ6GFPsWPw56ldAMYW+1liFZMiCy
 /DwAWVoKa58Ta29/TrCnXygHRiyolq4=
X-Google-Smtp-Source: ABdhPJz9qVkhoSI3kTJhQ8WjlKyXOBu4SdkmXISQXTSqRH85T9rNOusljAAihO8/oo+pNb+1tMZOxg==
X-Received: by 2002:a05:6402:1756:b0:410:be91:cd5b with SMTP id
 v22-20020a056402175600b00410be91cd5bmr26746265edx.375.1646175153510; 
 Tue, 01 Mar 2022 14:52:33 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402271200b0041110d6b80asm7806711edd.39.2022.03.01.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:52:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines)
Subject: [PATCH RESEND 2/2] hw/riscv/sifive_u: Resolve redundant property
 accessors
Date: Tue,  1 Mar 2022 23:52:20 +0100
Message-Id: <20220301225220.239065-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301225220.239065-1-shentey@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Mar 2022 22:52:37 -0000

The QOM API already provides accessors for uint32 values, so reuse them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/sifive_u.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..747eb4ee89 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -713,36 +713,20 @@ static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error *
     s->start_in_flash = value;
 }
 
-static void sifive_u_machine_get_uint32_prop(Object *obj, Visitor *v,
-                                             const char *name, void *opaque,
-                                             Error **errp)
-{
-    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
-}
-
-static void sifive_u_machine_set_uint32_prop(Object *obj, Visitor *v,
-                                             const char *name, void *opaque,
-                                             Error **errp)
-{
-    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
-}
-
 static void sifive_u_machine_instance_init(Object *obj)
 {
     SiFiveUState *s = RISCV_U_MACHINE(obj);
 
     s->start_in_flash = false;
     s->msel = 0;
-    object_property_add(obj, "msel", "uint32",
-                        sifive_u_machine_get_uint32_prop,
-                        sifive_u_machine_set_uint32_prop, NULL, &s->msel);
+    object_property_add_uint32_ptr(obj, "msel", &s->msel,
+                                   OBJ_PROP_FLAG_READWRITE);
     object_property_set_description(obj, "msel",
                                     "Mode Select (MSEL[3:0]) pin state");
 
     s->serial = OTP_SERIAL;
-    object_property_add(obj, "serial", "uint32",
-                        sifive_u_machine_get_uint32_prop,
-                        sifive_u_machine_set_uint32_prop, NULL, &s->serial);
+    object_property_add_uint32_ptr(obj, "serial", &s->serial,
+                                   OBJ_PROP_FLAG_READWRITE);
     object_property_set_description(obj, "serial", "Board serial number");
 }
 
-- 
2.35.1


