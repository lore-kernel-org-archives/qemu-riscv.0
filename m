Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OSZ-00020p-Pa
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSY-00020J-FJ
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:12:58 -0500
Received: from [2607:f8b0:4864:20::534] (port=42568
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSW-0001Tb-DZ
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:12:57 -0500
Received: by mail-pg1-x534.google.com with SMTP id g2so17270216pgo.9
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuUccC/6LLpVEOSnkVTMuJy2Wfb7prxCbSw3oYnOtHY=;
 b=jqsapwLuIOlx2Fnk85plBNahbMqXbzA3gT2Fp5Pf59s5yGNYLIHCTG1iiKVDE14vPq
 mr+GXhYOGOfGOl0qFR1C4qz6d14cJCKWAA5PGccpzWbigP7UvL7iYZbLcpP2hureMGVL
 peY4NxfO423hoYFwNBxNvfl4kC5PW+Vkkh/VAFvI1KJU89a+mtxU/11v3/nC2UUCZSz6
 s+SzbqcSVRkakShX+VrHsEpoj3/M483eeogYNhoMvjbZSM1c7lzP8iipHYcXWBh7nZNl
 tNxEX63qpPu1ETL/Xq05GsC+QJDFtAwh+GX+7MIdhFUiwxDyjx1r1stF3tLuOLflxqZq
 LwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuUccC/6LLpVEOSnkVTMuJy2Wfb7prxCbSw3oYnOtHY=;
 b=kGJJomxdw4RWGdujT5mKV9MB4879SlCIMv2wieOyOkmKvN1EcoUwnaneoswF+loWU0
 +hivcX1yLHbpRtHQKNAWRfxpTQw55aicZ8hlRabRssG/h9V3m9Avnufu+ua4K1JQwR9v
 maL0/DRzVXo56xQXPx+xKyxHTiKeuSilvdlOnrFkVelUZeKGyeUy6qpsK1lga3yPZily
 1fezbe+i2JYC8gPN0CpdJATgxe9n0BM1m5kPXinsCb/YrqNHPUSk097qzFAGAQgKIGcw
 tZkIzYwX92CX4zpogQ/IEgFgHN2rbg6j3ZVK77CuVe7BzypRc+4JPAIiykTiAeDZLsPD
 xJzQ==
X-Gm-Message-State: AOAM532Z4Zf2rIIHKeDWPArcgus+g8v2Odp0MnMatH/CorjBmLQxJwkJ
 6XOu5L2gKL+YyULYnoy0z7wQvw==
X-Google-Smtp-Source: ABdhPJxDcKId48pzTOIGy1lRnSD+BL4YmJ4rqC/jYqoh3jlCc99vtfm72TUtynBf/TfNZhtB36vpCg==
X-Received: by 2002:a63:6886:: with SMTP id
 d128mr21643736pgc.247.1640743974856; 
 Tue, 28 Dec 2021 18:12:54 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k8sm15693975pjs.53.2021.12.28.18.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:12:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/3] Fix RVV calling incorrect RFV/RVD check functions bug
Date: Wed, 29 Dec 2021 10:12:45 +0800
Message-Id: <20211229021250.29804-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:12:58 -0000

From: Frank Chang <frank.chang@sifive.com>

For vector widening and narrowing floating-point instructions, we should
use require_scale_rvf() instead of require_rvf() to check whether the
correspond RVF/RVD is enabled if either source or destination
floating-point operand is double-width of SEW. Otherwise, illegal
instruction exception should be raised.

e.g. For SEW=16, if the source/destination floating-point operand is
double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
instruction exception will be raised. Similarly, for SEW=32, RVD
needs to be enabled.

Frank Chang (3):
  target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
    widening fp insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
    widening fp/int type-convert insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
    narrowing fp/int type-convert insns

 target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
 1 file changed, 57 insertions(+), 21 deletions(-)

--
2.31.1


