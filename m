Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxD-0003PL-Ka
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxA-0003HK-Lk
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgQ-0006W4-NO
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgQ-0006V9-IB
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id p1so5655828plo.2
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=A46qd+Lun1Jqp2LnJV4/8L0u1a2QnjICpRUQ7yaJbfA=;
	b=l0MOoQynQ+kDACwUI4DStSEz/feWdmKodc6i1ftYAZad1TVXkzzI6ZVRU2OdbcYz8+
	pnqioVRXgn0ysshc7ru+8qZDyflmpFt3uUe2HjvuzUoF8lg7W+Gb0PW37CKYY8ty15kA
	UiAZpoZllWbglT6+e0oLGQghZPogw5CiQA3nC0ax+60zhTYkuq3jQVPIh1ZeHgeVeuKj
	SAgNU4CaZn06B8Fi7Afkpc/FdrknRHTxznm9h3aCqeocOpIDk5jfzoZMVgy1DBo7e+P+
	Hx6gjFP1BdDWPDSlLOKUhWC2+TrQ21Whpt2Zh71o6B1S3mVmCfjYUmHZk4k3/12B8X+p
	h8fg==
X-Gm-Message-State: APjAAAUVMNus18WKEzpJAtSrMse8lsoAq1t/Sn7CuPebz0g7kkDjUqNd
	2DbezDxERbgTDMlEtT83NvwqCFuYKKU=
X-Google-Smtp-Source: APXvYqzaNy5hjqks01TxmcWVh9IxZfM7eBnQf8DhxI0B6Ypgf3FLewhzsozAtYWXl2GyT+ahZVq7qQ==
X-Received: by 2002:a17:902:8ec4:: with SMTP id
	x4mr16380382plo.249.1558833039887; 
	Sat, 25 May 2019 18:10:39 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	p16sm6813182pff.35.2019.05.25.18.10.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:38 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:47 -0700
Message-Id: <20190526010948.3923-29-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Jonathan Behrens <jonathan@fintelia.io>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.195
Subject: [Qemu-riscv] [PULL 28/29] target/riscv: More accurate handling of
 `sip` CSR
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 26 May 2019 01:28:01 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

According to the spec, "All bits besides SSIP, USIP, and UEIP in the sip
register are read-only." Further, if an interrupt is not delegated to mode x,
then "the corresponding bits in xip [...] should appear to be hardwired to
zero. This patch implements both of those requirements.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e6d68a99560d..0f51c7eae241 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -237,6 +237,7 @@ static const target_ulong sstatus_v1_9_mask = SSTATUS_SIE | SSTATUS_SPIE |
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 
 #if defined(TARGET_RISCV32)
 static const char valid_vm_1_09[16] = {
@@ -682,8 +683,10 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
-    return rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
-                   write_mask & env->mideleg);
+    int ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+                      write_mask & env->mideleg & sip_writable_mask);
+    *ret_value &= env->mideleg;
+    return ret;
 }
 
 /* Supervisor Protection and Translation */
-- 
2.21.0


