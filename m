Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B5BC79F83
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 08:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2Ph1-0005Iv-6C; Fri, 04 Sep 2026 04:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2Pgz-0005IF-4m
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 04:54:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2Pgw-0007Wf-N9
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 04:54:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-3990fe066ebso595067a91.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788512073; x=1789116873; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=e3Z6D/ZmJMC60zoXWk3qSe7Gtc0eJVaktOuLmTJ3a88=;
 b=Wtzi/kHvrYylbhlXCMhHCJ8IYWemwN62Q0zcMZ7f4v/E6mWQhtwiCH3m7WBEefIARt
 PQ+hvtjXeBcRqLV1UMpf7dc+hYSVdE7fynm8hOJ298f6m3PoQLEz/CRR0jJ3fwOhJa3Y
 hUrm0pWf0FspJO0ac4vwlS7Lwd+yxdgKfRAKzDhDkQ8Lo7UfO5SfQexrKph+b/Yb7rQS
 5SOk47FKWwEfbjLF15pV2rwc9YIq5y+HaN6GwXvBLZgG5/VUP2bJdwt7TlkkMQGzoORK
 giyLC0Y6K/G456rVcu6Mreb/eP91OE4NI2FHtuivx6EIrvD/9Hg9ifrdPAkQOKRwiJdV
 /LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788512073; x=1789116873;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=e3Z6D/ZmJMC60zoXWk3qSe7Gtc0eJVaktOuLmTJ3a88=;
 b=oBvpb8YBJRtDL6nrMYQbsTL0xUglc7STte0sWLy8f8yGr9Hn7CXQXL77pfYbyoIOj4
 EUBGNLCPUGZQW9bLD2IcHYAfA1N0xbc2yyzgrWImrHTeaQEu31xwnEreIm+tLgNte+P7
 gt8WaO0P6cf4z7g69HGKOXMebL5wfrOoYrCs8rIK41jv1t22xcnfADJszWpBKg3jTiEd
 Dxl2UGjucGY0Q9387/1Usb2ASlmvsjUhp6paYdC+K7tNO2JlQ7ODnafH7dLRw3z8kDo4
 M36Y7MNvpSPZjx7WNKYODPVpb6PZlzYssju1hY5aawEu+iCfnjwbE5c4GWwNckQDRrSw
 Qp1A==
X-Forwarded-Encrypted: i=1;
 AKwUvByVbj4LLyyWyjfJFVUmFWLVe8PNSrU867yCQdKEpVACQklqSSTcWcUyndxfzPaBVk4Urn6ZwERY2Qs4@nongnu.org
X-Gm-Message-State: AFuF++m8zazgnWIVbLNgFKHjNX6JxK7UluB8uZ4KsY10ABSRbASQByMB
 TzR25WbgMRjHKCfPGNaQhM60hM7mZ1T8jqWpS38boCLMolk9AAf8wAdTquOSzTroJVY=
X-Gm-Gg: AYBFou2pIuFakgifuhl7nQFSl+PvYuVKIsqF3LAFoDLlg4ypnF4s8qxzXk6Sv21AZDY
 Rh6GVV5GsdFPNvqJrEosU8Z+livC8/LZJdoXIk09krGRdAsGgaTjRZTTsNf4FyI9rzl7iAV8Gnq
 f55WysFhEMPbvKBag09H2doOOoNPE2gDuQHp5IpfDVsf3z6Q5kIlE9do8cIwRpRXzaECL5snQSY
 y97D6gznaggtoMKoKeZuovc5ScVHlYF2MM4Lr+GrmGpxGp9I6jy8Fl/V9O+3qV75pHmlTtk7/y8
 DeX1nuq1cnTPhA38X2Odk5xPHcZ8XuU0+wc1i2D/C5vz0py+n0x2AanUUpgJS7GGQex9qTD0anD
 cCrun/q9EgagGcuwASnhF0FPR9QR5imFpb9fb+9kaDJqen8C3mWXVp5A7XyDXhG9YN09BSFSEre
 gC8CFliMyqxPs4wiOYFEmD/zbKsHxzcxQAAW7BcsrGeOxJGheOxYTdzqaruGRh5/Ilf49GHTtEN
 XtInoxADP7F+ykmGqvWLi+3xNLxITXNGpmlBMJqBfofk8txs2s9sYOpd3vJ8hTiSwX33ERKq507
 d7LIyP19qg==
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id
 98e67ed59e1d1-39b26273a40mr7767927a91.21.1788512073051; 
 Fri, 04 Sep 2026 01:54:33 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39ae8f1448esm4782912a91.4.2026.09.04.01.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 01:54:32 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 0/2] tcg/riscv64: Fix AUIPC pair range validation
Date: Fri,  4 Sep 2026 16:54:24 +0800
Message-ID: <20260904085426.3686492-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1034.google.com
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

This patchset tries to fix the AUIPC-pair range checking issue in
current TCG riscv64 backend.

The issue will be triggered in the following example.
---
Assumptions
- AUIPC at       0x00007fff77fa1258
- target call at 0x00007ffff7fa12d6

The direct pc-relative displacement from the AUIPC at 0x00007fff77fa1258
is 0x000000008000007e, so it is already outside the signed 32-bit range.
tcg_out_call_int therefore takes its far-call path: it separates the JALR
immediate (0x2d6) and asks tcg_out_movi to materialize this page-aligned
base:

  target call  = 0x00007ffff7fa12d6
  JALR lo      =              0x2d6
  base         = 0x00007ffff7fa1000
  base - AUIPC = 0x000000007ffffda8

The final value, 0x7ffffda8, is less than INT32_MAX. The current range 
therefore accepts it, but that is not sufficient: the signed low 12-bit
immediate must be removed before the value can be encoded in AUIPC.

The current reloc_call performs that split as follows:

  int32_t lo = sextreg(offset, 0, 12);
  int32_t hi = offset - lo;

For the captured placement, the values required by the split are:

  offset = 0x000000007ffffda8
  lo     = 0xfffffffffffffda8
  hi     = 0x0000000080000000

The lo is representable by the ADDI immediate. But the hi is not
representable by int32_t: narrowing it produces the bit pattern
0x80000000, which is -0x80000000 as a signed 32-bit value.
Thus the int32_t split can accept a wrapped upper value instead of
proving that the positive upper contribution required by AUIPC is
representable.

AUIPC has a 20-bit immediate which it shifts left by 12 and sign-extends.
Consequently, an encoded immediate of 0x80000 means -0x80000000, not the
required +0x80000000. The resulting generated code will be:

  0x00007fff77fa1258: auipc t6,-524288
  0x00007fff77fa125c: addi  t6,t6,-600
  0x00007fff77fa1260: jalr  ra,t6,726

It computes the base as 0x00007ffef7fa1000 and transfers to
0x00007ffef7fa12d6, exactly 4 GiB below the requested callback which is
0x00007ffff7fa12d6.
---

This patchset addresses the issue of AUIPC split checking and applies
the corrected split. It ensures that the split is checked before
emitting AUIPC/ADDI and AUIPC/JALR pairs in tcg_out_[movi|call_int].

Changes since v1:<20260903170405.3632015-1-max.chou@sifive.com>
- Rebase to riscv-to-apply.next branch (commit b23a627)
- Address the data type mismatch between encode_* and hi/lo parameters

rnax

Max Chou (2):
  tcg/riscv64: Validate AUIPC relocation range
  tcg/riscv64: Fall back when AUIPC pairs are out of range

 tcg/riscv64/tcg-target.c.inc | 68 ++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 19 deletions(-)

-- 
2.43.0


