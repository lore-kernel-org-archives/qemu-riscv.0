Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdwk-0004K7-To
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwd-0004IA-Ns
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:04 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwb-0001zy-UW
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:03 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 g13-20020a4ac4cd000000b0051f842ba672so203981ooq.4
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hK7hUX9DpCweRWw5pi7iDFzv4O4v8vKk9BPAoNwGEr4=;
 b=PwEP8PoUSUUhlc/r1rPXY07CJCpr2oV1HIRW+Zv0IYBNCrlpOPhrR3m3SrlKJOmoXm
 YJLFN1CWOloIVnL5jeGe3LZDPBsYoUkfK5lRJLcxpu7qa+a6peexpuVq7lppsPrTrBbA
 gqr6eNqJvuWZ9Krim9vE/EgRZPBFmzqLR/4ihNhsjGIIcPw2ryGAKl5h7SbTXR0ms3kP
 Op4p15V6aLj8LRuKdQkQELziv4ssYGrY71HtO9ByEcquAFhrqWIhij/7V8zk2ozeaZoE
 T4JBGTnvSVZZWMyxr/psgSGXCdCE0Z1IMv6l9ApgEtc779MX8Xm2bULPQ6eYZa8XNuE9
 hb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hK7hUX9DpCweRWw5pi7iDFzv4O4v8vKk9BPAoNwGEr4=;
 b=bWnyfE6MyVgyUJ55LMi/0H6ZTiJm+JMajVTlRdJPY1bXlyQ7WBjombFmoT80xRnWVv
 p2VUiYY2x6yOeGNdnb7vvejLBgrg+ttu3LXOKCxb857rT5f9vRFwudxk96y5U6iNPKvo
 ariEriMceW1tH8CCnlh4e6W0OkQ0grRkxjw5ikmVBpKtBHBnnkFhxhQSCHI17i5lw5de
 iwxC9+gAB2J4WSW2mawflkX0v+XtOPg89GzsWCZ/c0cjA1DwOTI/NndJQeCix2CP3nrV
 MpPHJ0FirzEboMx5lk+F38bulkSTe0PeVETsUbumMboiNP+rjv8OoJgKMgOuijNRYA7i
 uBig==
X-Gm-Message-State: AO0yUKV9n3c20Jyc0zgfjjtn675CVG1W6Kz3/93Q9xNfg/4AxLMQdC4p
 5TIlM4GszmjqM/L9+HUz8CiT0w==
X-Google-Smtp-Source: AK7set9BVhHVYEONygd6Qeq6Rf6V9idsQvUH69FFQp2/m+M0/CCjfiyDSc5twoBrKFx7YJk2Yh76ag==
X-Received: by 2002:a4a:9871:0:b0:51a:9c6f:a7a9 with SMTP id
 z46-20020a4a9871000000b0051a9c6fa7a9mr2635761ooi.1.1676552700627; 
 Thu, 16 Feb 2023 05:05:00 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 02/10] target/riscv: remove RISCV_FEATURE_MISA
Date: Thu, 16 Feb 2023 10:04:36 -0300
Message-Id: <20230216130444.795997-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:05 -0000

It's unused after write_misa() became a regular no-op.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..01803a020d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
-- 
2.39.1


