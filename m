Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxJ-0004MD-0t
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxH-0004I5-EW
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:32776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxF-00023I-Oc
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:27 -0400
Received: by mail-pf1-x434.google.com with SMTP id q123so5543446pfb.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TdAeKsA5L+s4IiMWzkqm1nibEblXKkWRjjA3AJ5bA5U=;
 b=b5ZszqYTXE8PpSjNsp+kYGiuv1geDDwhIev4bvNlLY536qZ09sz/sl/T/fzs9aV3mc
 DILOtDIww98xLeRhxgxIw42XzJqhTF+Pn5a/t3rIsiCdeRW51RoetdHnhJJH5xLgFi/i
 ehqt9L6xe+FuJTRpX8XgZcKxgXFUNKc9GkOvF1iO56fAXkHcmhgk+STY9zXtcCPUUvF6
 duGR2INjrV4kiFvBI0CdSlLh19d45GzXJXW5oqZcFGP4vVjQrZT0Lv8Yli0NZDFiT75N
 YSPOY/Gw7jwuARQueSw8y/aclrLAL5A2bLFSZRe5RKQVXBjqXmNIzRFtbVwQRXkl2QNg
 miDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TdAeKsA5L+s4IiMWzkqm1nibEblXKkWRjjA3AJ5bA5U=;
 b=fci9Mn0W/pGauLBEYJzD/M5YBZ7Zz8Et6AWh/S9/GlDyBk2AQmJlRzIX/CwjCunhMr
 mLK06CTs9KiEVWKN1bn/Cu8ECo9W3xnjV1Qtunfj+Tqal/JAF2tRygDm9cTnJrzYpODQ
 wbFCdmc72M58F5bMIg/97zWadjNfnuy4yu3gfmkJWkIjfBe37E36ctSlrkCivXxs+LqI
 GgzX3J/l8KHwwqvq799xBfTujc8xiNm9lHivxNd+Nvpdtia41T9YmSeRBj7TWyhB6nvS
 fX7zIYEWAibTZmznKLTboC1MsRJuk1t4IQfw1Y2rTud3/MDkeEYffuDICwFlh54nwIkW
 4f+Q==
X-Gm-Message-State: AOAM531MH5gWmnreX9TGUhibs/NQyMHXjFvDDTOcLtfZ5zRrt1uXeKCE
 7pXPwOzOBGSxbCf+bOAlNcHKww==
X-Google-Smtp-Source: ABdhPJySXnyWytVeIHHuWbL7lSx+hvYWzOqxJCvSGtes0ftBd+JJ3sBxjKtmC6tGOaYK1O7PP7uT0g==
X-Received: by 2002:a63:1226:: with SMTP id h38mr4309113pgl.196.1601406384520; 
 Tue, 29 Sep 2020 12:06:24 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 20/68] target/riscv: rvv-1.0: fix address index overflow bug
 of indexed load/store insns
Date: Wed, 30 Sep 2020 03:03:55 +0800
Message-Id: <20200929190448.31116-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 29 Sep 2020 19:06:27 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 368259f75a..9349a36b41 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -361,10 +361,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.17.1


