Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAC-0007OI-F1
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAA-0007K7-GS; Thu, 31 Dec 2020 06:30:38 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwA5-00076M-9H; Thu, 31 Dec 2020 06:30:38 -0500
Received: by mail-pj1-x1031.google.com with SMTP id l23so5225128pjg.1;
 Thu, 31 Dec 2020 03:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rqEu3v1d5mObXhooJewKMPxHI+pEETcLUOipcA1Z1oU=;
 b=SSV2tjJ1ffr2s6n6W91pcMWsVsKOjad9MfkhzCpVXmiInXCjpgyS5AnybVDrCAH3bU
 QN4iLhz8ggs1UO2LKzEU3BBlueUjEzDfYGSKcwQuXjAN/kUT2du6QCGh5aHc7DNe1G6/
 MecdIeM9eWIcqzoGcpbr8LtCv9tmqZsjI4msoGIFHVGLH51U9QhRrq15LGqZYeoE77eu
 917ZH2BPpEr2t3IB5zs9PXaSmhqw0xMLQe6fPeOa42DfAswnzHApWz1Lx3S9cTY7wBvR
 9HLODiFhZqdD3bDr2VUua+BqNNky7RctkcrtIiRej+iJEd9QZUkBdOYxNx4AapWZ8xYq
 vUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqEu3v1d5mObXhooJewKMPxHI+pEETcLUOipcA1Z1oU=;
 b=bkSKb5CNH86+FTu05i3u+tGp3HgeMifHeq1EuFQUabdW0eMdwU/DE1+R+FqgQwvr7G
 PTCg4hV6Ly17ztVWCUnCcebJz0dJJc7AD6avzHeaRNECQvY293CMD50w72KuWYSLaP/U
 bWglCFCpPjhV4dn638KPmzN1v9CrJ/0vMMBn2DLdR0nLdWer82L3+xkV3yKYWXaw3p8R
 l7kZSnjbugbQYYF1ETA0kj8B4v7cHDW/GPaa5AD0+MFdKS+AUjaHmA9f1gnN6+nmk7fS
 jPpphyJd0F5A+na0TAYEeiFRNYex5hSu7zhBHgW3FrDJ2eufZ0sNncV8Xyd6D3mNGUsJ
 yULw==
X-Gm-Message-State: AOAM53200WUCaSv6L3PwHnqsJIinP4fyhQKDTp1C1/Io3I9muLicuRbK
 WfPJUu2iZFOfw5lo31keuUImNWoTkLA=
X-Google-Smtp-Source: ABdhPJxvbLN2OpAfaHdV0SmPuhrWlU59AFI1wZP1wmBzzcucew6mh7dbB6YhJ0NirtLmCs4lRdENlQ==
X-Received: by 2002:a17:902:8643:b029:da:d5f9:28f6 with SMTP id
 y3-20020a1709028643b02900dad5f928f6mr57515050plt.8.1609414230327; 
 Thu, 31 Dec 2020 03:30:30 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 01/22] hw/block: m25p80: Add ISSI SPI flash support
Date: Thu, 31 Dec 2020 19:29:49 +0800
Message-Id: <20201231113010.27108-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:30:38 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the ISSI SPI flash support. The number of dummy cycles in
fast read, fast read dual output and fast read quad output commands
is currently using the default 8. Per the datasheet [1], the number
of dummy cycles configurable, but this is not modeled.

For flash whose size is larger than 16 MiB, the sequence of 3-byte
address along with EXTADD bit in the bank address register (BAR) is
not supported. Currently we assume that guest software will alawys
use op codes with 4-byte address sequence. Fortunately this is the
case for both U-Boot and Linux.

[1] http://www.issi.com/WW/pdf/25LP-WP256.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 844cabea21..8a62bc4bc4 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -411,6 +411,7 @@ typedef enum {
     MAN_NUMONYX,
     MAN_WINBOND,
     MAN_SST,
+    MAN_ISSI,
     MAN_GENERIC,
 } Manufacturer;
 
@@ -486,6 +487,8 @@ static inline Manufacturer get_man(Flash *s)
         return MAN_MACRONIX;
     case 0xBF:
         return MAN_SST;
+    case 0x9D:
+        return MAN_ISSI;
     default:
         return MAN_GENERIC;
     }
@@ -705,6 +708,9 @@ static void complete_collecting_data(Flash *s)
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
             break;
+        case MAN_ISSI:
+            s->quad_enable = extract32(s->data[0], 6, 1);
+            break;
         case MAN_MACRONIX:
             s->quad_enable = extract32(s->data[0], 6, 1);
             if (s->len > 1) {
@@ -897,6 +903,16 @@ static void decode_fast_read_cmd(Flash *s)
                                     SPANSION_DUMMY_CLK_LEN
                                     );
         break;
+    case MAN_ISSI:
+        /*
+         * The fast read instruction code is followed by address bytes and
+         * dummy cycles, transmitted via the SI line.
+         *
+         * The number of dummy cycles are configurable but this is currently
+         * unmodeled, hence the default value 8 is used.
+         */
+        s->needed_bytes += ((8 * 1) / 8);
+        break;
     default:
         break;
     }
@@ -936,6 +952,16 @@ static void decode_dio_read_cmd(Flash *s)
             break;
         }
         break;
+    case MAN_ISSI:
+        /*
+         * The fast read dual I/O instruction code is followed by address bytes
+         * and dummy cycles, transmitted via the IO1 and IO0 line.
+         *
+         * The number of dummy cycles are configurable but this is currently
+         * unmodeled, hence the default value 4 is used.
+         */
+        s->needed_bytes += ((4 * 2) / 8);
+        break;
     default:
         break;
     }
@@ -976,6 +1002,16 @@ static void decode_qio_read_cmd(Flash *s)
             break;
         }
         break;
+    case MAN_ISSI:
+        /*
+         * The fast read quad I/O instruction code is followed by address bytes
+         * and dummy cycles, transmitted via the IO3, IO2, IO1 and IO0 line.
+         *
+         * The number of dummy cycles are configurable but this is currently
+         * unmodeled, hence the default value 6 is used.
+         */
+        s->needed_bytes += ((6 * 4) / 8);
+        break;
     default:
         break;
     }
@@ -1134,7 +1170,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
-        if (get_man(s) == MAN_MACRONIX) {
+        if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
         if (get_man(s) == MAN_SST) {
-- 
2.25.1


