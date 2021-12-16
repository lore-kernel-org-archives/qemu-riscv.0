Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxr73-0003bS-Dq
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 08:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mxjAJ-0007qg-JW
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:18:51 -0500
Received: from [2607:f8b0:4864:20::42d] (port=35451
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mxjAH-0002cm-Ll
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:18:51 -0500
Received: by mail-pf1-x42d.google.com with SMTP id p13so22673845pfw.2
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 21:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/3ih0jQP3bVdDSUp6/JrmQ/9EepiccfZebbj0OoY6T0=;
 b=JEv/j0LOdoGKeQTM0dIYOSP88BKwoPLmLW7ffSgy4DoT6W+IAlBLEsRwk/ixjVYVpR
 9q+5DlSpWG+f8BCtdvoxT0lKOk9McNfCvcns4MSEYIfpLb6eQVD5IE0dfjsJqmp3KqZ5
 zZR+0wm0wR8/a4ii80u2XQWW8eblV6nlj91agrLYNZQ1HeIvzPdjl9nyOTtd9lbmkyAe
 y57KEgEKyEKCLCfuBwXXT2Yl/Wx+PI7fzerbBREbMkSE7bLDObV12TSSnBi763qNHiv7
 dPO87zIgJKhah6MtQuMYPpj8ixHUVrDrY69US6JdizIC3PeshfMR7scik2oy9AuTpDn6
 RNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/3ih0jQP3bVdDSUp6/JrmQ/9EepiccfZebbj0OoY6T0=;
 b=B1ItR44zKKROvZdLeY4O1uON917l1Gwebp/PFHreV7svldhLZtgZyLy6I+xB/ahuRv
 u6Iai9qpHgnQNtFQKvjb+hpCh+aV63s9U8y132nFgG+AOsV+kaPlAkzJ2GvPZ0951yqq
 BgNAxAMCxohLNWsttsWbGct9Hgb2nm30qjXeq0ck3nsUWlLaQMCX7ipyvKjYc6ll/Yw2
 A+Bzdll+RqwYMtU+ihz3BU4ddtg0pgA59mHRPsSVjvMIXPVD3VdrIQrLbj0MP9/dLjIY
 Wf+C8+A3j4s1T+HM94mIMzRfkNd4nEH6kHGK63GaGPw6RSZSE51550pBTBeAA0tUqoer
 V5Hw==
X-Gm-Message-State: AOAM530HOqazag5BJjQYFiVCXYpsjWhd+omfPrAw/S1Gdh2Z5k5p6aLs
 0AocmHer+mQVki+epesWLd2DIQ==
X-Google-Smtp-Source: ABdhPJznXifEgc1J9fFnvBpwHpyrzgvH+BvMB/R1oZufiTh3P6BMaZWF8uHqB7sDbBiTjJ074WZu8A==
X-Received: by 2002:a05:6a00:2134:b0:4b0:bf74:a64d with SMTP id
 n20-20020a056a00213400b004b0bf74a64dmr12625486pfj.56.1639631927469; 
 Wed, 15 Dec 2021 21:18:47 -0800 (PST)
Received: from vineetg-ThinkPad-X1-Carbon-Gen-9.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id n15sm3961785pgs.59.2021.12.15.21.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 21:18:47 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH] target/riscv: Enable bitmanip Zb[abcs] instructions
Date: Wed, 15 Dec 2021 21:18:44 -0800
Message-Id: <20211216051844.3921088-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=vineetg@rivosinc.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Dec 2021 08:47:56 -0500
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
X-List-Received-Date: Thu, 16 Dec 2021 05:18:51 -0000

The bitmanip extension has now been ratified [1] and upstream tooling
(gcc/binutils) support it too, so move them out of experimental and also
enable by default (for better test exposure/coverage)

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 target/riscv/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f81299812350..c00d59cd04b5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -635,10 +635,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
 
     /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
-    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
-    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
-    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
+    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
+    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
+    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
+    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-- 
2.30.2


