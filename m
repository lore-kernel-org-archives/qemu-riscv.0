Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6689FC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:46:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKV-0007Gz-KE; Sat, 15 Aug 2026 15:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKR-0007Ga-3M
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKP-0008FF-5d
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2caea3f742bso36589775ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823159; x=1787427959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Oly/r6zZ3NchHQ6eEP7Qm9fTY6UmNBB0A0oONUbitF0=;
 b=IHKWJEMuSsbXNWvBY3N84AX1jnQ/E4/adCthYXXI1yULwk5gzRKr+9hDARmp/ThmXo
 XImylIiPfwDu08p2Tnk0UBtKte6UNpegcypGSQV92+EI49An48e+xU7JTFpubF65VsIZ
 zparso2E92QK61pOKnGHQPp0p9sy2PwZhJIuFREwLpTUtcskmjTdZgPvEZ53/vMdoHbX
 O1vTNvmQBaWOVFI/1j4EHh0kGqfmo+16K7VDTXuZgqyZuAj8Tj/Y9CJ5lHOk72v/tHO5
 +MZvvE+gU6T113tZQdVDJnXDhzSI8n5n7p8psr5K3iOyMTl/v1Da7Z14veb4jDGPafdv
 6duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823159; x=1787427959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Oly/r6zZ3NchHQ6eEP7Qm9fTY6UmNBB0A0oONUbitF0=;
 b=H7Frg1R/j1c8OJpd9sBntYqMC6cdNR6x1rmt6JDJdeSBj1uQZEm+yeNUIePJvnilfT
 fDHGs33kH9SX+MHfGjYKzmA0558LqOqgHoibohAMr6eMfuPI434lk3JUa9ZojSJS0KkN
 MeZWjKeuplyA6P5I4yz+aQ8gqMZbBygQGTzM4evyN0OFwkmMO9MKdMu7uxcAgguKf1SG
 jizQdrAg4qL0lwBrVjlQ76FYL4WRoQs1LiFxGakBW843cWlj1WAIGDOzvUZlQZSRpmLH
 U6AvyuPaPu29HGZYvlpDndfOD/AJQiuVM2UypcX0QuJ8iYSpOZVHgn7SwgXqTxx1JvN7
 Py/w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq58HUp6ldmaOSg+COwk7lu7DhC/qpFph9NpW1EY2l69/wXpFokgh6kLoWv55T+WU0yKmoN33YQCshb@nongnu.org
X-Gm-Message-State: AOJu0Yyxu2bG0Ja1IFX3Jf7//VDEsgx0yoIlaOpFmUIuK/wNpe0SJn+6
 V3WH8+HZhOU75mUHqXeDC8uSeVat0J1/FYRmsZ6jW8QajDWmyfPHoh9lUnsMr/d4iqmbujbZlVq
 MZiWN
X-Gm-Gg: AR+sD10MOsZzhYixMR45jwj4R6V+BgnCqFjv2N16XLJSs/dDvWDtuBklVeMroSkSHAU
 PrZpuhDpE7ZPKVyyBeVuxEo30PMuKs/xBZDgztwut2vf5fqg7rttOYbRifOJDOBUL1l/YP4vloD
 vv7IRkgoeinfUSQAVkfp6I8ecH95L3bHO259535J0aQBEqu0IptYkpJhqEjgk30MdMWLCweQAR3
 7K7mOOKNK8a/fuB734HqV90J5UYjOZw3aJ98txj5F8Wiy3x/+YiTUTtVMuKAt5lS6ISf3AUI8xe
 wRPx0b6hgDpmde2XPUWW69Einb/nAjeTGuI3Da0SVBg3ZqjBEcO0M5CyoUIDeAXkq+NXApSFhbz
 HaQDD0TFRLf5cViM0GwBawOxO5BuCnTtIsg2rbZd1MWC9MJn91QfEoL+X0aDrGVaBnCP0quN6hM
 +N+TKkYRVjWQkvk6iznBQ7uAYg5fUYgRrQe3dxroIY3AULCIoc3zdnIahlDwJA+EVD9fxbsADGA
 mHBJFn6fRGQE30hNaln
X-Received: by 2002:a17:902:e543:b0:2c9:b396:1a55 with SMTP id
 d9443c01a7336-2d3b0c4876emr149243425ad.12.1786823159009; 
 Sat, 15 Aug 2026 12:45:59 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:45:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 00/23] target/riscv: Reorg vector load/store
Date: Sat, 15 Aug 2026 12:45:25 -0700
Message-ID: <20260815194549.1377505-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Hi all,

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

Thanks for the system mode alignment test, btw.  :-)

Anyway, thoughts?


r~


PS: Based-on riscv-to-apply.next, obvs.


Richard Henderson (23):
  target/riscv: Split out vext_set_nf_elems_1s
  target/riscv: Hoist vma check out of vext_set_tail_elems_1s
  target/riscv: Split out vext_ldst_nf_tlb
  target/riscv: Split out vext_ldst_nf_host
  target/riscv: Add evl argument to vext_ldst_elem_fn_host
  target/riscv: Drop is_load parameter from vext_continuous_ldst_tlb
  target/riscv: Remove vext_continuous_ldst_tlb
  target/riscv: Move misalignment check out of vext_page_ldst_us
  target/riscv: Split out vext_page_ldst_us_{host,tlb}
  target/riscv: Rewrite vext_ldst_us
  target/riscv: Rewrite vext_ldff
  target/riscv: Split out vext_ldst_us_desc
  target/riscv: Use vext_ldst_us in vext_ldst_whole
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

 target/riscv/helper.h                       |  124 +--
 target/riscv/internals.h                    |    4 +-
 target/riscv/tcg/vector_internals.h         |    2 +-
 target/riscv/tcg/vector_helper.c            | 1010 ++++++++++---------
 target/riscv/tcg/insn_trans/trans_rvv.c.inc |   77 +-
 5 files changed, 627 insertions(+), 590 deletions(-)

-- 
2.43.0


