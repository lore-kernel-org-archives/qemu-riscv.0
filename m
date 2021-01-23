Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLk-00039B-50
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLJ-0002wo-5f; Sat, 23 Jan 2021 05:40:38 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLF-0002uP-Kz; Sat, 23 Jan 2021 05:40:32 -0500
Received: by mail-pg1-x52c.google.com with SMTP id c22so5569264pgg.13;
 Sat, 23 Jan 2021 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BkVaQxIMTlL8Oph24ElXi5legL3wqrN1Wo0MOAKX7rk=;
 b=utT0Tc8RuTDqAcmOEFkzGs0WDw3wZ54N2aSKkf2MW5bC22nGRi6jupE5NyfLAYNcff
 QjbucA7PdFaUXfvKl42WK/SjTTw6TtC+/UaFha7/9PgbTnA3oRk6IfB5Hb7gq+CrTCTY
 vCC+1XLMmok3i43LC9zQeWWa3FuU982Zeqzk4xt/oKKt4Ls6Fks0ZIOzWjcFjzHMdDg3
 R72H9d5a5K57o64JiE2a0Jd2e36u6D0nnXstt3+CskK1t+A3eElYk+/K55xg00Ivuncm
 aiMVVYwML11AvNMx+TyOCB8U8CHLe9Ssxzr1LTJSEQ4u/wHPUS2BfvwGVKGU1YJbEnEi
 64gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BkVaQxIMTlL8Oph24ElXi5legL3wqrN1Wo0MOAKX7rk=;
 b=frLv2UdiTKYIb4Yo+L28Y7PpfHnujPfXopseSeMdKhb9I+qjw1w6eidQZzjEUI9LAL
 mNOyki36gHERwkssytKG10g9banNqHUOYqR2LPx6U47uifvnbK2JgZre9NSzqRjpwpUA
 rKpJJCFG8Ke3uqwEY6Fv5+9ulcJIv3xacXGQ1qYU3EFOFU25DNM+GUBjtyA3ReDUv6XF
 TDwULxjoYwrW5wA71jVsDKXUrdiC8xSXFEcYfx0eYJfsXnNvU2bqT6Xk04UncnXmlutl
 R+AqD5nieN0outPENitbCwzaMssG/h6tChbOsNcCTnrjEsEuLVqrSBdYBRtJMTXqOB/q
 bWSg==
X-Gm-Message-State: AOAM533eTOfLfNYYrcr5fCJjKYKn6TM9tIFVA5S8bV+WfaoggOTHt4N6
 5YPezPdUJr2+LwishhQ0gkg=
X-Google-Smtp-Source: ABdhPJwIvx9uHPiBKoplu3Y/yRo0Yx5ug6gyCeQQ8o9/4q8XN6jpYmy2rFeh8QzFEP0kZUZ58B6ssg==
X-Received: by 2002:a63:1602:: with SMTP id w2mr9384825pgl.128.1611398427432; 
 Sat, 23 Jan 2021 02:40:27 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:27 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 01/25] hw/block: m25p80: Add ISSI SPI flash support
Date: Sat, 23 Jan 2021 18:39:52 +0800
Message-Id: <20210123104016.17485-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:40:40 -0000

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


