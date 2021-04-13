Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWLpt-0000Zy-B1
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 12:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lWLpr-0000X6-Um
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 12:24:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lWLpq-0006Jw-5o
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 12:24:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so8548731wmg.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Apr 2021 09:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FaYEx/+e7PztCL7ZsaAfRiYm9VaQUFN5Q36NwYQnTZk=;
 b=aN2goz94+bl9pVobEb4rgJNCehPfG9Uq0v6Hgw5JLNu+MkqKVxdIW2+WXrEYkvr5td
 dMTv8Ajf8yada0tpDjfoOmDYVg5IpdMb8+xwewfQKygzOW2QiFZ3wdXNyiwEfzfq++4c
 QZ/Dx5RN1t+yahDaG951a9gY8Dg4kQgg2ue8hFYsxF1e+muSDqobag7sirUW4qhuNZvn
 prChoukNwD0EQFKhsRi0CTbxcVgvpTM6KCy05bRW49dUbUhWtEWxPFERO6lVs6rJzrz+
 rY29mm3HSvgGk1qMPx3bLNqli1ukURbyapBdgG/PmibXqM4eO/fPmIPW4LZXd5Kl0ZWd
 K0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FaYEx/+e7PztCL7ZsaAfRiYm9VaQUFN5Q36NwYQnTZk=;
 b=O0wIScbdxDlovDxL72xbyCJ2KXGxqZTvSQUG7viv5YyP64VgcqquQRs/d2PHomXcZZ
 5gZtK1Ni1W81FNYKIxdQ8s6/q6cHTGR4FtonDVNJqGq7JHi7aEgrrO3L21eaUEZIkQpz
 wrA7rDnEg0hnRKboXUL8Tj5ErhYhFeommNzecmbTPavrCLffWmmHMT+I6h3nMRSwF52C
 rGeTeG4C6lKBY3eFGh0XPKGHj4b8hwnkwmrbwArQBS/mPX4yz9j7vZfzh5CyrObjsSY9
 QsYr67pPjqXDZVezHw191QbQBj2ciJG+9Od8hKDbh0Na2VVaBegyN2uh/0IaVStmjrVr
 vq9w==
X-Gm-Message-State: AOAM533La0do1ERpt7rS5PPAyNQzARCATBMVetdDMYnFYdv6eQaBBhrK
 +au4lg032p3kfJDwXfa/BJph9w==
X-Google-Smtp-Source: ABdhPJzhMUPkzj5od4U88GqAJaZzJ/li+OBQz7F9Bu5SCPQKUmR9cPcGz9w0qyYuazM616R9up5v6Q==
X-Received: by 2002:a7b:cf38:: with SMTP id m24mr799636wmg.148.1618331055669; 
 Tue, 13 Apr 2021 09:24:15 -0700 (PDT)
Received: from glencoe.iroazh.eu (lfbn-tln-1-134-231.w90-119.abo.wanadoo.fr.
 [90.119.102.231])
 by smtp.gmail.com with ESMTPSA id 61sm11621535wrm.52.2021.04.13.09.24.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:24:15 -0700 (PDT)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-riscv@nongnu.org,
	Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: Fix exception index on instruction access fault 
Date: Tue, 13 Apr 2021 18:20:02 +0200
Message-Id: <20210413162001.44953-1-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Tue, 13 Apr 2021 16:24:20 -0000

This patch addresses an issue with the wrong RISCV exception handler being called
when the guest code performs an instruction fetch from an invalid address.

 cpu_helper.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>


