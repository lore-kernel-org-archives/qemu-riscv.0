Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKpps-0005DC-Gf
	for mharc-qemu-riscv@gnu.org; Thu, 17 Feb 2022 18:05:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpmn-0004eE-3f
 for qemu-riscv@nongnu.org; Thu, 17 Feb 2022 18:02:05 -0500
Received: from [2a00:1450:4864:20::52a] (port=40865
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpmX-0005Fa-TO
 for qemu-riscv@nongnu.org; Thu, 17 Feb 2022 18:02:04 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h18so12323078edb.7
 for <qemu-riscv@nongnu.org>; Thu, 17 Feb 2022 15:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fRlSqQPzztWpXDOsBI/n8vm223cY5mt64tT7JGeMEVY=;
 b=WALMoUBa3GnbcoiVWR6ZatTUDmxBdfLzOUeSF5pAl3HzaVayj3BmRZ6cfchm4GTDIg
 uwZSPeG9f/5eSitBi5SBiqkBrsGiWG0CVz4ZOALChX3fY7u7M+QIfkL2EjYGtyf+QFu9
 vQ8FoOBxDie3xXrjU2CdMjSASzk4SRUtkCFt+3vekn/AMnspv1d0xRWSi9t6W8K43ZIp
 fhEAY5t2dp6qYGxuANLSaObbG99hqptSxh/pcKYvsrT4ELHiUg9vSB/cyonE4uGudXYz
 mt5OL6c1VFvapjZiom2fUNrJa+/iViEoQJ+Xv0sFa74AHnj+bBJ3xxDEgHmylx3rCUMC
 lxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fRlSqQPzztWpXDOsBI/n8vm223cY5mt64tT7JGeMEVY=;
 b=qEVA//T6BkDT6yBTrCVOxTiMpo7kF34t5qiEqaUxkerZ+soEIocgedwnNLSXNfe3XK
 wsKHbsfaKElJzGy2efyERzT7W2GKjIv4EzvQYrzk/s9E+cImOuB51VVsie0XrqMx0h+6
 hqjzLJvhmudzPy7yNg9byUgcwyOTLdr+QbLcVjcneqGcfnCenkUlhT3iHs4F7S+996u0
 gPqiTF485BoQQ54DzAatJqejoqj1j7OgvJuY4d6qyf0n6lliDsERU7ffaPgQqCbaIBfD
 7FoZxu4IbKY0csyQD7wq5pMg6DHwavf9WWt0VbFAmt1IvJVEpOHkQCsR6+o0czsZHujW
 89Dw==
X-Gm-Message-State: AOAM531qiltivIpX4Fdkel+QnX1exhbeodto8ODcd6fZb4HqAv/yU/D6
 238Ay+ilWaDtL6qcvjzl5Fu/rA2kfdG6tw==
X-Google-Smtp-Source: ABdhPJxxQ/4h522NJRoTK1rfkAlGURA55n5+lJkFU1N6XIlBcI/cq1XSOodxfuPN8ryHvmyw3qNX4g==
X-Received: by 2002:a17:906:53c7:b0:6ce:6f32:ce53 with SMTP id
 p7-20020a17090653c700b006ce6f32ce53mr4156328ejo.352.1645138442275; 
 Thu, 17 Feb 2022 14:54:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id mb23sm1598871ejb.62.2022.02.17.14.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 14:54:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines)
Subject: [PATCH 2/2] hw/riscv/sifive_u: Resolve redundant property accessors
Date: Thu, 17 Feb 2022 23:53:51 +0100
Message-Id: <20220217225351.140095-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217225351.140095-1-shentey@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Feb 2022 18:05:14 -0500
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
X-List-Received-Date: Thu, 17 Feb 2022 23:02:05 -0000

The QOM API already provides accessors for uint32 values, so reuse them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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


