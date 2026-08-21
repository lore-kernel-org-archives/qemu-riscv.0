Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03B1C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:05:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUM-0005zc-Fh; Fri, 21 Aug 2026 00:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUK-0005yC-8m
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:16 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUH-00039b-50
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:15 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-cc16c6dcae2so599667a12.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285051; x=1787889851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wH8pIKqvYD9Zh/0ybIh1J3jaOmzPQm2BkvS+Y5JfPBQ=;
 b=hQXf6iPkvAFFiB2MKqwNr5mc1wgin8prDhtaIdVhvJQFWhR1490qzm+fgc5LHdQvf8
 0M47JRFQLygRjzSwDIHghffL1fE7MTKAjpJy02V9mtYwc+mJtZ9HzQfCBEy/PTRcaKuB
 ILMqhY0s7T8XAju1vUtyQGjD2v2hUAz1grfNgpBiUvNGHY0zMuZulUzEWtAR1hos3/r2
 xrE2T4ggMnpQYQsRTwnBiF6fDovjaHWh+/IEwHRiyd+ISleGV4wnJdEnWdekvz0GkDg5
 5pkEHvMXtzBosCXNHmWMJT1/qE0XiV9q+iAJbSQOJm2Nd8tkTEAib0lZGwHdt1encXZV
 rJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285051; x=1787889851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wH8pIKqvYD9Zh/0ybIh1J3jaOmzPQm2BkvS+Y5JfPBQ=;
 b=SbYT9KNy6+qbDcRpl9r46/ysBe1VhkJGY749mFopIPrLS0B960KcLDWYUgyHyo/0jp
 vAu4ZAHsDAPZ8pxTeExRYEGL5+nHhB68X7/1frQ10+Ufa18VNCWX3g8u7N/fhaq2XKwM
 Hk20JR05YiHNzn28W4FSkrthZXTGj5MtOPiNjM5/KKTM75qHbKixklyaHsR4DaWUCAer
 Kipph6VL/uaNI06AenG+NpsKbsVQ3bRrMTEuJCU92nPl7320LHNkL+SyDbBDJ6vdlI5X
 HTpC6vdGkp2WQCY/D/qX/BVhCxHLkDPftVfUuVArKymj2fuiP0bACdsqoge9Z+Q/FkaX
 UwuQ==
X-Gm-Message-State: AFuF++n25EYTbiiwjS/E0SDHv//MAQsUtpNjsO6ZXnbPNhtMKkc6Tu7j
 01j6RvRt9nXOClpRVmBvEBZU850l4h/ECN/yeNcyMr3+rtthtkZRPE5i+xujxsDD3TE=
X-Gm-Gg: AR+sD10+VJCvJVZc5USquXg6nK1/6e/ZDFvcO6ul3SdSZvYvrxYaN1pwICbxRbR/oph
 9/emOkh7MlW3dNxcNPqTrkqsjIYi/E1sGTMiPJj5bQVzlItt7n2aIp5s5pDpcNyEGEpEWzIGUCA
 +aCJI4evb/DO6sbsllkzgFA/UZIhUkhYZOL6hCn6gojQPsd0nEUxGxnPpEpBmUIV5kBYkNQLBgF
 koYltR6HX1fC5PJdAHzmFJ9IBxOoVfuy/VwAClAJtmySQHq8pSAPqJfMBp+3gxcNgkXkzbcqTF3
 VpeaXGiCR80mY1yyDLi3hpAvOtHfzX8ghByfebxyHcyGQBmCAHs2yvbAtz1aC8ov9JRLj6sp7hz
 o2xSY6uwC1iFtCZ01+S0C4I9aAYbZlqA7yVoRszX5olhG6uuH/2AyqMpnGfozsZkeU6NojZovm/
 5DQzUsOdYjy51ojnfFzQjeJuosE5JO/WAFwzql3bO5xN6goHEBSlJcdkkj5oeiOfLBgho=
X-Received: by 2002:a17:90b:4a:b0:38e:4cb:51f with SMTP id
 98e67ed59e1d1-395c352f984mr5023955a91.11.1787285050908; 
 Thu, 20 Aug 2026 21:04:10 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 00/23] target/riscv: Reorg vector load/store
Date: Thu, 20 Aug 2026 21:03:41 -0700
Message-ID: <20260821040404.268123-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

I'm working on a reorg of the probe_access set of functions and in
the process I discovered probe_pages() within riscv vector_helper.c.

The short story there is that probe_pages() is broken.  I had several
attempts to fix it before tackling the wider problem: there are way
too many probes going on, mostly from vext_ldff.  There was a real
lack of using the result of one page probe to cover any other elements
within the same page.

So this is an attempt to reorganize things such that there's one
probe per page as we step through vstart -> vl.  But since I touched
so much code, of course I saw other bits that could use improvement.

In particular, Frank, is the location of the alignment test you added,
which is in riscv-to-apply.next but not yet mainline.  I *think* it
is at the wrong place.  Also, it's unclear to me how/where it applies
to the fault-on-first instructions. I've moved it first, before any
page probing, as we would get along the tlb slow path.  I believe I
won't trigger an alignment fault if all vector elements are masked.
We can compute MemOpIdx per vector, not per element.

Changes for v2:
  - Include Joel's cross page smoke tests.
  - Fix off-by-one errors exposed by Joel's tests.
  - Reverting vta != vma silliness, handle tail cleanup differently.
  - No longer remove vext_continuous_ldst_host.

r~


Joel Stanley (2):
  tests/tcg/riscv64: Vector load test
  tests/tcg/riscv64: Add intrinsics version of test-rvv-ldst

Richard Henderson (21):
  target/riscv: Split out vext_set_nf_elems_1s
  target/riscv: Split out vext_ldst_nf_tlb
  target/riscv: Split out vext_ldst_nf_host
  target/riscv: Drop is_load parameter from vext_continuous_ldst_tlb
  target/riscv: Remove vext_continuous_ldst_tlb
  target/riscv: Move misalignment check out of vext_page_ldst_us
  target/riscv: Split out vext_page_ldst_us_{host,tlb}
  target/riscv: Rewrite vext_ldst_us
  target/riscv: Rewrite vext_ldff
  target/riscv: Split out vext_ldst_us_notail
  target/riscv: Use vext_ldst_us_notail in vext_ldst_whole
  target/riscv: Mark VSTART_CHECK_EARLY_EXIT unlikely
  target/riscv: Remove unused VDATA,WD
  target/riscv: Add MEM_IDX, BSWAP, ALIGN to VDATA
  target/riscv: Pass MemOpIdx to vext_ldst_us
  target/riscv: Build MemOpIdx to vext_ldff
  target/riscv: Pass MemOpIdx to vext_ldst_elem_fn_tlb
  target/riscv: Use FLATTEN rather than ALWAYS_INLINE for vector ldst
  target/riscv: Drop v0 argument from gen_helper_ldst_us
  target/riscv: Drop v0 argument from gen_helper_ldst_stride
  target/riscv: Drop v0 argument from gen_helper_ldst_index

 target/riscv/helper.h                        | 124 +--
 target/riscv/internals.h                     |   4 +-
 target/riscv/tcg/vector_internals.h          |   2 +-
 target/riscv/tcg/vector_helper.c             | 964 ++++++++++---------
 tests/tcg/riscv64/test-rvv-ldst-intrinsics.c |  66 ++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc  |  77 +-
 tests/tcg/riscv64/Makefile.target            |  19 +
 tests/tcg/riscv64/test-rvv-ldst.S            | 131 +++
 8 files changed, 817 insertions(+), 570 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst-intrinsics.c
 create mode 100644 tests/tcg/riscv64/test-rvv-ldst.S

-- 
2.43.0


