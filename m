Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvanr-00066L-TL
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvann-0005vC-Hy
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=55146
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanj-0006r0-QN
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:47 -0500
Received: by mail-pj1-x1032.google.com with SMTP id np3so6250032pjb.4
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bMxtMs8KLHg1VrhV6E9tcps8BmAmJv9k6CQYse6I7KA=;
 b=cQp8KCv6lt9kw8ZmSJiW1u8wFS/U3yHMQdPm1RXpWWdZAvY9jESFAx8MafJcSVsZy9
 wtMN4VrcBhyR91bIeX3nsk2ZnyFgCXY5E/Gc66agp+fCfQBzC+JpX/OyYlFzBHIjSki4
 DJseYx//lt1A1z00FbehxjBC6PXJzInyHMgXJyhufRuEKC+EizCVZK12ut+JuN0e2/ri
 GEQ59CRtuz5iruGb8u7YHtI/kW8DMjs4m2b1VeQe6JzozIfThB8DNL6DA90isV1w1E6X
 RWe4yt5WYA4NX5T/0gi/g6esWel59IYO5MCT/R/H30jFzlPWs66c/qlNknhIufhCat+b
 DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bMxtMs8KLHg1VrhV6E9tcps8BmAmJv9k6CQYse6I7KA=;
 b=eL8TzSO6shHwa6cHCMszpL3FotYfO1pisbr4xReRENlfiKk70c/lUmGsNs/qG/JUw/
 uWRdLDibCukdPxFkQmv+UmX54hxDmwYYz5BZu2onyyM7b8ri3nPEr/VAcM+R7crKeFV7
 4SGcGA544+rLgRX9SY0H6ldWHEEsmruJSQUVBNRnyOxMAC/NXws7zSNgX2MNwde4RcUN
 GbGc2UpC1/79P000GbXrWsQfyFUBtearDj6W/cHWQbn2937GUFHIV4uFioHqj/G3bT0s
 OEMIRoFwM+/7c9DCklSTJ7fuJXu3gv2ob5JoC5LcIKDl9zVcGExZIs3yr2a01Pgd4d7v
 O+9w==
X-Gm-Message-State: AOAM531D3CtnJLgBKid+rJvul/4NfqaEvDvn2VMcZHJWGNIQ+NrzK4tx
 RWYpzcJeep43mWHdyi/RUz4/ng==
X-Google-Smtp-Source: ABdhPJwY3x+cN0Dzq8bb/NFYg4Cw8kcMbZNv5yjio1RjZBAqOGUIzORuSA3oKrHjcKQZxjQ1NYgqmg==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr22184406pjo.219.1639123122662; 
 Thu, 09 Dec 2021 23:58:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 27/77] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 10 Dec 2021 15:56:13 +0800
Message-Id: <20211210075704.23951-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Dec 2021 07:58:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f2..92a0e6fe51 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.31.1


