Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md1x5-0001d8-1F
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1x2-0001We-So
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:36 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1x1-00030w-Cn
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e65so18814429pgc.5
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQ7ceHlIpxNMvHRzw6T15tg2TuDRPoXAXK95E1+Gc3c=;
 b=Ks2MwCc5i1q0HdGeQ/g6fhXCNMEdRwONUrAeH5LslwWoQW1Rs7DFaaVZpFm6LJT3Zt
 th2F9jT+y1b3f/V89vwrblGKyddhJ+fpkokwjuGlJzyNHGMFZFDQe4qMf8agaNH3z8oG
 VYa6DcX4buRISkPR6vgOle625ngbaMFMc0R311QYv+H76aXhE/Cwla8Bd9h82WlvUivZ
 ZK3jB2pjjC5HJqlmHRn0N4ZB3NT100DZZSdlycgR0AArfaoF8hq/Q0qngKu3SRftPgej
 qvOh6im9gmLVUqBND5REgIm+lZ07Q93hazFk2xXmyyHnKzn09Ms25re316eIDjwiWVa7
 OF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQ7ceHlIpxNMvHRzw6T15tg2TuDRPoXAXK95E1+Gc3c=;
 b=BlgngwyPtq5MIarDNOozR88CPk31ENAbDScfyG0tGkQ56A8SeYVSqhAP1i/Qndz3R9
 0E9oRp1mc9c2DOldpOqpRTnXGjZl8wpAM9pI8UUhbIbvaH/Y2vDDJSo4dGG/5Gdq70rX
 unpPYxy8N/0G8fS2slIU+xL5zemglfhbCp+rxvaswML5XOeZ9P6Fj8j5dXd1yIESrjm9
 Vz1xNsxnBQOo2TEuAcxggTFxgKziIj9rwecheMwoLXXjdOZBQGAb39NWi3uayiRTI5RP
 Lv0Ue3f6okBvfhwNOdkgPOugijdU/NfJ0SYbt+1YSCds9gtnIlyqRBYfJX5QjtSuH24d
 vvRQ==
X-Gm-Message-State: AOAM533lgs+zzpcj06ElyQI92z+gEjJ2PRdMgM6OFofwQ9bNy0a+JxOT
 5KqL1sISq3KeZirRsijRjxJvt3Kds/mUqA==
X-Google-Smtp-Source: ABdhPJzSmI4Csajy70g+eehW1iNxX3C6mtHuLcTS+VDbZXR0oGyjrd96EwIRqgeiQq+OG8fNfly2Fw==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr31419323pgc.173.1634699253875; 
 Tue, 19 Oct 2021 20:07:33 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:07:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Subject: [PATCH v4 8/8] target/riscv: zfh: add Zfhmin cpu property
Date: Wed, 20 Oct 2021 11:06:51 +0800
Message-Id: <20211020030653.213565-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020030653.213565-1-frank.chang@sifive.com>
References: <20211020030653.213565-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:07:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8c579dc297b..4c0e6532164 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -602,6 +602,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-- 
2.25.1


