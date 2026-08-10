Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D92C5AC82
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 05:56:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtIzv-0003xY-AD; Mon, 10 Aug 2026 01:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtIzs-0003x9-GJ
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:56:28 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtIzq-0007lF-Rw
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:56:28 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-ca7c1176317so1110130a12.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 22:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786341385; x=1786946185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g84DKJWv2zeuG9SPGPyMXWExhH1sgpKAugBZFzJmFbo=;
 b=D+RcVXpml8vH+P7+j5SF6mx+IEnNInnris7G3NNi3siehixilJkZJn/0HSDlTvPY9q
 glW2eBnpIYV/8hkVK1k+LUwOBjjsHfG3q5DQKhbiCDbfceda+vqDEY+/74TFcrrAcbgE
 l7CCTwFEizvRi44YcolOGIpXR4JDmiqFyme4LC/SJWyUUBO9+gVTXI7RjLaNc+z2KpCR
 j+uum7sOCNuN6VWLaCWbEIk+uHR/NCPL1RSYKdzHHGWPCP0+n87Ko1baJau4uDxvQViz
 E0bA774cwfEB2AXQTBNg/j6E7Ra/kjsQC5vmM/Mb3SlSnO1iieabedjYUgd+8rElpKhZ
 rBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786341385; x=1786946185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g84DKJWv2zeuG9SPGPyMXWExhH1sgpKAugBZFzJmFbo=;
 b=RoPwu1zZDUQyfrRueiyJtTMoUbcmwdVxw/W4GL8lIfsNtLcx8lV+7EMjz6aqZ7uuux
 TwCDcTmApjbJDWg57o5eFXzZEBZIth1uD6QINLyJyhiEi8tUq9PyXktXnGRDxS7koYIr
 8Eo52yHlrgV6Gy1sW/Fc13DfZxRueHjcvB7JqsStKtsgo5EZ4ocxUQa1llIi8qR8KJUi
 DNrXq6Asn1J06szB9hIBtXizR1b37RbLdPqKha36kQzMWv8jyc3p7Z2URaBhxcZB19hh
 AjL5iMC53BPW7/NmcOJWs1BGq0hAl6ZpHhV2idgTOS/krJaQl1JOfT71C57XON+BangA
 ZWLA==
X-Forwarded-Encrypted: i=1;
 AHgh+RriRXNKfVUsBDmB7EYZPzu4JMd3WPib2Ei5XfKgIr6orohNvAjtGTkcvZSXvnb2uX1GAFVySYqlNMQg@nongnu.org
X-Gm-Message-State: AOJu0Ywy6zFqNpRIHYPVqAtXy9DgWYmfC5VnaHbBmivoudApZjlVLqmW
 6RsVboMh2DCr6Oe5mBPXn8jVy/jUZK1FlMpDCs1xaLFOkMvy4A8PXn/OKxg3bx2eS7g=
X-Gm-Gg: AR+sD10MWfXrGwkZLVmLk4NWJWkPO6Soc6ORezayf9fy6jJZMy0Tbm/W+JYRWqsy7aS
 WPrMCD0LEP3Wg7bzOvzVFHenn/ZW6ipRTxqwFOkXUsAccfFnR71enUh3EOUf07vmze1ODb1JtIY
 ChfOg7Fj/gsiZRYiPKiU+1UfI9MMEAo/mo8nFqMw5cplRcsrjU2niWxF9kfIjT8CXbFenMhk8g3
 ZSDZGPmQmCI/M/AW9tXID6a5O2KaRxlpqX0Ew0+w75iMUxHZYg1BZ/AWvoKxZhxM+2jqOIdGDB4
 ejT70F/ml89Ib9JqAFCI/pIxwKipOPLrEvDtE/RuTTbqykPvlOtPA7gtUejpeuUQAYc8XLnv649
 PHO5FSIHsl3pIbkKWEUxS1QRyT9aAcKaycqa6Fgdp7IhChujNXECo9QjXz+vr8jKf3BjR9yfUlf
 J+75YBNfLFOLtcdfyEbysewaA4THFTXi32vU4jmjUmada/pIIV+sjiAITbJcwzV56jP+EAPAMwI
 Fo88UH5IUOjk4g=
X-Received: by 2002:a05:6a21:99a3:b0:3b4:7b3d:179b with SMTP id
 adf61e73a8af0-3cbce751791mr18842585637.12.1786341384690; 
 Sun, 09 Aug 2026 22:56:24 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315be86fc7bsm39172122eec.1.2026.08.09.22.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 22:56:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 0/7] target/riscv: Support the true Zicclsm extension
Date: Mon, 10 Aug 2026 13:56:11 +0800
Message-ID: <20260810055618.1175500-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Frank Chang <frank.chang@sifive.com>

Support the true Zicclsm extension so that we can trap misaligned accesses
when Zicclsm is disabled.

To enable/disable Zicclsm, simply set zicclsm=[true|false], e.g.:
  -cpu rv64,zicclsm=[true|false]

QEMU will raise a misaligned load/store exception when executing misaligned
load/store instructions if Zicclsm is disabled.

Changelog:
  v8:
    * Squash patch#1 into patch#2.
  v7:
    * Raise the misaligned exceptions for floating-point instructions
      (RVF, RVD, Zfh) when Zicclsm is disabled.
    * Add Zicclsm unit tests.
  v6:
    * Reorder and squash Zicclsm CPU property and RVA22U64 profile patches to
      make every single commit to pass `make check`.
  v5:
    * Add Zicclsm to RVA22U64 profile explicitly.
    * Rebase to the latest riscv-to-apply.next.
  v4:
    * Align ROM reset vector data at 8-byte aligned offsets.
  v3:
    * Enable Zicclsm for the compatible CPUs.
    * Rebase to the latest riscv-to-apply.next.
  v2:
    * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
    * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
      vector load/store whole register instructions.

Frank Chang (7):
  target/riscv: Add Zicclsm CPU option and enable it for the eligible
    CPUs
  hw/riscv: sifive_u: Align ROM reset vector data
  target/riscv: Support raising misaligned exceptions for scalar
    loads/stores
  target/riscv: Support raising misaligned exceptions for floating-point
    loads/stores
  target/riscv: Support raising misaligned exceptions for vector
    loads/stores
  target/riscv: Expose Zicclsm as a CPU property and update RVA22U64
    profile
  tests/tcg/riscv64: Add test for Zicclsm

 hw/riscv/sifive_u.c                           |  11 +-
 target/riscv/cpu.c                            |  10 +-
 target/riscv/cpu_cfg_fields.h.inc             |   2 +
 target/riscv/tcg/insn_trans/trans_rvd.c.inc   |   6 +
 target/riscv/tcg/insn_trans/trans_rvf.c.inc   |   6 +
 target/riscv/tcg/insn_trans/trans_rvi.c.inc   |   6 +
 target/riscv/tcg/insn_trans/trans_rvv.c.inc   |  18 +-
 target/riscv/tcg/insn_trans/trans_rvzfh.c.inc |   6 +
 target/riscv/tcg/vector_helper.c              |  65 +++-
 tests/tcg/riscv64/Makefile.softmmu-target     |  22 ++
 tests/tcg/riscv64/test-zicclsm.S              | 368 ++++++++++++++++++
 11 files changed, 496 insertions(+), 24 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-zicclsm.S

--
2.43.0


