Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ETw-0007aK-V6
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ETu-0006q2-2v
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGi-0005Sm-SV
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:01 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGi-0005S5-M1
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:00 -0400
Received: by mail-pg1-x531.google.com with SMTP id a22so13755783pgg.13
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=fIOHdXcjGKR6anAZfoIhg+wFKNluaHdFOG/gNrwQ5hg=;
	b=lQxBeXVpViww/2T+LRjCJYDPu6+eWCokzVq5SlAjxaT68N8bSD77S0Dqzrw2ym/8CG
	gvU8/FIMLJP+RueJFBSVRqrHqUn4cMyTSynk6QGJoZ74Td3hXRshyXJtW0wnet+8L5gk
	ILgWrFuOeP4SpMxyvIB2UR0x5aspvJJHMVUl2gEUygQ5u+tpXghJsB7QLbwj7Ne05Fc7
	oIWtRNV0ZTvVTD0FJzqDvyI82qkMAuz1Em3Ut6lWjH7iNIq5+xNnVf5VL1Nqce6p7Neh
	X8+231pXRS0+Y+SIg67wHm1f+vhD7Yf7WOBQ7q7SN/slfnHFp29o5bWC6F+ITYnpDU9w
	/i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=fIOHdXcjGKR6anAZfoIhg+wFKNluaHdFOG/gNrwQ5hg=;
	b=JfS7XdzpviT9nhGJ5Wugl9b7BFfm6VCriibCM0lZ7PFr31rBs1djxoDP3YDVWTK7zC
	+KeBRE9t4cGauyB1TiVPzzzt4N5Sv5R+KcCE7n/6gOYvbcH+nsZrXHN6DEN9fONGQlel
	Xqq9QMStjnssDf/DxJA3hX6JDpeVcCkRPqmwclQpNfoRXJsNHWDnW1QYylBHWjnhe2uJ
	t1nTyhKMEZtM9oqCzhTFLIPMMz4rxT3HayBwyX1gQMVuy3zMhkOOuVChf1QHEfoPxkFk
	28inUPbQvh6kEBhHe6Kk8NxRXvxdhWwVhpSEXFPdEagY9+W1xvDiqp5oQv6viQ6i9xmw
	7KPA==
X-Gm-Message-State: APjAAAV9mmfv/Y/C9j/NKRHn+8PsWyWfzdBBexpRkoBLwmLLXsFjsVYT
	i/uLmecW+Y+7XuMWgdJlJP9BtVXHWGB8bCGY
X-Google-Smtp-Source: APXvYqwZ6jXwmM+GABFhEdbw7m+DNR934DtZxuac3jfi6gad6exb9Tb2Z4WvD7K4KbyLycIcaEUWNQ==
X-Received: by 2002:a17:902:9a95:: with SMTP id
	w21mr2446919plp.118.1553000099217; 
	Tue, 19 Mar 2019 05:54:59 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	s4sm22305577pfe.16.2019.03.19.05.54.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:58 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:48:00 -0700
Message-Id: <20190319124803.13826-17-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: [Qemu-riscv] [PULL 16/19] riscv: sifive_u: Allow up to 4 CPUs to be
 created
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:39 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7bc25820feaa..3199238ba01e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -398,7 +398,10 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
 {
     mc->desc = "RISC-V Board compatible with SiFive U SDK";
     mc->init = riscv_sifive_u_init;
-    mc->max_cpus = 1;
+    /* The real hardware has 5 CPUs, but one of them is a small embedded power
+     * management CPU.
+     */
+    mc->max_cpus = 4;
 }
 
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
-- 
2.19.2


