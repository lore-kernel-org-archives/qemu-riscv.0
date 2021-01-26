Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4HOx-0000LN-Gy
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HOw-0000In-Cz; Tue, 26 Jan 2021 01:00:30 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HOu-0001Oi-DJ; Tue, 26 Jan 2021 01:00:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o16so1234982pgg.5;
 Mon, 25 Jan 2021 22:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPgVdXOd8dKlKEB1hV4iW/elZmTi6Kdti2t1vuxXyCY=;
 b=Kr9C7OR2d/F8dxYmk6VlFDwmz82/7516dde52C9GtQBFoWhRWivTbn8ggkXqu0M6DU
 jMjpwZkPYcncT0LaVQYRXb2Vy12NdLQAby3Bee4DGiJ2ua2c19Hhu5s5IbjUhqZb1pYG
 zQrvQCNUUIuBnolz/GqHYRrcDg7PHmyKzxWvN0ZKdPsAh8NAGlDzSpFbaAPP+H98tdBg
 SuaJOHnmJLyBdsI0qIvjSLW2oqum1a7STX/vV2XW0jZu+Rxa02DZ3JwSjj0Pezn3vHLi
 vBdDeQaUD0pPL+k1iHviaUlbHmogZ11hAaNIjBMS7VRrh5uuTDu8mN3uoJoxH2rE7eDa
 DntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPgVdXOd8dKlKEB1hV4iW/elZmTi6Kdti2t1vuxXyCY=;
 b=oxQhh7Fcik3kGwz4j1bNPFFMrG+27cFu0J4YS0992Uh5Z5weaKIte1wqR0yTr0kRkg
 eEhCc3Anun5iF7gIvXKN0zHshV5wC2uZr3aRmoPZilaw/epGF9Fy7c67uWkcz+jk5To7
 imFDUEP67tBlCWq07K8SJi6uZhbAgMHh5c7YRmcbhBgmnOR9ptBaBvn6emUlvMrhhuO0
 ePDUwLqwQx/UIbLisHSIrXk1E+0dAjFXuDnH0P8xFx6Ofw2MQeB77Sq1AdbtdeSNN84U
 eQErf8rdNOLQafWKhRIJxLYHN1N3IYer8AEZAdF7d/QQPAesQSEWQBgCnF9xGDv+/pAJ
 YUfg==
X-Gm-Message-State: AOAM530CwJpUFge5QVX4zJgum4aMWZkPM45SW8JN7fomg5dTwH1u9Cym
 lxxdkdjrIXfCpohX6TaDeVM=
X-Google-Smtp-Source: ABdhPJxLLezv+bV5vWwozjpqqjCZOWQrvviS4iRNAFBQ48L79w05FZhZ5EaAk5uZSq5Q4WkeUP2sWw==
X-Received: by 2002:a62:7694:0:b029:1b9:8d43:95af with SMTP id
 r142-20020a6276940000b02901b98d4395afmr3952293pfc.2.1611640826616; 
 Mon, 25 Jan 2021 22:00:26 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm12471076pfk.0.2021.01.25.22.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 22:00:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 1/9] hw/block: m25p80: Add ISSI SPI flash support
Date: Tue, 26 Jan 2021 13:59:59 +0800
Message-Id: <20210126060007.12904-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126060007.12904-1-bmeng.cn@gmail.com>
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Tue, 26 Jan 2021 06:00:30 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the ISSI SPI flash support. The number of dummy cycles in
fast read, fast read dual output and fast read quad output commands
is currently using the default 8. Likewise, the same default value
is used for fast read dual/quad I/O command. Per the datasheet [1],
the number of dummy cycles is configurable, but this is not modeled
at present.

For flash whose size is larger than 16 MiB, the sequence of 3-byte
address along with EXTADD bit in the bank address register (BAR) is
not supported. We assume that guest software always uses op codes
with 4-byte address sequence. Fortunately, this is the case for both
U-Boot and Linux spi-nor drivers.

QPI (Quad Peripheral Interface) that supports 2-cycle instruction
has different default values for dummy cycles of fast read family
commands, and is unsupported at the time being.

[1] http://www.issi.com/WW/pdf/25LP-WP256.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- Mention QPI (Quad Peripheral Interface) mode is not supported

 hw/block/m25p80.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b744a58d1c..217c130f56 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -412,6 +412,7 @@ typedef enum {
     MAN_NUMONYX,
     MAN_WINBOND,
     MAN_SST,
+    MAN_ISSI,
     MAN_GENERIC,
 } Manufacturer;
 
@@ -487,6 +488,8 @@ static inline Manufacturer get_man(Flash *s)
         return MAN_MACRONIX;
     case 0xBF:
         return MAN_SST;
+    case 0x9D:
+        return MAN_ISSI;
     default:
         return MAN_GENERIC;
     }
@@ -706,6 +709,9 @@ static void complete_collecting_data(Flash *s)
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
             break;
+        case MAN_ISSI:
+            s->quad_enable = extract32(s->data[0], 6, 1);
+            break;
         case MAN_MACRONIX:
             s->quad_enable = extract32(s->data[0], 6, 1);
             if (s->len > 1) {
@@ -895,6 +901,19 @@ static void decode_fast_read_cmd(Flash *s)
                                     SPANSION_DUMMY_CLK_LEN
                                     );
         break;
+    case MAN_ISSI:
+        /*
+         * The Fast Read instruction code is followed by address bytes and
+         * dummy cycles, transmitted via the SI line.
+         *
+         * The number of dummy cycles is configurable but this is currently
+         * unmodeled, hence the default value 8 is used.
+         *
+         * QPI (Quad Peripheral Interface) mode has different default value
+         * of dummy cycles, but this is unsupported at the time being.
+         */
+        s->needed_bytes += 1;
+        break;
     default:
         break;
     }
@@ -934,6 +953,16 @@ static void decode_dio_read_cmd(Flash *s)
             break;
         }
         break;
+    case MAN_ISSI:
+        /*
+         * The Fast Read Dual I/O instruction code is followed by address bytes
+         * and dummy cycles, transmitted via the IO1 and IO0 line.
+         *
+         * The number of dummy cycles is configurable but this is currently
+         * unmodeled, hence the default value 4 is used.
+         */
+        s->needed_bytes += 1;
+        break;
     default:
         break;
     }
@@ -974,6 +1003,19 @@ static void decode_qio_read_cmd(Flash *s)
             break;
         }
         break;
+    case MAN_ISSI:
+        /*
+         * The Fast Read Quad I/O instruction code is followed by address bytes
+         * and dummy cycles, transmitted via the IO3, IO2, IO1 and IO0 line.
+         *
+         * The number of dummy cycles is configurable but this is currently
+         * unmodeled, hence the default value 6 is used.
+         *
+         * QPI (Quad Peripheral Interface) mode has different default value
+         * of dummy cycles, but this is unsupported at the time being.
+         */
+        s->needed_bytes += 3;
+        break;
     default:
         break;
     }
@@ -1132,7 +1174,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
-        if (get_man(s) == MAN_MACRONIX) {
+        if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
         if (get_man(s) == MAN_SST) {
-- 
2.25.1


