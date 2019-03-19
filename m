Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ETt-0007X6-Oq
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ETr-0006q2-U1
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGl-0005UB-Gs
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:04 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGl-0005Ts-5G
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:03 -0400
Received: by mail-pf1-x430.google.com with SMTP id j5so13642986pfa.2
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=04ZkILDLzSK+siZu7BoyQWG8P+UnNDS/4rtHP7+fHuo=;
	b=hhJeKCvMhNMcOWqZgo7TtuG8UxqjrDWn9sSR1QveHk0eb3yCOWpy3Wy10Coq+XlM9e
	C9gmspXvDTdXjXDS41d9JBnkq4eURjw0Ib7/edv06DCjlIuYsbbOl4fNnv6LMn0EVAbp
	UhQGZOZy8wxP730BkSF+S6mH0HZtkIuamrR+L21GERguj5gG35lQhjCcHUzPs+IP8p4e
	Ftjb/3qnfF0VNC6qIF30ONcuHEQu/jj8cYVvM+Sau0L/KB3E+7RjxdA9bqD2Gd2E6kzI
	siDuF1NGJKmyfeKF+0Db0YSDVoeD8t8VHpVLU9K8q6LyUTdg4ATOEQ19FgvT1vCTKrpD
	hmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=04ZkILDLzSK+siZu7BoyQWG8P+UnNDS/4rtHP7+fHuo=;
	b=AEBfLkmtDWPxgxhHlrUzfoxnT2MMOJlkPPg21xwOWWIg7OakzaGYYArXWVYq71wyI1
	K4Lo4H0+ffYW8Q1O5gzcWVDnN/Fdozy3P6udAWUrKCH9n/L6xQ6TLs/XneHG69nYJwxi
	phQ9ws8AtcsmO0K6TvWgR0oM1BSQfcB3B+/GkNzGMaB1xJlzsBOh9Nc0DQwWW/foCDwC
	k+8X38CsA7DZ3atFtEq8v13bLiwlMAEn45/Na5BJEQWWlQb+w00Yza2zafZHVOZLsIc2
	vWgcjascMNNkZLZQGPSfH7TRFPhZTmV2byOoEoXiqWzzXBIx/1vucZT9qsRt/jMjLBcN
	9+lw==
X-Gm-Message-State: APjAAAXqETGf5ygIfqWv1prRsGASgVTkwIK2ispA809bprDqSxJYnG8P
	XiNGY4n5elLyPCoXqTdRieyrCAOcHl6Nyezy
X-Google-Smtp-Source: APXvYqxLBsltXBah/c4vnATWsN0RxYKj/K/tezAT7+5ooZG6YqiswnGYic2MIHzevx2IRWWThhBaRg==
X-Received: by 2002:a63:4247:: with SMTP id p68mr1728068pga.30.1553000101973; 
	Tue, 19 Mar 2019 05:55:01 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	i22sm16954845pfa.88.2019.03.19.05.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:55:01 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:48:01 -0700
Message-Id: <20190319124803.13826-18-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-riscv] [PULL 17/19] target/riscv: Remove unused struct
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:36 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index feea169e1223..d61bce6d5581 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -80,12 +80,6 @@ const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-typedef struct RISCVCPUInfo {
-    const int bit_widths;
-    const char *name;
-    void (*initfn)(Object *obj);
-} RISCVCPUInfo;
-
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask = env->misa = misa;
-- 
2.19.2


