Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIF2V-0001ac-Qt
	for mharc-qemu-riscv@gnu.org; Tue, 15 Sep 2020 13:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2R-0001Yf-FX
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2020 13:46:43 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIF2N-0007Dy-2T
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2020 13:46:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w7so2391934pfi.4
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2020 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J/C0CgMtD1LdsmM6ACDCgEWX06co4iTUlmwkoRNuL8=;
 b=BGKA3JlfigwPFD1yg3nqZxSGvmznZexDHC6tx+LFwUjnYJNrRl/F8pG63TA8dvpzxI
 qIpFvIm3fyBGIi7GveCv1O5Xj+e3xJEvYKO8VQKfPsZAOJAAdEUhwF3ORm4PNz6EiBAn
 H2RiCMjAu5kQWMQSAULlQWnf1BY80dPzdnIhGymT2HdY7eqInNDRXDuuqYabrEyUY/6m
 yqd9qGpg9oYnAyM5B5KESH1nYjECXGiMPVxnrsS4Eg0c41OdVGT8Qmw+4dyFK05bxPE4
 SFSu12r706ReiomTQrZ5BhrDZYkHTnhTFgQrd1Svq24Q0C9VfYC5sYgL3KYD2l47U3Hz
 JFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4J/C0CgMtD1LdsmM6ACDCgEWX06co4iTUlmwkoRNuL8=;
 b=fWdSc7voaV45it6bLv6v/MLvbWdrH4eEQ4nNWGIXHNYPpWKaXd4KUWfYz5+v1IGoJI
 PZbN+LguXO75qu38rqfn3+6UKPeA3WqubnUF6f/Y6X5oqyzlvOtbmYulVmC1FFnSN806
 5w3t0GBWE97eFy7aONjU3NmaUdPenDAPs7ItODiYmMKr2Td6E83harv/6K0cZ5GUDHs3
 YJS4Qw2hYlklHxL3xb2FTIzh6iuyh4M4gdul5olm9Mcw05qIOw+DF7LstCaZNEwBETOe
 ypNJOfT69rhSaapPjFp4cQNgi1XILZIuKqqJK9IRm9U9afy2S0XWCQ2GByNbPIUos/Q/
 kMWg==
X-Gm-Message-State: AOAM532hYq31T0Ru26uds2Voij9CccHIFZiP+cPiOUY0vSO7bw+8pH6x
 vWSic8FWgNJ09rKh+FVepMLBXQ==
X-Google-Smtp-Source: ABdhPJywZS5SLDX5laTosDiEBzMBPNRjGIBnlpXeOCMQPoGbNQlSXXhz4yjU8OdM7Nw87BqzVITYWg==
X-Received: by 2002:a63:c343:: with SMTP id e3mr14492145pgd.288.1600191996919; 
 Tue, 15 Sep 2020 10:46:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id cf7sm147896pjb.52.2020.09.15.10.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:46:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 0/5] qom: Allow object to be aligned
Date: Tue, 15 Sep 2020 10:46:30 -0700
Message-Id: <20200915174635.2333553-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 15 Sep 2020 17:46:44 -0000

I've seen some failures on arm and s390x hosts after
enabling host vector support.  It turns out that the
malloc for these hosts does not provide 16-byte alignment.

We already have a function that can alloc with alignment,
but we need to pass this down from the structure.  We also
don't want to use this function unconditionally, because
the windows version does page allocation, which would be
overkill for the vast majority of the objects allocated.


r~


Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org


Richard Henderson (5):
  qom: Allow objects to be allocated with increased alignment
  target/arm: Set instance_align on CPUARM TypeInfo
  target/ppc: Set instance_align on PowerPCCPU TypeInfo
  target/riscv: Set instance_align on RISCVCPU TypeInfo
  target/s390x: Set instance_align on S390CPU TypeInfo

 include/qom/object.h            |  4 ++++
 qom/object.c                    | 16 +++++++++++++---
 target/arm/cpu.c                |  2 ++
 target/riscv/cpu.c              |  1 +
 target/s390x/cpu.c              |  1 +
 target/ppc/translate_init.c.inc |  1 +
 6 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.25.1


