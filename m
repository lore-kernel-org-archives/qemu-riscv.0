Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyQe-0007mq-F4
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQZ-0007hC-W0
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQY-0007ge-BA
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:27 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jQyQX-0007e2-T0
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w20so387835pll.4
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=BbK4N9sLahlO51Mgo2mcAZi2nlNHOPi2T0wGJXMXDaM=;
 b=BP6HrcMbpOlN+yaS+74o5Ot0RAWCQ7pQGbDt83XmI9+ayd6LJpyTNHVJlpTMVc22X8
 P5QMSZ8K9yE92pIg0Qh4cWtKY0guKLYHqcxY0jT7b/CvSHxWtVXZzQTS6oMmVUwmo6UM
 CtkOu8LbNwRN9uhvfClfL6sCKViIdZTe/sVCmiasz1qunuR8OfN5G22jw2b9TjC/UwFv
 Xy8r1k/HKwH6qU3iOPEo7Vd9CibE7Z/N4o/0DShFhI5FaAbuGVWUx22Rg8rNEJmQ7nmo
 /rmnzSih58sNjygZVVcfpMCBCKRFZoUXNmMF2Y4/Z/omXGctmiNiWq2tdLMHGEq/rfB4
 mf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=BbK4N9sLahlO51Mgo2mcAZi2nlNHOPi2T0wGJXMXDaM=;
 b=W/fEKZzwK/KoLu7KzarCU6BrWAld1a9hep6mJXhUfRjHMtjmEPo/gfjp8fU0D+C5zZ
 tswOE11XBimFhSx7PHoNnaf/+eNuCVWngQm0zfbJUiaZ70J4wKSW0JvA6rGUEfJV3wiA
 bNB4NM12jfyoxVmAS3wFfVSZg8unHrGrYwhv75ZagXiw+M+MGaor87byCKsrcweVskO7
 zY9wM5bd2u2ZnEIDVNhNIoSvSQfQ0Y/w/rdmWls8/czRN0V9KdiEFoqpek2SeoKmYZZ5
 TdSoUnEodm1FqGuewLH2N7mlGKTDpVj9wlj8EsFNrY6G7Qez/L+VyfD3X8jDy3oY1fxu
 0qEA==
X-Gm-Message-State: AGi0PuYxmGvOdFuGAIpjhFgr2gwUM9ksGn5IfGigORH8r41FptnTBPZt
 ks4JnVmEMrhYzDyUAuFfKfTkqc5w67M=
X-Google-Smtp-Source: APiQypIzTiDBeHoAdJWi/KobMJYe++LprBBpDZIRQvFvxrp6Wue7bah+j6pdDL+b/UjzBRjsUMgF4g==
X-Received: by 2002:a17:902:7b95:: with SMTP id
 w21mr5096217pll.25.1587496763218; 
 Tue, 21 Apr 2020 12:19:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e29sm2884850pgn.57.2020.04.21.12.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 12:19:22 -0700 (PDT)
Subject: [PULL 1/6] target/riscv: Don't set write permissions on dirty PTEs
Date: Tue, 21 Apr 2020 12:09:56 -0700
Message-Id: <20200421191001.92644-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421191001.92644-1-palmerdabbelt@google.com>
References: <20200421191001.92644-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmerdabbelt@google.com; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::62e
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
X-List-Received-Date: Tue, 21 Apr 2020 19:19:30 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The RISC-V spec specifies that when a write happens and the D bit is
clear the implementation will set the bit in the PTE. It does not
describe that the PTE being dirty means that we should provide write
access. This patch removes the write access granted to pages when the
dirty bit is set.

Following the prot variable we can see that it affects all of these
functions:
 riscv_cpu_tlb_fill()
   tlb_set_page()
     tlb_set_page_with_attrs()
       address_space_translate_for_iotlb()

Looking at the cputlb code (tlb_set_page_with_attrs() and
address_space_translate_for_iotlb()) it looks like the main affect of
setting write permissions is that the page can be marked as TLB_NOTDIRTY.

I don't see any other impacts (related to the dirty bit) for giving a
page write permissions.

Setting write permission on dirty PTEs results in userspace inside a
Hypervisor guest (VU) becoming corrupted. This appears to be because it
ends up with write permission in the second stage translation in cases
where we aren't doing a store.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d3ba9efb02..e2da2a4787 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -572,10 +572,8 @@ restart:
             if ((pte & PTE_X)) {
                 *prot |= PAGE_EXEC;
             }
-            /* add write permission on stores or if the page is already dirty,
-               so that we TLB miss on later writes to update the dirty bit */
-            if ((pte & PTE_W) &&
-                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
+            /* add write permission on stores */
+            if ((pte & PTE_W) && (access_type == MMU_DATA_STORE)) {
                 *prot |= PAGE_WRITE;
             }
             return TRANSLATE_SUCCESS;
-- 
2.26.1.301.g55bc3eb7cb9-goog


