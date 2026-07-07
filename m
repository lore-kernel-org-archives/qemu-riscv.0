Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89661C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:12:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1pN-0003WT-IT; Tue, 07 Jul 2026 05:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pL-0003Vp-PG
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:10:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pJ-0002F4-Vo
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:10:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so4403965e9.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415448; x=1784020248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YgcYbSmE1WSQgn9Ir35dqnNelarFHzO6B8Lh8ECIcEo=;
 b=L+y3veuNPdUaDwpIVfId9x875HiskJGakg5V0zBhd0WnXwiLKbtPQH+ajSkN4q/TsG
 R/tcb2PsfKLx+8gyC6A7SE9Yf1zJH/cazZNCSwDogaOm4bk/Hn5CdNKGLL+aNMxKiILh
 kU8Sl9dTe1sSui0mn8U+Pdv8jTcgoIExMl/zWpB3STUXVxVpiIk0rWWfqr0UF33TwsA2
 +NkIa2atjTST/TimV1pTj/zWugZhf3DzdlX3FXhEna2P3CF40l4zFPKxoC61w/E0sRA0
 lWYJgst+N9cAWgwU+UnpdQ9/ki4H/MWsQIlNhmqh2saxo+tHdW+Mlz3EM62xQ4nDAbo9
 /GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415448; x=1784020248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgcYbSmE1WSQgn9Ir35dqnNelarFHzO6B8Lh8ECIcEo=;
 b=RZouei0APP+MQzCXHUBrf1I55SX2MwBC2rqMROqLWeU0//T42Ojhne9er9do6OA2px
 zip8jFvXUO4/lXFelWwnitELZU+vXRiM6yCh1d6FuzpGs0Sr6q7P/So7ItubALfa6Vvm
 U08ibOD4RQubhdQszFhc6qWCBSBhfOiSZvy8z6TYnd46z2laZErxCeYV1gTQyv7z27xO
 eJv+FRS/nOAtsI6hBuiXCCMBGmDTy01LxribQ9epNXZTHvsnS4be67R2iMKjh1kQ4Z3/
 da3xYW0FS4LBf+sl4vjT2TvKAoZ9Gjmy9a5WnjelYYJOtG/CQTYCPiBTjsG4CW7muSsp
 h7TQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqS1RKrOGAxnnuJUSeX5vEgmS078MV4fhbaGx4E0n9f4uZ770YvXkIgr8jV/FTS367gegrqcaqo9AVa@nongnu.org
X-Gm-Message-State: AOJu0YwMlGoU7bHHr0KBJxUrWorW9AH92u2w7UBmkVz0gnnXs5pZCfqM
 7z8f6N6FTyKhqg/Im/Q0VzPQrZ29C4RaTiYi9D2hi/vWzOSNwLynmiZgPB3mZQ0EXEM=
X-Gm-Gg: AfdE7clL18PjY3exhnT7ZEmgfxvZAlw/qeGJZ48zmxpUuAtToHglsUlqP+6pqcOjCq3
 LliMvX9txizY+3X2bJPvuMTSNmOCmtx2wdEIfaAzFZW5iYFKzFrM5GH1Ng02NAdAx59ODFJGWpV
 y+k9BsMzSfmVURm4/O/h+15JD5Byl2/9n/dAVWxlGCxos8D+WY+Zg6XzVR1uBL2wXBMIg5nvo1j
 DfrjM3nGT8sW8itcEQVQQf/qP8OiRtVZpVQQ+0EGQ+eXFpmG/REiFMFTtgrv+pnXEOSKZvoZzXr
 ItQjTyUI3nKgT7d/Ib+SpmTcAOM/f/NjeEx+6dIQBcDNFP4VLhhVscaLEuqMjAtjb6kj27145Br
 8xzYMFBhgnz6iVsBrncfL/EyF55ObI6e+e3bQ7gWpZKaOQnnvQDAGjVPzkRQzoPaa37eRuhnhaq
 hvsM5RT9M77l6s8V6enRs48sBxtsiAnJz1yMo3A6g=
X-Received: by 2002:a05:600c:8b33:b0:493:b4a3:5ab0 with SMTP id
 5b1f17b1804b1-493e10165b4mr18878825e9.13.1783415447904; 
 Tue, 07 Jul 2026 02:10:47 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f32660sm41004665e9.2.2026.07.07.02.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:10:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 0/6] target/riscv: Support the true Zicclsm extension
Date: Tue,  7 Jul 2026 17:10:33 +0800
Message-ID: <20260707091039.2574638-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=frank.chang@sifive.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
  v4:
    * Align ROM reset vector data at 8-byte aligned offsets.
  v3:
    * Enable Zicclsm for the compatible CPUs.
    * Rebase to the latest riscv-to-apply.next.
  v2:
    * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
    * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
      vector load/store whole register instructions.

Frank Chang (6):
  target/riscv: Add Zicclsm CPU option
  target/riscv: Support raising misaligned exceptions for scalar
    loads/stores
  target/riscv: Support raising misaligned exceptions for vector
    loads/stores
  target/riscv: Enable Zicclsm for the compatible CPUs
  hw/riscv: sifive_u: Align ROM reset vector data
  target/riscv: Update Zicclsm ISA string and expose it as a CPU
    property

 hw/riscv/sifive_u.c                     | 11 +++--
 target/riscv/cpu.c                      |  9 +++-
 target/riscv/cpu_cfg_fields.h.inc       |  2 +
 target/riscv/insn_trans/trans_rvi.c.inc |  6 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++--
 target/riscv/vector_helper.c            | 65 +++++++++++++++++++------
 6 files changed, 87 insertions(+), 24 deletions(-)

--
2.43.0


