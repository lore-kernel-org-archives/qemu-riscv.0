Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVILn-0003zk-Vb
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 15:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILb-0003ms-UA; Tue, 28 Sep 2021 15:00:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILa-00010w-9i; Tue, 28 Sep 2021 15:00:59 -0400
Received: by mail-ed1-x536.google.com with SMTP id bd28so25514895edb.9;
 Tue, 28 Sep 2021 12:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ctk7m5SNSaS76MPHqTbEowhtmoRkmXJ3p8AQiBYE8AE=;
 b=DDaA+PpM4i3q81x5lqNsC+6hA4to0OluXm9ip0fRGYHzLXzg3icDvyHXDxVy/601xO
 SlzAfc6fOWNkYLRU9XaaOt3BT/s6NPPCH4RNwv5RnxsjpQ0WUrtbYstf8lucj56y8Xtm
 lPvR3QeMjrGVsbC78BbUL59RUoJY4HuQNPaciG6V0YIBlikz71DGN5J10sph4yo1EitQ
 dHwSZmCRqp1ycMuzskXhzHvAkQGTOfkxKtlZajhJf98dUnV1zKpFIsJbdZzk8Nc214Nf
 fxsPWVLuM7Gl5pjDlXTGQGSC+WEI+oWFX+9V+IiNm+134Ie7A8sQnxrKILd5JWG7JKOV
 cHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ctk7m5SNSaS76MPHqTbEowhtmoRkmXJ3p8AQiBYE8AE=;
 b=z2MsQxGDz8GbdoFqk16Kq/C0sDHbmtxP2yuqzzWLJZxQxqWVOpKJz6o4UPWgMlVTJw
 t3nYDxf3X4UvOLqjn00wcWNaaQdWF9RZoNjYwwnVKF/20FABWVs5H3DVLK2GxRod9X8G
 ZgtaGGq4lwyPpf+FRAC3Gw6LURT5/hx1ckfc/tFu4krvvSD9/ULpwbLqFrgjtyrmVJKv
 qe9BB+I4Hpl4VctO1+DolUGvcXWeOkywk5lE2BOPoJ12xepcJFOAUdb8jtneHt+ZDAQ9
 qsJcZ/GGFoTdEpbrMj//NS0I/caTX9oe5u8ZQIcLcTPuRM95DbDzkWmOqjML+YP0aCTC
 GfXw==
X-Gm-Message-State: AOAM532pK96r2/o/jhlkeQ0jMZHdh/Ygk2ReLXBR/LYaGCOlVo6DTnK8
 72Z4AfmykzeclouPj7lhH04=
X-Google-Smtp-Source: ABdhPJz3LZVPsXQ++8vL4Arhpjn8bVK2+t/XapwDUhfgva1ixY//kxFCcsDBjvstO9e6iawJ/gfSJg==
X-Received: by 2002:a17:906:1901:: with SMTP id
 a1mr8679946eje.129.1632855656116; 
 Tue, 28 Sep 2021 12:00:56 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:55 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v12 7/7] [RISCV_PM] Allow experimental J-ext to be turned on
Date: Tue, 28 Sep 2021 22:00:36 +0300
Message-Id: <20210928190036.4114438-8-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Sep 2021 19:01:00 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 911cd02ea4..c456be39a1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -582,6 +582,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            target_misa |= RVJ;
+        }
 
         set_misa(env, target_misa);
     }
@@ -645,6 +648,7 @@ static Property riscv_cpu_properties[] = {
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.30.2


