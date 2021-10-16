Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbffS-0002iP-QL
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 05:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffR-0002i6-PM
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:07:49 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffQ-0001A8-1M
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:07:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id d23so10843379pgh.8
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZ1KI+SSAwSkrp1DeCdr4PA7deK/tLqedEy67K7eJC0=;
 b=iFQsPJtgzPwSrkXV5gNmOtLGwI1+KiPz9JSl4MmYNjHM57Nj/RisxHpQCFWGz2z3sy
 WEIc0lXqFKoknNCUcNz5zWiXZ/vXtFyC0FW3vL5ezhcAVgqr7bHis2ZELi72Cp4In7T/
 Of8g0MTp6+Bnjwhx82jJrzuP0M5+kXy2Gf3RSmwu5lfeS8RzrU/RTsdhC1fcWjGqoJBi
 +YxbKKxN7k5CLwnxdonWTr1p3r1yCteD/zcKe2CXZ5V7cDw2CRSy3XBcQe/jATT4ZIZy
 VxhLtl/+xw6eTsLd35kVzAyHEanXQoy+vj0R5oIFsOBVa90HCwvGwkyMQHCdR0ysbTw5
 U3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZ1KI+SSAwSkrp1DeCdr4PA7deK/tLqedEy67K7eJC0=;
 b=7Ok5MmdD001h3/QbhcnkAyjSyPq09Y8yEx/5eI52FGMAuQD5y4SyasNKfsneiIghK1
 J+pL6wXngXRrZkX8S83rIYnwnHjXrkS3gJKbNGiBQRVoGRIT9m1Scc8SU46yPawxJHF1
 hkGPVxiQWiH5lKSRBm2CGxCtXf3GbE/ATasr9k4nynStcKV9U3Ds5tJ611PD+uPXmCGq
 ierPmD8MSl8gi5X9erTvsC7aMBCEq7WZm8e4hbT92UopEQINVzhG4K6hLGYfw9/sjfUZ
 ldd7nqChzTUiShSb/LjW/mqDk4XfiedquJRYNXa2bvaGOBtWDltT3tJ9MrzxV/nD8A4x
 Eulg==
X-Gm-Message-State: AOAM532l7D8KOwm6rE56nJLBfRJ6OVoMBOoB4yBZQ4/HIumm9Xqs9h/L
 wCVxi9yTr9aFDRItEaLBmtnVKQ==
X-Google-Smtp-Source: ABdhPJw/j5441qJMdfmRFTi0IwS2/nppjS2YrSHmLdoP8bf0quNB1t8+jqOCdVWL1+suPFhd+eiKFw==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr13046910pgl.376.1634375266239; 
 Sat, 16 Oct 2021 02:07:46 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:07:46 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 0/6] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Sat, 16 Oct 2021 17:07:35 +0800
Message-Id: <20211016090742.3034669-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 16 Oct 2021 09:07:50 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfh - Half width floating point
Zfhmin - Subset of half width floating point

Zfh, Zfhmin v0.1 is now in public review period and is required by
RVV extension:
https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ

Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
respectively.

The port is available at:
https://github.com/sifive/qemu/tree/zfh-upstream-v3

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v3:
  * Use the renamed softfloat min/max APIs: *_minimum_number()
    and *_maximum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.
  * Add braces for if statements in REQUIRE_ZFH() and
    REQUIRE_ZFH_OR_ZFHMIN().
  * Rearrange the positions of Zfh and Zfhmin cpu properties.

v2:
  * Use {get,dest}_gpr APIs.
  * Add Zfhmin extension.

Based-on: <20211016085428.3001501-1-frank.chang@sifive.com>

Frank Chang (1):
  target/riscv: zfh: implement zfhmin extension

Kito Cheng (5):
  target/riscv: zfh: half-precision load and store
  target/riscv: zfh: half-precision computational
  target/riscv: zfh: half-precision convert and move
  target/riscv: zfh: half-precision floating-point compare
  target/riscv: zfh: half-precision floating-point classify

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 180 ++++++++
 target/riscv/helper.h                     |  29 ++
 target/riscv/insn32.decode                |  38 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  20 +
 8 files changed, 824 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

--
2.25.1


