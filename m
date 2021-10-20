Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md1wZ-0000oE-E9
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wX-0000nz-HU
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wS-0002PU-4E
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ez7-20020a17090ae14700b001a132a1679bso1447874pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AlJGA8Zc594h1lb8+cuEC7oOB49A+22eBd2PWgFpUXw=;
 b=YMcJG26ADnXducbj0xGyDOmx790b6/DgLbyUr7HeyCq5AmCI+z+PF52Bu/5OIXX7OG
 C7HOeVjaXDod8+UznGfR6XitVSQIDzZ914laT9uDJFo84hR+D+pyc2pLfHRgRyUxNwUi
 T5oZljJVa38lzgDeWsKWLJ04Te9kG3arIS2HRob5FVsbyUNfQrfSUsSQbbeIc9fIPM3C
 9EryxSVpNvHTz0mhppmys6y636yuk407lGIy+YcRatL1MgtENRaa2N+Kb3eqmq+DPOok
 dIj2kYPV+EgA7gnWYPVZlY6ak0MKAhrcoSRrwjHeRUmOPFQK1ivwWQcLZPGwrfVe/Ed2
 z/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AlJGA8Zc594h1lb8+cuEC7oOB49A+22eBd2PWgFpUXw=;
 b=g4FVrlZ+7rbIc/DoXlG12LMMyQcuXvItWWUns0FIbAD3VSFO9W5hDiW7kvoWMrIXvN
 Wa8C/j/066ha1Z+hHZZSfWMXhn7XXRzIQSiF7/yCHX46QzoEpCKDaorqMqO4fDOjISpY
 Tpx40jYKE6GRMO0VhjTzX6I92FbH7KEx8XztZCaVBcYJENjLZCxQqkiz5uJGB5w9iJLW
 Wo2sR9yg+poOLv3K1mjwAY0Tr5o9gA02sCmfF0fb6ci4WxVh0Lop5iGx0mdwhki4s+QC
 GNXWxLAguliaWJpHQr2By7JLFEp5hPr/+V/7y2H6Kd/tU1Hv4MhK6c/+nhWqeU+dN+0I
 OLqQ==
X-Gm-Message-State: AOAM531RlzXQtwVCycvBOPz6W+8BzSyHNCVsHdpidPb5qUDOaNi92XFa
 4o+GUvywUoWEWyXkuyIHw1u5TsC/v/Vd4Q==
X-Google-Smtp-Source: ABdhPJyQFRb5keAcoUsS7z/u3XjmqgX+KihyFYw07PWQTtJe2BHkZuyBsmDIw3rw6Ym129ijWXrhlg==
X-Received: by 2002:a17:90a:a586:: with SMTP id
 b6mr4137354pjq.244.1634699218319; 
 Tue, 19 Oct 2021 20:06:58 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:06:58 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 0/8] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Wed, 20 Oct 2021 11:06:43 +0800
Message-Id: <20211020030653.213565-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:07:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfh - Half width floating point
Zfhmin - Subset of half width floating point

Zfh, Zfhmin v0.1 is now in public review period and is required by
RVV extension:
https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ

Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
respectively.

The port is available at:
https://github.com/sifive/qemu/tree/zfh-upstream-v4

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v4:
  * Spilt Zfh, Zfhmin cpu properties related changes into individual
    patches.

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
Frank Chang (3):
  target/riscv: zfh: add Zfh cpu property
  target/riscv: zfh: implement zfhmin extension
  target/riscv: zfh: add Zfhmin cpu property

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


