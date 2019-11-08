Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iTAFF-0000EV-PN
	for mharc-qemu-riscv@gnu.org; Fri, 08 Nov 2019 14:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iTAFC-0000AC-IP
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iTAFB-00064I-J9
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:30 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iTAFB-00063p-Dv
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 14:48:29 -0500
Received: by mail-pg1-x541.google.com with SMTP id z24so4611096pgu.4
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2019 11:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=5agNHd9M2bORCVbIGO//JZMZDNyfUZl1bBgI5l6KvTQ=;
 b=Phez6cVAOAk6qvA3brvUjT0QhoQeK19ixiY6E8EHjShNInxaUAUxVga9N8f+ahKnB4
 eZUDjKYVzlgD4hVBUQBW42rgQ7tfX2VLAWVm8gj+M3+9lUr0X+auUBHf+nwNOZKFOr2S
 TNBLth0FYYYnT5toF+rM/dDsjb5kJdepUsN8lZYHCtXWxWd2+NdyZuPc5/OviT1lWMn/
 0xEge9o7YRi/M7szla8/Qh/VvkaEOAtMewPqwyx/83iGRbuxImvjt8/edortm2heLP43
 +MtOo6YPuRppc53pDpXMd+SglAST0/IGjZOOpkTNbFhfdI3uSJ+p/w+9/75c2wDvA/Lx
 MRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=5agNHd9M2bORCVbIGO//JZMZDNyfUZl1bBgI5l6KvTQ=;
 b=JNfHTyaRF2CSdUUsuKzMH8XrsFSjp0jb31AFEEmNblkex+XWoJCsBFLOGqjrlMX1eH
 ZG0HITnU5zRSqeCB/7Cawtw/SADnMGg1INz63N7/h8cZRBkh4/PeOyG8dE0jUXClM7/m
 C3L5WSwG74GstNR65q+TS5uD9YpvvK/eol6r5RFmS1osv2HUsUIAvalQalgdXRdBaMHH
 esBwvlTZyCRuchyvojenXaYHeID8gZcIaRWybuOi0uTJQeNMqoD8BlT75K54qhGl6aEg
 RpTipCPe5GK6rwQ18a1aCSWk8dU9dr+/lg9vxN3UL2krW2inhC3SLl8wXw+wv70byL8Q
 w5/g==
X-Gm-Message-State: APjAAAXZbA4JO8tSBNM1ySzudMAkbbx1FQOErIgiJ5/uG+WBMnQM5bi8
 CMFKN6ZoMBbcs5xUnSNEZjwYbCr0EbE=
X-Google-Smtp-Source: APXvYqx89ckaICmNEcPymnIaPzw/La0DkOPJLAUZIE+RBy/lpguEOtXGyUt3wXoJKDiajjs6+Ikk0A==
X-Received: by 2002:a63:7887:: with SMTP id
 t129mr13976804pgc.144.1573242507720; 
 Fri, 08 Nov 2019 11:48:27 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r68sm7456977pfr.78.2019.11.08.11.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 11:48:26 -0800 (PST)
Subject: [PATCH v2 2/3] ARM/virt: Use fdt_setprop_strings()
Date: Fri,  8 Nov 2019 11:47:57 -0800
Message-Id: <20191108194758.17813-3-palmer@dabbelt.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191108194758.17813-1-palmer@dabbelt.com>
References: <20191108194758.17813-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Fri, 08 Nov 2019 19:48:32 -0000

This new helper function encodes the idiom used by the ARM virt board to
set a string array.  I don't currently have a working ARM userspace, so I haven't tested
this, but I made the helper function because I wanted to use it for the
RISC-V virt board where I have tested it.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 hw/arm/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d4bedc2607..4dc00f54d5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -304,9 +304,8 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
 
     armcpu = ARM_CPU(qemu_get_cpu(0));
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
-        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
-        qemu_fdt_setprop(vms->fdt, "/timer", "compatible",
-                         compat, sizeof(compat));
+        qemu_fdt_setprop_strings(vms->fdt, "/timer", "compatible",
+                                 "arm,armv8-timer\0arm,armv7-timer\0");
     } else {
         qemu_fdt_setprop_string(vms->fdt, "/timer", "compatible",
                                 "arm,armv7-timer");
-- 
2.21.0


