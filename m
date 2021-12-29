Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnN-00048w-V7
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnM-00043t-9z
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:28 -0500
Received: from [2607:f8b0:4864:20::1032] (port=40813
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnK-0004el-PF
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:27 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so23215755pjo.5
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N03Xkux9la2UybCMyY074pwvy5+acptGJ9BHqYtpSWA=;
 b=ljjLMVnwm3sFudrKReD2vy0qXzF50cr8X15TaBAPe4hSF5z/eOgQQ6b5SkcEP4aZxN
 G1sfOPhEBAl2SHihCdHvbngVBPxPCKWjbaNuPyqxk2pp7maWAPuOuNANIBhzvOKPrFLb
 KDaWspspGNLP3v04+0W2TGMks9Z7gh9QrI3ueneSD946CK/Ovrom0s4IYIuBWitTaE6o
 EC4v3jYHeQYaLhRlsZ0+ItKac4I+BD1EXVqzT0g2mhLH+Rz94DhHY6Lp5zoZtX0Zfe09
 GqygkVtvpEfVwY14YB3rPypCVrTDuKloylOfefoDiOwOFaj+IwVwiwyvQvlTwk9YTQoG
 rjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N03Xkux9la2UybCMyY074pwvy5+acptGJ9BHqYtpSWA=;
 b=ElkRpoPpiIyKV7f+LWi2TsNYEq8lqzeXUsh8LWh4/sFyzxFNmAWpgE2ln1MwadBZBw
 f8C8OkynN7vu+RhOoDE8Ug17N0HlJOsPU197dKXZ1Ua/VCwVlLYvhE04KqoZsKQwxXCo
 0D8MJH0EzF36Rj8p389MrEphj6yHwpKrcmV8CjWm2FfgJXD2srfmZmgAzQGMr7MqXhy5
 PPuS6knHLW7r+3wyei8z4S2hjQbBuFL9SNQkKaUG7GrZcAGBg/C/tPLY/Vn3mrlB14RY
 JrbWnDVsZ7Hmdt0abNofLyls99xwRYSns3TdhtFuXd7SOdGxjPC0cN95altQ/NOgI3Qp
 kUXg==
X-Gm-Message-State: AOAM53135dst2wbRz2jn9mtpEsEvfMsGDjL82Xg8+zSqHF46O1kzkzCo
 wtMJBT/fhxOixKPk1w9fbhT+Ag==
X-Google-Smtp-Source: ABdhPJwugzM4QBlUZalJVypEM3DgZGOTu42By2+F6AmIf9Fq3jM+vsWklqQEBwWT2us+4MBK2ZJKPg==
X-Received: by 2002:a17:90b:1956:: with SMTP id
 nk22mr29453458pjb.38.1640745265694; 
 Tue, 28 Dec 2021 18:34:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 10/17] target/riscv: rvv-1.0: Allow Zve64f extension to be
 turned on
Date: Wed, 29 Dec 2021 10:33:37 +0800
Message-Id: <20211229023348.12606-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 01239620ca..38cd11a8ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,6 +636,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.31.1


