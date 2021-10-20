Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md1wz-0001Pd-K7
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wx-0001HI-Bt
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:31 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wt-0002rh-FH
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:29 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h193so5825600pgc.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65+Yki7uSyr7Ly13EzYk4vMMejSvYa9sd+AEZsay2EA=;
 b=NkTowJpe4yb5h+ZUEpqNopqZJGSeNu/1xzbt0tdCTqQrzosj7WSqEbH06ZduAcQ5GS
 JVXMXf4D0QVLDf9o47OnmCyNqoEce7gAC+297hl8lnY4Eq6m87hJGXKeYl4iuDLepBaE
 1EZ249FNTGNo7XyXWpv6WSZFW+BsxqufGIxcVcTSz+lNeo0S/KS3krCEjxQPu7q5r37e
 9WnnReWWmbhkEluEU6UmORMxJg60mD2JKyvTpxkYhiwMsIfoe0AxTPsxx51/iV3p7VKC
 T0P22dvV+T31orHyVjcOsMtcE0HZkm8Wdw/nJmTvQPBUmx79Qng/7cCErHj+5NDOnJEe
 wHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65+Yki7uSyr7Ly13EzYk4vMMejSvYa9sd+AEZsay2EA=;
 b=4iGQPV8u0pgBS+1JTvu/1OZudl7CWf0kxlDjxUgqnLsr4IE3PIhTWM+42ZPJcypzAE
 dZJUhhNJk4kDeAfvniiB+jzV6OmBnu7Rn9HsszNSG0Rpmzo78DxE50wYKMtjysURiezs
 8wvTvSeL91SObeMxAi7Z4OiEr1uspyXy1v+v4Xte/bcRDxdGq2b8Zb4nUf+i0uvk1e/W
 CNuCqld2NmqcgKHV9eGbaMq2jTd0JCW0Gc2tbQDUawdbJhAaWzdreAbumCcxHfCd0TvQ
 lWFKh7GhJR5n29jSrH+4yVyA5NNikmym6yH2KUNKwUBZ5LDsePu23qPrCj6kxhPWEONR
 JOdA==
X-Gm-Message-State: AOAM5310RTOxf4RQbHbGJzlwsDbHcxPEhWnwxwMIQ4V2aeTb2rYrfKsA
 hnWk5SofgtbXM4iryLi1xshNVhPxtScdVg==
X-Google-Smtp-Source: ABdhPJwTHSWvXeaNztENfSdK6MPHG2eKNvwc+Ci4seuL7KuXrLPtV1ZKfqrBv3bQPEo4zTjTxKYWSQ==
X-Received: by 2002:a63:1125:: with SMTP id g37mr31254140pgl.403.1634699245967; 
 Tue, 19 Oct 2021 20:07:25 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:07:25 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Subject: [PATCH v4 6/8] target/riscv: zfh: add Zfh cpu property
Date: Wed, 20 Oct 2021 11:06:49 +0800
Message-Id: <20211020030653.213565-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020030653.213565-1-frank.chang@sifive.com>
References: <20211020030653.213565-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:07:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e6..8c579dc297b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-- 
2.25.1


