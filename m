Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnLt8-0002Io-N3
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 12:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLt5-0002A1-C1
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 12:02:59 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLt2-0007I8-Hh
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 12:02:59 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-187b51ed66fso2209796fac.6
 for <qemu-riscv@nongnu.org>; Fri, 14 Apr 2023 09:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681488173; x=1684080173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEmvHHbBbKmeVHVaRiMbrmPg34zyJnxsV36tsik2vpc=;
 b=LZiXPXOXUfDfy8ihUPmUThWiyrIlRBBpdaR4HVD6IU0Zr/6SDPnZAczT/53674Sp+H
 ydLGG+RpJZS0DMdqPYzYuFZbA47019jUyxUgvgnl9Zj1RMvwVdxLPfHxAN4SRwlLP0rz
 Hlc8Ho6r448E/D+RQ+GWQ4yBq23BXHVEadi6MurXLO2HpDd2GN5zIoweMI6YKHoJpWsu
 bO2s9D9QYwcxDDKFj6Bxf7mOK02IgJLsrLGsNLnVo5FYiNvXjD6PALgp/qAZtt+iwW0K
 qfnn/PrOGmf+JrrPwe5NqHfgXuBI/6GmVm6QY/nQPUmeIYrB0d+8f/YMFy1n3AWKS4Hi
 Bqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488173; x=1684080173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEmvHHbBbKmeVHVaRiMbrmPg34zyJnxsV36tsik2vpc=;
 b=KwGRIqoo283rp3ax2zblPAc+rq5NqZ5uu3DUEY2QX1WLt6jw1SUbjZMJm3Gbpi/+gn
 OOAIUfLcxtdhAjnOTtc27LyAAhmH7Mz638nVoq7XFBGiDBLDyw3e7UqoNoij9G68LxJw
 Rv6cUGv98iAp00l/Sy9kMXBr2dmK64CxFNPOrQQNP+eKGP+JkAKgPBC634i9m8zqFDbZ
 2wmvfJZkOrE89bSbC9I1jGsj26RfL220GXcfQ/AvFt58SWTw1cxL+2LfQKN2wXS8W2VE
 wObelSLBfZW4o59FD049OQ39hHhhJrWtYgnGo/abNTiDwpLeWnfHdJ0GJSoGwZsRGvhj
 w21A==
X-Gm-Message-State: AAQBX9c/DAW8Lpobn/oU3+teG0ctVRzO95tLfP7cYHHbq1H6rN/7xrsL
 YYgSTU1HJqk6iSttqJiFecGWPH5I0ZgHYFvTiLjP2g==
X-Google-Smtp-Source: AKy350Z3eqfxueJTtDn0vUbSkyrfNwMwP8AcxnZauPVDcqBMJKe6fNG/1Fr1bQtdR+UKHporNa++ow==
X-Received: by 2002:a05:6870:4722:b0:187:98c4:2766 with SMTP id
 b34-20020a056870472200b0018798c42766mr3673563oaq.14.1681488173757; 
 Fri, 14 Apr 2023 09:02:53 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a4a5706000000b00524fe20aee5sm1794323ooa.34.2023.04.14.09.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:02:53 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH v2 4/4] target/riscv: smstateen knobs
Date: Fri, 14 Apr 2023 21:32:02 +0530
Message-Id: <20230414160202.1298242-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160202.1298242-1-mchitale@ventanamicro.com>
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 14 Apr 2023 16:02:59 -0000

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fab38859ec..5c00106899 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1498,8 +1499,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.34.1


