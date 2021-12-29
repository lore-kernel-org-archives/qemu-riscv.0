Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2Onh-0005Nm-DO
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Onf-0005El-Cn
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:47 -0500
Received: from [2607:f8b0:4864:20::42c] (port=36666
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Ond-0004hb-PZ
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:47 -0500
Received: by mail-pf1-x42c.google.com with SMTP id v13so17569691pfi.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jbLe1H2YPzqkbRWWQ+VDyla260n74cDi0uoHKqxIf+k=;
 b=Slkod0h518utOxYraByj7qZKRVYm2xGMUdmoPL3JS9yuRC8YVdzAMpbBtx53DwbDaO
 QnJor1rYuN9nU4t8UzBC18OXIihXZCKcqLXgNnbhh2FXbvGI4l6HKoqCdQpTYUt8lB8d
 vg5qq2W8Xqn01WYCO63EEfLM9T5BmrRS45m/2Ey1Ihv/XNb1Lq5Q2p2X2SZDqU5vWRj4
 ytRDANZ81z51PVwdtYSQSNXjB9dCG1WzALlDruebYlK/8ehmIHAsN/DKYZ0Zgr6V11GE
 1l5GS9L0eCstXEUv+ilrmz/bbay4ZUBsT3Ihg2EPokQ7fOj5UibQt6Y7TtnyyYkoNXmt
 N2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jbLe1H2YPzqkbRWWQ+VDyla260n74cDi0uoHKqxIf+k=;
 b=SCyxXakPr3a100aGcJ/Iy7aRouxn7F5301tFngqLqtmpwe+aFhLMJqDrm1NmiVznIe
 fQ55IHkTPd2vHwbJtf7oDEzOLsOvZZpIiMI/fdGk8m+gDzWt87+n3sGAgitl2bSGB0Yz
 vpvBKUsCXOUOaW+R3bMYENHCGzMVBCbgtD/Yzso19baNALLEZH1BpHQKJTtIpw++T4dV
 WsZY2V3fd2H87+KhSHhAaN248dioniWmovLTmutfowF5c4yYywLL8iY6fKWWuVgNUBuz
 8S3OwxgBZdsHNVA29FIfSYormJDHNz9+r01N3uRGYeJ+XxiVZovh3UJmaCBKAYQxZsiC
 Pgeg==
X-Gm-Message-State: AOAM531x6fePsdA+MknrGLjIhu2F2vFeZ8bul6q8IEaXo5jLHx5b7R+d
 NgN30ayaK28OXuYQNiGRqszTdQ==
X-Google-Smtp-Source: ABdhPJwxTBrSoON7JTgbjkdulCtAfIy5MaRegcgq7CtmCPSEjtCs2x5k864lDeA8eSEIeb38hvwWwA==
X-Received: by 2002:a63:7f58:: with SMTP id p24mr21873523pgn.109.1640745284647; 
 Tue, 28 Dec 2021 18:34:44 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 16/17] target/riscv: rvv-1.0: Add Zve32f support for narrowing
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:43 +0800
Message-Id: <20211229023348.12606-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector narrowing conversion instructions are provided to and from all
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index da0e501f85..5214cf08db 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2860,6 +2860,7 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
            (s->sew != MO_64) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2868,6 +2869,7 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2918,6 +2920,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
-- 
2.31.1


